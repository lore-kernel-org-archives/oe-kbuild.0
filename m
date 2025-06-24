Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C443074B5
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798998; cv=none; b=NKy+8tappr8+3KvhNcorUmqnYVL9cJ0YUfA29cuqrsREA6wcHv+I8TeQ/E2tdsZLpubKTE9DGo4kWJvwvOf85I16uXT1GaxQgnJQrmm9xffCPxR3t9sjTO2W3shkHubN/OcRM50lqiQU6fQo9zh/DUY/lwaqnsBfcZaFDXJOu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798998; c=relaxed/simple;
	bh=Q9I82pKM6rKozHBIVB5Es9tpPAuePML+PnH10kRRiSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pn9mfUNM07dasUMs5XRQAZppSEurpXmtozpF/FExlPDpc7xakET2El/h8TAAyOXm4O2fNtABCXOUH8Y9D6kvmVErA9qwjOGXYbeJMYlKZGq7tXhVNIYyuyUmwo3SVYK7uC1R2+/RBjH+BTdMGxnpZwMFB9jjyH+0+6GWDfr+3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0+5zzH5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0+5zzH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750798990; x=1782334990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9I82pKM6rKozHBIVB5Es9tpPAuePML+PnH10kRRiSE=;
  b=l0+5zzH5ixw57mHlhSkOEWaaKgb+NlDsVZ5rI0pLzufxj0pV6Vji3ddC
   TCwDJgPM+wdkuU+qyIstlRHVJPpguqFLHw0+VZe7xHbPD44cdhlu6i7xJ
   kWjap/G/oB2J/ptlh5kydt9SQTzsXiert0q3+IT/cis5ilHyRZ0/KoakB
   eI922Yxaz7CI00Ej84+iwyUvlqKMOZlpqaeX91rUeSKD2kz5xF0IZJGTE
   4s+LK1RcvrKtPJJIrvY5bt2an/3qCKa+pzceTix9IxDuDKC3UyXinaj0B
   eEkkVEfy35PvkUBKTyu5C6fa5we9iRV/kWCOemy75gikQ+4zAksjnb+84
   A==;
X-CSE-ConnectionGUID: W0CAC43QQniayECTL3sesQ==
X-CSE-MsgGUID: vbRRuTciSRyP7aO5pZJ2nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56840216"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56840216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:03:09 -0700
X-CSE-ConnectionGUID: j1p6JpfqTIiEfMDOFtmLfA==
X-CSE-MsgGUID: 375xs0B7ToqaewYzdbH64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="183067129"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 14:03:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUAnI-000SVu-1h;
	Tue, 24 Jun 2025 21:03:04 +0000
Date: Wed, 25 Jun 2025 05:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <202506250444.vN3kOIIH-lkp@intel.com>
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
In-Reply-To: <20250624064945.764245-3-quic_gkohli@quicinc.com>
References: <20250624064945.764245-3-quic_gkohli@quicinc.com>
TO: Gaurav Kohli <quic_gkohli@quicinc.com>
TO: amitk@kernel.org
TO: rafael@kernel.org
TO: daniel.lezcano@linaro.org
TO: rui.zhang@intel.com
TO: lukasz.luba@arm.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: quic_manafm@quicinc.com
CC: Gaurav Kohli <quic_gkohli@quicinc.com>

Hi Gaurav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next linus/master v6.16-rc3]
[cannot apply to next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gaurav-Kohli/dt-bindings-thermal-tsens-Add-QCS615-compatible/20250624-145223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20250624064945.764245-3-quic_gkohli%40quicinc.com
patch subject: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250625/202506250444.vN3kOIIH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250444.vN3kOIIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506250444.vN3kOIIH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs615.dtsi:3662.34-3671.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c222000: simple-bus unit address format error, expected "c263000"

vim +/c263000 +3662 arch/arm64/boot/dts/qcom/qcs615.dtsi

8e266654a2fe82 Lijuan Gao       2024-11-04    15  
8e266654a2fe82 Lijuan Gao       2024-11-04    16  / {
8e266654a2fe82 Lijuan Gao       2024-11-04    17  	interrupt-parent = <&intc>;
8e266654a2fe82 Lijuan Gao       2024-11-04    18  	#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    19  	#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    20  
8e266654a2fe82 Lijuan Gao       2024-11-04    21  	cpus {
8e266654a2fe82 Lijuan Gao       2024-11-04    22  		#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    23  		#size-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    24  
8e266654a2fe82 Lijuan Gao       2024-11-04    25  		cpu0: cpu@0 {
8e266654a2fe82 Lijuan Gao       2024-11-04    26  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04    27  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04    28  			reg = <0x0 0x0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    29  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04    30  			power-domains = <&cpu_pd0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    31  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11    32  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11    33  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    34  			next-level-cache = <&l2_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    35  			#cooling-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    36  
8e266654a2fe82 Lijuan Gao       2024-11-04    37  			l2_0: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04    38  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04    39  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    40  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04    41  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    42  			};
8e266654a2fe82 Lijuan Gao       2024-11-04    43  		};
8e266654a2fe82 Lijuan Gao       2024-11-04    44  
8e266654a2fe82 Lijuan Gao       2024-11-04    45  		cpu1: cpu@100 {
8e266654a2fe82 Lijuan Gao       2024-11-04    46  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04    47  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04    48  			reg = <0x0 0x100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    49  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04    50  			power-domains = <&cpu_pd1>;
8e266654a2fe82 Lijuan Gao       2024-11-04    51  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11    52  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11    53  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    54  			next-level-cache = <&l2_100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    55  
8e266654a2fe82 Lijuan Gao       2024-11-04    56  			l2_100: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04    57  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04    58  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    59  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04    60  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    61  			};
8e266654a2fe82 Lijuan Gao       2024-11-04    62  		};
8e266654a2fe82 Lijuan Gao       2024-11-04    63  
8e266654a2fe82 Lijuan Gao       2024-11-04    64  		cpu2: cpu@200 {
8e266654a2fe82 Lijuan Gao       2024-11-04    65  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04    66  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04    67  			reg = <0x0 0x200>;
8e266654a2fe82 Lijuan Gao       2024-11-04    68  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04    69  			power-domains = <&cpu_pd2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    70  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11    71  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11    72  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    73  			next-level-cache = <&l2_200>;
8e266654a2fe82 Lijuan Gao       2024-11-04    74  
8e266654a2fe82 Lijuan Gao       2024-11-04    75  			l2_200: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04    76  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04    77  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    78  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04    79  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    80  			};
8e266654a2fe82 Lijuan Gao       2024-11-04    81  		};
8e266654a2fe82 Lijuan Gao       2024-11-04    82  
8e266654a2fe82 Lijuan Gao       2024-11-04    83  		cpu3: cpu@300 {
8e266654a2fe82 Lijuan Gao       2024-11-04    84  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04    85  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04    86  			reg = <0x0 0x300>;
8e266654a2fe82 Lijuan Gao       2024-11-04    87  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04    88  			power-domains = <&cpu_pd3>;
8e266654a2fe82 Lijuan Gao       2024-11-04    89  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11    90  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11    91  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04    92  			next-level-cache = <&l2_300>;
8e266654a2fe82 Lijuan Gao       2024-11-04    93  
8e266654a2fe82 Lijuan Gao       2024-11-04    94  			l2_300: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04    95  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04    96  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04    97  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04    98  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04    99  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   100  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   101  
8e266654a2fe82 Lijuan Gao       2024-11-04   102  		cpu4: cpu@400 {
8e266654a2fe82 Lijuan Gao       2024-11-04   103  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04   104  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04   105  			reg = <0x0 0x400>;
8e266654a2fe82 Lijuan Gao       2024-11-04   106  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04   107  			power-domains = <&cpu_pd4>;
8e266654a2fe82 Lijuan Gao       2024-11-04   108  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11   109  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11   110  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04   111  			next-level-cache = <&l2_400>;
8e266654a2fe82 Lijuan Gao       2024-11-04   112  
8e266654a2fe82 Lijuan Gao       2024-11-04   113  			l2_400: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04   114  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04   115  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   116  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04   117  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   118  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   119  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   120  
8e266654a2fe82 Lijuan Gao       2024-11-04   121  		cpu5: cpu@500 {
8e266654a2fe82 Lijuan Gao       2024-11-04   122  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04   123  			compatible = "arm,cortex-a55";
8e266654a2fe82 Lijuan Gao       2024-11-04   124  			reg = <0x0 0x500>;
8e266654a2fe82 Lijuan Gao       2024-11-04   125  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04   126  			power-domains = <&cpu_pd5>;
8e266654a2fe82 Lijuan Gao       2024-11-04   127  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11   128  			capacity-dmips-mhz = <1024>;
82db707eb97d96 Lijuan Gao       2024-12-11   129  			dynamic-power-coefficient = <100>;
8e266654a2fe82 Lijuan Gao       2024-11-04   130  			next-level-cache = <&l2_500>;
8e266654a2fe82 Lijuan Gao       2024-11-04   131  
8e266654a2fe82 Lijuan Gao       2024-11-04   132  			l2_500: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04   133  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04   134  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   135  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04   136  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   137  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   138  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   139  
8e266654a2fe82 Lijuan Gao       2024-11-04   140  		cpu6: cpu@600 {
8e266654a2fe82 Lijuan Gao       2024-11-04   141  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04   142  			compatible = "arm,cortex-a76";
8e266654a2fe82 Lijuan Gao       2024-11-04   143  			reg = <0x0 0x600>;
8e266654a2fe82 Lijuan Gao       2024-11-04   144  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04   145  			power-domains = <&cpu_pd6>;
8e266654a2fe82 Lijuan Gao       2024-11-04   146  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11   147  			capacity-dmips-mhz = <1740>;
82db707eb97d96 Lijuan Gao       2024-12-11   148  			dynamic-power-coefficient = <404>;
8e266654a2fe82 Lijuan Gao       2024-11-04   149  			next-level-cache = <&l2_600>;
8e266654a2fe82 Lijuan Gao       2024-11-04   150  			#cooling-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   151  
8e266654a2fe82 Lijuan Gao       2024-11-04   152  			l2_600: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04   153  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04   154  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   155  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04   156  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   157  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   158  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   159  
8e266654a2fe82 Lijuan Gao       2024-11-04   160  		cpu7: cpu@700 {
8e266654a2fe82 Lijuan Gao       2024-11-04   161  			device_type = "cpu";
8e266654a2fe82 Lijuan Gao       2024-11-04   162  			compatible = "arm,cortex-a76";
8e266654a2fe82 Lijuan Gao       2024-11-04   163  			reg = <0x0 0x700>;
8e266654a2fe82 Lijuan Gao       2024-11-04   164  			enable-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04   165  			power-domains = <&cpu_pd7>;
8e266654a2fe82 Lijuan Gao       2024-11-04   166  			power-domain-names = "psci";
82db707eb97d96 Lijuan Gao       2024-12-11   167  			capacity-dmips-mhz = <1740>;
82db707eb97d96 Lijuan Gao       2024-12-11   168  			dynamic-power-coefficient = <404>;
8e266654a2fe82 Lijuan Gao       2024-11-04   169  			next-level-cache = <&l2_700>;
8e266654a2fe82 Lijuan Gao       2024-11-04   170  
8e266654a2fe82 Lijuan Gao       2024-11-04   171  			l2_700: l2-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04   172  			      compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04   173  			      cache-level = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   174  			      cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04   175  			      next-level-cache = <&l3_0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   176  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   177  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   178  
8e266654a2fe82 Lijuan Gao       2024-11-04   179  		cpu-map {
8e266654a2fe82 Lijuan Gao       2024-11-04   180  			cluster0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   181  				core0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   182  					cpu = <&cpu0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   183  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   184  
8e266654a2fe82 Lijuan Gao       2024-11-04   185  				core1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   186  					cpu = <&cpu1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   187  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   188  
8e266654a2fe82 Lijuan Gao       2024-11-04   189  				core2 {
8e266654a2fe82 Lijuan Gao       2024-11-04   190  					cpu = <&cpu2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   191  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   192  
8e266654a2fe82 Lijuan Gao       2024-11-04   193  				core3 {
8e266654a2fe82 Lijuan Gao       2024-11-04   194  					cpu = <&cpu3>;
8e266654a2fe82 Lijuan Gao       2024-11-04   195  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   196  
8e266654a2fe82 Lijuan Gao       2024-11-04   197  				core4 {
8e266654a2fe82 Lijuan Gao       2024-11-04   198  					cpu = <&cpu4>;
8e266654a2fe82 Lijuan Gao       2024-11-04   199  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   200  
8e266654a2fe82 Lijuan Gao       2024-11-04   201  				core5 {
8e266654a2fe82 Lijuan Gao       2024-11-04   202  					cpu = <&cpu5>;
8e266654a2fe82 Lijuan Gao       2024-11-04   203  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   204  
8e266654a2fe82 Lijuan Gao       2024-11-04   205  				core6 {
8e266654a2fe82 Lijuan Gao       2024-11-04   206  					cpu = <&cpu6>;
8e266654a2fe82 Lijuan Gao       2024-11-04   207  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   208  
8e266654a2fe82 Lijuan Gao       2024-11-04   209  				core7 {
8e266654a2fe82 Lijuan Gao       2024-11-04   210  					cpu = <&cpu7>;
8e266654a2fe82 Lijuan Gao       2024-11-04   211  				};
8e266654a2fe82 Lijuan Gao       2024-11-04   212  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   213  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   214  
8e266654a2fe82 Lijuan Gao       2024-11-04   215  		l3_0: l3-cache {
8e266654a2fe82 Lijuan Gao       2024-11-04   216  			compatible = "cache";
8e266654a2fe82 Lijuan Gao       2024-11-04   217  			cache-level = <3>;
8e266654a2fe82 Lijuan Gao       2024-11-04   218  			cache-unified;
8e266654a2fe82 Lijuan Gao       2024-11-04   219  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   220  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   221  
bf469630552a39 Jie Gan          2024-11-06   222  	dummy_eud: dummy-sink {
bf469630552a39 Jie Gan          2024-11-06   223  		compatible = "arm,coresight-dummy-sink";
bf469630552a39 Jie Gan          2024-11-06   224  
bf469630552a39 Jie Gan          2024-11-06   225  		in-ports {
bf469630552a39 Jie Gan          2024-11-06   226  			port {
bf469630552a39 Jie Gan          2024-11-06   227  				eud_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06   228  					remote-endpoint = <&replicator_swao_out1>;
bf469630552a39 Jie Gan          2024-11-06   229  				};
bf469630552a39 Jie Gan          2024-11-06   230  			};
bf469630552a39 Jie Gan          2024-11-06   231  		};
bf469630552a39 Jie Gan          2024-11-06   232  	};
bf469630552a39 Jie Gan          2024-11-06   233  
8e266654a2fe82 Lijuan Gao       2024-11-04   234  	idle-states {
8e266654a2fe82 Lijuan Gao       2024-11-04   235  		entry-method = "psci";
8e266654a2fe82 Lijuan Gao       2024-11-04   236  
8e266654a2fe82 Lijuan Gao       2024-11-04   237  		little_cpu_sleep_0: cpu-sleep-0-0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   238  			compatible = "arm,idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   239  			idle-state-name = "silver-power-collapse";
8e266654a2fe82 Lijuan Gao       2024-11-04   240  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe82 Lijuan Gao       2024-11-04   241  			entry-latency-us = <549>;
8e266654a2fe82 Lijuan Gao       2024-11-04   242  			exit-latency-us = <901>;
8e266654a2fe82 Lijuan Gao       2024-11-04   243  			min-residency-us = <1774>;
8e266654a2fe82 Lijuan Gao       2024-11-04   244  			local-timer-stop;
8e266654a2fe82 Lijuan Gao       2024-11-04   245  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   246  
8e266654a2fe82 Lijuan Gao       2024-11-04   247  		little_cpu_sleep_1: cpu-sleep-0-1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   248  			compatible = "arm,idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   249  			idle-state-name = "silver-rail-power-collapse";
8e266654a2fe82 Lijuan Gao       2024-11-04   250  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe82 Lijuan Gao       2024-11-04   251  			entry-latency-us = <702>;
8e266654a2fe82 Lijuan Gao       2024-11-04   252  			exit-latency-us = <915>;
8e266654a2fe82 Lijuan Gao       2024-11-04   253  			min-residency-us = <4001>;
8e266654a2fe82 Lijuan Gao       2024-11-04   254  			local-timer-stop;
8e266654a2fe82 Lijuan Gao       2024-11-04   255  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   256  
8e266654a2fe82 Lijuan Gao       2024-11-04   257  		big_cpu_sleep_0: cpu-sleep-1-0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   258  			compatible = "arm,idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   259  			idle-state-name = "gold-power-collapse";
8e266654a2fe82 Lijuan Gao       2024-11-04   260  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe82 Lijuan Gao       2024-11-04   261  			entry-latency-us = <523>;
8e266654a2fe82 Lijuan Gao       2024-11-04   262  			exit-latency-us = <1244>;
8e266654a2fe82 Lijuan Gao       2024-11-04   263  			min-residency-us = <2207>;
8e266654a2fe82 Lijuan Gao       2024-11-04   264  			local-timer-stop;
8e266654a2fe82 Lijuan Gao       2024-11-04   265  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   266  
8e266654a2fe82 Lijuan Gao       2024-11-04   267  		big_cpu_sleep_1: cpu-sleep-1-1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   268  			compatible = "arm,idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   269  			idle-state-name = "gold-rail-power-collapse";
8e266654a2fe82 Lijuan Gao       2024-11-04   270  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe82 Lijuan Gao       2024-11-04   271  			entry-latency-us = <526>;
8e266654a2fe82 Lijuan Gao       2024-11-04   272  			exit-latency-us = <1854>;
8e266654a2fe82 Lijuan Gao       2024-11-04   273  			min-residency-us = <5555>;
8e266654a2fe82 Lijuan Gao       2024-11-04   274  			local-timer-stop;
8e266654a2fe82 Lijuan Gao       2024-11-04   275  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   276  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   277  
8e266654a2fe82 Lijuan Gao       2024-11-04   278  	domain-idle-states {
8e266654a2fe82 Lijuan Gao       2024-11-04   279  		cluster_sleep_0: cluster-sleep-0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   280  			compatible = "domain-idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   281  			arm,psci-suspend-param = <0x41000044>;
8e266654a2fe82 Lijuan Gao       2024-11-04   282  			entry-latency-us = <2752>;
8e266654a2fe82 Lijuan Gao       2024-11-04   283  			exit-latency-us = <3048>;
8e266654a2fe82 Lijuan Gao       2024-11-04   284  			min-residency-us = <6118>;
8e266654a2fe82 Lijuan Gao       2024-11-04   285  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   286  
8e266654a2fe82 Lijuan Gao       2024-11-04   287  		cluster_sleep_1: cluster-sleep-1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   288  			compatible = "domain-idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   289  			arm,psci-suspend-param = <0x41001344>;
8e266654a2fe82 Lijuan Gao       2024-11-04   290  			entry-latency-us = <3263>;
8e266654a2fe82 Lijuan Gao       2024-11-04   291  			exit-latency-us = <4562>;
8e266654a2fe82 Lijuan Gao       2024-11-04   292  			min-residency-us = <8467>;
8e266654a2fe82 Lijuan Gao       2024-11-04   293  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   294  
8e266654a2fe82 Lijuan Gao       2024-11-04   295  		cluster_sleep_2: cluster-sleep-2 {
8e266654a2fe82 Lijuan Gao       2024-11-04   296  			compatible = "domain-idle-state";
8e266654a2fe82 Lijuan Gao       2024-11-04   297  			arm,psci-suspend-param = <0x4100b344>;
8e266654a2fe82 Lijuan Gao       2024-11-04   298  			entry-latency-us = <3638>;
8e266654a2fe82 Lijuan Gao       2024-11-04   299  			exit-latency-us = <6562>;
8e266654a2fe82 Lijuan Gao       2024-11-04   300  			min-residency-us = <9826>;
8e266654a2fe82 Lijuan Gao       2024-11-04   301  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   302  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   303  
8e266654a2fe82 Lijuan Gao       2024-11-04   304  	memory@80000000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   305  		device_type = "memory";
8e266654a2fe82 Lijuan Gao       2024-11-04   306  		/* We expect the bootloader to fill in the size */
8e266654a2fe82 Lijuan Gao       2024-11-04   307  		reg = <0 0x80000000 0 0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   308  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   309  
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   310  	firmware {
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   311  		scm {
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   312  			compatible = "qcom,scm-qcs615", "qcom,scm";
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   313  			qcom,dload-mode = <&tcsr 0x13000>;
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   314  		};
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   315  	};
8c7f9d73de1bdb Qingqing Zhou    2024-11-05   316  
8e266654a2fe82 Lijuan Gao       2024-11-04   317  	camnoc_virt: interconnect-0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   318  		compatible = "qcom,qcs615-camnoc-virt";
8e266654a2fe82 Lijuan Gao       2024-11-04   319  		#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   320  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   321  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   322  
8e266654a2fe82 Lijuan Gao       2024-11-04   323  	ipa_virt: interconnect-1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   324  		compatible = "qcom,qcs615-ipa-virt";
8e266654a2fe82 Lijuan Gao       2024-11-04   325  		#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   326  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   327  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   328  
8e266654a2fe82 Lijuan Gao       2024-11-04   329  	mc_virt: interconnect-2 {
8e266654a2fe82 Lijuan Gao       2024-11-04   330  		compatible = "qcom,qcs615-mc-virt";
8e266654a2fe82 Lijuan Gao       2024-11-04   331  		#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   332  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   333  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   334  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   335  	qup_opp_table: opp-table-qup {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   336  		compatible = "operating-points-v2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   337  		opp-shared;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   338  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   339  		opp-75000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   340  			opp-hz = /bits/ 64 <75000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   341  			required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   342  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   343  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   344  		opp-100000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   345  			opp-hz = /bits/ 64 <100000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   346  			required-opps = <&rpmhpd_opp_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   347  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   348  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   349  		opp-128000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   350  			opp-hz = /bits/ 64 <128000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   351  			required-opps = <&rpmhpd_opp_nom>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   352  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   353  	};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   354  
8e266654a2fe82 Lijuan Gao       2024-11-04   355  	psci {
8e266654a2fe82 Lijuan Gao       2024-11-04   356  		compatible = "arm,psci-1.0";
8e266654a2fe82 Lijuan Gao       2024-11-04   357  		method = "smc";
8e266654a2fe82 Lijuan Gao       2024-11-04   358  
8e266654a2fe82 Lijuan Gao       2024-11-04   359  		cpu_pd0: power-domain-cpu0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   360  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   361  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   362  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   363  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   364  
8e266654a2fe82 Lijuan Gao       2024-11-04   365  		cpu_pd1: power-domain-cpu1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   366  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   367  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   368  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   369  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   370  
8e266654a2fe82 Lijuan Gao       2024-11-04   371  		cpu_pd2: power-domain-cpu2 {
8e266654a2fe82 Lijuan Gao       2024-11-04   372  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   373  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   374  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   375  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   376  
8e266654a2fe82 Lijuan Gao       2024-11-04   377  		cpu_pd3: power-domain-cpu3 {
8e266654a2fe82 Lijuan Gao       2024-11-04   378  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   379  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   380  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   381  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   382  
8e266654a2fe82 Lijuan Gao       2024-11-04   383  		cpu_pd4: power-domain-cpu4 {
8e266654a2fe82 Lijuan Gao       2024-11-04   384  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   385  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   386  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   387  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   388  
8e266654a2fe82 Lijuan Gao       2024-11-04   389  		cpu_pd5: power-domain-cpu5 {
8e266654a2fe82 Lijuan Gao       2024-11-04   390  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   391  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   392  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   393  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   394  
8e266654a2fe82 Lijuan Gao       2024-11-04   395  		cpu_pd6: power-domain-cpu6 {
8e266654a2fe82 Lijuan Gao       2024-11-04   396  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   397  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   398  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   399  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   400  
8e266654a2fe82 Lijuan Gao       2024-11-04   401  		cpu_pd7: power-domain-cpu7 {
8e266654a2fe82 Lijuan Gao       2024-11-04   402  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   403  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   404  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   405  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   406  
8e266654a2fe82 Lijuan Gao       2024-11-04   407  		cluster_pd: power-domain-cluster {
8e266654a2fe82 Lijuan Gao       2024-11-04   408  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   409  			domain-idle-states = <&cluster_sleep_0
8e266654a2fe82 Lijuan Gao       2024-11-04   410  					      &cluster_sleep_1
8e266654a2fe82 Lijuan Gao       2024-11-04   411  					      &cluster_sleep_2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   412  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   413  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   414  
8e266654a2fe82 Lijuan Gao       2024-11-04   415  	reserved-memory {
8e266654a2fe82 Lijuan Gao       2024-11-04   416  		#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   417  		#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   418  		ranges;
8e266654a2fe82 Lijuan Gao       2024-11-04   419  
8e266654a2fe82 Lijuan Gao       2024-11-04   420  		smem_region: smem@86000000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   421  			compatible = "qcom,smem";
8e266654a2fe82 Lijuan Gao       2024-11-04   422  			reg = <0x0 0x86000000 0x0 0x200000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   423  			no-map;
8e266654a2fe82 Lijuan Gao       2024-11-04   424  			hwlocks = <&tcsr_mutex 3>;
8e266654a2fe82 Lijuan Gao       2024-11-04   425  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   426  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   427  
8e266654a2fe82 Lijuan Gao       2024-11-04   428  	soc: soc@0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   429  		compatible = "simple-bus";
8e266654a2fe82 Lijuan Gao       2024-11-04   430  		ranges = <0 0 0 0 0x10 0>;
58241be90050e5 Qingqing Zhou    2024-11-05   431  		dma-ranges = <0 0 0 0 0x10 0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   432  		#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   433  		#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   434  
8e266654a2fe82 Lijuan Gao       2024-11-04   435  		gcc: clock-controller@100000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   436  			compatible = "qcom,qcs615-gcc";
8e266654a2fe82 Lijuan Gao       2024-11-04   437  			reg = <0 0x00100000 0 0x1f0000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   438  
8e266654a2fe82 Lijuan Gao       2024-11-04   439  			#clock-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   440  			#reset-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   441  			#power-domain-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   442  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   443  
8e266654a2fe82 Lijuan Gao       2024-11-04   444  		qfprom: efuse@780000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   445  			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
8e266654a2fe82 Lijuan Gao       2024-11-04   446  			reg = <0x0 0x00780000 0x0 0x7000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   447  			#address-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   448  			#size-cells = <1>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   449  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   450  			qusb2_hstx_trim: hstx-trim@1f8 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   451  				reg = <0x1fb 0x1>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   452  				bits = <1 4>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   453  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   454  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   455  
8009de059f8693 Yuanjie Yang     2024-12-17   456  		sdhc_1: mmc@7c4000 {
8009de059f8693 Yuanjie Yang     2024-12-17   457  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 Yuanjie Yang     2024-12-17   458  			reg = <0x0 0x007c4000 0x0 0x1000>,
8009de059f8693 Yuanjie Yang     2024-12-17   459  			      <0x0 0x007c5000 0x0 0x1000>,
8009de059f8693 Yuanjie Yang     2024-12-17   460  			      <0x0 0x007c8000 0x0 0x8000>;
8009de059f8693 Yuanjie Yang     2024-12-17   461  			reg-names = "hc",
8009de059f8693 Yuanjie Yang     2024-12-17   462  				    "cqhci",
8009de059f8693 Yuanjie Yang     2024-12-17   463  				    "ice";
8009de059f8693 Yuanjie Yang     2024-12-17   464  
8009de059f8693 Yuanjie Yang     2024-12-17   465  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 Yuanjie Yang     2024-12-17   466  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 Yuanjie Yang     2024-12-17   467  			interrupt-names = "hc_irq",
8009de059f8693 Yuanjie Yang     2024-12-17   468  					  "pwr_irq";
8009de059f8693 Yuanjie Yang     2024-12-17   469  
8009de059f8693 Yuanjie Yang     2024-12-17   470  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   471  				 <&gcc GCC_SDCC1_APPS_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   472  				 <&rpmhcc RPMH_CXO_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   473  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
8009de059f8693 Yuanjie Yang     2024-12-17   474  			clock-names = "iface",
8009de059f8693 Yuanjie Yang     2024-12-17   475  				      "core",
8009de059f8693 Yuanjie Yang     2024-12-17   476  				      "xo",
8009de059f8693 Yuanjie Yang     2024-12-17   477  				      "ice";
8009de059f8693 Yuanjie Yang     2024-12-17   478  
8009de059f8693 Yuanjie Yang     2024-12-17   479  			resets = <&gcc GCC_SDCC1_BCR>;
8009de059f8693 Yuanjie Yang     2024-12-17   480  
8009de059f8693 Yuanjie Yang     2024-12-17   481  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 Yuanjie Yang     2024-12-17   482  			operating-points-v2 = <&sdhc1_opp_table>;
8009de059f8693 Yuanjie Yang     2024-12-17   483  			iommus = <&apps_smmu 0x02c0 0x0>;
8009de059f8693 Yuanjie Yang     2024-12-17   484  			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
8009de059f8693 Yuanjie Yang     2024-12-17   485  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 Yuanjie Yang     2024-12-17   486  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 Yuanjie Yang     2024-12-17   487  					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 Yuanjie Yang     2024-12-17   488  			interconnect-names = "sdhc-ddr",
8009de059f8693 Yuanjie Yang     2024-12-17   489  					     "cpu-sdhc";
8009de059f8693 Yuanjie Yang     2024-12-17   490  
8009de059f8693 Yuanjie Yang     2024-12-17   491  			qcom,dll-config = <0x000f642c>;
8009de059f8693 Yuanjie Yang     2024-12-17   492  			qcom,ddr-config = <0x80040868>;
8009de059f8693 Yuanjie Yang     2024-12-17   493  			supports-cqe;
8009de059f8693 Yuanjie Yang     2024-12-17   494  			dma-coherent;
8009de059f8693 Yuanjie Yang     2024-12-17   495  
8009de059f8693 Yuanjie Yang     2024-12-17   496  			status = "disabled";
8009de059f8693 Yuanjie Yang     2024-12-17   497  
8009de059f8693 Yuanjie Yang     2024-12-17   498  			sdhc1_opp_table: opp-table {
8009de059f8693 Yuanjie Yang     2024-12-17   499  				compatible = "operating-points-v2";
8009de059f8693 Yuanjie Yang     2024-12-17   500  
8009de059f8693 Yuanjie Yang     2024-12-17   501  				opp-50000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   502  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   503  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17   504  				};
8009de059f8693 Yuanjie Yang     2024-12-17   505  
8009de059f8693 Yuanjie Yang     2024-12-17   506  				opp-100000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   507  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   508  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17   509  				};
8009de059f8693 Yuanjie Yang     2024-12-17   510  
8009de059f8693 Yuanjie Yang     2024-12-17   511  				opp-200000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   512  					opp-hz = /bits/ 64 <200000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   513  					required-opps = <&rpmhpd_opp_svs_l1>;
8009de059f8693 Yuanjie Yang     2024-12-17   514  				};
8009de059f8693 Yuanjie Yang     2024-12-17   515  
8009de059f8693 Yuanjie Yang     2024-12-17   516  				opp-384000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   517  					opp-hz = /bits/ 64 <384000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   518  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 Yuanjie Yang     2024-12-17   519  				};
8009de059f8693 Yuanjie Yang     2024-12-17   520  			};
8009de059f8693 Yuanjie Yang     2024-12-17   521  		};
8009de059f8693 Yuanjie Yang     2024-12-17   522  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   523  		gpi_dma0: dma-controller@800000  {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   524  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   525  			reg = <0x0 0x800000 0x0 0x60000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   526  			#dma-cells = <3>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   527  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   528  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   529  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   530  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   531  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   532  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   533  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   534  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   535  			dma-channels = <8>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   536  			dma-channel-mask = <0xf>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   537  			iommus = <&apps_smmu 0xd6 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   538  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   539  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   540  
8e266654a2fe82 Lijuan Gao       2024-11-04   541  		qupv3_id_0: geniqup@8c0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   542  			compatible = "qcom,geni-se-qup";
8e266654a2fe82 Lijuan Gao       2024-11-04   543  			reg = <0x0 0x008c0000 0x0 0x6000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   544  			ranges;
8e266654a2fe82 Lijuan Gao       2024-11-04   545  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
8e266654a2fe82 Lijuan Gao       2024-11-04   546  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
8e266654a2fe82 Lijuan Gao       2024-11-04   547  			clock-names = "m-ahb",
8e266654a2fe82 Lijuan Gao       2024-11-04   548  				      "s-ahb";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   549  			iommus = <&apps_smmu 0xc3 0x0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   550  			#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   551  			#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   552  			status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04   553  
8e266654a2fe82 Lijuan Gao       2024-11-04   554  			uart0: serial@880000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   555  				compatible = "qcom,geni-debug-uart";
8e266654a2fe82 Lijuan Gao       2024-11-04   556  				reg = <0x0 0x00880000 0x0 0x4000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   557  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
8e266654a2fe82 Lijuan Gao       2024-11-04   558  				clock-names = "se";
8e266654a2fe82 Lijuan Gao       2024-11-04   559  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
8e266654a2fe82 Lijuan Gao       2024-11-04   560  				pinctrl-names = "default";
8e266654a2fe82 Lijuan Gao       2024-11-04   561  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   562  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   563  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   564  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   565  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   566  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   567  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   568  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   569  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   570  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   571  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   572  			i2c1: i2c@884000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   573  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   574  				reg = <0x0 0x884000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   575  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   576  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   577  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   578  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   579  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   580  				pinctrl-0 = <&qup_i2c1_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   581  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   582  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   583  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   584  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   585  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   586  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   587  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   588  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   589  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   590  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   591  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   592  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   593  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   594  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   595  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   596  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   597  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   598  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   599  			i2c2: i2c@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   600  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   601  				reg = <0x0 0x888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   602  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   603  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   604  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   605  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   606  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   607  				pinctrl-0 = <&qup_i2c2_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   608  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   609  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   610  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   611  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   612  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   613  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   614  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   615  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   616  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   617  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   618  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   619  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   620  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   621  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   622  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   623  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   624  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   625  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   626  			spi2: spi@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   627  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   628  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   629  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   630  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   631  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   632  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   633  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   634  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   635  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   636  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   637  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   638  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   639  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   640  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   641  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   642  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   643  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   644  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   645  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   646  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   647  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   648  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   649  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   650  			uart2: serial@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   651  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   652  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   653  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   654  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   655  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   656  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   657  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   658  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   659  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   660  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   661  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   662  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   663  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   664  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   665  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   666  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   667  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   668  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   669  			i2c3: i2c@88c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   670  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   671  				reg = <0x0 0x88c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   672  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   673  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   674  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   675  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   676  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   677  				pinctrl-0 = <&qup_i2c3_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   678  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   679  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   680  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   681  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   682  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   683  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   684  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   685  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   686  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   687  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   688  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   689  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   690  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   691  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   692  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   693  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   694  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   695  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   696  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   697  		gpi_dma1: dma-controller@a00000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   698  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   699  			reg = <0x0 0xa00000 0x0 0x60000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   700  			#dma-cells = <3>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   701  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   702  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   703  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   704  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   705  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   706  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   707  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   708  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   709  			dma-channels = <8>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   710  			dma-channel-mask = <0xf>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   711  			iommus = <&apps_smmu 0x376 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   712  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   713  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   714  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   715  		qupv3_id_1: geniqup@ac0000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   716  			compatible = "qcom,geni-se-qup";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   717  			reg = <0x0 0xac0000 0x0 0x2000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   718  			ranges;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   719  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   720  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   721  			clock-names = "m-ahb",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   722  				      "s-ahb";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   723  			iommus = <&apps_smmu 0x363 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   724  			#address-cells = <2>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   725  			#size-cells = <2>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   726  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   727  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   728  			i2c4: i2c@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   729  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   730  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   731  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   732  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   733  				pinctrl-0 = <&qup_i2c4_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   734  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   735  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   736  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   737  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   738  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   739  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   740  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   741  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   742  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   743  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   744  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   745  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   746  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   747  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   748  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   749  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   750  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   751  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   752  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   753  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   754  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   755  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   756  			spi4: spi@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   757  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   758  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   759  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   760  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   761  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   762  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   763  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   764  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   765  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   766  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   767  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   768  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   769  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   770  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   771  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   772  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   773  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   774  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   775  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   776  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   777  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   778  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   779  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   780  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   781  			uart4: serial@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   782  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   783  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   784  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   785  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   786  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   787  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   788  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   789  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   790  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   791  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   792  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   793  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   794  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   795  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   796  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   797  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   798  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   799  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   800  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   801  			i2c5: i2c@a84000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   802  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   803  				reg = <0x0 0xa84000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   804  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   805  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   806  				pinctrl-0 = <&qup_i2c5_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   807  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   808  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   809  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   810  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   811  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   812  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   813  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   814  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   815  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   816  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   817  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   818  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   819  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   820  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   821  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   822  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   823  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   824  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   825  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   826  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   827  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   828  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   829  			i2c6: i2c@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   830  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   831  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   832  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   833  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   834  				pinctrl-0 = <&qup_i2c6_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   835  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   836  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   837  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   838  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   839  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   840  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   841  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   842  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   843  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   844  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   845  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   846  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   847  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   848  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   849  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   850  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   851  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   852  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   853  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   854  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   855  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   856  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   857  			spi6: spi@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   858  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   859  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   860  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   861  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   862  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   863  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   864  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   865  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   866  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   867  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   868  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   869  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   870  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   871  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   872  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   873  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   874  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   875  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   876  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   877  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   878  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   879  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   880  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   881  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   882  			uart6: serial@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   883  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   884  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   885  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   886  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   887  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   888  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   889  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   890  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   891  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   892  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   893  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   894  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   895  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   896  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   897  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   898  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   899  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   900  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   901  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   902  			i2c7: i2c@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   903  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   904  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   905  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   906  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   907  				pinctrl-0 = <&qup_i2c7_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   908  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   909  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   910  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   911  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   912  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   913  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   914  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   915  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   916  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   917  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   918  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   919  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   920  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   921  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   922  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   923  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   924  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   925  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   926  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   927  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   928  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   929  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   930  			spi7: spi@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   931  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   932  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   933  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   934  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   935  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   936  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   937  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   938  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   939  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   940  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   941  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   942  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   943  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
8e266654a2fe82 Lijuan Gao       2024-11-04   944  				interconnect-names = "qup-core",
8e266654a2fe82 Lijuan Gao       2024-11-04   945  						     "qup-config";
8e266654a2fe82 Lijuan Gao       2024-11-04   946  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   947  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   948  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   949  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   950  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   951  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   952  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   953  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   954  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   955  			uart7: serial@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   956  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   957  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   958  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   959  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   960  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   961  					    <&qup_uart7_tx>, <&qup_uart7_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   962  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   963  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   964  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   965  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   966  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   967  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   968  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   969  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   970  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   971  				operating-points-v2 = <&qup_opp_table>;
8e266654a2fe82 Lijuan Gao       2024-11-04   972  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04   973  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   974  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   975  
8e266654a2fe82 Lijuan Gao       2024-11-04   976  		config_noc: interconnect@1500000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   977  			reg = <0x0 0x01500000 0x0 0x5080>;
8e266654a2fe82 Lijuan Gao       2024-11-04   978  			compatible = "qcom,qcs615-config-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04   979  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   980  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   981  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   982  
8e266654a2fe82 Lijuan Gao       2024-11-04   983  		system_noc: interconnect@1620000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   984  			reg = <0x0 0x01620000 0x0 0x1f300>;
8e266654a2fe82 Lijuan Gao       2024-11-04   985  			compatible = "qcom,qcs615-system-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04   986  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   987  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   988  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   989  
8e266654a2fe82 Lijuan Gao       2024-11-04   990  		aggre1_noc: interconnect@1700000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   991  			reg = <0x0 0x01700000 0x0 0x3f200>;
8e266654a2fe82 Lijuan Gao       2024-11-04   992  			compatible = "qcom,qcs615-aggre1-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04   993  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   994  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04   995  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   996  
8e266654a2fe82 Lijuan Gao       2024-11-04   997  		mmss_noc: interconnect@1740000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   998  			reg = <0x0 0x01740000 0x0 0x1c100>;
8e266654a2fe82 Lijuan Gao       2024-11-04   999  			compatible = "qcom,qcs615-mmss-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  1000  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1001  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1002  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1003  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1004  		ufs_mem_hc: ufshc@1d84000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1005  			compatible = "qcom,qcs615-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1006  			reg = <0x0 0x01d84000 0x0 0x3000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1007  			      <0x0 0x01d90000 0x0 0x8000>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1008  			reg-names = "std",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1009  				    "ice";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1010  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1011  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1012  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1013  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1014  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1015  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1016  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1017  				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1018  				 <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1019  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1020  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1021  			clock-names = "core_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1022  				      "bus_aggr_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1023  				      "iface_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1024  				      "core_clk_unipro",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1025  				      "core_clk_ice",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1026  				      "ref_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1027  				      "tx_lane0_sync_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1028  				      "rx_lane0_sync_clk";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1029  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1030  			resets = <&gcc GCC_UFS_PHY_BCR>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1031  			reset-names = "rst";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1032  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1033  			operating-points-v2 = <&ufs_opp_table>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1034  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
a6a9d10e796957 Sayali Lokhande  2024-12-16  1035  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1036  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a6a9d10e796957 Sayali Lokhande  2024-12-16  1037  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1038  			interconnect-names = "ufs-ddr",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1039  					     "cpu-ufs";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1040  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1041  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1042  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1043  			iommus = <&apps_smmu 0x300 0x0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1044  			dma-coherent;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1045  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1046  			lanes-per-direction = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1047  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1048  			phys = <&ufs_mem_phy>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1049  			phy-names = "ufsphy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1050  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1051  			#reset-cells = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1052  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1053  			status = "disabled";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1054  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1055  			ufs_opp_table: opp-table {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1056  				compatible = "operating-points-v2";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1057  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1058  				opp-50000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1059  					opp-hz = /bits/ 64 <50000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1060  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1061  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1062  						 /bits/ 64 <37500000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1063  						 /bits/ 64 <75000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1064  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1065  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1066  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1067  					required-opps = <&rpmhpd_opp_low_svs>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1068  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1069  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1070  				opp-100000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1071  					opp-hz = /bits/ 64 <100000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1072  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1073  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1074  						 /bits/ 64 <75000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1075  						 /bits/ 64 <150000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1076  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1077  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1078  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1079  					required-opps = <&rpmhpd_opp_svs>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1080  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1081  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1082  				opp-200000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1083  					opp-hz = /bits/ 64 <200000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1084  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1085  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1086  						 /bits/ 64 <150000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1087  						 /bits/ 64 <300000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1088  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1089  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1090  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1091  					required-opps = <&rpmhpd_opp_nom>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1092  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1093  			};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1094  		};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1095  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1096  		ufs_mem_phy: phy@1d87000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1097  			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1098  			reg = <0x0 0x01d87000 0x0 0xe00>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1099  			clocks = <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1100  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1101  				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1102  			clock-names = "ref",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1103  				      "ref_aux",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1104  				      "qref";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1105  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1106  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1107  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1108  			resets = <&ufs_mem_hc 0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1109  			reset-names = "ufsphy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1110  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1111  			#clock-cells = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1112  			#phy-cells = <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1113  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1114  			status = "disabled";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1115  		};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1116  
8e266654a2fe82 Lijuan Gao       2024-11-04  1117  		tcsr_mutex: hwlock@1f40000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1118  			compatible = "qcom,tcsr-mutex";
8e266654a2fe82 Lijuan Gao       2024-11-04  1119  			reg = <0x0 0x01f40000 0x0 0x20000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1120  			#hwlock-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1121  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1122  
8e266654a2fe82 Lijuan Gao       2024-11-04  1123  		tcsr: syscon@1fc0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1124  			compatible = "qcom,qcs615-tcsr", "syscon";
8e266654a2fe82 Lijuan Gao       2024-11-04  1125  			reg = <0x0 0x01fc0000 0x0 0x30000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1126  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1127  
8e266654a2fe82 Lijuan Gao       2024-11-04  1128  		tlmm: pinctrl@3100000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1129  			compatible = "qcom,qcs615-tlmm";
8e266654a2fe82 Lijuan Gao       2024-11-04  1130  			reg = <0x0 0x03100000 0x0 0x300000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  1131  			      <0x0 0x03500000 0x0 0x300000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  1132  			      <0x0 0x03d00000 0x0 0x300000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1133  			reg-names = "east",
8e266654a2fe82 Lijuan Gao       2024-11-04  1134  				    "west",
8e266654a2fe82 Lijuan Gao       2024-11-04  1135  				    "south";
8e266654a2fe82 Lijuan Gao       2024-11-04  1136  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
80c82827327d80 Lijuan Gao       2024-12-19  1137  			gpio-ranges = <&tlmm 0 0 124>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1138  			gpio-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  1139  			#gpio-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1140  			interrupt-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  1141  			#interrupt-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1142  			wakeup-parent = <&pdc>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1143  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1144  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1145  				pins = "gpio4", "gpio5";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1146  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1147  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1148  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1149  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1150  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1151  				pins = "gpio0", "gpio1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1152  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1153  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1154  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1155  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1156  				pins = "gpio18", "gpio19";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1157  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1158  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1159  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1160  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1161  				pins = "gpio20", "gpio21";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1162  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1163  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1164  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1165  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1166  				pins = "gpio14", "gpio15";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1167  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1168  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1169  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1170  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1171  				pins = "gpio6", "gpio7";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1172  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1173  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1174  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1175  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1176  				pins = "gpio10", "gpio11";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1177  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1178  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1179  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1180  			qup_spi2_data_clk: qup-spi2-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1181  				pins = "gpio0", "gpio1", "gpio2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1182  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1183  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1184  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1185  			qup_spi2_cs: qup-spi2-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1186  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1187  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1188  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1189  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1190  			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1191  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1192  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1193  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1194  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1195  			qup_spi4_data_clk: qup-spi4-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1196  				pins = "gpio20", "gpio21", "gpio22";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1197  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1198  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1199  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1200  			qup_spi4_cs: qup-spi4-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1201  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1202  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1203  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1204  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1205  			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1206  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1207  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1208  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1209  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1210  			qup_spi6_data_clk: qup-spi6-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1211  				pins = "gpio6", "gpio7", "gpio8";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1212  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1213  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1214  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1215  			qup_spi6_cs: qup-spi6-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1216  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1217  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1218  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1219  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1220  			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1221  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1222  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1223  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1224  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1225  			qup_spi7_data_clk: qup-spi7-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1226  				pins = "gpio10", "gpio11", "gpio12";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1227  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1228  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1229  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1230  			qup_spi7_cs: qup-spi7-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1231  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1232  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1233  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1234  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1235  			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1236  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1237  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1238  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1239  
8e266654a2fe82 Lijuan Gao       2024-11-04  1240  			qup_uart0_tx: qup-uart0-tx-state {
8e266654a2fe82 Lijuan Gao       2024-11-04  1241  				pins = "gpio16";
8e266654a2fe82 Lijuan Gao       2024-11-04  1242  				function = "qup0";
8e266654a2fe82 Lijuan Gao       2024-11-04  1243  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  1244  
8e266654a2fe82 Lijuan Gao       2024-11-04  1245  			qup_uart0_rx: qup-uart0-rx-state {
8e266654a2fe82 Lijuan Gao       2024-11-04  1246  				pins = "gpio17";
8e266654a2fe82 Lijuan Gao       2024-11-04  1247  				function = "qup0";
8e266654a2fe82 Lijuan Gao       2024-11-04  1248  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1249  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1250  			qup_uart2_cts: qup-uart2-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1251  				pins = "gpio0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1252  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1253  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1254  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1255  			qup_uart2_rts: qup-uart2-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1256  				pins = "gpio1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1257  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1258  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1259  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1260  			qup_uart2_tx: qup-uart2-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1261  				pins = "gpio2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1262  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1263  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1264  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1265  			qup_uart2_rx: qup-uart2-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1266  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1267  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1268  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1269  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1270  			qup_uart4_cts: qup-uart4-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1271  				pins = "gpio20";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1272  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1273  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1274  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1275  			qup_uart4_rts: qup-uart4-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1276  				pins = "gpio21";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1277  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1278  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1279  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1280  			qup_uart4_tx: qup-uart4-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1281  				pins = "gpio22";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1282  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1283  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1284  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1285  			qup_uart4_rx: qup-uart4-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1286  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1287  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1288  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1289  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1290  			qup_uart6_cts: qup-uart6-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1291  				pins = "gpio6";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1292  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1293  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1294  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1295  			qup_uart6_rts: qup-uart6-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1296  				pins = "gpio7";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1297  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1298  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1299  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1300  			qup_uart6_tx: qup-uart6-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1301  				pins = "gpio8";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1302  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1303  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1304  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1305  			qup_uart6_rx: qup-uart6-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1306  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1307  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1308  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1309  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1310  			qup_uart7_cts: qup-uart7-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1311  				pins = "gpio10";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1312  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1313  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1314  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1315  			qup_uart7_rts: qup-uart7-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1316  				pins = "gpio11";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1317  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1318  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1319  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1320  			qup_uart7_tx: qup-uart7-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1321  				pins = "gpio12";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1322  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1323  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1324  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1325  			qup_uart7_rx: qup-uart7-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1326  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1327  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1328  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1329  
8009de059f8693 Yuanjie Yang     2024-12-17  1330  			sdc1_state_on: sdc1-on-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1331  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1332  					pins = "sdc1_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1333  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1334  					drive-strength = <16>;
8009de059f8693 Yuanjie Yang     2024-12-17  1335  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1336  
8009de059f8693 Yuanjie Yang     2024-12-17  1337  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1338  					pins = "sdc1_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1339  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1340  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1341  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1342  
8009de059f8693 Yuanjie Yang     2024-12-17  1343  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1344  					pins = "sdc1_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1345  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1346  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1347  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1348  
8009de059f8693 Yuanjie Yang     2024-12-17  1349  				rclk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1350  					pins = "sdc1_rclk";
8009de059f8693 Yuanjie Yang     2024-12-17  1351  					bias-pull-down;
8009de059f8693 Yuanjie Yang     2024-12-17  1352  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1353  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1354  
8009de059f8693 Yuanjie Yang     2024-12-17  1355  			sdc1_state_off: sdc1-off-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1356  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1357  					pins = "sdc1_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1358  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1359  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1360  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1361  
8009de059f8693 Yuanjie Yang     2024-12-17  1362  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1363  					pins = "sdc1_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1364  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1365  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1366  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1367  
8009de059f8693 Yuanjie Yang     2024-12-17  1368  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1369  					pins = "sdc1_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1370  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1371  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1372  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1373  
8009de059f8693 Yuanjie Yang     2024-12-17  1374  				rclk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1375  					pins = "sdc1_rclk";
8009de059f8693 Yuanjie Yang     2024-12-17  1376  					bias-pull-down;
8009de059f8693 Yuanjie Yang     2024-12-17  1377  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1378  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1379  
8009de059f8693 Yuanjie Yang     2024-12-17  1380  			sdc2_state_on: sdc2-on-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1381  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1382  					pins = "sdc2_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1383  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1384  					drive-strength = <16>;
8009de059f8693 Yuanjie Yang     2024-12-17  1385  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1386  
8009de059f8693 Yuanjie Yang     2024-12-17  1387  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1388  					pins = "sdc2_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1389  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1390  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1391  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1392  
8009de059f8693 Yuanjie Yang     2024-12-17  1393  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1394  					pins = "sdc2_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1395  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1396  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1397  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1398  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1399  
8009de059f8693 Yuanjie Yang     2024-12-17  1400  			sdc2_state_off: sdc2-off-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1401  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1402  					pins = "sdc2_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1403  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1404  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1405  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1406  
8009de059f8693 Yuanjie Yang     2024-12-17  1407  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1408  					pins = "sdc2_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1409  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1410  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1411  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1412  
8009de059f8693 Yuanjie Yang     2024-12-17  1413  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1414  					pins = "sdc2_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1415  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1416  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1417  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1418  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  1419  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1420  
bf469630552a39 Jie Gan          2024-11-06  1421  		stm@6002000 {
bf469630552a39 Jie Gan          2024-11-06  1422  			compatible = "arm,coresight-stm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1423  			reg = <0x0 0x06002000 0x0 0x1000>,
bf469630552a39 Jie Gan          2024-11-06  1424  			      <0x0 0x16280000 0x0 0x180000>;
bf469630552a39 Jie Gan          2024-11-06  1425  			reg-names = "stm-base",
bf469630552a39 Jie Gan          2024-11-06  1426  				    "stm-stimulus-base";
bf469630552a39 Jie Gan          2024-11-06  1427  
bf469630552a39 Jie Gan          2024-11-06  1428  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1429  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1430  
bf469630552a39 Jie Gan          2024-11-06  1431  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1432  				port {
bf469630552a39 Jie Gan          2024-11-06  1433  					stm_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1434  						remote-endpoint = <&funnel_in0_in7>;
bf469630552a39 Jie Gan          2024-11-06  1435  					};
bf469630552a39 Jie Gan          2024-11-06  1436  				};
bf469630552a39 Jie Gan          2024-11-06  1437  			};
bf469630552a39 Jie Gan          2024-11-06  1438  		};
bf469630552a39 Jie Gan          2024-11-06  1439  
bf469630552a39 Jie Gan          2024-11-06  1440  		tpda@6004000 {
bf469630552a39 Jie Gan          2024-11-06  1441  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1442  			reg = <0x0 0x06004000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1443  
bf469630552a39 Jie Gan          2024-11-06  1444  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1445  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1446  
bf469630552a39 Jie Gan          2024-11-06  1447  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1448  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1449  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1450  
bf469630552a39 Jie Gan          2024-11-06  1451  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  1452  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  1453  
bf469630552a39 Jie Gan          2024-11-06  1454  					tpda_qdss_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1455  						remote-endpoint = <&tpdm_center_out>;
bf469630552a39 Jie Gan          2024-11-06  1456  					};
bf469630552a39 Jie Gan          2024-11-06  1457  				};
bf469630552a39 Jie Gan          2024-11-06  1458  
bf469630552a39 Jie Gan          2024-11-06  1459  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  1460  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  1461  
bf469630552a39 Jie Gan          2024-11-06  1462  					tpda_qdss_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1463  						remote-endpoint = <&funnel_monaq_out>;
bf469630552a39 Jie Gan          2024-11-06  1464  					};
bf469630552a39 Jie Gan          2024-11-06  1465  				};
bf469630552a39 Jie Gan          2024-11-06  1466  
bf469630552a39 Jie Gan          2024-11-06  1467  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  1468  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  1469  
bf469630552a39 Jie Gan          2024-11-06  1470  					tpda_qdss_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1471  						remote-endpoint = <&funnel_ddr_0_out>;
bf469630552a39 Jie Gan          2024-11-06  1472  					};
bf469630552a39 Jie Gan          2024-11-06  1473  				};
bf469630552a39 Jie Gan          2024-11-06  1474  
bf469630552a39 Jie Gan          2024-11-06  1475  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  1476  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  1477  
bf469630552a39 Jie Gan          2024-11-06  1478  					tpda_qdss_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1479  						remote-endpoint = <&funnel_turing_out>;
bf469630552a39 Jie Gan          2024-11-06  1480  					};
bf469630552a39 Jie Gan          2024-11-06  1481  				};
bf469630552a39 Jie Gan          2024-11-06  1482  
bf469630552a39 Jie Gan          2024-11-06  1483  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1484  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1485  
bf469630552a39 Jie Gan          2024-11-06  1486  					tpda_qdss_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1487  						remote-endpoint = <&tpdm_vsense_out>;
bf469630552a39 Jie Gan          2024-11-06  1488  					};
bf469630552a39 Jie Gan          2024-11-06  1489  				};
bf469630552a39 Jie Gan          2024-11-06  1490  
bf469630552a39 Jie Gan          2024-11-06  1491  				port@8 {
bf469630552a39 Jie Gan          2024-11-06  1492  					reg = <8>;
bf469630552a39 Jie Gan          2024-11-06  1493  
bf469630552a39 Jie Gan          2024-11-06  1494  					tpda_qdss_in8: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1495  						remote-endpoint = <&tpdm_dcc_out>;
bf469630552a39 Jie Gan          2024-11-06  1496  					};
bf469630552a39 Jie Gan          2024-11-06  1497  				};
bf469630552a39 Jie Gan          2024-11-06  1498  
bf469630552a39 Jie Gan          2024-11-06  1499  				port@9 {
bf469630552a39 Jie Gan          2024-11-06  1500  					reg = <9>;
bf469630552a39 Jie Gan          2024-11-06  1501  
bf469630552a39 Jie Gan          2024-11-06  1502  					tpda_qdss_in9: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1503  						remote-endpoint = <&tpdm_prng_out>;
bf469630552a39 Jie Gan          2024-11-06  1504  					};
bf469630552a39 Jie Gan          2024-11-06  1505  				};
bf469630552a39 Jie Gan          2024-11-06  1506  
bf469630552a39 Jie Gan          2024-11-06  1507  				port@b {
bf469630552a39 Jie Gan          2024-11-06  1508  					reg = <11>;
bf469630552a39 Jie Gan          2024-11-06  1509  
bf469630552a39 Jie Gan          2024-11-06  1510  					tpda_qdss_in11: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1511  						remote-endpoint = <&tpdm_qm_out>;
bf469630552a39 Jie Gan          2024-11-06  1512  					};
bf469630552a39 Jie Gan          2024-11-06  1513  				};
bf469630552a39 Jie Gan          2024-11-06  1514  
bf469630552a39 Jie Gan          2024-11-06  1515  				port@c {
bf469630552a39 Jie Gan          2024-11-06  1516  					reg = <12>;
bf469630552a39 Jie Gan          2024-11-06  1517  
bf469630552a39 Jie Gan          2024-11-06  1518  					tpda_qdss_in12: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1519  						remote-endpoint = <&tpdm_west_out>;
bf469630552a39 Jie Gan          2024-11-06  1520  					};
bf469630552a39 Jie Gan          2024-11-06  1521  				};
bf469630552a39 Jie Gan          2024-11-06  1522  
bf469630552a39 Jie Gan          2024-11-06  1523  				port@d {
bf469630552a39 Jie Gan          2024-11-06  1524  					reg = <13>;
bf469630552a39 Jie Gan          2024-11-06  1525  
bf469630552a39 Jie Gan          2024-11-06  1526  					tpda_qdss_in13: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1527  						remote-endpoint = <&tpdm_pimem_out>;
bf469630552a39 Jie Gan          2024-11-06  1528  					};
bf469630552a39 Jie Gan          2024-11-06  1529  				};
bf469630552a39 Jie Gan          2024-11-06  1530  			};
bf469630552a39 Jie Gan          2024-11-06  1531  
bf469630552a39 Jie Gan          2024-11-06  1532  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1533  				port {
bf469630552a39 Jie Gan          2024-11-06  1534  					tpda_qdss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1535  						remote-endpoint = <&funnel_qatb_in>;
bf469630552a39 Jie Gan          2024-11-06  1536  					};
bf469630552a39 Jie Gan          2024-11-06  1537  				};
bf469630552a39 Jie Gan          2024-11-06  1538  			};
bf469630552a39 Jie Gan          2024-11-06  1539  		};
bf469630552a39 Jie Gan          2024-11-06  1540  
bf469630552a39 Jie Gan          2024-11-06  1541  		funnel@6005000 {
bf469630552a39 Jie Gan          2024-11-06  1542  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1543  			reg = <0x0 0x06005000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1544  
bf469630552a39 Jie Gan          2024-11-06  1545  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1546  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1547  
bf469630552a39 Jie Gan          2024-11-06  1548  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1549  				port {
bf469630552a39 Jie Gan          2024-11-06  1550  					funnel_qatb_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1551  						remote-endpoint = <&tpda_qdss_out>;
bf469630552a39 Jie Gan          2024-11-06  1552  					};
bf469630552a39 Jie Gan          2024-11-06  1553  				};
bf469630552a39 Jie Gan          2024-11-06  1554  			};
bf469630552a39 Jie Gan          2024-11-06  1555  
bf469630552a39 Jie Gan          2024-11-06  1556  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1557  				port {
bf469630552a39 Jie Gan          2024-11-06  1558  					funnel_qatb_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1559  						remote-endpoint = <&funnel_in0_in6>;
bf469630552a39 Jie Gan          2024-11-06  1560  					};
bf469630552a39 Jie Gan          2024-11-06  1561  				};
bf469630552a39 Jie Gan          2024-11-06  1562  			};
bf469630552a39 Jie Gan          2024-11-06  1563  		};
bf469630552a39 Jie Gan          2024-11-06  1564  
bf469630552a39 Jie Gan          2024-11-06  1565  		cti@6010000 {
bf469630552a39 Jie Gan          2024-11-06  1566  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1567  			reg = <0x0 0x06010000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1568  
bf469630552a39 Jie Gan          2024-11-06  1569  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1570  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1571  		};
bf469630552a39 Jie Gan          2024-11-06  1572  
bf469630552a39 Jie Gan          2024-11-06  1573  		cti@6011000 {
bf469630552a39 Jie Gan          2024-11-06  1574  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1575  			reg = <0x0 0x06011000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1576  
bf469630552a39 Jie Gan          2024-11-06  1577  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1578  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1579  		};
bf469630552a39 Jie Gan          2024-11-06  1580  
bf469630552a39 Jie Gan          2024-11-06  1581  		cti@6012000 {
bf469630552a39 Jie Gan          2024-11-06  1582  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1583  			reg = <0x0 0x06012000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1584  
bf469630552a39 Jie Gan          2024-11-06  1585  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1586  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1587  		};
bf469630552a39 Jie Gan          2024-11-06  1588  
bf469630552a39 Jie Gan          2024-11-06  1589  		cti@6013000 {
bf469630552a39 Jie Gan          2024-11-06  1590  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1591  			reg = <0x0 0x06013000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1592  
bf469630552a39 Jie Gan          2024-11-06  1593  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1594  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1595  		};
bf469630552a39 Jie Gan          2024-11-06  1596  
bf469630552a39 Jie Gan          2024-11-06  1597  		cti@6014000 {
bf469630552a39 Jie Gan          2024-11-06  1598  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1599  			reg = <0x0 0x06014000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1600  
bf469630552a39 Jie Gan          2024-11-06  1601  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1602  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1603  		};
bf469630552a39 Jie Gan          2024-11-06  1604  
bf469630552a39 Jie Gan          2024-11-06  1605  		cti@6015000 {
bf469630552a39 Jie Gan          2024-11-06  1606  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1607  			reg = <0x0 0x06015000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1608  
bf469630552a39 Jie Gan          2024-11-06  1609  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1610  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1611  		};
bf469630552a39 Jie Gan          2024-11-06  1612  
bf469630552a39 Jie Gan          2024-11-06  1613  		cti@6016000 {
bf469630552a39 Jie Gan          2024-11-06  1614  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1615  			reg = <0x0 0x06016000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1616  
bf469630552a39 Jie Gan          2024-11-06  1617  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1618  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1619  		};
bf469630552a39 Jie Gan          2024-11-06  1620  
bf469630552a39 Jie Gan          2024-11-06  1621  		cti@6017000 {
bf469630552a39 Jie Gan          2024-11-06  1622  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1623  			reg = <0x0 0x06017000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1624  
bf469630552a39 Jie Gan          2024-11-06  1625  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1626  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1627  		};
bf469630552a39 Jie Gan          2024-11-06  1628  
bf469630552a39 Jie Gan          2024-11-06  1629  		cti@6018000 {
bf469630552a39 Jie Gan          2024-11-06  1630  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1631  			reg = <0x0 0x06018000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1632  
bf469630552a39 Jie Gan          2024-11-06  1633  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1634  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1635  		};
bf469630552a39 Jie Gan          2024-11-06  1636  
bf469630552a39 Jie Gan          2024-11-06  1637  		cti@6019000 {
bf469630552a39 Jie Gan          2024-11-06  1638  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1639  			reg = <0x0 0x06019000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1640  
bf469630552a39 Jie Gan          2024-11-06  1641  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1642  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1643  		};
bf469630552a39 Jie Gan          2024-11-06  1644  
bf469630552a39 Jie Gan          2024-11-06  1645  		cti@601a000 {
bf469630552a39 Jie Gan          2024-11-06  1646  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1647  			reg = <0x0 0x0601a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1648  
bf469630552a39 Jie Gan          2024-11-06  1649  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1650  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1651  		};
bf469630552a39 Jie Gan          2024-11-06  1652  
bf469630552a39 Jie Gan          2024-11-06  1653  		cti@601b000 {
bf469630552a39 Jie Gan          2024-11-06  1654  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1655  			reg = <0x0 0x0601b000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1656  
bf469630552a39 Jie Gan          2024-11-06  1657  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1658  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1659  		};
bf469630552a39 Jie Gan          2024-11-06  1660  
bf469630552a39 Jie Gan          2024-11-06  1661  		cti@601c000 {
bf469630552a39 Jie Gan          2024-11-06  1662  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1663  			reg = <0x0 0x0601c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1664  
bf469630552a39 Jie Gan          2024-11-06  1665  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1666  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1667  		};
bf469630552a39 Jie Gan          2024-11-06  1668  
bf469630552a39 Jie Gan          2024-11-06  1669  		cti@601d000 {
bf469630552a39 Jie Gan          2024-11-06  1670  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1671  			reg = <0x0 0x0601d000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1672  
bf469630552a39 Jie Gan          2024-11-06  1673  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1674  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1675  		};
bf469630552a39 Jie Gan          2024-11-06  1676  
bf469630552a39 Jie Gan          2024-11-06  1677  		cti@601e000 {
bf469630552a39 Jie Gan          2024-11-06  1678  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1679  			reg = <0x0 0x0601e000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1680  
bf469630552a39 Jie Gan          2024-11-06  1681  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1682  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1683  		};
bf469630552a39 Jie Gan          2024-11-06  1684  
bf469630552a39 Jie Gan          2024-11-06  1685  		cti@601f000 {
bf469630552a39 Jie Gan          2024-11-06  1686  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1687  			reg = <0x0 0x0601f000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1688  
bf469630552a39 Jie Gan          2024-11-06  1689  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1690  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1691  		};
bf469630552a39 Jie Gan          2024-11-06  1692  
bf469630552a39 Jie Gan          2024-11-06  1693  		funnel@6041000 {
bf469630552a39 Jie Gan          2024-11-06  1694  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1695  			reg = <0x0 0x06041000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1696  
bf469630552a39 Jie Gan          2024-11-06  1697  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1698  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1699  
bf469630552a39 Jie Gan          2024-11-06  1700  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1701  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1702  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1703  
bf469630552a39 Jie Gan          2024-11-06  1704  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  1705  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  1706  
bf469630552a39 Jie Gan          2024-11-06  1707  					funnel_in0_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1708  						remote-endpoint = <&funnel_qatb_out>;
bf469630552a39 Jie Gan          2024-11-06  1709  					};
bf469630552a39 Jie Gan          2024-11-06  1710  				};
bf469630552a39 Jie Gan          2024-11-06  1711  
bf469630552a39 Jie Gan          2024-11-06  1712  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1713  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1714  
bf469630552a39 Jie Gan          2024-11-06  1715  					funnel_in0_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1716  						remote-endpoint = <&stm_out>;
bf469630552a39 Jie Gan          2024-11-06  1717  					};
bf469630552a39 Jie Gan          2024-11-06  1718  				};
bf469630552a39 Jie Gan          2024-11-06  1719  			};
bf469630552a39 Jie Gan          2024-11-06  1720  
bf469630552a39 Jie Gan          2024-11-06  1721  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1722  				port {
bf469630552a39 Jie Gan          2024-11-06  1723  					funnel_in0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1724  						remote-endpoint = <&funnel_merg_in0>;
bf469630552a39 Jie Gan          2024-11-06  1725  					};
bf469630552a39 Jie Gan          2024-11-06  1726  				};
bf469630552a39 Jie Gan          2024-11-06  1727  			};
bf469630552a39 Jie Gan          2024-11-06  1728  		};
bf469630552a39 Jie Gan          2024-11-06  1729  
bf469630552a39 Jie Gan          2024-11-06  1730  		funnel@6042000 {
bf469630552a39 Jie Gan          2024-11-06  1731  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1732  			reg = <0x0 0x06042000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1733  
bf469630552a39 Jie Gan          2024-11-06  1734  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1735  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1736  
bf469630552a39 Jie Gan          2024-11-06  1737  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1738  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1739  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1740  
bf469630552a39 Jie Gan          2024-11-06  1741  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  1742  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  1743  
bf469630552a39 Jie Gan          2024-11-06  1744  					funnel_in1_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1745  						remote-endpoint = <&replicator_swao_out0>;
bf469630552a39 Jie Gan          2024-11-06  1746  					};
bf469630552a39 Jie Gan          2024-11-06  1747  				};
bf469630552a39 Jie Gan          2024-11-06  1748  
bf469630552a39 Jie Gan          2024-11-06  1749  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  1750  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  1751  
bf469630552a39 Jie Gan          2024-11-06  1752  					funnel_in1_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1753  						remote-endpoint = <&tpdm_wcss_out>;
bf469630552a39 Jie Gan          2024-11-06  1754  					};
bf469630552a39 Jie Gan          2024-11-06  1755  				};
bf469630552a39 Jie Gan          2024-11-06  1756  
bf469630552a39 Jie Gan          2024-11-06  1757  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1758  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1759  
bf469630552a39 Jie Gan          2024-11-06  1760  					funnel_in1_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1761  						remote-endpoint = <&funnel_apss_merg_out>;
bf469630552a39 Jie Gan          2024-11-06  1762  					};
bf469630552a39 Jie Gan          2024-11-06  1763  				};
bf469630552a39 Jie Gan          2024-11-06  1764  			};
bf469630552a39 Jie Gan          2024-11-06  1765  
bf469630552a39 Jie Gan          2024-11-06  1766  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1767  				port {
bf469630552a39 Jie Gan          2024-11-06  1768  					funnel_in1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1769  						remote-endpoint = <&funnel_merg_in1>;
bf469630552a39 Jie Gan          2024-11-06  1770  					};
bf469630552a39 Jie Gan          2024-11-06  1771  				};
bf469630552a39 Jie Gan          2024-11-06  1772  			};
bf469630552a39 Jie Gan          2024-11-06  1773  		};
bf469630552a39 Jie Gan          2024-11-06  1774  
bf469630552a39 Jie Gan          2024-11-06  1775  		funnel@6045000 {
bf469630552a39 Jie Gan          2024-11-06  1776  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1777  			reg = <0x0 0x06045000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1778  
bf469630552a39 Jie Gan          2024-11-06  1779  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1780  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1781  
bf469630552a39 Jie Gan          2024-11-06  1782  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1783  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1784  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1785  
bf469630552a39 Jie Gan          2024-11-06  1786  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  1787  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  1788  
bf469630552a39 Jie Gan          2024-11-06  1789  					funnel_merg_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1790  						remote-endpoint = <&funnel_in0_out>;
bf469630552a39 Jie Gan          2024-11-06  1791  					};
bf469630552a39 Jie Gan          2024-11-06  1792  				};
bf469630552a39 Jie Gan          2024-11-06  1793  
bf469630552a39 Jie Gan          2024-11-06  1794  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  1795  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  1796  
bf469630552a39 Jie Gan          2024-11-06  1797  					funnel_merg_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1798  						remote-endpoint = <&funnel_in1_out>;
bf469630552a39 Jie Gan          2024-11-06  1799  					};
bf469630552a39 Jie Gan          2024-11-06  1800  				};
bf469630552a39 Jie Gan          2024-11-06  1801  			};
bf469630552a39 Jie Gan          2024-11-06  1802  
bf469630552a39 Jie Gan          2024-11-06  1803  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1804  				port {
bf469630552a39 Jie Gan          2024-11-06  1805  					funnel_merg_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1806  						remote-endpoint = <&tmc_etf_in>;
bf469630552a39 Jie Gan          2024-11-06  1807  					};
bf469630552a39 Jie Gan          2024-11-06  1808  				};
bf469630552a39 Jie Gan          2024-11-06  1809  			};
bf469630552a39 Jie Gan          2024-11-06  1810  		};
bf469630552a39 Jie Gan          2024-11-06  1811  
bf469630552a39 Jie Gan          2024-11-06  1812  		replicator@6046000 {
bf469630552a39 Jie Gan          2024-11-06  1813  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1814  			reg = <0x0 0x06046000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1815  
bf469630552a39 Jie Gan          2024-11-06  1816  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1817  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1818  
bf469630552a39 Jie Gan          2024-11-06  1819  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1820  				port {
bf469630552a39 Jie Gan          2024-11-06  1821  					replicator0_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1822  						remote-endpoint= <&tmc_etf_out>;
bf469630552a39 Jie Gan          2024-11-06  1823  					};
bf469630552a39 Jie Gan          2024-11-06  1824  				};
bf469630552a39 Jie Gan          2024-11-06  1825  			};
bf469630552a39 Jie Gan          2024-11-06  1826  
bf469630552a39 Jie Gan          2024-11-06  1827  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1828  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1829  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1830  
bf469630552a39 Jie Gan          2024-11-06  1831  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  1832  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  1833  
bf469630552a39 Jie Gan          2024-11-06  1834  					replicator0_out1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1835  						remote-endpoint= <&replicator1_in>;
bf469630552a39 Jie Gan          2024-11-06  1836  					};
bf469630552a39 Jie Gan          2024-11-06  1837  				};
bf469630552a39 Jie Gan          2024-11-06  1838  			};
bf469630552a39 Jie Gan          2024-11-06  1839  		};
bf469630552a39 Jie Gan          2024-11-06  1840  
bf469630552a39 Jie Gan          2024-11-06  1841  		tmc@6047000 {
bf469630552a39 Jie Gan          2024-11-06  1842  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1843  			reg = <0x0 0x06047000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1844  
bf469630552a39 Jie Gan          2024-11-06  1845  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1846  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1847  
bf469630552a39 Jie Gan          2024-11-06  1848  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1849  				port {
bf469630552a39 Jie Gan          2024-11-06  1850  					tmc_etf_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1851  						remote-endpoint = <&funnel_merg_out>;
bf469630552a39 Jie Gan          2024-11-06  1852  					};
bf469630552a39 Jie Gan          2024-11-06  1853  				};
bf469630552a39 Jie Gan          2024-11-06  1854  			};
bf469630552a39 Jie Gan          2024-11-06  1855  
bf469630552a39 Jie Gan          2024-11-06  1856  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1857  				port {
bf469630552a39 Jie Gan          2024-11-06  1858  					tmc_etf_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1859  						remote-endpoint = <&replicator0_in>;
bf469630552a39 Jie Gan          2024-11-06  1860  					};
bf469630552a39 Jie Gan          2024-11-06  1861  				};
bf469630552a39 Jie Gan          2024-11-06  1862  			};
bf469630552a39 Jie Gan          2024-11-06  1863  		};
bf469630552a39 Jie Gan          2024-11-06  1864  
bf469630552a39 Jie Gan          2024-11-06  1865  		replicator@604a000 {
bf469630552a39 Jie Gan          2024-11-06  1866  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1867  			reg = <0x0 0x0604a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1868  
bf469630552a39 Jie Gan          2024-11-06  1869  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1870  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1871  
bf469630552a39 Jie Gan          2024-11-06  1872  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1873  				port {
bf469630552a39 Jie Gan          2024-11-06  1874  					replicator1_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1875  						remote-endpoint= <&replicator0_out1>;
bf469630552a39 Jie Gan          2024-11-06  1876  					};
bf469630552a39 Jie Gan          2024-11-06  1877  				};
bf469630552a39 Jie Gan          2024-11-06  1878  			};
bf469630552a39 Jie Gan          2024-11-06  1879  
bf469630552a39 Jie Gan          2024-11-06  1880  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1881  				port {
bf469630552a39 Jie Gan          2024-11-06  1882  					replicator1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1883  						remote-endpoint= <&funnel_swao_in6>;
bf469630552a39 Jie Gan          2024-11-06  1884  					};
bf469630552a39 Jie Gan          2024-11-06  1885  				};
bf469630552a39 Jie Gan          2024-11-06  1886  			};
bf469630552a39 Jie Gan          2024-11-06  1887  		};
bf469630552a39 Jie Gan          2024-11-06  1888  
bf469630552a39 Jie Gan          2024-11-06  1889  		cti@683b000 {
bf469630552a39 Jie Gan          2024-11-06  1890  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1891  			reg = <0x0 0x0683b000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1892  
bf469630552a39 Jie Gan          2024-11-06  1893  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1894  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1895  		};
bf469630552a39 Jie Gan          2024-11-06  1896  
bf469630552a39 Jie Gan          2024-11-06  1897  		tpdm@6840000 {
bf469630552a39 Jie Gan          2024-11-06  1898  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1899  			reg = <0x0 0x06840000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1900  
bf469630552a39 Jie Gan          2024-11-06  1901  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1902  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1903  
bf469630552a39 Jie Gan          2024-11-06  1904  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  1905  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1906  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  1907  
bf469630552a39 Jie Gan          2024-11-06  1908  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1909  				port {
bf469630552a39 Jie Gan          2024-11-06  1910  					tpdm_vsense_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1911  						remote-endpoint = <&tpda_qdss_in7>;
bf469630552a39 Jie Gan          2024-11-06  1912  					};
bf469630552a39 Jie Gan          2024-11-06  1913  				};
bf469630552a39 Jie Gan          2024-11-06  1914  			};
bf469630552a39 Jie Gan          2024-11-06  1915  		};
bf469630552a39 Jie Gan          2024-11-06  1916  
bf469630552a39 Jie Gan          2024-11-06  1917  		tpdm@684c000 {
bf469630552a39 Jie Gan          2024-11-06  1918  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1919  			reg = <0x0 0x0684c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1920  
bf469630552a39 Jie Gan          2024-11-06  1921  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1922  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1923  
bf469630552a39 Jie Gan          2024-11-06  1924  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  1925  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1926  
bf469630552a39 Jie Gan          2024-11-06  1927  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1928  				port {
bf469630552a39 Jie Gan          2024-11-06  1929  					tpdm_prng_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1930  						remote-endpoint = <&tpda_qdss_in9>;
bf469630552a39 Jie Gan          2024-11-06  1931  					};
bf469630552a39 Jie Gan          2024-11-06  1932  				};
bf469630552a39 Jie Gan          2024-11-06  1933  			};
bf469630552a39 Jie Gan          2024-11-06  1934  		};
bf469630552a39 Jie Gan          2024-11-06  1935  
bf469630552a39 Jie Gan          2024-11-06  1936  		tpdm@6850000 {
bf469630552a39 Jie Gan          2024-11-06  1937  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1938  			reg = <0x0 0x06850000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1939  
bf469630552a39 Jie Gan          2024-11-06  1940  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1941  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1942  
bf469630552a39 Jie Gan          2024-11-06  1943  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  1944  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1945  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  1946  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1947  
bf469630552a39 Jie Gan          2024-11-06  1948  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1949  				port {
bf469630552a39 Jie Gan          2024-11-06  1950  					tpdm_pimem_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1951  						remote-endpoint = <&tpda_qdss_in13>;
bf469630552a39 Jie Gan          2024-11-06  1952  					};
bf469630552a39 Jie Gan          2024-11-06  1953  				};
bf469630552a39 Jie Gan          2024-11-06  1954  			};
bf469630552a39 Jie Gan          2024-11-06  1955  		};
bf469630552a39 Jie Gan          2024-11-06  1956  
bf469630552a39 Jie Gan          2024-11-06  1957  		tpdm@6860000 {
bf469630552a39 Jie Gan          2024-11-06  1958  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1959  			reg = <0x0 0x06860000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1960  
bf469630552a39 Jie Gan          2024-11-06  1961  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1962  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1963  
bf469630552a39 Jie Gan          2024-11-06  1964  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  1965  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1966  
bf469630552a39 Jie Gan          2024-11-06  1967  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1968  				port {
bf469630552a39 Jie Gan          2024-11-06  1969  					tpdm_turing_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1970  						remote-endpoint = <&funnel_turing_in>;
bf469630552a39 Jie Gan          2024-11-06  1971  					};
bf469630552a39 Jie Gan          2024-11-06  1972  				};
bf469630552a39 Jie Gan          2024-11-06  1973  			};
bf469630552a39 Jie Gan          2024-11-06  1974  		};
bf469630552a39 Jie Gan          2024-11-06  1975  
bf469630552a39 Jie Gan          2024-11-06  1976  		funnel@6861000 {
bf469630552a39 Jie Gan          2024-11-06  1977  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1978  			reg = <0x0 0x06861000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1979  
bf469630552a39 Jie Gan          2024-11-06  1980  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1981  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1982  
bf469630552a39 Jie Gan          2024-11-06  1983  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1984  				port {
bf469630552a39 Jie Gan          2024-11-06  1985  					funnel_turing_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1986  						remote-endpoint = <&tpdm_turing_out>;
bf469630552a39 Jie Gan          2024-11-06  1987  					};
bf469630552a39 Jie Gan          2024-11-06  1988  				};
bf469630552a39 Jie Gan          2024-11-06  1989  			};
bf469630552a39 Jie Gan          2024-11-06  1990  
bf469630552a39 Jie Gan          2024-11-06  1991  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1992  				port {
bf469630552a39 Jie Gan          2024-11-06  1993  					funnel_turing_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1994  						remote-endpoint = <&tpda_qdss_in6>;
bf469630552a39 Jie Gan          2024-11-06  1995  					};
bf469630552a39 Jie Gan          2024-11-06  1996  				};
bf469630552a39 Jie Gan          2024-11-06  1997  			};
bf469630552a39 Jie Gan          2024-11-06  1998  		};
bf469630552a39 Jie Gan          2024-11-06  1999  
bf469630552a39 Jie Gan          2024-11-06  2000  		cti@6867000 {
bf469630552a39 Jie Gan          2024-11-06  2001  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2002  			reg = <0x0 0x06867000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2003  
bf469630552a39 Jie Gan          2024-11-06  2004  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2005  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2006  		};
bf469630552a39 Jie Gan          2024-11-06  2007  
bf469630552a39 Jie Gan          2024-11-06  2008  		tpdm@6870000 {
bf469630552a39 Jie Gan          2024-11-06  2009  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2010  			reg = <0x0 0x06870000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2011  
bf469630552a39 Jie Gan          2024-11-06  2012  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2013  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2014  
bf469630552a39 Jie Gan          2024-11-06  2015  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2016  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2017  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2018  
bf469630552a39 Jie Gan          2024-11-06  2019  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2020  				port {
bf469630552a39 Jie Gan          2024-11-06  2021  					tpdm_dcc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2022  						remote-endpoint = <&tpda_qdss_in8>;
bf469630552a39 Jie Gan          2024-11-06  2023  					};
bf469630552a39 Jie Gan          2024-11-06  2024  				};
bf469630552a39 Jie Gan          2024-11-06  2025  			};
bf469630552a39 Jie Gan          2024-11-06  2026  		};
bf469630552a39 Jie Gan          2024-11-06  2027  
bf469630552a39 Jie Gan          2024-11-06  2028  		tpdm@699c000 {
bf469630552a39 Jie Gan          2024-11-06  2029  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2030  			reg = <0x0 0x0699c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2031  
bf469630552a39 Jie Gan          2024-11-06  2032  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2033  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2034  
bf469630552a39 Jie Gan          2024-11-06  2035  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2036  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2037  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2038  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2039  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2040  
bf469630552a39 Jie Gan          2024-11-06  2041  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2042  				port {
bf469630552a39 Jie Gan          2024-11-06  2043  					tpdm_wcss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2044  						remote-endpoint = <&funnel_in1_in4>;
bf469630552a39 Jie Gan          2024-11-06  2045  					};
bf469630552a39 Jie Gan          2024-11-06  2046  				};
bf469630552a39 Jie Gan          2024-11-06  2047  			};
bf469630552a39 Jie Gan          2024-11-06  2048  		};
bf469630552a39 Jie Gan          2024-11-06  2049  
bf469630552a39 Jie Gan          2024-11-06  2050  		tpdm@69c0000 {
bf469630552a39 Jie Gan          2024-11-06  2051  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2052  			reg = <0x0 0x069c0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2053  
bf469630552a39 Jie Gan          2024-11-06  2054  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2055  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2056  
bf469630552a39 Jie Gan          2024-11-06  2057  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2058  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2059  
bf469630552a39 Jie Gan          2024-11-06  2060  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2061  				port {
bf469630552a39 Jie Gan          2024-11-06  2062  					tpdm_monaq_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2063  						remote-endpoint = <&funnel_monaq_in>;
bf469630552a39 Jie Gan          2024-11-06  2064  					};
bf469630552a39 Jie Gan          2024-11-06  2065  				};
bf469630552a39 Jie Gan          2024-11-06  2066  			};
bf469630552a39 Jie Gan          2024-11-06  2067  		};
bf469630552a39 Jie Gan          2024-11-06  2068  
bf469630552a39 Jie Gan          2024-11-06  2069  		funnel@69c3000 {
bf469630552a39 Jie Gan          2024-11-06  2070  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2071  			reg = <0x0 0x069c3000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2072  
bf469630552a39 Jie Gan          2024-11-06  2073  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2074  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2075  
bf469630552a39 Jie Gan          2024-11-06  2076  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2077  				port {
bf469630552a39 Jie Gan          2024-11-06  2078  					funnel_monaq_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2079  						remote-endpoint = <&tpdm_monaq_out>;
bf469630552a39 Jie Gan          2024-11-06  2080  					};
bf469630552a39 Jie Gan          2024-11-06  2081  				};
bf469630552a39 Jie Gan          2024-11-06  2082  			};
bf469630552a39 Jie Gan          2024-11-06  2083  
bf469630552a39 Jie Gan          2024-11-06  2084  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2085  				port {
bf469630552a39 Jie Gan          2024-11-06  2086  					funnel_monaq_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2087  						remote-endpoint = <&tpda_qdss_in4>;
bf469630552a39 Jie Gan          2024-11-06  2088  					};
bf469630552a39 Jie Gan          2024-11-06  2089  				};
bf469630552a39 Jie Gan          2024-11-06  2090  			};
bf469630552a39 Jie Gan          2024-11-06  2091  		};
bf469630552a39 Jie Gan          2024-11-06  2092  
bf469630552a39 Jie Gan          2024-11-06  2093  		tpdm@69d0000 {
bf469630552a39 Jie Gan          2024-11-06  2094  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2095  			reg = <0x0 0x069d0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2096  
bf469630552a39 Jie Gan          2024-11-06  2097  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2098  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2099  
bf469630552a39 Jie Gan          2024-11-06  2100  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2101  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2102  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2103  
bf469630552a39 Jie Gan          2024-11-06  2104  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2105  				port {
bf469630552a39 Jie Gan          2024-11-06  2106  					tpdm_qm_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2107  						remote-endpoint = <&tpda_qdss_in11>;
bf469630552a39 Jie Gan          2024-11-06  2108  					};
bf469630552a39 Jie Gan          2024-11-06  2109  				};
bf469630552a39 Jie Gan          2024-11-06  2110  			};
bf469630552a39 Jie Gan          2024-11-06  2111  		};
bf469630552a39 Jie Gan          2024-11-06  2112  
bf469630552a39 Jie Gan          2024-11-06  2113  		tpdm@6a00000 {
bf469630552a39 Jie Gan          2024-11-06  2114  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2115  			reg = <0x0 0x06a00000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2116  
bf469630552a39 Jie Gan          2024-11-06  2117  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2118  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2119  
bf469630552a39 Jie Gan          2024-11-06  2120  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2121  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2122  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2123  
bf469630552a39 Jie Gan          2024-11-06  2124  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2125  				port {
bf469630552a39 Jie Gan          2024-11-06  2126  					tpdm_ddr_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2127  						remote-endpoint = <&funnel_ddr_0_in>;
bf469630552a39 Jie Gan          2024-11-06  2128  					};
bf469630552a39 Jie Gan          2024-11-06  2129  				};
bf469630552a39 Jie Gan          2024-11-06  2130  			};
bf469630552a39 Jie Gan          2024-11-06  2131  		};
bf469630552a39 Jie Gan          2024-11-06  2132  
bf469630552a39 Jie Gan          2024-11-06  2133  		cti@6a02000 {
bf469630552a39 Jie Gan          2024-11-06  2134  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2135  			reg = <0x0 0x06a02000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2136  
bf469630552a39 Jie Gan          2024-11-06  2137  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2138  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2139  		};
bf469630552a39 Jie Gan          2024-11-06  2140  
bf469630552a39 Jie Gan          2024-11-06  2141  		cti@6a03000 {
bf469630552a39 Jie Gan          2024-11-06  2142  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2143  			reg = <0x0 0x06a03000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2144  
bf469630552a39 Jie Gan          2024-11-06  2145  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2146  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2147  		};
bf469630552a39 Jie Gan          2024-11-06  2148  
bf469630552a39 Jie Gan          2024-11-06  2149  		cti@6a10000 {
bf469630552a39 Jie Gan          2024-11-06  2150  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2151  			reg = <0x0 0x06a10000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2152  
bf469630552a39 Jie Gan          2024-11-06  2153  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2154  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2155  		};
bf469630552a39 Jie Gan          2024-11-06  2156  
bf469630552a39 Jie Gan          2024-11-06  2157  		cti@6a11000 {
bf469630552a39 Jie Gan          2024-11-06  2158  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2159  			reg = <0x0 0x06a11000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2160  
bf469630552a39 Jie Gan          2024-11-06  2161  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2162  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2163  		};
bf469630552a39 Jie Gan          2024-11-06  2164  
bf469630552a39 Jie Gan          2024-11-06  2165  		funnel@6a05000 {
bf469630552a39 Jie Gan          2024-11-06  2166  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2167  			reg = <0x0 0x06a05000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2168  
bf469630552a39 Jie Gan          2024-11-06  2169  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2170  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2171  
bf469630552a39 Jie Gan          2024-11-06  2172  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2173  				port {
bf469630552a39 Jie Gan          2024-11-06  2174  					funnel_ddr_0_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2175  						remote-endpoint = <&tpdm_ddr_out>;
bf469630552a39 Jie Gan          2024-11-06  2176  					};
bf469630552a39 Jie Gan          2024-11-06  2177  				};
bf469630552a39 Jie Gan          2024-11-06  2178  			};
bf469630552a39 Jie Gan          2024-11-06  2179  
bf469630552a39 Jie Gan          2024-11-06  2180  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2181  				port {
bf469630552a39 Jie Gan          2024-11-06  2182  					funnel_ddr_0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2183  						remote-endpoint = <&tpda_qdss_in5>;
bf469630552a39 Jie Gan          2024-11-06  2184  					};
bf469630552a39 Jie Gan          2024-11-06  2185  				};
bf469630552a39 Jie Gan          2024-11-06  2186  			};
bf469630552a39 Jie Gan          2024-11-06  2187  		};
bf469630552a39 Jie Gan          2024-11-06  2188  
bf469630552a39 Jie Gan          2024-11-06  2189  		tpda@6b01000 {
bf469630552a39 Jie Gan          2024-11-06  2190  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2191  			reg = <0x0 0x06b01000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2192  
bf469630552a39 Jie Gan          2024-11-06  2193  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2194  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2195  
bf469630552a39 Jie Gan          2024-11-06  2196  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2197  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2198  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2199  
bf469630552a39 Jie Gan          2024-11-06  2200  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2201  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2202  
bf469630552a39 Jie Gan          2024-11-06  2203  					tpda_swao_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2204  						remote-endpoint = <&tpdm_swao0_out>;
bf469630552a39 Jie Gan          2024-11-06  2205  					};
bf469630552a39 Jie Gan          2024-11-06  2206  				};
bf469630552a39 Jie Gan          2024-11-06  2207  
bf469630552a39 Jie Gan          2024-11-06  2208  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2209  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2210  
bf469630552a39 Jie Gan          2024-11-06  2211  					tpda_swao_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2212  						remote-endpoint = <&tpdm_swao1_out>;
bf469630552a39 Jie Gan          2024-11-06  2213  					};
bf469630552a39 Jie Gan          2024-11-06  2214  
bf469630552a39 Jie Gan          2024-11-06  2215  				};
bf469630552a39 Jie Gan          2024-11-06  2216  			};
bf469630552a39 Jie Gan          2024-11-06  2217  
bf469630552a39 Jie Gan          2024-11-06  2218  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2219  				port {
bf469630552a39 Jie Gan          2024-11-06  2220  					tpda_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2221  						remote-endpoint = <&funnel_swao_in7>;
bf469630552a39 Jie Gan          2024-11-06  2222  					};
bf469630552a39 Jie Gan          2024-11-06  2223  				};
bf469630552a39 Jie Gan          2024-11-06  2224  			};
bf469630552a39 Jie Gan          2024-11-06  2225  		};
bf469630552a39 Jie Gan          2024-11-06  2226  
bf469630552a39 Jie Gan          2024-11-06  2227  		tpdm@6b02000 {
bf469630552a39 Jie Gan          2024-11-06  2228  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2229  			reg = <0x0 0x06b02000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2230  
bf469630552a39 Jie Gan          2024-11-06  2231  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2232  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2233  
bf469630552a39 Jie Gan          2024-11-06  2234  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  2235  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2236  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2237  
bf469630552a39 Jie Gan          2024-11-06  2238  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2239  				port {
bf469630552a39 Jie Gan          2024-11-06  2240  					tpdm_swao0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2241  						remote-endpoint = <&tpda_swao_in0>;
bf469630552a39 Jie Gan          2024-11-06  2242  					};
bf469630552a39 Jie Gan          2024-11-06  2243  				};
bf469630552a39 Jie Gan          2024-11-06  2244  			};
bf469630552a39 Jie Gan          2024-11-06  2245  		};
bf469630552a39 Jie Gan          2024-11-06  2246  
bf469630552a39 Jie Gan          2024-11-06  2247  		tpdm@6b03000 {
bf469630552a39 Jie Gan          2024-11-06  2248  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2249  			reg = <0x0 0x06b03000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2250  
bf469630552a39 Jie Gan          2024-11-06  2251  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2252  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2253  
bf469630552a39 Jie Gan          2024-11-06  2254  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2255  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2256  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2257  
bf469630552a39 Jie Gan          2024-11-06  2258  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2259  				port {
bf469630552a39 Jie Gan          2024-11-06  2260  					tpdm_swao1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2261  						remote-endpoint = <&tpda_swao_in1>;
bf469630552a39 Jie Gan          2024-11-06  2262  					};
bf469630552a39 Jie Gan          2024-11-06  2263  				};
bf469630552a39 Jie Gan          2024-11-06  2264  			};
bf469630552a39 Jie Gan          2024-11-06  2265  		};
bf469630552a39 Jie Gan          2024-11-06  2266  
bf469630552a39 Jie Gan          2024-11-06  2267  		cti@6b04000 {
bf469630552a39 Jie Gan          2024-11-06  2268  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2269  			reg = <0x0 0x06b04000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2270  
bf469630552a39 Jie Gan          2024-11-06  2271  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2272  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2273  		};
bf469630552a39 Jie Gan          2024-11-06  2274  
bf469630552a39 Jie Gan          2024-11-06  2275  		cti@6b05000 {
bf469630552a39 Jie Gan          2024-11-06  2276  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2277  			reg = <0x0 0x06b05000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2278  
bf469630552a39 Jie Gan          2024-11-06  2279  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2280  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2281  		};
bf469630552a39 Jie Gan          2024-11-06  2282  
bf469630552a39 Jie Gan          2024-11-06  2283  		cti@6b06000 {
bf469630552a39 Jie Gan          2024-11-06  2284  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2285  			reg = <0x0 0x06b06000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2286  
bf469630552a39 Jie Gan          2024-11-06  2287  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2288  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2289  		};
bf469630552a39 Jie Gan          2024-11-06  2290  
bf469630552a39 Jie Gan          2024-11-06  2291  		cti@6b07000 {
bf469630552a39 Jie Gan          2024-11-06  2292  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2293  			reg = <0x0 0x06b07000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2294  
bf469630552a39 Jie Gan          2024-11-06  2295  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2296  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2297  		};
bf469630552a39 Jie Gan          2024-11-06  2298  
bf469630552a39 Jie Gan          2024-11-06  2299  		funnel@6b08000 {
bf469630552a39 Jie Gan          2024-11-06  2300  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2301  			reg = <0x0 0x06b08000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2302  
bf469630552a39 Jie Gan          2024-11-06  2303  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2304  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2305  
bf469630552a39 Jie Gan          2024-11-06  2306  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2307  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2308  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2309  
bf469630552a39 Jie Gan          2024-11-06  2310  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  2311  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  2312  
bf469630552a39 Jie Gan          2024-11-06  2313  					funnel_swao_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2314  						remote-endpoint= <&replicator1_out>;
bf469630552a39 Jie Gan          2024-11-06  2315  					};
bf469630552a39 Jie Gan          2024-11-06  2316  				};
bf469630552a39 Jie Gan          2024-11-06  2317  
bf469630552a39 Jie Gan          2024-11-06  2318  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  2319  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  2320  
bf469630552a39 Jie Gan          2024-11-06  2321  					funnel_swao_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2322  						remote-endpoint= <&tpda_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2323  					};
bf469630552a39 Jie Gan          2024-11-06  2324  				};
bf469630552a39 Jie Gan          2024-11-06  2325  			};
bf469630552a39 Jie Gan          2024-11-06  2326  
bf469630552a39 Jie Gan          2024-11-06  2327  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2328  				port {
bf469630552a39 Jie Gan          2024-11-06  2329  					funnel_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2330  						remote-endpoint = <&tmc_etf_swao_in>;
bf469630552a39 Jie Gan          2024-11-06  2331  					};
bf469630552a39 Jie Gan          2024-11-06  2332  				};
bf469630552a39 Jie Gan          2024-11-06  2333  			};
bf469630552a39 Jie Gan          2024-11-06  2334  		};
bf469630552a39 Jie Gan          2024-11-06  2335  
bf469630552a39 Jie Gan          2024-11-06  2336  		tmc@6b09000 {
bf469630552a39 Jie Gan          2024-11-06  2337  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2338  			reg = <0x0 0x06b09000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2339  
bf469630552a39 Jie Gan          2024-11-06  2340  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2341  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2342  
bf469630552a39 Jie Gan          2024-11-06  2343  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2344  				port {
bf469630552a39 Jie Gan          2024-11-06  2345  					tmc_etf_swao_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2346  						remote-endpoint= <&funnel_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2347  					};
bf469630552a39 Jie Gan          2024-11-06  2348  				};
bf469630552a39 Jie Gan          2024-11-06  2349  			};
bf469630552a39 Jie Gan          2024-11-06  2350  
bf469630552a39 Jie Gan          2024-11-06  2351  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2352  				port {
bf469630552a39 Jie Gan          2024-11-06  2353  					tmc_etf_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2354  						remote-endpoint= <&replicator_swao_in>;
bf469630552a39 Jie Gan          2024-11-06  2355  					};
bf469630552a39 Jie Gan          2024-11-06  2356  				};
bf469630552a39 Jie Gan          2024-11-06  2357  			};
bf469630552a39 Jie Gan          2024-11-06  2358  		};
bf469630552a39 Jie Gan          2024-11-06  2359  
bf469630552a39 Jie Gan          2024-11-06  2360  		replicator@6b0a000 {
bf469630552a39 Jie Gan          2024-11-06  2361  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2362  			reg = <0x0 0x06b0a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2363  
bf469630552a39 Jie Gan          2024-11-06  2364  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2365  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2366  
bf469630552a39 Jie Gan          2024-11-06  2367  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2368  				port {
bf469630552a39 Jie Gan          2024-11-06  2369  					replicator_swao_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2370  						remote-endpoint = <&tmc_etf_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2371  					};
bf469630552a39 Jie Gan          2024-11-06  2372  				};
bf469630552a39 Jie Gan          2024-11-06  2373  			};
bf469630552a39 Jie Gan          2024-11-06  2374  
bf469630552a39 Jie Gan          2024-11-06  2375  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2376  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2377  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2378  
bf469630552a39 Jie Gan          2024-11-06  2379  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2380  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2381  
bf469630552a39 Jie Gan          2024-11-06  2382  					replicator_swao_out0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2383  						remote-endpoint = <&funnel_in1_in3>;
bf469630552a39 Jie Gan          2024-11-06  2384  					};
bf469630552a39 Jie Gan          2024-11-06  2385  				};
bf469630552a39 Jie Gan          2024-11-06  2386  
bf469630552a39 Jie Gan          2024-11-06  2387  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2388  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2389  
bf469630552a39 Jie Gan          2024-11-06  2390  					replicator_swao_out1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2391  						remote-endpoint = <&eud_in>;
bf469630552a39 Jie Gan          2024-11-06  2392  					};
bf469630552a39 Jie Gan          2024-11-06  2393  				};
bf469630552a39 Jie Gan          2024-11-06  2394  			};
bf469630552a39 Jie Gan          2024-11-06  2395  		};
bf469630552a39 Jie Gan          2024-11-06  2396  
bf469630552a39 Jie Gan          2024-11-06  2397  		cti@6b21000 {
bf469630552a39 Jie Gan          2024-11-06  2398  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2399  			reg = <0x0 0x06b21000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2400  
bf469630552a39 Jie Gan          2024-11-06  2401  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2402  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2403  		};
bf469630552a39 Jie Gan          2024-11-06  2404  
bf469630552a39 Jie Gan          2024-11-06  2405  		tpdm@6b48000 {
bf469630552a39 Jie Gan          2024-11-06  2406  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2407  			reg = <0x0 0x06b48000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2408  
bf469630552a39 Jie Gan          2024-11-06  2409  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2410  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2411  
bf469630552a39 Jie Gan          2024-11-06  2412  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2413  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2414  
bf469630552a39 Jie Gan          2024-11-06  2415  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2416  				port {
bf469630552a39 Jie Gan          2024-11-06  2417  					tpdm_west_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2418  						remote-endpoint = <&tpda_qdss_in12>;
bf469630552a39 Jie Gan          2024-11-06  2419  					};
bf469630552a39 Jie Gan          2024-11-06  2420  				};
bf469630552a39 Jie Gan          2024-11-06  2421  			};
bf469630552a39 Jie Gan          2024-11-06  2422  		};
bf469630552a39 Jie Gan          2024-11-06  2423  
bf469630552a39 Jie Gan          2024-11-06  2424  		cti@6c13000 {
bf469630552a39 Jie Gan          2024-11-06  2425  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2426  			reg = <0x0 0x06c13000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2427  
bf469630552a39 Jie Gan          2024-11-06  2428  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2429  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2430  		};
bf469630552a39 Jie Gan          2024-11-06  2431  
bf469630552a39 Jie Gan          2024-11-06  2432  		cti@6c20000 {
bf469630552a39 Jie Gan          2024-11-06  2433  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2434  			reg = <0x0 0x06c20000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2435  
bf469630552a39 Jie Gan          2024-11-06  2436  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2437  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2438  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2439  		};
bf469630552a39 Jie Gan          2024-11-06  2440  
bf469630552a39 Jie Gan          2024-11-06  2441  		tpdm@6c28000 {
bf469630552a39 Jie Gan          2024-11-06  2442  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2443  			reg = <0x0 0x06c28000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2444  
bf469630552a39 Jie Gan          2024-11-06  2445  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2446  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2447  
bf469630552a39 Jie Gan          2024-11-06  2448  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2449  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2450  
bf469630552a39 Jie Gan          2024-11-06  2451  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2452  				port {
bf469630552a39 Jie Gan          2024-11-06  2453  					tpdm_center_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2454  						remote-endpoint = <&tpda_qdss_in0>;
bf469630552a39 Jie Gan          2024-11-06  2455  					};
bf469630552a39 Jie Gan          2024-11-06  2456  				};
bf469630552a39 Jie Gan          2024-11-06  2457  			};
bf469630552a39 Jie Gan          2024-11-06  2458  		};
bf469630552a39 Jie Gan          2024-11-06  2459  
bf469630552a39 Jie Gan          2024-11-06  2460  		cti@6c29000 {
bf469630552a39 Jie Gan          2024-11-06  2461  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2462  			reg = <0x0 0x06c29000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2463  
bf469630552a39 Jie Gan          2024-11-06  2464  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2465  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2466  		};
bf469630552a39 Jie Gan          2024-11-06  2467  
bf469630552a39 Jie Gan          2024-11-06  2468  		cti@6c2a000 {
bf469630552a39 Jie Gan          2024-11-06  2469  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2470  			reg = <0x0 0x06c2a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2471  
bf469630552a39 Jie Gan          2024-11-06  2472  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2473  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2474  		};
bf469630552a39 Jie Gan          2024-11-06  2475  
bf469630552a39 Jie Gan          2024-11-06  2476  		cti@7020000 {
bf469630552a39 Jie Gan          2024-11-06  2477  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2478  			reg = <0x0 0x07020000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2479  
bf469630552a39 Jie Gan          2024-11-06  2480  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2481  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2482  		};
bf469630552a39 Jie Gan          2024-11-06  2483  
bf469630552a39 Jie Gan          2024-11-06  2484  		etm@7040000 {
bf469630552a39 Jie Gan          2024-11-06  2485  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2486  			reg = <0x0 0x07040000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2487  			cpu = <&cpu0>;
bf469630552a39 Jie Gan          2024-11-06  2488  
bf469630552a39 Jie Gan          2024-11-06  2489  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2490  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2491  
bf469630552a39 Jie Gan          2024-11-06  2492  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2493  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2494  
bf469630552a39 Jie Gan          2024-11-06  2495  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2496  				port {
bf469630552a39 Jie Gan          2024-11-06  2497  					etm0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2498  						remote-endpoint = <&funnel_apss_in0>;
bf469630552a39 Jie Gan          2024-11-06  2499  					};
bf469630552a39 Jie Gan          2024-11-06  2500  				};
bf469630552a39 Jie Gan          2024-11-06  2501  			};
bf469630552a39 Jie Gan          2024-11-06  2502  		};
bf469630552a39 Jie Gan          2024-11-06  2503  
bf469630552a39 Jie Gan          2024-11-06  2504  		cti@7120000 {
bf469630552a39 Jie Gan          2024-11-06  2505  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2506  			reg = <0x0 0x07120000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2507  
bf469630552a39 Jie Gan          2024-11-06  2508  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2509  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2510  		};
bf469630552a39 Jie Gan          2024-11-06  2511  
bf469630552a39 Jie Gan          2024-11-06  2512  		etm@7140000 {
bf469630552a39 Jie Gan          2024-11-06  2513  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2514  			reg = <0x0 0x07140000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2515  			cpu = <&cpu1>;
bf469630552a39 Jie Gan          2024-11-06  2516  
bf469630552a39 Jie Gan          2024-11-06  2517  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2518  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2519  
bf469630552a39 Jie Gan          2024-11-06  2520  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2521  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2522  
bf469630552a39 Jie Gan          2024-11-06  2523  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2524  				port {
bf469630552a39 Jie Gan          2024-11-06  2525  					etm1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2526  						remote-endpoint = <&funnel_apss_in1>;
bf469630552a39 Jie Gan          2024-11-06  2527  					};
bf469630552a39 Jie Gan          2024-11-06  2528  				};
bf469630552a39 Jie Gan          2024-11-06  2529  			};
bf469630552a39 Jie Gan          2024-11-06  2530  		};
bf469630552a39 Jie Gan          2024-11-06  2531  
bf469630552a39 Jie Gan          2024-11-06  2532  		cti@7220000 {
bf469630552a39 Jie Gan          2024-11-06  2533  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2534  			reg = <0x0 0x07220000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2535  
bf469630552a39 Jie Gan          2024-11-06  2536  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2537  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2538  		};
bf469630552a39 Jie Gan          2024-11-06  2539  
bf469630552a39 Jie Gan          2024-11-06  2540  		etm@7240000 {
bf469630552a39 Jie Gan          2024-11-06  2541  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2542  			reg = <0x0 0x07240000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2543  			cpu = <&cpu2>;
bf469630552a39 Jie Gan          2024-11-06  2544  
bf469630552a39 Jie Gan          2024-11-06  2545  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2546  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2547  
bf469630552a39 Jie Gan          2024-11-06  2548  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2549  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2550  
bf469630552a39 Jie Gan          2024-11-06  2551  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2552  				port {
bf469630552a39 Jie Gan          2024-11-06  2553  					etm2_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2554  						remote-endpoint = <&funnel_apss_in2>;
bf469630552a39 Jie Gan          2024-11-06  2555  					};
bf469630552a39 Jie Gan          2024-11-06  2556  				};
bf469630552a39 Jie Gan          2024-11-06  2557  			};
bf469630552a39 Jie Gan          2024-11-06  2558  		};
bf469630552a39 Jie Gan          2024-11-06  2559  
bf469630552a39 Jie Gan          2024-11-06  2560  		cti@7320000 {
bf469630552a39 Jie Gan          2024-11-06  2561  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2562  			reg = <0x0 0x07320000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2563  
bf469630552a39 Jie Gan          2024-11-06  2564  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2565  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2566  		};
bf469630552a39 Jie Gan          2024-11-06  2567  
bf469630552a39 Jie Gan          2024-11-06  2568  		etm@7340000 {
bf469630552a39 Jie Gan          2024-11-06  2569  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2570  			reg = <0x0 0x07340000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2571  			cpu = <&cpu3>;
bf469630552a39 Jie Gan          2024-11-06  2572  
bf469630552a39 Jie Gan          2024-11-06  2573  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2574  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2575  
bf469630552a39 Jie Gan          2024-11-06  2576  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2577  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2578  
bf469630552a39 Jie Gan          2024-11-06  2579  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2580  				port {
bf469630552a39 Jie Gan          2024-11-06  2581  					etm3_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2582  						remote-endpoint = <&funnel_apss_in3>;
bf469630552a39 Jie Gan          2024-11-06  2583  					};
bf469630552a39 Jie Gan          2024-11-06  2584  				};
bf469630552a39 Jie Gan          2024-11-06  2585  			};
bf469630552a39 Jie Gan          2024-11-06  2586  		};
bf469630552a39 Jie Gan          2024-11-06  2587  
bf469630552a39 Jie Gan          2024-11-06  2588  		cti@7420000 {
bf469630552a39 Jie Gan          2024-11-06  2589  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2590  			reg = <0x0 0x07420000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2591  
bf469630552a39 Jie Gan          2024-11-06  2592  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2593  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2594  		};
bf469630552a39 Jie Gan          2024-11-06  2595  
bf469630552a39 Jie Gan          2024-11-06  2596  		etm@7440000 {
bf469630552a39 Jie Gan          2024-11-06  2597  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2598  			reg = <0x0 0x07440000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2599  			cpu = <&cpu4>;
bf469630552a39 Jie Gan          2024-11-06  2600  
bf469630552a39 Jie Gan          2024-11-06  2601  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2602  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2603  
bf469630552a39 Jie Gan          2024-11-06  2604  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2605  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2606  
bf469630552a39 Jie Gan          2024-11-06  2607  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2608  				port {
bf469630552a39 Jie Gan          2024-11-06  2609  					etm4_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2610  						remote-endpoint = <&funnel_apss_in4>;
bf469630552a39 Jie Gan          2024-11-06  2611  					};
bf469630552a39 Jie Gan          2024-11-06  2612  				};
bf469630552a39 Jie Gan          2024-11-06  2613  			};
bf469630552a39 Jie Gan          2024-11-06  2614  		};
bf469630552a39 Jie Gan          2024-11-06  2615  
bf469630552a39 Jie Gan          2024-11-06  2616  		cti@7520000 {
bf469630552a39 Jie Gan          2024-11-06  2617  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2618  			reg = <0x0 0x07520000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2619  
bf469630552a39 Jie Gan          2024-11-06  2620  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2621  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2622  		};
bf469630552a39 Jie Gan          2024-11-06  2623  
bf469630552a39 Jie Gan          2024-11-06  2624  		etm@7540000 {
bf469630552a39 Jie Gan          2024-11-06  2625  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2626  			reg = <0x0 0x07540000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2627  			cpu = <&cpu5>;
bf469630552a39 Jie Gan          2024-11-06  2628  
bf469630552a39 Jie Gan          2024-11-06  2629  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2630  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2631  
bf469630552a39 Jie Gan          2024-11-06  2632  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2633  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2634  
bf469630552a39 Jie Gan          2024-11-06  2635  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2636  				port {
bf469630552a39 Jie Gan          2024-11-06  2637  					etm5_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2638  						remote-endpoint = <&funnel_apss_in5>;
bf469630552a39 Jie Gan          2024-11-06  2639  					};
bf469630552a39 Jie Gan          2024-11-06  2640  				};
bf469630552a39 Jie Gan          2024-11-06  2641  			};
bf469630552a39 Jie Gan          2024-11-06  2642  		};
bf469630552a39 Jie Gan          2024-11-06  2643  
bf469630552a39 Jie Gan          2024-11-06  2644  		cti@7620000 {
bf469630552a39 Jie Gan          2024-11-06  2645  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2646  			reg = <0x0 0x07620000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2647  
bf469630552a39 Jie Gan          2024-11-06  2648  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2649  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2650  		};
bf469630552a39 Jie Gan          2024-11-06  2651  
bf469630552a39 Jie Gan          2024-11-06  2652  		etm@7640000 {
bf469630552a39 Jie Gan          2024-11-06  2653  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2654  			reg = <0x0 0x07640000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2655  			cpu = <&cpu6>;
bf469630552a39 Jie Gan          2024-11-06  2656  
bf469630552a39 Jie Gan          2024-11-06  2657  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2658  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2659  
bf469630552a39 Jie Gan          2024-11-06  2660  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2661  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2662  
bf469630552a39 Jie Gan          2024-11-06  2663  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2664  				port {
bf469630552a39 Jie Gan          2024-11-06  2665  					etm6_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2666  						remote-endpoint = <&funnel_apss_in6>;
bf469630552a39 Jie Gan          2024-11-06  2667  					};
bf469630552a39 Jie Gan          2024-11-06  2668  				};
bf469630552a39 Jie Gan          2024-11-06  2669  			};
bf469630552a39 Jie Gan          2024-11-06  2670  		};
bf469630552a39 Jie Gan          2024-11-06  2671  
bf469630552a39 Jie Gan          2024-11-06  2672  		cti@7720000 {
bf469630552a39 Jie Gan          2024-11-06  2673  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2674  			reg = <0x0 0x07720000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2675  
bf469630552a39 Jie Gan          2024-11-06  2676  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2677  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2678  		};
bf469630552a39 Jie Gan          2024-11-06  2679  
bf469630552a39 Jie Gan          2024-11-06  2680  		etm@7740000 {
bf469630552a39 Jie Gan          2024-11-06  2681  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2682  			reg = <0x0 0x07740000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2683  			cpu = <&cpu7>;
bf469630552a39 Jie Gan          2024-11-06  2684  
bf469630552a39 Jie Gan          2024-11-06  2685  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2686  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2687  
bf469630552a39 Jie Gan          2024-11-06  2688  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2689  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2690  
bf469630552a39 Jie Gan          2024-11-06  2691  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2692  				port {
bf469630552a39 Jie Gan          2024-11-06  2693  					etm7_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2694  						remote-endpoint = <&funnel_apss_in7>;
bf469630552a39 Jie Gan          2024-11-06  2695  					};
bf469630552a39 Jie Gan          2024-11-06  2696  				};
bf469630552a39 Jie Gan          2024-11-06  2697  			};
bf469630552a39 Jie Gan          2024-11-06  2698  		};
bf469630552a39 Jie Gan          2024-11-06  2699  
bf469630552a39 Jie Gan          2024-11-06  2700  		funnel@7800000 {
bf469630552a39 Jie Gan          2024-11-06  2701  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2702  			reg = <0x0 0x07800000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2703  
bf469630552a39 Jie Gan          2024-11-06  2704  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2705  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2706  
bf469630552a39 Jie Gan          2024-11-06  2707  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2708  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2709  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2710  
bf469630552a39 Jie Gan          2024-11-06  2711  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2712  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2713  
bf469630552a39 Jie Gan          2024-11-06  2714  					funnel_apss_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2715  						remote-endpoint = <&etm0_out>;
bf469630552a39 Jie Gan          2024-11-06  2716  					};
bf469630552a39 Jie Gan          2024-11-06  2717  				};
bf469630552a39 Jie Gan          2024-11-06  2718  
bf469630552a39 Jie Gan          2024-11-06  2719  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2720  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2721  
bf469630552a39 Jie Gan          2024-11-06  2722  					funnel_apss_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2723  						remote-endpoint = <&etm1_out>;
bf469630552a39 Jie Gan          2024-11-06  2724  					};
bf469630552a39 Jie Gan          2024-11-06  2725  				};
bf469630552a39 Jie Gan          2024-11-06  2726  
bf469630552a39 Jie Gan          2024-11-06  2727  				port@2 {
bf469630552a39 Jie Gan          2024-11-06  2728  					reg = <2>;
bf469630552a39 Jie Gan          2024-11-06  2729  
bf469630552a39 Jie Gan          2024-11-06  2730  					funnel_apss_in2: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2731  						remote-endpoint = <&etm2_out>;
bf469630552a39 Jie Gan          2024-11-06  2732  					};
bf469630552a39 Jie Gan          2024-11-06  2733  				};
bf469630552a39 Jie Gan          2024-11-06  2734  
bf469630552a39 Jie Gan          2024-11-06  2735  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  2736  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  2737  
bf469630552a39 Jie Gan          2024-11-06  2738  					funnel_apss_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2739  						remote-endpoint = <&etm3_out>;
bf469630552a39 Jie Gan          2024-11-06  2740  					};
bf469630552a39 Jie Gan          2024-11-06  2741  				};
bf469630552a39 Jie Gan          2024-11-06  2742  
bf469630552a39 Jie Gan          2024-11-06  2743  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  2744  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  2745  
bf469630552a39 Jie Gan          2024-11-06  2746  					funnel_apss_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2747  						remote-endpoint = <&etm4_out>;
bf469630552a39 Jie Gan          2024-11-06  2748  					};
bf469630552a39 Jie Gan          2024-11-06  2749  				};
bf469630552a39 Jie Gan          2024-11-06  2750  
bf469630552a39 Jie Gan          2024-11-06  2751  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  2752  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  2753  
bf469630552a39 Jie Gan          2024-11-06  2754  					funnel_apss_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2755  						remote-endpoint = <&etm5_out>;
bf469630552a39 Jie Gan          2024-11-06  2756  					};
bf469630552a39 Jie Gan          2024-11-06  2757  				};
bf469630552a39 Jie Gan          2024-11-06  2758  
bf469630552a39 Jie Gan          2024-11-06  2759  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  2760  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  2761  
bf469630552a39 Jie Gan          2024-11-06  2762  					funnel_apss_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2763  						remote-endpoint = <&etm6_out>;
bf469630552a39 Jie Gan          2024-11-06  2764  					};
bf469630552a39 Jie Gan          2024-11-06  2765  				};
bf469630552a39 Jie Gan          2024-11-06  2766  
bf469630552a39 Jie Gan          2024-11-06  2767  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  2768  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  2769  
bf469630552a39 Jie Gan          2024-11-06  2770  					funnel_apss_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2771  						remote-endpoint = <&etm7_out>;
bf469630552a39 Jie Gan          2024-11-06  2772  					};
bf469630552a39 Jie Gan          2024-11-06  2773  				};
bf469630552a39 Jie Gan          2024-11-06  2774  			};
bf469630552a39 Jie Gan          2024-11-06  2775  
bf469630552a39 Jie Gan          2024-11-06  2776  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2777  				port {
bf469630552a39 Jie Gan          2024-11-06  2778  					funnel_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2779  						remote-endpoint = <&funnel_apss_merg_in0>;
bf469630552a39 Jie Gan          2024-11-06  2780  					};
bf469630552a39 Jie Gan          2024-11-06  2781  				};
bf469630552a39 Jie Gan          2024-11-06  2782  			};
bf469630552a39 Jie Gan          2024-11-06  2783  		};
bf469630552a39 Jie Gan          2024-11-06  2784  
bf469630552a39 Jie Gan          2024-11-06  2785  		funnel@7810000 {
bf469630552a39 Jie Gan          2024-11-06  2786  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2787  			reg = <0x0 0x07810000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2788  
bf469630552a39 Jie Gan          2024-11-06  2789  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2790  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2791  
bf469630552a39 Jie Gan          2024-11-06  2792  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2793  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2794  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2795  
bf469630552a39 Jie Gan          2024-11-06  2796  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2797  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2798  
bf469630552a39 Jie Gan          2024-11-06  2799  					funnel_apss_merg_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2800  						remote-endpoint = <&funnel_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2801  					};
bf469630552a39 Jie Gan          2024-11-06  2802  				};
bf469630552a39 Jie Gan          2024-11-06  2803  
bf469630552a39 Jie Gan          2024-11-06  2804  				port@2 {
bf469630552a39 Jie Gan          2024-11-06  2805  					reg = <2>;
bf469630552a39 Jie Gan          2024-11-06  2806  
bf469630552a39 Jie Gan          2024-11-06  2807  					funnel_apss_merg_in2: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2808  						remote-endpoint = <&tpda_olc_out>;
bf469630552a39 Jie Gan          2024-11-06  2809  					};
bf469630552a39 Jie Gan          2024-11-06  2810  				};
bf469630552a39 Jie Gan          2024-11-06  2811  
bf469630552a39 Jie Gan          2024-11-06  2812  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  2813  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  2814  
bf469630552a39 Jie Gan          2024-11-06  2815  					funnel_apss_merg_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2816  						remote-endpoint = <&tpda_llm_silver_out>;
bf469630552a39 Jie Gan          2024-11-06  2817  					};
bf469630552a39 Jie Gan          2024-11-06  2818  				};
bf469630552a39 Jie Gan          2024-11-06  2819  
bf469630552a39 Jie Gan          2024-11-06  2820  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  2821  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  2822  
bf469630552a39 Jie Gan          2024-11-06  2823  					funnel_apss_merg_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2824  						remote-endpoint = <&tpda_llm_gold_out>;
bf469630552a39 Jie Gan          2024-11-06  2825  					};
bf469630552a39 Jie Gan          2024-11-06  2826  				};
bf469630552a39 Jie Gan          2024-11-06  2827  
bf469630552a39 Jie Gan          2024-11-06  2828  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  2829  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  2830  
bf469630552a39 Jie Gan          2024-11-06  2831  					funnel_apss_merg_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2832  						remote-endpoint = <&tpda_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2833  					};
bf469630552a39 Jie Gan          2024-11-06  2834  				};
bf469630552a39 Jie Gan          2024-11-06  2835  			};
bf469630552a39 Jie Gan          2024-11-06  2836  
bf469630552a39 Jie Gan          2024-11-06  2837  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2838  				port {
bf469630552a39 Jie Gan          2024-11-06  2839  					funnel_apss_merg_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2840  						remote-endpoint = <&funnel_in1_in7>;
bf469630552a39 Jie Gan          2024-11-06  2841  					};
bf469630552a39 Jie Gan          2024-11-06  2842  				};
bf469630552a39 Jie Gan          2024-11-06  2843  			};
bf469630552a39 Jie Gan          2024-11-06  2844  		};
bf469630552a39 Jie Gan          2024-11-06  2845  
bf469630552a39 Jie Gan          2024-11-06  2846  		tpdm@7830000 {
bf469630552a39 Jie Gan          2024-11-06  2847  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2848  			reg = <0x0 0x07830000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2849  
bf469630552a39 Jie Gan          2024-11-06  2850  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2851  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2852  
bf469630552a39 Jie Gan          2024-11-06  2853  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  2854  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2855  
bf469630552a39 Jie Gan          2024-11-06  2856  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2857  				port {
bf469630552a39 Jie Gan          2024-11-06  2858  					tpdm_olc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2859  						remote-endpoint = <&tpda_olc_in>;
bf469630552a39 Jie Gan          2024-11-06  2860  					};
bf469630552a39 Jie Gan          2024-11-06  2861  				};
bf469630552a39 Jie Gan          2024-11-06  2862  			};
bf469630552a39 Jie Gan          2024-11-06  2863  		};
bf469630552a39 Jie Gan          2024-11-06  2864  
bf469630552a39 Jie Gan          2024-11-06  2865  		tpda@7832000 {
bf469630552a39 Jie Gan          2024-11-06  2866  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2867  			reg = <0x0 0x07832000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2868  
bf469630552a39 Jie Gan          2024-11-06  2869  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2870  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2871  
bf469630552a39 Jie Gan          2024-11-06  2872  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2873  				port {
bf469630552a39 Jie Gan          2024-11-06  2874  					tpda_olc_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2875  						remote-endpoint = <&tpdm_olc_out>;
bf469630552a39 Jie Gan          2024-11-06  2876  					};
bf469630552a39 Jie Gan          2024-11-06  2877  				};
bf469630552a39 Jie Gan          2024-11-06  2878  			};
bf469630552a39 Jie Gan          2024-11-06  2879  
bf469630552a39 Jie Gan          2024-11-06  2880  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2881  				port {
bf469630552a39 Jie Gan          2024-11-06  2882  					tpda_olc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2883  						remote-endpoint = <&funnel_apss_merg_in2>;
bf469630552a39 Jie Gan          2024-11-06  2884  					};
bf469630552a39 Jie Gan          2024-11-06  2885  				};
bf469630552a39 Jie Gan          2024-11-06  2886  			};
bf469630552a39 Jie Gan          2024-11-06  2887  		};
bf469630552a39 Jie Gan          2024-11-06  2888  
bf469630552a39 Jie Gan          2024-11-06  2889  		tpdm@7860000 {
bf469630552a39 Jie Gan          2024-11-06  2890  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2891  			reg = <0x0 0x07860000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2892  
bf469630552a39 Jie Gan          2024-11-06  2893  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2894  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2895  
bf469630552a39 Jie Gan          2024-11-06  2896  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2897  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2898  
bf469630552a39 Jie Gan          2024-11-06  2899  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2900  				port {
bf469630552a39 Jie Gan          2024-11-06  2901  					tpdm_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2902  						remote-endpoint = <&tpda_apss_in>;
bf469630552a39 Jie Gan          2024-11-06  2903  					};
bf469630552a39 Jie Gan          2024-11-06  2904  				};
bf469630552a39 Jie Gan          2024-11-06  2905  			};
bf469630552a39 Jie Gan          2024-11-06  2906  		};
bf469630552a39 Jie Gan          2024-11-06  2907  
bf469630552a39 Jie Gan          2024-11-06  2908  		tpda@7862000 {
bf469630552a39 Jie Gan          2024-11-06  2909  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2910  			reg = <0x0 0x07862000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2911  
bf469630552a39 Jie Gan          2024-11-06  2912  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2913  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2914  
bf469630552a39 Jie Gan          2024-11-06  2915  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2916  				port {
bf469630552a39 Jie Gan          2024-11-06  2917  					tpda_apss_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2918  						remote-endpoint = <&tpdm_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2919  					};
bf469630552a39 Jie Gan          2024-11-06  2920  				};
bf469630552a39 Jie Gan          2024-11-06  2921  			};
bf469630552a39 Jie Gan          2024-11-06  2922  
bf469630552a39 Jie Gan          2024-11-06  2923  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2924  				port {
bf469630552a39 Jie Gan          2024-11-06  2925  					tpda_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2926  						remote-endpoint = <&funnel_apss_merg_in5>;
bf469630552a39 Jie Gan          2024-11-06  2927  					};
bf469630552a39 Jie Gan          2024-11-06  2928  				};
bf469630552a39 Jie Gan          2024-11-06  2929  			};
bf469630552a39 Jie Gan          2024-11-06  2930  		};
bf469630552a39 Jie Gan          2024-11-06  2931  
bf469630552a39 Jie Gan          2024-11-06  2932  		tpdm@78a0000 {
bf469630552a39 Jie Gan          2024-11-06  2933  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2934  			reg = <0x0 0x078a0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2935  
bf469630552a39 Jie Gan          2024-11-06  2936  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2937  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2938  
bf469630552a39 Jie Gan          2024-11-06  2939  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2940  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2941  
bf469630552a39 Jie Gan          2024-11-06  2942  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2943  				port {
bf469630552a39 Jie Gan          2024-11-06  2944  					tpdm_llm_silver_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2945  						remote-endpoint = <&tpda_llm_silver_in>;
bf469630552a39 Jie Gan          2024-11-06  2946  					};
bf469630552a39 Jie Gan          2024-11-06  2947  				};
bf469630552a39 Jie Gan          2024-11-06  2948  			};
bf469630552a39 Jie Gan          2024-11-06  2949  		};
bf469630552a39 Jie Gan          2024-11-06  2950  
bf469630552a39 Jie Gan          2024-11-06  2951  		tpdm@78b0000 {
bf469630552a39 Jie Gan          2024-11-06  2952  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2953  			reg = <0x0 0x078b0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2954  
bf469630552a39 Jie Gan          2024-11-06  2955  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2956  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2957  
bf469630552a39 Jie Gan          2024-11-06  2958  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2959  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2960  
bf469630552a39 Jie Gan          2024-11-06  2961  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2962  				port {
bf469630552a39 Jie Gan          2024-11-06  2963  					tpdm_llm_gold_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2964  						remote-endpoint = <&tpda_llm_gold_in>;
bf469630552a39 Jie Gan          2024-11-06  2965  					};
bf469630552a39 Jie Gan          2024-11-06  2966  				};
bf469630552a39 Jie Gan          2024-11-06  2967  			};
bf469630552a39 Jie Gan          2024-11-06  2968  		};
bf469630552a39 Jie Gan          2024-11-06  2969  
bf469630552a39 Jie Gan          2024-11-06  2970  		tpda@78c0000 {
bf469630552a39 Jie Gan          2024-11-06  2971  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2972  			reg = <0x0 0x078c0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2973  
bf469630552a39 Jie Gan          2024-11-06  2974  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2975  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2976  
bf469630552a39 Jie Gan          2024-11-06  2977  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2978  				port {
bf469630552a39 Jie Gan          2024-11-06  2979  					tpda_llm_silver_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2980  						remote-endpoint = <&tpdm_llm_silver_out>;
bf469630552a39 Jie Gan          2024-11-06  2981  					};
bf469630552a39 Jie Gan          2024-11-06  2982  				};
bf469630552a39 Jie Gan          2024-11-06  2983  			};
bf469630552a39 Jie Gan          2024-11-06  2984  
bf469630552a39 Jie Gan          2024-11-06  2985  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2986  				port {
bf469630552a39 Jie Gan          2024-11-06  2987  					tpda_llm_silver_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2988  						remote-endpoint = <&funnel_apss_merg_in3>;
bf469630552a39 Jie Gan          2024-11-06  2989  					};
bf469630552a39 Jie Gan          2024-11-06  2990  				};
bf469630552a39 Jie Gan          2024-11-06  2991  			};
bf469630552a39 Jie Gan          2024-11-06  2992  		};
bf469630552a39 Jie Gan          2024-11-06  2993  
bf469630552a39 Jie Gan          2024-11-06  2994  		tpda@78d0000 {
bf469630552a39 Jie Gan          2024-11-06  2995  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2996  			reg = <0x0 0x078d0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2997  
bf469630552a39 Jie Gan          2024-11-06  2998  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2999  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3000  
bf469630552a39 Jie Gan          2024-11-06  3001  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  3002  				port {
bf469630552a39 Jie Gan          2024-11-06  3003  					tpda_llm_gold_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3004  						remote-endpoint = <&tpdm_llm_gold_out>;
bf469630552a39 Jie Gan          2024-11-06  3005  					};
bf469630552a39 Jie Gan          2024-11-06  3006  				};
bf469630552a39 Jie Gan          2024-11-06  3007  			};
bf469630552a39 Jie Gan          2024-11-06  3008  
bf469630552a39 Jie Gan          2024-11-06  3009  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3010  				port {
bf469630552a39 Jie Gan          2024-11-06  3011  					tpda_llm_gold_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3012  						remote-endpoint = <&funnel_apss_merg_in4>;
bf469630552a39 Jie Gan          2024-11-06  3013  					};
bf469630552a39 Jie Gan          2024-11-06  3014  				};
bf469630552a39 Jie Gan          2024-11-06  3015  			};
bf469630552a39 Jie Gan          2024-11-06  3016  		};
bf469630552a39 Jie Gan          2024-11-06  3017  
bf469630552a39 Jie Gan          2024-11-06  3018  		cti@78e0000 {
bf469630552a39 Jie Gan          2024-11-06  3019  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3020  			reg = <0x0 0x078e0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3021  
bf469630552a39 Jie Gan          2024-11-06  3022  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3023  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3024  		};
bf469630552a39 Jie Gan          2024-11-06  3025  
bf469630552a39 Jie Gan          2024-11-06  3026  		cti@78f0000 {
bf469630552a39 Jie Gan          2024-11-06  3027  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3028  			reg = <0x0 0x078f0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3029  
bf469630552a39 Jie Gan          2024-11-06  3030  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3031  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3032  		};
bf469630552a39 Jie Gan          2024-11-06  3033  
bf469630552a39 Jie Gan          2024-11-06  3034  		cti@7900000 {
bf469630552a39 Jie Gan          2024-11-06  3035  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3036  			reg = <0x0 0x07900000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3037  
bf469630552a39 Jie Gan          2024-11-06  3038  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3039  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3040  		};
bf469630552a39 Jie Gan          2024-11-06  3041  
89fc83a9472812 Lijuan Gao       2024-12-18  3042  		pmu@90b6300 {
89fc83a9472812 Lijuan Gao       2024-12-18  3043  			compatible = "qcom,qcs615-cpu-bwmon", "qcom,sdm845-bwmon";
89fc83a9472812 Lijuan Gao       2024-12-18  3044  			reg = <0x0 0x090b6300 0x0 0x600>;
89fc83a9472812 Lijuan Gao       2024-12-18  3045  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 Lijuan Gao       2024-12-18  3046  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 Lijuan Gao       2024-12-18  3047  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 Lijuan Gao       2024-12-18  3048  
89fc83a9472812 Lijuan Gao       2024-12-18  3049  			operating-points-v2 = <&cpu_bwmon_opp_table>;
89fc83a9472812 Lijuan Gao       2024-12-18  3050  
89fc83a9472812 Lijuan Gao       2024-12-18  3051  			cpu_bwmon_opp_table: opp-table {
89fc83a9472812 Lijuan Gao       2024-12-18  3052  				compatible = "operating-points-v2";
89fc83a9472812 Lijuan Gao       2024-12-18  3053  
89fc83a9472812 Lijuan Gao       2024-12-18  3054  				opp-0 {
89fc83a9472812 Lijuan Gao       2024-12-18  3055  					opp-peak-kBps = <12896000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3056  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3057  
89fc83a9472812 Lijuan Gao       2024-12-18  3058  				opp-1 {
89fc83a9472812 Lijuan Gao       2024-12-18  3059  					opp-peak-kBps = <14928000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3060  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3061  			};
89fc83a9472812 Lijuan Gao       2024-12-18  3062  		};
89fc83a9472812 Lijuan Gao       2024-12-18  3063  
89fc83a9472812 Lijuan Gao       2024-12-18  3064  		pmu@90cd000 {
89fc83a9472812 Lijuan Gao       2024-12-18  3065  			compatible = "qcom,qcs615-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
89fc83a9472812 Lijuan Gao       2024-12-18  3066  			reg = <0x0 0x090cd000 0x0 0x1000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3067  			interrupts = <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 Lijuan Gao       2024-12-18  3068  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 Lijuan Gao       2024-12-18  3069  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 Lijuan Gao       2024-12-18  3070  
89fc83a9472812 Lijuan Gao       2024-12-18  3071  			operating-points-v2 = <&llcc_bwmon_opp_table>;
89fc83a9472812 Lijuan Gao       2024-12-18  3072  
89fc83a9472812 Lijuan Gao       2024-12-18  3073  			llcc_bwmon_opp_table: opp-table {
89fc83a9472812 Lijuan Gao       2024-12-18  3074  				compatible = "operating-points-v2";
89fc83a9472812 Lijuan Gao       2024-12-18  3075  
89fc83a9472812 Lijuan Gao       2024-12-18  3076  				opp-0 {
89fc83a9472812 Lijuan Gao       2024-12-18  3077  					opp-peak-kBps = <800000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3078  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3079  
89fc83a9472812 Lijuan Gao       2024-12-18  3080  				opp-1 {
89fc83a9472812 Lijuan Gao       2024-12-18  3081  					opp-peak-kBps = <1200000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3082  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3083  
89fc83a9472812 Lijuan Gao       2024-12-18  3084  				opp-2 {
89fc83a9472812 Lijuan Gao       2024-12-18  3085  					opp-peak-kBps = <1804800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3086  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3087  
89fc83a9472812 Lijuan Gao       2024-12-18  3088  				opp-3 {
89fc83a9472812 Lijuan Gao       2024-12-18  3089  					opp-peak-kBps = <2188800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3090  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3091  
89fc83a9472812 Lijuan Gao       2024-12-18  3092  				opp-4 {
89fc83a9472812 Lijuan Gao       2024-12-18  3093  					opp-peak-kBps = <2726400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3094  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3095  
89fc83a9472812 Lijuan Gao       2024-12-18  3096  				opp-5 {
89fc83a9472812 Lijuan Gao       2024-12-18  3097  					opp-peak-kBps = <3072000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3098  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3099  
89fc83a9472812 Lijuan Gao       2024-12-18  3100  				opp-6 {
89fc83a9472812 Lijuan Gao       2024-12-18  3101  					opp-peak-kBps = <4070400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3102  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3103  
89fc83a9472812 Lijuan Gao       2024-12-18  3104  				opp-7 {
89fc83a9472812 Lijuan Gao       2024-12-18  3105  					opp-peak-kBps = <5414400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3106  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3107  
89fc83a9472812 Lijuan Gao       2024-12-18  3108  				opp-8 {
89fc83a9472812 Lijuan Gao       2024-12-18  3109  					opp-peak-kBps = <6220800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3110  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3111  			};
89fc83a9472812 Lijuan Gao       2024-12-18  3112  		};
89fc83a9472812 Lijuan Gao       2024-12-18  3113  
8009de059f8693 Yuanjie Yang     2024-12-17  3114  		sdhc_2: mmc@8804000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3115  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 Yuanjie Yang     2024-12-17  3116  			reg = <0x0 0x08804000 0x0 0x1000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3117  			reg-names = "hc";
8009de059f8693 Yuanjie Yang     2024-12-17  3118  
8009de059f8693 Yuanjie Yang     2024-12-17  3119  			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 Yuanjie Yang     2024-12-17  3120  				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 Yuanjie Yang     2024-12-17  3121  			interrupt-names = "hc_irq",
8009de059f8693 Yuanjie Yang     2024-12-17  3122  					  "pwr_irq";
8009de059f8693 Yuanjie Yang     2024-12-17  3123  
8009de059f8693 Yuanjie Yang     2024-12-17  3124  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17  3125  				 <&gcc GCC_SDCC2_APPS_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17  3126  				 <&rpmhcc RPMH_CXO_CLK>;
8009de059f8693 Yuanjie Yang     2024-12-17  3127  			clock-names = "iface",
8009de059f8693 Yuanjie Yang     2024-12-17  3128  				      "core",
8009de059f8693 Yuanjie Yang     2024-12-17  3129  				      "xo";
8009de059f8693 Yuanjie Yang     2024-12-17  3130  
8009de059f8693 Yuanjie Yang     2024-12-17  3131  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 Yuanjie Yang     2024-12-17  3132  			operating-points-v2 = <&sdhc2_opp_table>;
8009de059f8693 Yuanjie Yang     2024-12-17  3133  			iommus = <&apps_smmu 0x02a0 0x0>;
8009de059f8693 Yuanjie Yang     2024-12-17  3134  			resets = <&gcc GCC_SDCC2_BCR>;
8009de059f8693 Yuanjie Yang     2024-12-17  3135  			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
8009de059f8693 Yuanjie Yang     2024-12-17  3136  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 Yuanjie Yang     2024-12-17  3137  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 Yuanjie Yang     2024-12-17  3138  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 Yuanjie Yang     2024-12-17  3139  			interconnect-names = "sdhc-ddr",
8009de059f8693 Yuanjie Yang     2024-12-17  3140  					     "cpu-sdhc";
8009de059f8693 Yuanjie Yang     2024-12-17  3141  
8009de059f8693 Yuanjie Yang     2024-12-17  3142  			qcom,dll-config = <0x0007642c>;
8009de059f8693 Yuanjie Yang     2024-12-17  3143  			qcom,ddr-config = <0x80040868>;
8009de059f8693 Yuanjie Yang     2024-12-17  3144  			dma-coherent;
8009de059f8693 Yuanjie Yang     2024-12-17  3145  
8009de059f8693 Yuanjie Yang     2024-12-17  3146  			status = "disabled";
8009de059f8693 Yuanjie Yang     2024-12-17  3147  
8009de059f8693 Yuanjie Yang     2024-12-17  3148  			sdhc2_opp_table: opp-table {
8009de059f8693 Yuanjie Yang     2024-12-17  3149  				compatible = "operating-points-v2";
8009de059f8693 Yuanjie Yang     2024-12-17  3150  
8009de059f8693 Yuanjie Yang     2024-12-17  3151  				opp-50000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3152  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3153  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17  3154  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3155  
8009de059f8693 Yuanjie Yang     2024-12-17  3156  				opp-100000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3157  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3158  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17  3159  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3160  
8009de059f8693 Yuanjie Yang     2024-12-17  3161  				opp-202000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3162  					opp-hz = /bits/ 64 <202000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3163  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 Yuanjie Yang     2024-12-17  3164  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3165  			};
8009de059f8693 Yuanjie Yang     2024-12-17  3166  		};
8009de059f8693 Yuanjie Yang     2024-12-17  3167  
8e266654a2fe82 Lijuan Gao       2024-11-04  3168  		dc_noc: interconnect@9160000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3169  			reg = <0x0 0x09160000 0x0 0x3200>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3170  			compatible = "qcom,qcs615-dc-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3171  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3172  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3173  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3174  
29af58ab4d17f5 Song Xue         2024-10-31  3175  		llcc: system-cache-controller@9200000 {
29af58ab4d17f5 Song Xue         2024-10-31  3176  			compatible = "qcom,qcs615-llcc";
29af58ab4d17f5 Song Xue         2024-10-31  3177  			reg = <0x0 0x09200000 0x0 0x50000>,
29af58ab4d17f5 Song Xue         2024-10-31  3178  			      <0x0 0x09600000 0x0 0x50000>;
29af58ab4d17f5 Song Xue         2024-10-31  3179  			reg-names = "llcc0_base",
29af58ab4d17f5 Song Xue         2024-10-31  3180  				    "llcc_broadcast_base";
29af58ab4d17f5 Song Xue         2024-10-31  3181  		};
29af58ab4d17f5 Song Xue         2024-10-31  3182  
8e266654a2fe82 Lijuan Gao       2024-11-04  3183  		gem_noc: interconnect@9680000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3184  			reg = <0x0 0x09680000 0x0 0x3e200>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3185  			compatible = "qcom,qcs615-gem-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3186  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3187  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3188  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3189  
8e266654a2fe82 Lijuan Gao       2024-11-04  3190  		pdc: interrupt-controller@b220000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3191  			compatible = "qcom,qcs615-pdc", "qcom,pdc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3192  			reg = <0x0 0x0b220000 0x0 0x30000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3193  			      <0x0 0x17c000f0 0x0 0x64>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3194  			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3195  			interrupt-parent = <&intc>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3196  			#interrupt-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3197  			interrupt-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  3198  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3199  
0775021783b553 Kyle Deng        2024-10-18  3200  		aoss_qmp: power-controller@c300000 {
0775021783b553 Kyle Deng        2024-10-18  3201  			compatible = "qcom,qcs615-aoss-qmp", "qcom,aoss-qmp";
0775021783b553 Kyle Deng        2024-10-18  3202  			reg = <0x0 0x0c300000 0x0 0x400>;
0775021783b553 Kyle Deng        2024-10-18  3203  			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
0775021783b553 Kyle Deng        2024-10-18  3204  			mboxes = <&apss_shared 0>;
0775021783b553 Kyle Deng        2024-10-18  3205  
0775021783b553 Kyle Deng        2024-10-18  3206  			#clock-cells = <0>;
0775021783b553 Kyle Deng        2024-10-18  3207  			#power-domain-cells = <1>;
0775021783b553 Kyle Deng        2024-10-18  3208  		};
0775021783b553 Kyle Deng        2024-10-18  3209  
8e266654a2fe82 Lijuan Gao       2024-11-04  3210  		sram@c3f0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3211  			compatible = "qcom,rpmh-stats";
8e266654a2fe82 Lijuan Gao       2024-11-04  3212  			reg = <0x0 0x0c3f0000 0x0 0x400>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3213  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3214  
58241be90050e5 Qingqing Zhou    2024-11-05  3215  		apps_smmu: iommu@15000000 {
58241be90050e5 Qingqing Zhou    2024-11-05  3216  			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
58241be90050e5 Qingqing Zhou    2024-11-05  3217  			reg = <0x0 0x15000000 0x0 0x80000>;
58241be90050e5 Qingqing Zhou    2024-11-05  3218  			#iommu-cells = <2>;
58241be90050e5 Qingqing Zhou    2024-11-05  3219  			#global-interrupts = <1>;
58241be90050e5 Qingqing Zhou    2024-11-05  3220  			dma-coherent;
58241be90050e5 Qingqing Zhou    2024-11-05  3221  
58241be90050e5 Qingqing Zhou    2024-11-05  3222  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3223  				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3224  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3225  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3226  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3227  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3228  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3229  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3230  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3231  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3232  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3233  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3234  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3235  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3236  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3237  				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3238  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3239  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3240  				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3241  				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3242  				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3243  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3244  				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3245  				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3246  				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3247  				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3248  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3249  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3250  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3251  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3252  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3253  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3254  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3255  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3256  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3257  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3258  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3259  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3260  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3261  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3262  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3263  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3264  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3265  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3266  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3267  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3268  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3269  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3270  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3271  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3272  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3273  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3274  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3275  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3276  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3277  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3278  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3279  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3280  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3281  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3282  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3283  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3284  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3285  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
58241be90050e5 Qingqing Zhou    2024-11-05  3286  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
58241be90050e5 Qingqing Zhou    2024-11-05  3287  		};
58241be90050e5 Qingqing Zhou    2024-11-05  3288  
27554e2bef4d70 Tingguo Cheng    2024-12-02  3289  		spmi_bus: spmi@c440000 {
27554e2bef4d70 Tingguo Cheng    2024-12-02  3290  			compatible = "qcom,spmi-pmic-arb";
27554e2bef4d70 Tingguo Cheng    2024-12-02  3291  			reg = <0x0 0x0c440000 0x0 0x1100>,
27554e2bef4d70 Tingguo Cheng    2024-12-02  3292  			      <0x0 0x0c600000 0x0 0x2000000>,
27554e2bef4d70 Tingguo Cheng    2024-12-02  3293  			      <0x0 0x0e600000 0x0 0x100000>,
27554e2bef4d70 Tingguo Cheng    2024-12-02  3294  			      <0x0 0x0e700000 0x0 0xa0000>,
27554e2bef4d70 Tingguo Cheng    2024-12-02  3295  			      <0x0 0x0c40a000 0x0 0x26000>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3296  			reg-names = "core",
27554e2bef4d70 Tingguo Cheng    2024-12-02  3297  				    "chnls",
27554e2bef4d70 Tingguo Cheng    2024-12-02  3298  				    "obsrvr",
27554e2bef4d70 Tingguo Cheng    2024-12-02  3299  				    "intr",
27554e2bef4d70 Tingguo Cheng    2024-12-02  3300  				    "cnfg";
27554e2bef4d70 Tingguo Cheng    2024-12-02  3301  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3302  			interrupt-names = "periph_irq";
27554e2bef4d70 Tingguo Cheng    2024-12-02  3303  			interrupt-controller;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3304  			#interrupt-cells = <4>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3305  			#address-cells = <2>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3306  			#size-cells = <0>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3307  			cell-index = <0>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3308  			qcom,channel = <0>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3309  			qcom,ee = <0>;
27554e2bef4d70 Tingguo Cheng    2024-12-02  3310  		};
27554e2bef4d70 Tingguo Cheng    2024-12-02  3311  
8e266654a2fe82 Lijuan Gao       2024-11-04  3312  		intc: interrupt-controller@17a00000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3313  			compatible = "arm,gic-v3";
8e266654a2fe82 Lijuan Gao       2024-11-04  3314  			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
8e266654a2fe82 Lijuan Gao       2024-11-04  3315  			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
8e266654a2fe82 Lijuan Gao       2024-11-04  3316  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3317  			#interrupt-cells = <3>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3318  			interrupt-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  3319  			#redistributor-regions = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3320  			redistributor-stride = <0x0 0x20000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3321  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3322  
0775021783b553 Kyle Deng        2024-10-18  3323  		apss_shared: mailbox@17c00000 {
0775021783b553 Kyle Deng        2024-10-18  3324  			compatible = "qcom,qcs615-apss-shared",
0775021783b553 Kyle Deng        2024-10-18  3325  				     "qcom,sdm845-apss-shared";
0775021783b553 Kyle Deng        2024-10-18  3326  			reg = <0x0 0x17c00000 0x0 0x1000>;
0775021783b553 Kyle Deng        2024-10-18  3327  			#mbox-cells = <1>;
0775021783b553 Kyle Deng        2024-10-18  3328  		};
0775021783b553 Kyle Deng        2024-10-18  3329  
8e266654a2fe82 Lijuan Gao       2024-11-04  3330  		watchdog: watchdog@17c10000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3331  			compatible = "qcom,apss-wdt-qcs615", "qcom,kpss-wdt";
8e266654a2fe82 Lijuan Gao       2024-11-04  3332  			reg = <0x0 0x17c10000 0x0 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3333  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3334  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3335  
8e266654a2fe82 Lijuan Gao       2024-11-04  3336  		timer@17c20000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3337  			compatible = "arm,armv7-timer-mem";
8e266654a2fe82 Lijuan Gao       2024-11-04  3338  			reg = <0x0 0x17c20000 0x0 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3339  			ranges = <0 0 0 0x20000000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3340  			#address-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3341  			#size-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3342  
8e266654a2fe82 Lijuan Gao       2024-11-04  3343  			frame@17c21000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3344  				reg = <0x17c21000 0x1000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3345  				      <0x17c22000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3346  				frame-number = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3347  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3348  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3349  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3350  
8e266654a2fe82 Lijuan Gao       2024-11-04  3351  			frame@17c23000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3352  				reg = <0x17c23000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3353  				frame-number = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3354  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3355  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3356  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3357  
8e266654a2fe82 Lijuan Gao       2024-11-04  3358  			frame@17c25000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3359  				reg = <0x17c25000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3360  				frame-number = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3361  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3362  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3363  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3364  
8e266654a2fe82 Lijuan Gao       2024-11-04  3365  			frame@17c27000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3366  				reg = <0x17c27000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3367  				frame-number = <3>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3368  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3369  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3370  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3371  
8e266654a2fe82 Lijuan Gao       2024-11-04  3372  			frame@17c29000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3373  				reg = <0x17c29000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3374  				frame-number = <4>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3375  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3376  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3377  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3378  
8e266654a2fe82 Lijuan Gao       2024-11-04  3379  			frame@17c2b000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3380  				reg = <0x17c2b000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3381  				frame-number = <5>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3382  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3383  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3384  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3385  
8e266654a2fe82 Lijuan Gao       2024-11-04  3386  			frame@17c2d000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3387  				reg = <0x17c2d000 0x1000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3388  				frame-number = <6>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3389  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3390  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  3391  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3392  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3393  
8e266654a2fe82 Lijuan Gao       2024-11-04  3394  		apps_rsc: rsc@18200000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3395  			compatible = "qcom,rpmh-rsc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3396  			reg = <0x0 0x18200000 0x0 0x10000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3397  			      <0x0 0x18210000 0x0 0x10000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3398  			      <0x0 0x18220000 0x0 0x10000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3399  			reg-names = "drv-0",
8e266654a2fe82 Lijuan Gao       2024-11-04  3400  				    "drv-1",
8e266654a2fe82 Lijuan Gao       2024-11-04  3401  				    "drv-2";
8e266654a2fe82 Lijuan Gao       2024-11-04  3402  
8e266654a2fe82 Lijuan Gao       2024-11-04  3403  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3404  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3405  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3406  
8e266654a2fe82 Lijuan Gao       2024-11-04  3407  			qcom,drv-id = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3408  			qcom,tcs-offset = <0xd00>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3409  			qcom,tcs-config = <ACTIVE_TCS    2>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3410  					  <SLEEP_TCS     3>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3411  					  <WAKE_TCS      3>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3412  					  <CONTROL_TCS   1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3413  
8e266654a2fe82 Lijuan Gao       2024-11-04  3414  			label = "apps_rsc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3415  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3416  
8e266654a2fe82 Lijuan Gao       2024-11-04  3417  			apps_bcm_voter: bcm-voter {
8e266654a2fe82 Lijuan Gao       2024-11-04  3418  				compatible = "qcom,bcm-voter";
8e266654a2fe82 Lijuan Gao       2024-11-04  3419  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3420  
8e266654a2fe82 Lijuan Gao       2024-11-04  3421  			rpmhcc: clock-controller {
8e266654a2fe82 Lijuan Gao       2024-11-04  3422  				compatible = "qcom,qcs615-rpmh-clk";
8e266654a2fe82 Lijuan Gao       2024-11-04  3423  				clock-names = "xo";
8e266654a2fe82 Lijuan Gao       2024-11-04  3424  
8e266654a2fe82 Lijuan Gao       2024-11-04  3425  				#clock-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3426  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3427  
8e266654a2fe82 Lijuan Gao       2024-11-04  3428  			rpmhpd: power-controller {
8e266654a2fe82 Lijuan Gao       2024-11-04  3429  				compatible = "qcom,qcs615-rpmhpd";
8e266654a2fe82 Lijuan Gao       2024-11-04  3430  				#power-domain-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3431  				operating-points-v2 = <&rpmhpd_opp_table>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3432  
8e266654a2fe82 Lijuan Gao       2024-11-04  3433  				rpmhpd_opp_table: opp-table {
8e266654a2fe82 Lijuan Gao       2024-11-04  3434  					compatible = "operating-points-v2";
8e266654a2fe82 Lijuan Gao       2024-11-04  3435  
8e266654a2fe82 Lijuan Gao       2024-11-04  3436  					rpmhpd_opp_ret: opp-0 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3437  						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3438  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3439  
8e266654a2fe82 Lijuan Gao       2024-11-04  3440  					rpmhpd_opp_min_svs: opp-1 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3441  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3442  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3443  
8e266654a2fe82 Lijuan Gao       2024-11-04  3444  					rpmhpd_opp_low_svs: opp-2 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3445  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3446  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3447  
8e266654a2fe82 Lijuan Gao       2024-11-04  3448  					rpmhpd_opp_svs: opp-3 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3449  						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3450  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3451  
8e266654a2fe82 Lijuan Gao       2024-11-04  3452  					rpmhpd_opp_svs_l1: opp-4 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3453  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3454  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3455  
8e266654a2fe82 Lijuan Gao       2024-11-04  3456  					rpmhpd_opp_nom: opp-5 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3457  						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3458  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3459  
8e266654a2fe82 Lijuan Gao       2024-11-04  3460  					rpmhpd_opp_nom_l1: opp-6 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3461  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3462  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3463  
8e266654a2fe82 Lijuan Gao       2024-11-04  3464  					rpmhpd_opp_nom_l2: opp-7 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3465  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3466  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3467  
8e266654a2fe82 Lijuan Gao       2024-11-04  3468  					rpmhpd_opp_turbo: opp-8 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3469  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3470  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3471  
8e266654a2fe82 Lijuan Gao       2024-11-04  3472  					rpmhpd_opp_turbo_l1: opp-9 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3473  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3474  					};
8e266654a2fe82 Lijuan Gao       2024-11-04  3475  				};
8e266654a2fe82 Lijuan Gao       2024-11-04  3476  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  3477  		};
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3478  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3479  		usb_1_hsphy: phy@88e2000 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3480  			compatible = "qcom,qcs615-qusb2-phy";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3481  			reg = <0x0 0x88e2000 0x0 0x180>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3482  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3483  			clocks = <&gcc GCC_AHB2PHY_WEST_CLK>, <&rpmhcc RPMH_CXO_CLK>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3484  			clock-names = "cfg_ahb", "ref";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3485  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3486  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3487  			nvmem-cells = <&qusb2_hstx_trim>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3488  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3489  			#phy-cells = <0>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3490  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3491  			status = "disabled";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3492  		};
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3493  
2be96096148f1a Krishna Kurapati 2024-12-18  3494  		usb_hsphy_2: phy@88e3000 {
2be96096148f1a Krishna Kurapati 2024-12-18  3495  			compatible = "qcom,qcs615-qusb2-phy";
2be96096148f1a Krishna Kurapati 2024-12-18  3496  			reg = <0x0 0x088e3000 0x0 0x180>;
2be96096148f1a Krishna Kurapati 2024-12-18  3497  
2be96096148f1a Krishna Kurapati 2024-12-18  3498  			clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3499  				 <&rpmhcc RPMH_CXO_CLK>;
2be96096148f1a Krishna Kurapati 2024-12-18  3500  			clock-names = "cfg_ahb",
2be96096148f1a Krishna Kurapati 2024-12-18  3501  				      "ref";
2be96096148f1a Krishna Kurapati 2024-12-18  3502  
2be96096148f1a Krishna Kurapati 2024-12-18  3503  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
2be96096148f1a Krishna Kurapati 2024-12-18  3504  
2be96096148f1a Krishna Kurapati 2024-12-18  3505  			#phy-cells = <0>;
2be96096148f1a Krishna Kurapati 2024-12-18  3506  
2be96096148f1a Krishna Kurapati 2024-12-18  3507  			status = "disabled";
2be96096148f1a Krishna Kurapati 2024-12-18  3508  		};
2be96096148f1a Krishna Kurapati 2024-12-18  3509  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3510  		usb_qmpphy: phy@88e6000 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3511  			compatible = "qcom,qcs615-qmp-usb3-phy";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3512  			reg = <0x0 0x88e6000 0x0 0x1000>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3513  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3514  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3515  				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3516  				 <&gcc GCC_AHB2PHY_WEST_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3517  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3518  			clock-names = "aux",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3519  				      "ref",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3520  				      "cfg_ahb",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3521  				      "pipe";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3522  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3523  			resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3524  				 <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3525  			reset-names = "phy", "phy_phy";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3526  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3527  			qcom,tcsr-reg = <&tcsr 0xb244>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3528  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3529  			clock-output-names = "usb3_phy_pipe_clk_src";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3530  			#clock-cells = <0>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3531  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3532  			#phy-cells = <0>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3533  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3534  			status = "disabled";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3535  		};
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3536  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3537  		usb_1: usb@a6f8800 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3538  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3539  			reg = <0x0 0x0a6f8800 0x0 0x400>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3540  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3541  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3542  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3543  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3544  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3545  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3546  				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3547  			clock-names = "cfg_noc",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3548  				      "core",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3549  				      "iface",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3550  				      "sleep",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3551  				      "mock_utmi",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3552  				      "xo";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3553  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3554  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3555  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3556  			assigned-clock-rates = <19200000>, <200000000>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3557  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3558  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3559  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3560  					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3561  					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3562  					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3563  			interrupt-names = "pwr_event",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3564  					  "hs_phy_irq",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3565  					  "dp_hs_phy_irq",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3566  					  "dm_hs_phy_irq",
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3567  					  "ss_phy_irq";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3568  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3569  			power-domains = <&gcc USB30_PRIM_GDSC>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3570  			required-opps = <&rpmhpd_opp_nom>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3571  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3572  			resets = <&gcc GCC_USB30_PRIM_BCR>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3573  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3574  			#address-cells = <2>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3575  			#size-cells = <2>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3576  			ranges;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3577  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3578  			status = "disabled";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3579  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3580  			usb_1_dwc3: usb@a600000 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3581  				compatible = "snps,dwc3";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3582  				reg = <0x0 0x0a600000 0x0 0xcd00>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3583  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3584  				iommus = <&apps_smmu 0x140 0x0>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3585  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3586  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3587  				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3588  				phy-names = "usb2-phy", "usb3-phy";
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3589  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3590  				snps,dis-u1-entry-quirk;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3591  				snps,dis-u2-entry-quirk;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3592  				snps,dis_u2_susphy_quirk;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3593  				snps,dis_enblslpm_quirk;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3594  				snps,has-lpm-erratum;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3595  				snps,hird-threshold = /bits/ 8 <0x10>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3596  				snps,usb3_lpm_capable;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3597  			};
4b2769c7d7ce47 Krishna Kurapati 2024-11-21  3598  		};
2be96096148f1a Krishna Kurapati 2024-12-18  3599  
2be96096148f1a Krishna Kurapati 2024-12-18  3600  		usb_2: usb@a8f8800 {
2be96096148f1a Krishna Kurapati 2024-12-18  3601  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
2be96096148f1a Krishna Kurapati 2024-12-18  3602  			reg = <0x0 0x0a8f8800 0x0 0x400>;
2be96096148f1a Krishna Kurapati 2024-12-18  3603  
2be96096148f1a Krishna Kurapati 2024-12-18  3604  			clocks = <&gcc GCC_CFG_NOC_USB2_SEC_AXI_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3605  				 <&gcc GCC_USB20_SEC_MASTER_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3606  				 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3607  				 <&gcc GCC_USB20_SEC_SLEEP_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3608  				 <&gcc GCC_USB20_SEC_MOCK_UTMI_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3609  				 <&gcc GCC_USB2_PRIM_CLKREF_CLK>;
2be96096148f1a Krishna Kurapati 2024-12-18  3610  			clock-names = "cfg_noc",
2be96096148f1a Krishna Kurapati 2024-12-18  3611  				      "core",
2be96096148f1a Krishna Kurapati 2024-12-18  3612  				      "iface",
2be96096148f1a Krishna Kurapati 2024-12-18  3613  				      "sleep",
2be96096148f1a Krishna Kurapati 2024-12-18  3614  				      "mock_utmi",
2be96096148f1a Krishna Kurapati 2024-12-18  3615  				      "xo";
2be96096148f1a Krishna Kurapati 2024-12-18  3616  
2be96096148f1a Krishna Kurapati 2024-12-18  3617  			assigned-clocks = <&gcc GCC_USB20_SEC_MOCK_UTMI_CLK>,
2be96096148f1a Krishna Kurapati 2024-12-18  3618  					  <&gcc GCC_USB20_SEC_MASTER_CLK>;
2be96096148f1a Krishna Kurapati 2024-12-18  3619  			assigned-clock-rates = <19200000>, <200000000>;
2be96096148f1a Krishna Kurapati 2024-12-18  3620  
2be96096148f1a Krishna Kurapati 2024-12-18  3621  			interrupts-extended = <&intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH>,
2be96096148f1a Krishna Kurapati 2024-12-18  3622  					      <&intc GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
2be96096148f1a Krishna Kurapati 2024-12-18  3623  					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
2be96096148f1a Krishna Kurapati 2024-12-18  3624  					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>;
2be96096148f1a Krishna Kurapati 2024-12-18  3625  			interrupt-names = "pwr_event",
2be96096148f1a Krishna Kurapati 2024-12-18  3626  					  "hs_phy_irq",
2be96096148f1a Krishna Kurapati 2024-12-18  3627  					  "dp_hs_phy_irq",
2be96096148f1a Krishna Kurapati 2024-12-18  3628  					  "dm_hs_phy_irq";
2be96096148f1a Krishna Kurapati 2024-12-18  3629  
2be96096148f1a Krishna Kurapati 2024-12-18  3630  			power-domains = <&gcc USB20_SEC_GDSC>;
2be96096148f1a Krishna Kurapati 2024-12-18  3631  			required-opps = <&rpmhpd_opp_nom>;
2be96096148f1a Krishna Kurapati 2024-12-18  3632  
2be96096148f1a Krishna Kurapati 2024-12-18  3633  			resets = <&gcc GCC_USB20_SEC_BCR>;
2be96096148f1a Krishna Kurapati 2024-12-18  3634  
2be96096148f1a Krishna Kurapati 2024-12-18  3635  			qcom,select-utmi-as-pipe-clk;
2be96096148f1a Krishna Kurapati 2024-12-18  3636  
2be96096148f1a Krishna Kurapati 2024-12-18  3637  			#address-cells = <2>;
2be96096148f1a Krishna Kurapati 2024-12-18  3638  			#size-cells = <2>;
2be96096148f1a Krishna Kurapati 2024-12-18  3639  			ranges;
2be96096148f1a Krishna Kurapati 2024-12-18  3640  
2be96096148f1a Krishna Kurapati 2024-12-18  3641  			status = "disabled";
2be96096148f1a Krishna Kurapati 2024-12-18  3642  
2be96096148f1a Krishna Kurapati 2024-12-18  3643  			usb_2_dwc3: usb@a800000 {
2be96096148f1a Krishna Kurapati 2024-12-18  3644  				compatible = "snps,dwc3";
2be96096148f1a Krishna Kurapati 2024-12-18  3645  				reg = <0x0 0x0a800000 0x0 0xcd00>;
2be96096148f1a Krishna Kurapati 2024-12-18  3646  
2be96096148f1a Krishna Kurapati 2024-12-18  3647  				iommus = <&apps_smmu 0xe0 0x0>;
2be96096148f1a Krishna Kurapati 2024-12-18  3648  				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;
2be96096148f1a Krishna Kurapati 2024-12-18  3649  
2be96096148f1a Krishna Kurapati 2024-12-18  3650  				phys = <&usb_hsphy_2>;
2be96096148f1a Krishna Kurapati 2024-12-18  3651  				phy-names = "usb2-phy";
2be96096148f1a Krishna Kurapati 2024-12-18  3652  
2be96096148f1a Krishna Kurapati 2024-12-18  3653  				snps,dis_u2_susphy_quirk;
2be96096148f1a Krishna Kurapati 2024-12-18  3654  				snps,dis_enblslpm_quirk;
2be96096148f1a Krishna Kurapati 2024-12-18  3655  				snps,has-lpm-erratum;
2be96096148f1a Krishna Kurapati 2024-12-18  3656  				snps,hird-threshold = /bits/ 8 <0x10>;
2be96096148f1a Krishna Kurapati 2024-12-18  3657  
2be96096148f1a Krishna Kurapati 2024-12-18  3658  				maximum-speed = "high-speed";
2be96096148f1a Krishna Kurapati 2024-12-18  3659  			};
2be96096148f1a Krishna Kurapati 2024-12-18  3660  		};
c69fefd0a84dbd Gaurav Kohli     2025-06-24  3661  
c69fefd0a84dbd Gaurav Kohli     2025-06-24 @3662  		tsens0: thermal-sensor@c222000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
