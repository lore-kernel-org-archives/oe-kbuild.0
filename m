Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055E25CC77
	for <oe-kbuild@lists.linux.dev>; Fri, 16 May 2025 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747416440; cv=none; b=kh9WeKioZDxSLL38pdgI5Wwe9a4HNvcn04bMIZTHtty645DGleJa2V6rz2b/Z8O9QaDRDSqkFp6dqF6UiUJ+w8aKDHysA+XiQ51MA95IPElDjudFnhQBuSa0C5iryCni5A9d+9ldyax1CyfzyhCnRfU/mghN3U+CsrQQoKxHBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747416440; c=relaxed/simple;
	bh=HF17kIA2st1NuyeIhplkgGTk3+k1eCADH14dfoCIBx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3tSxwqUN22Z4q9cGXh1eGFkjEFzT2RuxjUFytnNZvEcWziuHF1MyrEGw9sf9kN1AaUTPcL2Eo3sZHXVD0DlUXQaMCJpWYEPYyt1/SbnQjWb97gVXzRUvuMyPL5CbNuQLRJu9TjlgvmY6x3UNDikZ0wt+Uz4VupLuVj9aIJQ8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWGlX2Xj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWGlX2Xj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747416432; x=1778952432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HF17kIA2st1NuyeIhplkgGTk3+k1eCADH14dfoCIBx8=;
  b=WWGlX2XjXi+KZjkRhXGTVAnv7+3rnmVqaB1vdSJ3M4PwfAxVI4Z6K2BI
   PfPwOl51gftMqu54EnYA23x9vSSQauxFZk6dQekYp9ii+u/YH3InhvEat
   VzBu8WDX5duNV0FcZphmGWcPMI/YCgDb3w5zF1D7n4LnjbusB/Fzbo0Yw
   xnGY4iUEeMqf3vHjTxJDgYVHQ6h3iFfvIXQBxE/X6jCntL610SxZTxGGG
   CVXdexDZpns90a47L2SaVTPL3JjulzMK/c2o2SRrUrIkglDESowev1pks
   i7MDUD1FMglNQmgJ6k+haTd/+6JKpo6Cu7FNDDreSzsKDa9FpNUBTi3Qv
   A==;
X-CSE-ConnectionGUID: 1Avq1lihQRCqbQdYHpQjqw==
X-CSE-MsgGUID: wctfYLDUQtm9oanlDBSXWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="52022163"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="52022163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:27:11 -0700
X-CSE-ConnectionGUID: FrzEiNcaS6CuRduRZfRJlw==
X-CSE-MsgGUID: ZBpq79H+TMy2M8ysK27ClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="143725376"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2025 10:27:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFypu-000JZL-25;
	Fri, 16 May 2025 17:27:06 +0000
Date: Sat, 17 May 2025 01:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
Message-ID: <202505170101.bOwrDzax-lkp@intel.com>
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
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
TO: Lijuan Gao <quic_lijuang@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: kernel@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Lijuan Gao <quic_lijuang@quicinc.com>

Hi Lijuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 484803582c77061b470ac64a634f25f89715be3f]

url:    https://github.com/intel-lab-lkp/linux/commits/Lijuan-Gao/dt-bindings-remoteproc-qcom-sm8150-pas-Document-QCS615-remoteproc/20250516-113038
base:   484803582c77061b470ac64a634f25f89715be3f
patch link:    https://lore.kernel.org/r/20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0%40quicinc.com
patch subject: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info region
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170101.bOwrDzax-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170101.bOwrDzax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505170101.bOwrDzax-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs615.dtsi:3293.17-3305.5: Warning (simple_bus_reg): /soc@0/sram@146aa000: simple-bus unit address format error, expected "14680000"

vim +/14680000 +3293 arch/arm64/boot/dts/qcom/qcs615.dtsi

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
a927f905e3d3d7 Kyle Deng        2025-05-16   335  	smp2p-adsp {
a927f905e3d3d7 Kyle Deng        2025-05-16   336  		compatible = "qcom,smp2p";
a927f905e3d3d7 Kyle Deng        2025-05-16   337  		qcom,smem = <443>, <429>;
a927f905e3d3d7 Kyle Deng        2025-05-16   338  		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
a927f905e3d3d7 Kyle Deng        2025-05-16   339  		/* On this platform, bit 26 (normally SLPI) is repurposed for ADSP */
a927f905e3d3d7 Kyle Deng        2025-05-16   340  		mboxes = <&apss_shared 26>;
a927f905e3d3d7 Kyle Deng        2025-05-16   341  
a927f905e3d3d7 Kyle Deng        2025-05-16   342  		qcom,local-pid = <0>;
a927f905e3d3d7 Kyle Deng        2025-05-16   343  		qcom,remote-pid = <2>;
a927f905e3d3d7 Kyle Deng        2025-05-16   344  
a927f905e3d3d7 Kyle Deng        2025-05-16   345  		adsp_smp2p_out: master-kernel {
a927f905e3d3d7 Kyle Deng        2025-05-16   346  			qcom,entry-name = "master-kernel";
a927f905e3d3d7 Kyle Deng        2025-05-16   347  			#qcom,smem-state-cells = <1>;
a927f905e3d3d7 Kyle Deng        2025-05-16   348  		};
a927f905e3d3d7 Kyle Deng        2025-05-16   349  
a927f905e3d3d7 Kyle Deng        2025-05-16   350  		adsp_smp2p_in: slave-kernel {
a927f905e3d3d7 Kyle Deng        2025-05-16   351  			qcom,entry-name = "slave-kernel";
a927f905e3d3d7 Kyle Deng        2025-05-16   352  			interrupt-controller;
a927f905e3d3d7 Kyle Deng        2025-05-16   353  			#interrupt-cells = <2>;
a927f905e3d3d7 Kyle Deng        2025-05-16   354  		};
a927f905e3d3d7 Kyle Deng        2025-05-16   355  	};
a927f905e3d3d7 Kyle Deng        2025-05-16   356  
a927f905e3d3d7 Kyle Deng        2025-05-16   357  	smp2p-cdsp {
a927f905e3d3d7 Kyle Deng        2025-05-16   358  		compatible = "qcom,smp2p";
a927f905e3d3d7 Kyle Deng        2025-05-16   359  		qcom,smem = <94>, <432>;
a927f905e3d3d7 Kyle Deng        2025-05-16   360  		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
a927f905e3d3d7 Kyle Deng        2025-05-16   361  		mboxes = <&apss_shared 6>;
a927f905e3d3d7 Kyle Deng        2025-05-16   362  
a927f905e3d3d7 Kyle Deng        2025-05-16   363  		qcom,local-pid = <0>;
a927f905e3d3d7 Kyle Deng        2025-05-16   364  		qcom,remote-pid = <5>;
a927f905e3d3d7 Kyle Deng        2025-05-16   365  
a927f905e3d3d7 Kyle Deng        2025-05-16   366  		cdsp_smp2p_out: master-kernel {
a927f905e3d3d7 Kyle Deng        2025-05-16   367  			qcom,entry-name = "master-kernel";
a927f905e3d3d7 Kyle Deng        2025-05-16   368  			#qcom,smem-state-cells = <1>;
a927f905e3d3d7 Kyle Deng        2025-05-16   369  		};
a927f905e3d3d7 Kyle Deng        2025-05-16   370  
a927f905e3d3d7 Kyle Deng        2025-05-16   371  		cdsp_smp2p_in: slave-kernel {
a927f905e3d3d7 Kyle Deng        2025-05-16   372  			qcom,entry-name = "slave-kernel";
a927f905e3d3d7 Kyle Deng        2025-05-16   373  			interrupt-controller;
a927f905e3d3d7 Kyle Deng        2025-05-16   374  			#interrupt-cells = <2>;
a927f905e3d3d7 Kyle Deng        2025-05-16   375  		};
a927f905e3d3d7 Kyle Deng        2025-05-16   376  
a927f905e3d3d7 Kyle Deng        2025-05-16   377  	};
a927f905e3d3d7 Kyle Deng        2025-05-16   378  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   379  	qup_opp_table: opp-table-qup {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   380  		compatible = "operating-points-v2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   381  		opp-shared;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   382  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   383  		opp-75000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   384  			opp-hz = /bits/ 64 <75000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   385  			required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   386  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   387  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   388  		opp-100000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   389  			opp-hz = /bits/ 64 <100000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   390  			required-opps = <&rpmhpd_opp_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   391  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   392  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   393  		opp-128000000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   394  			opp-hz = /bits/ 64 <128000000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   395  			required-opps = <&rpmhpd_opp_nom>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   396  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   397  	};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   398  
8e266654a2fe82 Lijuan Gao       2024-11-04   399  	psci {
8e266654a2fe82 Lijuan Gao       2024-11-04   400  		compatible = "arm,psci-1.0";
8e266654a2fe82 Lijuan Gao       2024-11-04   401  		method = "smc";
8e266654a2fe82 Lijuan Gao       2024-11-04   402  
8e266654a2fe82 Lijuan Gao       2024-11-04   403  		cpu_pd0: power-domain-cpu0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   404  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   405  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   406  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   407  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   408  
8e266654a2fe82 Lijuan Gao       2024-11-04   409  		cpu_pd1: power-domain-cpu1 {
8e266654a2fe82 Lijuan Gao       2024-11-04   410  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   411  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   412  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   413  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   414  
8e266654a2fe82 Lijuan Gao       2024-11-04   415  		cpu_pd2: power-domain-cpu2 {
8e266654a2fe82 Lijuan Gao       2024-11-04   416  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   417  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   418  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   419  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   420  
8e266654a2fe82 Lijuan Gao       2024-11-04   421  		cpu_pd3: power-domain-cpu3 {
8e266654a2fe82 Lijuan Gao       2024-11-04   422  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   423  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   424  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   425  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   426  
8e266654a2fe82 Lijuan Gao       2024-11-04   427  		cpu_pd4: power-domain-cpu4 {
8e266654a2fe82 Lijuan Gao       2024-11-04   428  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   429  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   430  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   431  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   432  
8e266654a2fe82 Lijuan Gao       2024-11-04   433  		cpu_pd5: power-domain-cpu5 {
8e266654a2fe82 Lijuan Gao       2024-11-04   434  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   435  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   436  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   437  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   438  
8e266654a2fe82 Lijuan Gao       2024-11-04   439  		cpu_pd6: power-domain-cpu6 {
8e266654a2fe82 Lijuan Gao       2024-11-04   440  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   441  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   442  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   443  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   444  
8e266654a2fe82 Lijuan Gao       2024-11-04   445  		cpu_pd7: power-domain-cpu7 {
8e266654a2fe82 Lijuan Gao       2024-11-04   446  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   447  			power-domains = <&cluster_pd>;
8e266654a2fe82 Lijuan Gao       2024-11-04   448  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   449  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   450  
8e266654a2fe82 Lijuan Gao       2024-11-04   451  		cluster_pd: power-domain-cluster {
8e266654a2fe82 Lijuan Gao       2024-11-04   452  			#power-domain-cells = <0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   453  			domain-idle-states = <&cluster_sleep_0
8e266654a2fe82 Lijuan Gao       2024-11-04   454  					      &cluster_sleep_1
8e266654a2fe82 Lijuan Gao       2024-11-04   455  					      &cluster_sleep_2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   456  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   457  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   458  
8e266654a2fe82 Lijuan Gao       2024-11-04   459  	reserved-memory {
8e266654a2fe82 Lijuan Gao       2024-11-04   460  		#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   461  		#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   462  		ranges;
8e266654a2fe82 Lijuan Gao       2024-11-04   463  
83934b5d6b1a96 Lijuan Gao       2025-02-21   464  		aop_cmd_db_mem: aop-cmd-db@85f20000 {
83934b5d6b1a96 Lijuan Gao       2025-02-21   465  			compatible = "qcom,cmd-db";
83934b5d6b1a96 Lijuan Gao       2025-02-21   466  			reg = <0x0 0x85f20000 0x0 0x20000>;
83934b5d6b1a96 Lijuan Gao       2025-02-21   467  			no-map;
83934b5d6b1a96 Lijuan Gao       2025-02-21   468  		};
83934b5d6b1a96 Lijuan Gao       2025-02-21   469  
8e266654a2fe82 Lijuan Gao       2024-11-04   470  		smem_region: smem@86000000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   471  			compatible = "qcom,smem";
8e266654a2fe82 Lijuan Gao       2024-11-04   472  			reg = <0x0 0x86000000 0x0 0x200000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   473  			no-map;
8e266654a2fe82 Lijuan Gao       2024-11-04   474  			hwlocks = <&tcsr_mutex 3>;
8e266654a2fe82 Lijuan Gao       2024-11-04   475  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   476  	};
8e266654a2fe82 Lijuan Gao       2024-11-04   477  
8e266654a2fe82 Lijuan Gao       2024-11-04   478  	soc: soc@0 {
8e266654a2fe82 Lijuan Gao       2024-11-04   479  		compatible = "simple-bus";
8e266654a2fe82 Lijuan Gao       2024-11-04   480  		ranges = <0 0 0 0 0x10 0>;
58241be90050e5 Qingqing Zhou    2024-11-05   481  		dma-ranges = <0 0 0 0 0x10 0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   482  		#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   483  		#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   484  
8e266654a2fe82 Lijuan Gao       2024-11-04   485  		gcc: clock-controller@100000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   486  			compatible = "qcom,qcs615-gcc";
8e266654a2fe82 Lijuan Gao       2024-11-04   487  			reg = <0 0x00100000 0 0x1f0000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   488  
8e266654a2fe82 Lijuan Gao       2024-11-04   489  			#clock-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   490  			#reset-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   491  			#power-domain-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   492  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   493  
8e266654a2fe82 Lijuan Gao       2024-11-04   494  		qfprom: efuse@780000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   495  			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
8e266654a2fe82 Lijuan Gao       2024-11-04   496  			reg = <0x0 0x00780000 0x0 0x7000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   497  			#address-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04   498  			#size-cells = <1>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   499  
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   500  			qusb2_hstx_trim: hstx-trim@1f8 {
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   501  				reg = <0x1fb 0x1>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   502  				bits = <1 4>;
4b2769c7d7ce47 Krishna Kurapati 2024-11-21   503  			};
8e266654a2fe82 Lijuan Gao       2024-11-04   504  		};
8e266654a2fe82 Lijuan Gao       2024-11-04   505  
a3daa844ed8104 Abhinaba Rakshit 2025-02-28   506  		rng@793000 {
a3daa844ed8104 Abhinaba Rakshit 2025-02-28   507  			compatible = "qcom,qcs615-trng", "qcom,trng";
a3daa844ed8104 Abhinaba Rakshit 2025-02-28   508  			reg = <0x0 0x00793000 0x0 0x1000>;
a3daa844ed8104 Abhinaba Rakshit 2025-02-28   509  		};
a3daa844ed8104 Abhinaba Rakshit 2025-02-28   510  
8009de059f8693 Yuanjie Yang     2024-12-17   511  		sdhc_1: mmc@7c4000 {
8009de059f8693 Yuanjie Yang     2024-12-17   512  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 Yuanjie Yang     2024-12-17   513  			reg = <0x0 0x007c4000 0x0 0x1000>,
8009de059f8693 Yuanjie Yang     2024-12-17   514  			      <0x0 0x007c5000 0x0 0x1000>,
8009de059f8693 Yuanjie Yang     2024-12-17   515  			      <0x0 0x007c8000 0x0 0x8000>;
8009de059f8693 Yuanjie Yang     2024-12-17   516  			reg-names = "hc",
8009de059f8693 Yuanjie Yang     2024-12-17   517  				    "cqhci",
8009de059f8693 Yuanjie Yang     2024-12-17   518  				    "ice";
8009de059f8693 Yuanjie Yang     2024-12-17   519  
8009de059f8693 Yuanjie Yang     2024-12-17   520  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 Yuanjie Yang     2024-12-17   521  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 Yuanjie Yang     2024-12-17   522  			interrupt-names = "hc_irq",
8009de059f8693 Yuanjie Yang     2024-12-17   523  					  "pwr_irq";
8009de059f8693 Yuanjie Yang     2024-12-17   524  
8009de059f8693 Yuanjie Yang     2024-12-17   525  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   526  				 <&gcc GCC_SDCC1_APPS_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   527  				 <&rpmhcc RPMH_CXO_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17   528  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
8009de059f8693 Yuanjie Yang     2024-12-17   529  			clock-names = "iface",
8009de059f8693 Yuanjie Yang     2024-12-17   530  				      "core",
8009de059f8693 Yuanjie Yang     2024-12-17   531  				      "xo",
8009de059f8693 Yuanjie Yang     2024-12-17   532  				      "ice";
8009de059f8693 Yuanjie Yang     2024-12-17   533  
8009de059f8693 Yuanjie Yang     2024-12-17   534  			resets = <&gcc GCC_SDCC1_BCR>;
8009de059f8693 Yuanjie Yang     2024-12-17   535  
8009de059f8693 Yuanjie Yang     2024-12-17   536  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 Yuanjie Yang     2024-12-17   537  			operating-points-v2 = <&sdhc1_opp_table>;
8009de059f8693 Yuanjie Yang     2024-12-17   538  			iommus = <&apps_smmu 0x02c0 0x0>;
8009de059f8693 Yuanjie Yang     2024-12-17   539  			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
8009de059f8693 Yuanjie Yang     2024-12-17   540  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 Yuanjie Yang     2024-12-17   541  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 Yuanjie Yang     2024-12-17   542  					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 Yuanjie Yang     2024-12-17   543  			interconnect-names = "sdhc-ddr",
8009de059f8693 Yuanjie Yang     2024-12-17   544  					     "cpu-sdhc";
8009de059f8693 Yuanjie Yang     2024-12-17   545  
8009de059f8693 Yuanjie Yang     2024-12-17   546  			qcom,dll-config = <0x000f642c>;
8009de059f8693 Yuanjie Yang     2024-12-17   547  			qcom,ddr-config = <0x80040868>;
8009de059f8693 Yuanjie Yang     2024-12-17   548  			supports-cqe;
8009de059f8693 Yuanjie Yang     2024-12-17   549  			dma-coherent;
8009de059f8693 Yuanjie Yang     2024-12-17   550  
8009de059f8693 Yuanjie Yang     2024-12-17   551  			status = "disabled";
8009de059f8693 Yuanjie Yang     2024-12-17   552  
8009de059f8693 Yuanjie Yang     2024-12-17   553  			sdhc1_opp_table: opp-table {
8009de059f8693 Yuanjie Yang     2024-12-17   554  				compatible = "operating-points-v2";
8009de059f8693 Yuanjie Yang     2024-12-17   555  
8009de059f8693 Yuanjie Yang     2024-12-17   556  				opp-50000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   557  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   558  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17   559  				};
8009de059f8693 Yuanjie Yang     2024-12-17   560  
8009de059f8693 Yuanjie Yang     2024-12-17   561  				opp-100000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   562  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   563  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17   564  				};
8009de059f8693 Yuanjie Yang     2024-12-17   565  
8009de059f8693 Yuanjie Yang     2024-12-17   566  				opp-200000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   567  					opp-hz = /bits/ 64 <200000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   568  					required-opps = <&rpmhpd_opp_svs_l1>;
8009de059f8693 Yuanjie Yang     2024-12-17   569  				};
8009de059f8693 Yuanjie Yang     2024-12-17   570  
8009de059f8693 Yuanjie Yang     2024-12-17   571  				opp-384000000 {
8009de059f8693 Yuanjie Yang     2024-12-17   572  					opp-hz = /bits/ 64 <384000000>;
8009de059f8693 Yuanjie Yang     2024-12-17   573  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 Yuanjie Yang     2024-12-17   574  				};
8009de059f8693 Yuanjie Yang     2024-12-17   575  			};
8009de059f8693 Yuanjie Yang     2024-12-17   576  		};
8009de059f8693 Yuanjie Yang     2024-12-17   577  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   578  		gpi_dma0: dma-controller@800000  {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   579  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   580  			reg = <0x0 0x800000 0x0 0x60000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   581  			#dma-cells = <3>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   582  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   583  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   584  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   585  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   586  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   587  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   588  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   589  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   590  			dma-channels = <8>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   591  			dma-channel-mask = <0xf>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   592  			iommus = <&apps_smmu 0xd6 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   593  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   594  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   595  
8e266654a2fe82 Lijuan Gao       2024-11-04   596  		qupv3_id_0: geniqup@8c0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   597  			compatible = "qcom,geni-se-qup";
8e266654a2fe82 Lijuan Gao       2024-11-04   598  			reg = <0x0 0x008c0000 0x0 0x6000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   599  			ranges;
8e266654a2fe82 Lijuan Gao       2024-11-04   600  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
8e266654a2fe82 Lijuan Gao       2024-11-04   601  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
8e266654a2fe82 Lijuan Gao       2024-11-04   602  			clock-names = "m-ahb",
8e266654a2fe82 Lijuan Gao       2024-11-04   603  				      "s-ahb";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   604  			iommus = <&apps_smmu 0xc3 0x0>;
8e266654a2fe82 Lijuan Gao       2024-11-04   605  			#address-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   606  			#size-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04   607  			status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04   608  
8e266654a2fe82 Lijuan Gao       2024-11-04   609  			uart0: serial@880000 {
8e266654a2fe82 Lijuan Gao       2024-11-04   610  				compatible = "qcom,geni-debug-uart";
8e266654a2fe82 Lijuan Gao       2024-11-04   611  				reg = <0x0 0x00880000 0x0 0x4000>;
8e266654a2fe82 Lijuan Gao       2024-11-04   612  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
8e266654a2fe82 Lijuan Gao       2024-11-04   613  				clock-names = "se";
8e266654a2fe82 Lijuan Gao       2024-11-04   614  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
8e266654a2fe82 Lijuan Gao       2024-11-04   615  				pinctrl-names = "default";
8e266654a2fe82 Lijuan Gao       2024-11-04   616  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   617  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   618  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   619  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   620  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   621  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   622  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   623  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   624  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   625  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   626  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   627  			i2c1: i2c@884000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   628  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   629  				reg = <0x0 0x884000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   630  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   631  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   632  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   633  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   634  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   635  				pinctrl-0 = <&qup_i2c1_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   636  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   637  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   638  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   639  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   640  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   641  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   642  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   643  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   644  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   645  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   646  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   647  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   648  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   649  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   650  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   651  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   652  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   653  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   654  			i2c2: i2c@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   655  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   656  				reg = <0x0 0x888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   657  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   658  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   659  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   660  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   661  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   662  				pinctrl-0 = <&qup_i2c2_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   663  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   664  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   665  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   666  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   667  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   668  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   669  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   670  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   671  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   672  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   673  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   674  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   675  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   676  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   677  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   678  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   679  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   680  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   681  			spi2: spi@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   682  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   683  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   684  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   685  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   686  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   687  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   688  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   689  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   690  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   691  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   692  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   693  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   694  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   695  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   696  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   697  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   698  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   699  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   700  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   701  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   702  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   703  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   704  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   705  			uart2: serial@888000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   706  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   707  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   708  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   709  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   710  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   711  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   712  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   713  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   714  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   715  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   716  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   717  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   718  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   719  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   720  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   721  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   722  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   723  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   724  			i2c3: i2c@88c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   725  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   726  				reg = <0x0 0x88c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   727  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   728  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   729  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   730  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   731  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   732  				pinctrl-0 = <&qup_i2c3_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   733  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   734  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   735  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   736  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   737  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   738  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   739  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   740  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   741  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   742  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   743  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   744  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   745  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   746  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   747  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   748  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   749  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   750  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   751  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   752  		gpi_dma1: dma-controller@a00000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   753  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   754  			reg = <0x0 0xa00000 0x0 0x60000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   755  			#dma-cells = <3>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   756  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   757  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   758  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   759  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   760  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   761  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   762  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   763  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   764  			dma-channels = <8>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   765  			dma-channel-mask = <0xf>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   766  			iommus = <&apps_smmu 0x376 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   767  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   768  		};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   769  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   770  		qupv3_id_1: geniqup@ac0000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   771  			compatible = "qcom,geni-se-qup";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   772  			reg = <0x0 0xac0000 0x0 0x2000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   773  			ranges;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   774  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   775  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   776  			clock-names = "m-ahb",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   777  				      "s-ahb";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   778  			iommus = <&apps_smmu 0x363 0x0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   779  			#address-cells = <2>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   780  			#size-cells = <2>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   781  			status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   782  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   783  			i2c4: i2c@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   784  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   785  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   786  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   787  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   788  				pinctrl-0 = <&qup_i2c4_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   789  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   790  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   791  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   792  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   793  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   794  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   795  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   796  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   797  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   798  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   799  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   800  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   801  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   802  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   803  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   804  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   805  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   806  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   807  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   808  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   809  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   810  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   811  			spi4: spi@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   812  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   813  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   814  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   815  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   816  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   817  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   818  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   819  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   820  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   821  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   822  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   823  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   824  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   825  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   826  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   827  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   828  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   829  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   830  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   831  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   832  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   833  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   834  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   835  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   836  			uart4: serial@a80000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   837  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   838  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   839  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   840  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   841  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   842  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   843  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   844  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   845  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   846  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   847  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   848  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   849  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   850  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   851  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   852  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   853  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   854  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   855  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   856  			i2c5: i2c@a84000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   857  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   858  				reg = <0x0 0xa84000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   859  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   860  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   861  				pinctrl-0 = <&qup_i2c5_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   862  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   863  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   864  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   865  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   866  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   867  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   868  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   869  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   870  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   871  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   872  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   873  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   874  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   875  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   876  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   877  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   878  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   879  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   880  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   881  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   882  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   883  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   884  			i2c6: i2c@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   885  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   886  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   887  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   888  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   889  				pinctrl-0 = <&qup_i2c6_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   890  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   891  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   892  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   893  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   894  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   895  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   896  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   897  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   898  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   899  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   900  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   901  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   902  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   903  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   904  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   905  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   906  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   907  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   908  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   909  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   910  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   911  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   912  			spi6: spi@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   913  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   914  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   915  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   916  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   917  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   918  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   919  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   920  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   921  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   922  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   923  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   924  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   925  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   926  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   927  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   928  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   929  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   930  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   931  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   932  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   933  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   934  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   935  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   936  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   937  			uart6: serial@a88000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   938  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   939  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   940  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   941  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   942  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   943  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   944  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   945  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   946  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   947  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   948  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   949  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   950  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   951  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   952  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   953  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   954  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   955  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   956  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   957  			i2c7: i2c@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   958  				compatible = "qcom,geni-i2c";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   959  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   960  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   961  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   962  				pinctrl-0 = <&qup_i2c7_data_clk>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   963  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   964  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   965  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   966  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   967  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   968  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   969  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   970  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   971  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   972  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   973  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   974  						     "qup-config",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   975  						     "qup-memory";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   976  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   977  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   978  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   979  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   980  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15   981  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   982  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   983  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15   984  
f6746dc9e379ea Viken Dadhaniya  2024-11-15   985  			spi7: spi@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15   986  				compatible = "qcom,geni-spi";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   987  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   988  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   989  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   990  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   991  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15   992  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   993  				#address-cells = <1>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   994  				#size-cells = <0>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15   995  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   996  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15   997  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15   998  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
8e266654a2fe82 Lijuan Gao       2024-11-04   999  				interconnect-names = "qup-core",
8e266654a2fe82 Lijuan Gao       2024-11-04  1000  						     "qup-config";
8e266654a2fe82 Lijuan Gao       2024-11-04  1001  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1002  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1003  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1004  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1005  				dma-names = "tx",
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1006  					    "rx";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1007  				status = "disabled";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1008  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1009  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1010  			uart7: serial@a8c000 {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1011  				compatible = "qcom,geni-uart";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1012  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1013  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1014  				clock-names = "se";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1015  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1016  					    <&qup_uart7_tx>, <&qup_uart7_rx>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1017  				pinctrl-names = "default";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1018  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1019  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1020  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1021  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1022  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1023  				interconnect-names = "qup-core",
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1024  						     "qup-config";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1025  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1026  				operating-points-v2 = <&qup_opp_table>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1027  				status = "disabled";
8e266654a2fe82 Lijuan Gao       2024-11-04  1028  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  1029  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1030  
8e266654a2fe82 Lijuan Gao       2024-11-04  1031  		config_noc: interconnect@1500000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1032  			reg = <0x0 0x01500000 0x0 0x5080>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1033  			compatible = "qcom,qcs615-config-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  1034  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1035  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1036  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1037  
8e266654a2fe82 Lijuan Gao       2024-11-04  1038  		system_noc: interconnect@1620000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1039  			reg = <0x0 0x01620000 0x0 0x1f300>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1040  			compatible = "qcom,qcs615-system-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  1041  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1042  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1043  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1044  
8e266654a2fe82 Lijuan Gao       2024-11-04  1045  		aggre1_noc: interconnect@1700000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1046  			reg = <0x0 0x01700000 0x0 0x3f200>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1047  			compatible = "qcom,qcs615-aggre1-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  1048  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1049  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1050  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1051  
8e266654a2fe82 Lijuan Gao       2024-11-04  1052  		mmss_noc: interconnect@1740000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1053  			reg = <0x0 0x01740000 0x0 0x1c100>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1054  			compatible = "qcom,qcs615-mmss-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  1055  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1056  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1057  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1058  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1059  		ufs_mem_hc: ufshc@1d84000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1060  			compatible = "qcom,qcs615-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1061  			reg = <0x0 0x01d84000 0x0 0x3000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1062  			      <0x0 0x01d90000 0x0 0x8000>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1063  			reg-names = "std",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1064  				    "ice";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1065  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1066  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1067  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1068  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1069  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1070  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1071  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1072  				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1073  				 <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1074  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1075  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1076  			clock-names = "core_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1077  				      "bus_aggr_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1078  				      "iface_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1079  				      "core_clk_unipro",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1080  				      "core_clk_ice",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1081  				      "ref_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1082  				      "tx_lane0_sync_clk",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1083  				      "rx_lane0_sync_clk";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1084  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1085  			resets = <&gcc GCC_UFS_PHY_BCR>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1086  			reset-names = "rst";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1087  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1088  			operating-points-v2 = <&ufs_opp_table>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1089  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
a6a9d10e796957 Sayali Lokhande  2024-12-16  1090  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1091  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a6a9d10e796957 Sayali Lokhande  2024-12-16  1092  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1093  			interconnect-names = "ufs-ddr",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1094  					     "cpu-ufs";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1095  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1096  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1097  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1098  			iommus = <&apps_smmu 0x300 0x0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1099  			dma-coherent;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1100  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1101  			lanes-per-direction = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1102  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1103  			phys = <&ufs_mem_phy>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1104  			phy-names = "ufsphy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1105  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1106  			#reset-cells = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1107  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1108  			status = "disabled";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1109  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1110  			ufs_opp_table: opp-table {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1111  				compatible = "operating-points-v2";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1112  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1113  				opp-50000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1114  					opp-hz = /bits/ 64 <50000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1115  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1116  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1117  						 /bits/ 64 <37500000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1118  						 /bits/ 64 <75000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1119  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1120  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1121  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1122  					required-opps = <&rpmhpd_opp_low_svs>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1123  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1124  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1125  				opp-100000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1126  					opp-hz = /bits/ 64 <100000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1127  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1128  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1129  						 /bits/ 64 <75000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1130  						 /bits/ 64 <150000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1131  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1132  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1133  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1134  					required-opps = <&rpmhpd_opp_svs>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1135  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1136  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1137  				opp-200000000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1138  					opp-hz = /bits/ 64 <200000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1139  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1140  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1141  						 /bits/ 64 <150000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1142  						 /bits/ 64 <300000000>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1143  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1144  						 /bits/ 64 <0>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1145  						 /bits/ 64 <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1146  					required-opps = <&rpmhpd_opp_nom>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1147  				};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1148  			};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1149  		};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1150  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1151  		ufs_mem_phy: phy@1d87000 {
a6a9d10e796957 Sayali Lokhande  2024-12-16  1152  			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1153  			reg = <0x0 0x01d87000 0x0 0xe00>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1154  			clocks = <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1155  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
a6a9d10e796957 Sayali Lokhande  2024-12-16  1156  				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1157  			clock-names = "ref",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1158  				      "ref_aux",
a6a9d10e796957 Sayali Lokhande  2024-12-16  1159  				      "qref";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1160  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1161  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1162  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1163  			resets = <&ufs_mem_hc 0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1164  			reset-names = "ufsphy";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1165  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1166  			#clock-cells = <1>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1167  			#phy-cells = <0>;
a6a9d10e796957 Sayali Lokhande  2024-12-16  1168  
a6a9d10e796957 Sayali Lokhande  2024-12-16  1169  			status = "disabled";
a6a9d10e796957 Sayali Lokhande  2024-12-16  1170  		};
a6a9d10e796957 Sayali Lokhande  2024-12-16  1171  
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1172  		cryptobam: dma-controller@1dc4000 {
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1173  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1174  			reg = <0x0 0x01dc4000 0x0 0x24000>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1175  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1176  			#dma-cells = <1>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1177  			qcom,ee = <0>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1178  			qcom,controlled-remotely;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1179  			num-channels = <16>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1180  			qcom,num-ees = <4>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1181  			iommus = <&apps_smmu 0x0104 0x0011>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1182  		};
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1183  
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1184  		crypto: crypto@1dfa000 {
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1185  			compatible = "qcom,qcs615-qce", "qcom,sm8150-qce", "qcom,qce";
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1186  			reg = <0x0 0x01dfa000 0x0 0x6000>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1187  			dmas = <&cryptobam 4>, <&cryptobam 5>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1188  			dma-names = "rx", "tx";
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1189  			iommus = <&apps_smmu 0x0104 0x0011>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1190  			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1191  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1192  			interconnect-names = "memory";
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1193  		};
4153eb38970a9f Abhinaba Rakshit 2025-03-18  1194  
8e266654a2fe82 Lijuan Gao       2024-11-04  1195  		tcsr_mutex: hwlock@1f40000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1196  			compatible = "qcom,tcsr-mutex";
8e266654a2fe82 Lijuan Gao       2024-11-04  1197  			reg = <0x0 0x01f40000 0x0 0x20000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1198  			#hwlock-cells = <1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1199  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1200  
8e266654a2fe82 Lijuan Gao       2024-11-04  1201  		tcsr: syscon@1fc0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1202  			compatible = "qcom,qcs615-tcsr", "syscon";
8e266654a2fe82 Lijuan Gao       2024-11-04  1203  			reg = <0x0 0x01fc0000 0x0 0x30000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1204  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1205  
8e266654a2fe82 Lijuan Gao       2024-11-04  1206  		tlmm: pinctrl@3100000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  1207  			compatible = "qcom,qcs615-tlmm";
8e266654a2fe82 Lijuan Gao       2024-11-04  1208  			reg = <0x0 0x03100000 0x0 0x300000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  1209  			      <0x0 0x03500000 0x0 0x300000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  1210  			      <0x0 0x03d00000 0x0 0x300000>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1211  			reg-names = "east",
8e266654a2fe82 Lijuan Gao       2024-11-04  1212  				    "west",
8e266654a2fe82 Lijuan Gao       2024-11-04  1213  				    "south";
8e266654a2fe82 Lijuan Gao       2024-11-04  1214  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
80c82827327d80 Lijuan Gao       2024-12-19  1215  			gpio-ranges = <&tlmm 0 0 124>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1216  			gpio-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  1217  			#gpio-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1218  			interrupt-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  1219  			#interrupt-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1220  			wakeup-parent = <&pdc>;
8e266654a2fe82 Lijuan Gao       2024-11-04  1221  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1222  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1223  				pins = "gpio4", "gpio5";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1224  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1225  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1226  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1227  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1228  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1229  				pins = "gpio0", "gpio1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1230  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1231  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1232  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1233  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1234  				pins = "gpio18", "gpio19";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1235  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1236  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1237  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1238  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1239  				pins = "gpio20", "gpio21";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1240  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1241  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1242  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1243  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1244  				pins = "gpio14", "gpio15";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1245  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1246  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1247  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1248  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1249  				pins = "gpio6", "gpio7";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1250  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1251  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1252  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1253  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1254  				pins = "gpio10", "gpio11";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1255  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1256  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1257  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1258  			qup_spi2_data_clk: qup-spi2-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1259  				pins = "gpio0", "gpio1", "gpio2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1260  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1261  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1262  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1263  			qup_spi2_cs: qup-spi2-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1264  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1265  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1266  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1267  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1268  			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1269  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1270  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1271  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1272  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1273  			qup_spi4_data_clk: qup-spi4-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1274  				pins = "gpio20", "gpio21", "gpio22";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1275  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1276  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1277  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1278  			qup_spi4_cs: qup-spi4-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1279  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1280  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1281  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1282  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1283  			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1284  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1285  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1286  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1287  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1288  			qup_spi6_data_clk: qup-spi6-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1289  				pins = "gpio6", "gpio7", "gpio8";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1290  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1291  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1292  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1293  			qup_spi6_cs: qup-spi6-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1294  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1295  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1296  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1297  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1298  			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1299  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1300  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1301  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1302  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1303  			qup_spi7_data_clk: qup-spi7-data-clk-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1304  				pins = "gpio10", "gpio11", "gpio12";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1305  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1306  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1307  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1308  			qup_spi7_cs: qup-spi7-cs-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1309  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1310  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1311  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1312  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1313  			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1314  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1315  				function = "gpio";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1316  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1317  
8e266654a2fe82 Lijuan Gao       2024-11-04  1318  			qup_uart0_tx: qup-uart0-tx-state {
8e266654a2fe82 Lijuan Gao       2024-11-04  1319  				pins = "gpio16";
8e266654a2fe82 Lijuan Gao       2024-11-04  1320  				function = "qup0";
8e266654a2fe82 Lijuan Gao       2024-11-04  1321  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  1322  
8e266654a2fe82 Lijuan Gao       2024-11-04  1323  			qup_uart0_rx: qup-uart0-rx-state {
8e266654a2fe82 Lijuan Gao       2024-11-04  1324  				pins = "gpio17";
8e266654a2fe82 Lijuan Gao       2024-11-04  1325  				function = "qup0";
8e266654a2fe82 Lijuan Gao       2024-11-04  1326  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1327  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1328  			qup_uart2_cts: qup-uart2-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1329  				pins = "gpio0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1330  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1331  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1332  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1333  			qup_uart2_rts: qup-uart2-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1334  				pins = "gpio1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1335  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1336  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1337  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1338  			qup_uart2_tx: qup-uart2-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1339  				pins = "gpio2";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1340  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1341  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1342  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1343  			qup_uart2_rx: qup-uart2-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1344  				pins = "gpio3";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1345  				function = "qup0";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1346  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1347  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1348  			qup_uart4_cts: qup-uart4-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1349  				pins = "gpio20";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1350  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1351  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1352  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1353  			qup_uart4_rts: qup-uart4-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1354  				pins = "gpio21";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1355  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1356  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1357  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1358  			qup_uart4_tx: qup-uart4-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1359  				pins = "gpio22";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1360  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1361  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1362  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1363  			qup_uart4_rx: qup-uart4-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1364  				pins = "gpio23";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1365  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1366  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1367  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1368  			qup_uart6_cts: qup-uart6-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1369  				pins = "gpio6";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1370  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1371  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1372  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1373  			qup_uart6_rts: qup-uart6-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1374  				pins = "gpio7";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1375  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1376  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1377  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1378  			qup_uart6_tx: qup-uart6-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1379  				pins = "gpio8";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1380  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1381  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1382  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1383  			qup_uart6_rx: qup-uart6-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1384  				pins = "gpio9";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1385  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1386  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1387  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1388  			qup_uart7_cts: qup-uart7-cts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1389  				pins = "gpio10";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1390  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1391  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1392  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1393  			qup_uart7_rts: qup-uart7-rts-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1394  				pins = "gpio11";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1395  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1396  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1397  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1398  			qup_uart7_tx: qup-uart7-tx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1399  				pins = "gpio12";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1400  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1401  			};
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1402  
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1403  			qup_uart7_rx: qup-uart7-rx-state {
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1404  				pins = "gpio13";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1405  				function = "qup1";
f6746dc9e379ea Viken Dadhaniya  2024-11-15  1406  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1407  
8009de059f8693 Yuanjie Yang     2024-12-17  1408  			sdc1_state_on: sdc1-on-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1409  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1410  					pins = "sdc1_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1411  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1412  					drive-strength = <16>;
8009de059f8693 Yuanjie Yang     2024-12-17  1413  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1414  
8009de059f8693 Yuanjie Yang     2024-12-17  1415  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1416  					pins = "sdc1_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1417  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1418  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1419  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1420  
8009de059f8693 Yuanjie Yang     2024-12-17  1421  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1422  					pins = "sdc1_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1423  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1424  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1425  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1426  
8009de059f8693 Yuanjie Yang     2024-12-17  1427  				rclk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1428  					pins = "sdc1_rclk";
8009de059f8693 Yuanjie Yang     2024-12-17  1429  					bias-pull-down;
8009de059f8693 Yuanjie Yang     2024-12-17  1430  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1431  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1432  
8009de059f8693 Yuanjie Yang     2024-12-17  1433  			sdc1_state_off: sdc1-off-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1434  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1435  					pins = "sdc1_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1436  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1437  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1438  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1439  
8009de059f8693 Yuanjie Yang     2024-12-17  1440  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1441  					pins = "sdc1_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1442  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1443  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1444  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1445  
8009de059f8693 Yuanjie Yang     2024-12-17  1446  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1447  					pins = "sdc1_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1448  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1449  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1450  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1451  
8009de059f8693 Yuanjie Yang     2024-12-17  1452  				rclk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1453  					pins = "sdc1_rclk";
8009de059f8693 Yuanjie Yang     2024-12-17  1454  					bias-pull-down;
8009de059f8693 Yuanjie Yang     2024-12-17  1455  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1456  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1457  
8009de059f8693 Yuanjie Yang     2024-12-17  1458  			sdc2_state_on: sdc2-on-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1459  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1460  					pins = "sdc2_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1461  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1462  					drive-strength = <16>;
8009de059f8693 Yuanjie Yang     2024-12-17  1463  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1464  
8009de059f8693 Yuanjie Yang     2024-12-17  1465  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1466  					pins = "sdc2_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1467  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1468  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1469  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1470  
8009de059f8693 Yuanjie Yang     2024-12-17  1471  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1472  					pins = "sdc2_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1473  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1474  					drive-strength = <10>;
8009de059f8693 Yuanjie Yang     2024-12-17  1475  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1476  			};
8009de059f8693 Yuanjie Yang     2024-12-17  1477  
8009de059f8693 Yuanjie Yang     2024-12-17  1478  			sdc2_state_off: sdc2-off-state {
8009de059f8693 Yuanjie Yang     2024-12-17  1479  				clk-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1480  					pins = "sdc2_clk";
8009de059f8693 Yuanjie Yang     2024-12-17  1481  					bias-disable;
8009de059f8693 Yuanjie Yang     2024-12-17  1482  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1483  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1484  
8009de059f8693 Yuanjie Yang     2024-12-17  1485  				cmd-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1486  					pins = "sdc2_cmd";
8009de059f8693 Yuanjie Yang     2024-12-17  1487  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1488  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1489  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1490  
8009de059f8693 Yuanjie Yang     2024-12-17  1491  				data-pins {
8009de059f8693 Yuanjie Yang     2024-12-17  1492  					pins = "sdc2_data";
8009de059f8693 Yuanjie Yang     2024-12-17  1493  					bias-pull-up;
8009de059f8693 Yuanjie Yang     2024-12-17  1494  					drive-strength = <2>;
8009de059f8693 Yuanjie Yang     2024-12-17  1495  				};
8009de059f8693 Yuanjie Yang     2024-12-17  1496  			};
8e266654a2fe82 Lijuan Gao       2024-11-04  1497  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  1498  
bf469630552a39 Jie Gan          2024-11-06  1499  		stm@6002000 {
bf469630552a39 Jie Gan          2024-11-06  1500  			compatible = "arm,coresight-stm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1501  			reg = <0x0 0x06002000 0x0 0x1000>,
bf469630552a39 Jie Gan          2024-11-06  1502  			      <0x0 0x16280000 0x0 0x180000>;
bf469630552a39 Jie Gan          2024-11-06  1503  			reg-names = "stm-base",
bf469630552a39 Jie Gan          2024-11-06  1504  				    "stm-stimulus-base";
bf469630552a39 Jie Gan          2024-11-06  1505  
bf469630552a39 Jie Gan          2024-11-06  1506  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1507  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1508  
bf469630552a39 Jie Gan          2024-11-06  1509  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1510  				port {
bf469630552a39 Jie Gan          2024-11-06  1511  					stm_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1512  						remote-endpoint = <&funnel_in0_in7>;
bf469630552a39 Jie Gan          2024-11-06  1513  					};
bf469630552a39 Jie Gan          2024-11-06  1514  				};
bf469630552a39 Jie Gan          2024-11-06  1515  			};
bf469630552a39 Jie Gan          2024-11-06  1516  		};
bf469630552a39 Jie Gan          2024-11-06  1517  
bf469630552a39 Jie Gan          2024-11-06  1518  		tpda@6004000 {
bf469630552a39 Jie Gan          2024-11-06  1519  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1520  			reg = <0x0 0x06004000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1521  
bf469630552a39 Jie Gan          2024-11-06  1522  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1523  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1524  
bf469630552a39 Jie Gan          2024-11-06  1525  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1526  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1527  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1528  
bf469630552a39 Jie Gan          2024-11-06  1529  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  1530  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  1531  
bf469630552a39 Jie Gan          2024-11-06  1532  					tpda_qdss_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1533  						remote-endpoint = <&tpdm_center_out>;
bf469630552a39 Jie Gan          2024-11-06  1534  					};
bf469630552a39 Jie Gan          2024-11-06  1535  				};
bf469630552a39 Jie Gan          2024-11-06  1536  
bf469630552a39 Jie Gan          2024-11-06  1537  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  1538  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  1539  
bf469630552a39 Jie Gan          2024-11-06  1540  					tpda_qdss_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1541  						remote-endpoint = <&funnel_monaq_out>;
bf469630552a39 Jie Gan          2024-11-06  1542  					};
bf469630552a39 Jie Gan          2024-11-06  1543  				};
bf469630552a39 Jie Gan          2024-11-06  1544  
bf469630552a39 Jie Gan          2024-11-06  1545  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  1546  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  1547  
bf469630552a39 Jie Gan          2024-11-06  1548  					tpda_qdss_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1549  						remote-endpoint = <&funnel_ddr_0_out>;
bf469630552a39 Jie Gan          2024-11-06  1550  					};
bf469630552a39 Jie Gan          2024-11-06  1551  				};
bf469630552a39 Jie Gan          2024-11-06  1552  
bf469630552a39 Jie Gan          2024-11-06  1553  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  1554  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  1555  
bf469630552a39 Jie Gan          2024-11-06  1556  					tpda_qdss_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1557  						remote-endpoint = <&funnel_turing_out>;
bf469630552a39 Jie Gan          2024-11-06  1558  					};
bf469630552a39 Jie Gan          2024-11-06  1559  				};
bf469630552a39 Jie Gan          2024-11-06  1560  
bf469630552a39 Jie Gan          2024-11-06  1561  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1562  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1563  
bf469630552a39 Jie Gan          2024-11-06  1564  					tpda_qdss_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1565  						remote-endpoint = <&tpdm_vsense_out>;
bf469630552a39 Jie Gan          2024-11-06  1566  					};
bf469630552a39 Jie Gan          2024-11-06  1567  				};
bf469630552a39 Jie Gan          2024-11-06  1568  
bf469630552a39 Jie Gan          2024-11-06  1569  				port@8 {
bf469630552a39 Jie Gan          2024-11-06  1570  					reg = <8>;
bf469630552a39 Jie Gan          2024-11-06  1571  
bf469630552a39 Jie Gan          2024-11-06  1572  					tpda_qdss_in8: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1573  						remote-endpoint = <&tpdm_dcc_out>;
bf469630552a39 Jie Gan          2024-11-06  1574  					};
bf469630552a39 Jie Gan          2024-11-06  1575  				};
bf469630552a39 Jie Gan          2024-11-06  1576  
bf469630552a39 Jie Gan          2024-11-06  1577  				port@9 {
bf469630552a39 Jie Gan          2024-11-06  1578  					reg = <9>;
bf469630552a39 Jie Gan          2024-11-06  1579  
bf469630552a39 Jie Gan          2024-11-06  1580  					tpda_qdss_in9: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1581  						remote-endpoint = <&tpdm_prng_out>;
bf469630552a39 Jie Gan          2024-11-06  1582  					};
bf469630552a39 Jie Gan          2024-11-06  1583  				};
bf469630552a39 Jie Gan          2024-11-06  1584  
bf469630552a39 Jie Gan          2024-11-06  1585  				port@b {
bf469630552a39 Jie Gan          2024-11-06  1586  					reg = <11>;
bf469630552a39 Jie Gan          2024-11-06  1587  
bf469630552a39 Jie Gan          2024-11-06  1588  					tpda_qdss_in11: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1589  						remote-endpoint = <&tpdm_qm_out>;
bf469630552a39 Jie Gan          2024-11-06  1590  					};
bf469630552a39 Jie Gan          2024-11-06  1591  				};
bf469630552a39 Jie Gan          2024-11-06  1592  
bf469630552a39 Jie Gan          2024-11-06  1593  				port@c {
bf469630552a39 Jie Gan          2024-11-06  1594  					reg = <12>;
bf469630552a39 Jie Gan          2024-11-06  1595  
bf469630552a39 Jie Gan          2024-11-06  1596  					tpda_qdss_in12: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1597  						remote-endpoint = <&tpdm_west_out>;
bf469630552a39 Jie Gan          2024-11-06  1598  					};
bf469630552a39 Jie Gan          2024-11-06  1599  				};
bf469630552a39 Jie Gan          2024-11-06  1600  
bf469630552a39 Jie Gan          2024-11-06  1601  				port@d {
bf469630552a39 Jie Gan          2024-11-06  1602  					reg = <13>;
bf469630552a39 Jie Gan          2024-11-06  1603  
bf469630552a39 Jie Gan          2024-11-06  1604  					tpda_qdss_in13: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1605  						remote-endpoint = <&tpdm_pimem_out>;
bf469630552a39 Jie Gan          2024-11-06  1606  					};
bf469630552a39 Jie Gan          2024-11-06  1607  				};
bf469630552a39 Jie Gan          2024-11-06  1608  			};
bf469630552a39 Jie Gan          2024-11-06  1609  
bf469630552a39 Jie Gan          2024-11-06  1610  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1611  				port {
bf469630552a39 Jie Gan          2024-11-06  1612  					tpda_qdss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1613  						remote-endpoint = <&funnel_qatb_in>;
bf469630552a39 Jie Gan          2024-11-06  1614  					};
bf469630552a39 Jie Gan          2024-11-06  1615  				};
bf469630552a39 Jie Gan          2024-11-06  1616  			};
bf469630552a39 Jie Gan          2024-11-06  1617  		};
bf469630552a39 Jie Gan          2024-11-06  1618  
bf469630552a39 Jie Gan          2024-11-06  1619  		funnel@6005000 {
bf469630552a39 Jie Gan          2024-11-06  1620  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1621  			reg = <0x0 0x06005000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1622  
bf469630552a39 Jie Gan          2024-11-06  1623  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1624  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1625  
bf469630552a39 Jie Gan          2024-11-06  1626  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1627  				port {
bf469630552a39 Jie Gan          2024-11-06  1628  					funnel_qatb_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1629  						remote-endpoint = <&tpda_qdss_out>;
bf469630552a39 Jie Gan          2024-11-06  1630  					};
bf469630552a39 Jie Gan          2024-11-06  1631  				};
bf469630552a39 Jie Gan          2024-11-06  1632  			};
bf469630552a39 Jie Gan          2024-11-06  1633  
bf469630552a39 Jie Gan          2024-11-06  1634  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1635  				port {
bf469630552a39 Jie Gan          2024-11-06  1636  					funnel_qatb_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1637  						remote-endpoint = <&funnel_in0_in6>;
bf469630552a39 Jie Gan          2024-11-06  1638  					};
bf469630552a39 Jie Gan          2024-11-06  1639  				};
bf469630552a39 Jie Gan          2024-11-06  1640  			};
bf469630552a39 Jie Gan          2024-11-06  1641  		};
bf469630552a39 Jie Gan          2024-11-06  1642  
bf469630552a39 Jie Gan          2024-11-06  1643  		cti@6010000 {
bf469630552a39 Jie Gan          2024-11-06  1644  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1645  			reg = <0x0 0x06010000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1646  
bf469630552a39 Jie Gan          2024-11-06  1647  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1648  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1649  		};
bf469630552a39 Jie Gan          2024-11-06  1650  
bf469630552a39 Jie Gan          2024-11-06  1651  		cti@6011000 {
bf469630552a39 Jie Gan          2024-11-06  1652  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1653  			reg = <0x0 0x06011000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1654  
bf469630552a39 Jie Gan          2024-11-06  1655  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1656  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1657  		};
bf469630552a39 Jie Gan          2024-11-06  1658  
bf469630552a39 Jie Gan          2024-11-06  1659  		cti@6012000 {
bf469630552a39 Jie Gan          2024-11-06  1660  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1661  			reg = <0x0 0x06012000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1662  
bf469630552a39 Jie Gan          2024-11-06  1663  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1664  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1665  		};
bf469630552a39 Jie Gan          2024-11-06  1666  
bf469630552a39 Jie Gan          2024-11-06  1667  		cti@6013000 {
bf469630552a39 Jie Gan          2024-11-06  1668  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1669  			reg = <0x0 0x06013000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1670  
bf469630552a39 Jie Gan          2024-11-06  1671  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1672  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1673  		};
bf469630552a39 Jie Gan          2024-11-06  1674  
bf469630552a39 Jie Gan          2024-11-06  1675  		cti@6014000 {
bf469630552a39 Jie Gan          2024-11-06  1676  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1677  			reg = <0x0 0x06014000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1678  
bf469630552a39 Jie Gan          2024-11-06  1679  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1680  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1681  		};
bf469630552a39 Jie Gan          2024-11-06  1682  
bf469630552a39 Jie Gan          2024-11-06  1683  		cti@6015000 {
bf469630552a39 Jie Gan          2024-11-06  1684  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1685  			reg = <0x0 0x06015000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1686  
bf469630552a39 Jie Gan          2024-11-06  1687  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1688  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1689  		};
bf469630552a39 Jie Gan          2024-11-06  1690  
bf469630552a39 Jie Gan          2024-11-06  1691  		cti@6016000 {
bf469630552a39 Jie Gan          2024-11-06  1692  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1693  			reg = <0x0 0x06016000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1694  
bf469630552a39 Jie Gan          2024-11-06  1695  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1696  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1697  		};
bf469630552a39 Jie Gan          2024-11-06  1698  
bf469630552a39 Jie Gan          2024-11-06  1699  		cti@6017000 {
bf469630552a39 Jie Gan          2024-11-06  1700  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1701  			reg = <0x0 0x06017000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1702  
bf469630552a39 Jie Gan          2024-11-06  1703  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1704  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1705  		};
bf469630552a39 Jie Gan          2024-11-06  1706  
bf469630552a39 Jie Gan          2024-11-06  1707  		cti@6018000 {
bf469630552a39 Jie Gan          2024-11-06  1708  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1709  			reg = <0x0 0x06018000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1710  
bf469630552a39 Jie Gan          2024-11-06  1711  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1712  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1713  		};
bf469630552a39 Jie Gan          2024-11-06  1714  
bf469630552a39 Jie Gan          2024-11-06  1715  		cti@6019000 {
bf469630552a39 Jie Gan          2024-11-06  1716  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1717  			reg = <0x0 0x06019000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1718  
bf469630552a39 Jie Gan          2024-11-06  1719  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1720  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1721  		};
bf469630552a39 Jie Gan          2024-11-06  1722  
bf469630552a39 Jie Gan          2024-11-06  1723  		cti@601a000 {
bf469630552a39 Jie Gan          2024-11-06  1724  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1725  			reg = <0x0 0x0601a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1726  
bf469630552a39 Jie Gan          2024-11-06  1727  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1728  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1729  		};
bf469630552a39 Jie Gan          2024-11-06  1730  
bf469630552a39 Jie Gan          2024-11-06  1731  		cti@601b000 {
bf469630552a39 Jie Gan          2024-11-06  1732  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1733  			reg = <0x0 0x0601b000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1734  
bf469630552a39 Jie Gan          2024-11-06  1735  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1736  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1737  		};
bf469630552a39 Jie Gan          2024-11-06  1738  
bf469630552a39 Jie Gan          2024-11-06  1739  		cti@601c000 {
bf469630552a39 Jie Gan          2024-11-06  1740  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1741  			reg = <0x0 0x0601c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1742  
bf469630552a39 Jie Gan          2024-11-06  1743  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1744  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1745  		};
bf469630552a39 Jie Gan          2024-11-06  1746  
bf469630552a39 Jie Gan          2024-11-06  1747  		cti@601d000 {
bf469630552a39 Jie Gan          2024-11-06  1748  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1749  			reg = <0x0 0x0601d000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1750  
bf469630552a39 Jie Gan          2024-11-06  1751  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1752  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1753  		};
bf469630552a39 Jie Gan          2024-11-06  1754  
bf469630552a39 Jie Gan          2024-11-06  1755  		cti@601e000 {
bf469630552a39 Jie Gan          2024-11-06  1756  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1757  			reg = <0x0 0x0601e000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1758  
bf469630552a39 Jie Gan          2024-11-06  1759  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1760  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1761  		};
bf469630552a39 Jie Gan          2024-11-06  1762  
bf469630552a39 Jie Gan          2024-11-06  1763  		cti@601f000 {
bf469630552a39 Jie Gan          2024-11-06  1764  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1765  			reg = <0x0 0x0601f000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1766  
bf469630552a39 Jie Gan          2024-11-06  1767  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1768  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1769  		};
bf469630552a39 Jie Gan          2024-11-06  1770  
bf469630552a39 Jie Gan          2024-11-06  1771  		funnel@6041000 {
bf469630552a39 Jie Gan          2024-11-06  1772  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1773  			reg = <0x0 0x06041000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1774  
bf469630552a39 Jie Gan          2024-11-06  1775  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1776  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1777  
bf469630552a39 Jie Gan          2024-11-06  1778  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1779  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1780  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1781  
bf469630552a39 Jie Gan          2024-11-06  1782  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  1783  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  1784  
bf469630552a39 Jie Gan          2024-11-06  1785  					funnel_in0_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1786  						remote-endpoint = <&funnel_qatb_out>;
bf469630552a39 Jie Gan          2024-11-06  1787  					};
bf469630552a39 Jie Gan          2024-11-06  1788  				};
bf469630552a39 Jie Gan          2024-11-06  1789  
bf469630552a39 Jie Gan          2024-11-06  1790  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1791  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1792  
bf469630552a39 Jie Gan          2024-11-06  1793  					funnel_in0_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1794  						remote-endpoint = <&stm_out>;
bf469630552a39 Jie Gan          2024-11-06  1795  					};
bf469630552a39 Jie Gan          2024-11-06  1796  				};
bf469630552a39 Jie Gan          2024-11-06  1797  			};
bf469630552a39 Jie Gan          2024-11-06  1798  
bf469630552a39 Jie Gan          2024-11-06  1799  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1800  				port {
bf469630552a39 Jie Gan          2024-11-06  1801  					funnel_in0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1802  						remote-endpoint = <&funnel_merg_in0>;
bf469630552a39 Jie Gan          2024-11-06  1803  					};
bf469630552a39 Jie Gan          2024-11-06  1804  				};
bf469630552a39 Jie Gan          2024-11-06  1805  			};
bf469630552a39 Jie Gan          2024-11-06  1806  		};
bf469630552a39 Jie Gan          2024-11-06  1807  
bf469630552a39 Jie Gan          2024-11-06  1808  		funnel@6042000 {
bf469630552a39 Jie Gan          2024-11-06  1809  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1810  			reg = <0x0 0x06042000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1811  
bf469630552a39 Jie Gan          2024-11-06  1812  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1813  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1814  
bf469630552a39 Jie Gan          2024-11-06  1815  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1816  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1817  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1818  
bf469630552a39 Jie Gan          2024-11-06  1819  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  1820  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  1821  
bf469630552a39 Jie Gan          2024-11-06  1822  					funnel_in1_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1823  						remote-endpoint = <&replicator_swao_out0>;
bf469630552a39 Jie Gan          2024-11-06  1824  					};
bf469630552a39 Jie Gan          2024-11-06  1825  				};
bf469630552a39 Jie Gan          2024-11-06  1826  
bf469630552a39 Jie Gan          2024-11-06  1827  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  1828  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  1829  
bf469630552a39 Jie Gan          2024-11-06  1830  					funnel_in1_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1831  						remote-endpoint = <&tpdm_wcss_out>;
bf469630552a39 Jie Gan          2024-11-06  1832  					};
bf469630552a39 Jie Gan          2024-11-06  1833  				};
bf469630552a39 Jie Gan          2024-11-06  1834  
bf469630552a39 Jie Gan          2024-11-06  1835  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  1836  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  1837  
bf469630552a39 Jie Gan          2024-11-06  1838  					funnel_in1_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1839  						remote-endpoint = <&funnel_apss_merg_out>;
bf469630552a39 Jie Gan          2024-11-06  1840  					};
bf469630552a39 Jie Gan          2024-11-06  1841  				};
bf469630552a39 Jie Gan          2024-11-06  1842  			};
bf469630552a39 Jie Gan          2024-11-06  1843  
bf469630552a39 Jie Gan          2024-11-06  1844  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1845  				port {
bf469630552a39 Jie Gan          2024-11-06  1846  					funnel_in1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1847  						remote-endpoint = <&funnel_merg_in1>;
bf469630552a39 Jie Gan          2024-11-06  1848  					};
bf469630552a39 Jie Gan          2024-11-06  1849  				};
bf469630552a39 Jie Gan          2024-11-06  1850  			};
bf469630552a39 Jie Gan          2024-11-06  1851  		};
bf469630552a39 Jie Gan          2024-11-06  1852  
bf469630552a39 Jie Gan          2024-11-06  1853  		funnel@6045000 {
bf469630552a39 Jie Gan          2024-11-06  1854  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1855  			reg = <0x0 0x06045000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1856  
bf469630552a39 Jie Gan          2024-11-06  1857  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1858  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1859  
bf469630552a39 Jie Gan          2024-11-06  1860  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1861  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1862  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1863  
bf469630552a39 Jie Gan          2024-11-06  1864  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  1865  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  1866  
bf469630552a39 Jie Gan          2024-11-06  1867  					funnel_merg_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1868  						remote-endpoint = <&funnel_in0_out>;
bf469630552a39 Jie Gan          2024-11-06  1869  					};
bf469630552a39 Jie Gan          2024-11-06  1870  				};
bf469630552a39 Jie Gan          2024-11-06  1871  
bf469630552a39 Jie Gan          2024-11-06  1872  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  1873  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  1874  
bf469630552a39 Jie Gan          2024-11-06  1875  					funnel_merg_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1876  						remote-endpoint = <&funnel_in1_out>;
bf469630552a39 Jie Gan          2024-11-06  1877  					};
bf469630552a39 Jie Gan          2024-11-06  1878  				};
bf469630552a39 Jie Gan          2024-11-06  1879  			};
bf469630552a39 Jie Gan          2024-11-06  1880  
bf469630552a39 Jie Gan          2024-11-06  1881  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1882  				port {
bf469630552a39 Jie Gan          2024-11-06  1883  					funnel_merg_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1884  						remote-endpoint = <&tmc_etf_in>;
bf469630552a39 Jie Gan          2024-11-06  1885  					};
bf469630552a39 Jie Gan          2024-11-06  1886  				};
bf469630552a39 Jie Gan          2024-11-06  1887  			};
bf469630552a39 Jie Gan          2024-11-06  1888  		};
bf469630552a39 Jie Gan          2024-11-06  1889  
bf469630552a39 Jie Gan          2024-11-06  1890  		replicator@6046000 {
bf469630552a39 Jie Gan          2024-11-06  1891  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1892  			reg = <0x0 0x06046000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1893  
bf469630552a39 Jie Gan          2024-11-06  1894  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1895  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1896  
bf469630552a39 Jie Gan          2024-11-06  1897  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1898  				port {
bf469630552a39 Jie Gan          2024-11-06  1899  					replicator0_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1900  						remote-endpoint = <&tmc_etf_out>;
bf469630552a39 Jie Gan          2024-11-06  1901  					};
bf469630552a39 Jie Gan          2024-11-06  1902  				};
bf469630552a39 Jie Gan          2024-11-06  1903  			};
bf469630552a39 Jie Gan          2024-11-06  1904  
bf469630552a39 Jie Gan          2024-11-06  1905  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1906  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  1907  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  1908  
bf469630552a39 Jie Gan          2024-11-06  1909  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  1910  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  1911  
bf469630552a39 Jie Gan          2024-11-06  1912  					replicator0_out1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1913  						remote-endpoint = <&replicator1_in>;
bf469630552a39 Jie Gan          2024-11-06  1914  					};
bf469630552a39 Jie Gan          2024-11-06  1915  				};
bf469630552a39 Jie Gan          2024-11-06  1916  			};
bf469630552a39 Jie Gan          2024-11-06  1917  		};
bf469630552a39 Jie Gan          2024-11-06  1918  
bf469630552a39 Jie Gan          2024-11-06  1919  		tmc@6047000 {
bf469630552a39 Jie Gan          2024-11-06  1920  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1921  			reg = <0x0 0x06047000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1922  
bf469630552a39 Jie Gan          2024-11-06  1923  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1924  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1925  
bf469630552a39 Jie Gan          2024-11-06  1926  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1927  				port {
bf469630552a39 Jie Gan          2024-11-06  1928  					tmc_etf_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1929  						remote-endpoint = <&funnel_merg_out>;
bf469630552a39 Jie Gan          2024-11-06  1930  					};
bf469630552a39 Jie Gan          2024-11-06  1931  				};
bf469630552a39 Jie Gan          2024-11-06  1932  			};
bf469630552a39 Jie Gan          2024-11-06  1933  
bf469630552a39 Jie Gan          2024-11-06  1934  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1935  				port {
bf469630552a39 Jie Gan          2024-11-06  1936  					tmc_etf_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1937  						remote-endpoint = <&replicator0_in>;
bf469630552a39 Jie Gan          2024-11-06  1938  					};
bf469630552a39 Jie Gan          2024-11-06  1939  				};
bf469630552a39 Jie Gan          2024-11-06  1940  			};
bf469630552a39 Jie Gan          2024-11-06  1941  		};
bf469630552a39 Jie Gan          2024-11-06  1942  
bf469630552a39 Jie Gan          2024-11-06  1943  		replicator@604a000 {
bf469630552a39 Jie Gan          2024-11-06  1944  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1945  			reg = <0x0 0x0604a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1946  
bf469630552a39 Jie Gan          2024-11-06  1947  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1948  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1949  
bf469630552a39 Jie Gan          2024-11-06  1950  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  1951  				port {
bf469630552a39 Jie Gan          2024-11-06  1952  					replicator1_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1953  						remote-endpoint = <&replicator0_out1>;
bf469630552a39 Jie Gan          2024-11-06  1954  					};
bf469630552a39 Jie Gan          2024-11-06  1955  				};
bf469630552a39 Jie Gan          2024-11-06  1956  			};
bf469630552a39 Jie Gan          2024-11-06  1957  
bf469630552a39 Jie Gan          2024-11-06  1958  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1959  				port {
bf469630552a39 Jie Gan          2024-11-06  1960  					replicator1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1961  						remote-endpoint = <&funnel_swao_in6>;
bf469630552a39 Jie Gan          2024-11-06  1962  					};
bf469630552a39 Jie Gan          2024-11-06  1963  				};
bf469630552a39 Jie Gan          2024-11-06  1964  			};
bf469630552a39 Jie Gan          2024-11-06  1965  		};
bf469630552a39 Jie Gan          2024-11-06  1966  
bf469630552a39 Jie Gan          2024-11-06  1967  		cti@683b000 {
bf469630552a39 Jie Gan          2024-11-06  1968  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1969  			reg = <0x0 0x0683b000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1970  
bf469630552a39 Jie Gan          2024-11-06  1971  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1972  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1973  		};
bf469630552a39 Jie Gan          2024-11-06  1974  
bf469630552a39 Jie Gan          2024-11-06  1975  		tpdm@6840000 {
bf469630552a39 Jie Gan          2024-11-06  1976  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1977  			reg = <0x0 0x06840000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1978  
bf469630552a39 Jie Gan          2024-11-06  1979  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  1980  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  1981  
bf469630552a39 Jie Gan          2024-11-06  1982  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  1983  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  1984  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  1985  
bf469630552a39 Jie Gan          2024-11-06  1986  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  1987  				port {
bf469630552a39 Jie Gan          2024-11-06  1988  					tpdm_vsense_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  1989  						remote-endpoint = <&tpda_qdss_in7>;
bf469630552a39 Jie Gan          2024-11-06  1990  					};
bf469630552a39 Jie Gan          2024-11-06  1991  				};
bf469630552a39 Jie Gan          2024-11-06  1992  			};
bf469630552a39 Jie Gan          2024-11-06  1993  		};
bf469630552a39 Jie Gan          2024-11-06  1994  
bf469630552a39 Jie Gan          2024-11-06  1995  		tpdm@684c000 {
bf469630552a39 Jie Gan          2024-11-06  1996  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  1997  			reg = <0x0 0x0684c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  1998  
bf469630552a39 Jie Gan          2024-11-06  1999  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2000  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2001  
bf469630552a39 Jie Gan          2024-11-06  2002  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2003  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2004  
bf469630552a39 Jie Gan          2024-11-06  2005  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2006  				port {
bf469630552a39 Jie Gan          2024-11-06  2007  					tpdm_prng_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2008  						remote-endpoint = <&tpda_qdss_in9>;
bf469630552a39 Jie Gan          2024-11-06  2009  					};
bf469630552a39 Jie Gan          2024-11-06  2010  				};
bf469630552a39 Jie Gan          2024-11-06  2011  			};
bf469630552a39 Jie Gan          2024-11-06  2012  		};
bf469630552a39 Jie Gan          2024-11-06  2013  
bf469630552a39 Jie Gan          2024-11-06  2014  		tpdm@6850000 {
bf469630552a39 Jie Gan          2024-11-06  2015  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2016  			reg = <0x0 0x06850000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2017  
bf469630552a39 Jie Gan          2024-11-06  2018  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2019  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2020  
bf469630552a39 Jie Gan          2024-11-06  2021  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  2022  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2023  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2024  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2025  
bf469630552a39 Jie Gan          2024-11-06  2026  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2027  				port {
bf469630552a39 Jie Gan          2024-11-06  2028  					tpdm_pimem_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2029  						remote-endpoint = <&tpda_qdss_in13>;
bf469630552a39 Jie Gan          2024-11-06  2030  					};
bf469630552a39 Jie Gan          2024-11-06  2031  				};
bf469630552a39 Jie Gan          2024-11-06  2032  			};
bf469630552a39 Jie Gan          2024-11-06  2033  		};
bf469630552a39 Jie Gan          2024-11-06  2034  
bf469630552a39 Jie Gan          2024-11-06  2035  		tpdm@6860000 {
bf469630552a39 Jie Gan          2024-11-06  2036  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2037  			reg = <0x0 0x06860000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2038  
bf469630552a39 Jie Gan          2024-11-06  2039  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2040  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2041  
bf469630552a39 Jie Gan          2024-11-06  2042  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2043  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2044  
bf469630552a39 Jie Gan          2024-11-06  2045  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2046  				port {
bf469630552a39 Jie Gan          2024-11-06  2047  					tpdm_turing_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2048  						remote-endpoint = <&funnel_turing_in>;
bf469630552a39 Jie Gan          2024-11-06  2049  					};
bf469630552a39 Jie Gan          2024-11-06  2050  				};
bf469630552a39 Jie Gan          2024-11-06  2051  			};
bf469630552a39 Jie Gan          2024-11-06  2052  		};
bf469630552a39 Jie Gan          2024-11-06  2053  
bf469630552a39 Jie Gan          2024-11-06  2054  		funnel@6861000 {
bf469630552a39 Jie Gan          2024-11-06  2055  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2056  			reg = <0x0 0x06861000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2057  
bf469630552a39 Jie Gan          2024-11-06  2058  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2059  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2060  
bf469630552a39 Jie Gan          2024-11-06  2061  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2062  				port {
bf469630552a39 Jie Gan          2024-11-06  2063  					funnel_turing_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2064  						remote-endpoint = <&tpdm_turing_out>;
bf469630552a39 Jie Gan          2024-11-06  2065  					};
bf469630552a39 Jie Gan          2024-11-06  2066  				};
bf469630552a39 Jie Gan          2024-11-06  2067  			};
bf469630552a39 Jie Gan          2024-11-06  2068  
bf469630552a39 Jie Gan          2024-11-06  2069  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2070  				port {
bf469630552a39 Jie Gan          2024-11-06  2071  					funnel_turing_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2072  						remote-endpoint = <&tpda_qdss_in6>;
bf469630552a39 Jie Gan          2024-11-06  2073  					};
bf469630552a39 Jie Gan          2024-11-06  2074  				};
bf469630552a39 Jie Gan          2024-11-06  2075  			};
bf469630552a39 Jie Gan          2024-11-06  2076  		};
bf469630552a39 Jie Gan          2024-11-06  2077  
bf469630552a39 Jie Gan          2024-11-06  2078  		cti@6867000 {
bf469630552a39 Jie Gan          2024-11-06  2079  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2080  			reg = <0x0 0x06867000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2081  
bf469630552a39 Jie Gan          2024-11-06  2082  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2083  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2084  		};
bf469630552a39 Jie Gan          2024-11-06  2085  
bf469630552a39 Jie Gan          2024-11-06  2086  		tpdm@6870000 {
bf469630552a39 Jie Gan          2024-11-06  2087  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2088  			reg = <0x0 0x06870000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2089  
bf469630552a39 Jie Gan          2024-11-06  2090  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2091  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2092  
bf469630552a39 Jie Gan          2024-11-06  2093  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2094  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2095  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2096  
bf469630552a39 Jie Gan          2024-11-06  2097  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2098  				port {
bf469630552a39 Jie Gan          2024-11-06  2099  					tpdm_dcc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2100  						remote-endpoint = <&tpda_qdss_in8>;
bf469630552a39 Jie Gan          2024-11-06  2101  					};
bf469630552a39 Jie Gan          2024-11-06  2102  				};
bf469630552a39 Jie Gan          2024-11-06  2103  			};
bf469630552a39 Jie Gan          2024-11-06  2104  		};
bf469630552a39 Jie Gan          2024-11-06  2105  
bf469630552a39 Jie Gan          2024-11-06  2106  		tpdm@699c000 {
bf469630552a39 Jie Gan          2024-11-06  2107  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2108  			reg = <0x0 0x0699c000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2109  
bf469630552a39 Jie Gan          2024-11-06  2110  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2111  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2112  
bf469630552a39 Jie Gan          2024-11-06  2113  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2114  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2115  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2116  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2117  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2118  
bf469630552a39 Jie Gan          2024-11-06  2119  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2120  				port {
bf469630552a39 Jie Gan          2024-11-06  2121  					tpdm_wcss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2122  						remote-endpoint = <&funnel_in1_in4>;
bf469630552a39 Jie Gan          2024-11-06  2123  					};
bf469630552a39 Jie Gan          2024-11-06  2124  				};
bf469630552a39 Jie Gan          2024-11-06  2125  			};
bf469630552a39 Jie Gan          2024-11-06  2126  		};
bf469630552a39 Jie Gan          2024-11-06  2127  
bf469630552a39 Jie Gan          2024-11-06  2128  		tpdm@69c0000 {
bf469630552a39 Jie Gan          2024-11-06  2129  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2130  			reg = <0x0 0x069c0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2131  
bf469630552a39 Jie Gan          2024-11-06  2132  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2133  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2134  
bf469630552a39 Jie Gan          2024-11-06  2135  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2136  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2137  
bf469630552a39 Jie Gan          2024-11-06  2138  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2139  				port {
bf469630552a39 Jie Gan          2024-11-06  2140  					tpdm_monaq_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2141  						remote-endpoint = <&funnel_monaq_in>;
bf469630552a39 Jie Gan          2024-11-06  2142  					};
bf469630552a39 Jie Gan          2024-11-06  2143  				};
bf469630552a39 Jie Gan          2024-11-06  2144  			};
bf469630552a39 Jie Gan          2024-11-06  2145  		};
bf469630552a39 Jie Gan          2024-11-06  2146  
bf469630552a39 Jie Gan          2024-11-06  2147  		funnel@69c3000 {
bf469630552a39 Jie Gan          2024-11-06  2148  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2149  			reg = <0x0 0x069c3000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2150  
bf469630552a39 Jie Gan          2024-11-06  2151  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2152  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2153  
bf469630552a39 Jie Gan          2024-11-06  2154  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2155  				port {
bf469630552a39 Jie Gan          2024-11-06  2156  					funnel_monaq_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2157  						remote-endpoint = <&tpdm_monaq_out>;
bf469630552a39 Jie Gan          2024-11-06  2158  					};
bf469630552a39 Jie Gan          2024-11-06  2159  				};
bf469630552a39 Jie Gan          2024-11-06  2160  			};
bf469630552a39 Jie Gan          2024-11-06  2161  
bf469630552a39 Jie Gan          2024-11-06  2162  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2163  				port {
bf469630552a39 Jie Gan          2024-11-06  2164  					funnel_monaq_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2165  						remote-endpoint = <&tpda_qdss_in4>;
bf469630552a39 Jie Gan          2024-11-06  2166  					};
bf469630552a39 Jie Gan          2024-11-06  2167  				};
bf469630552a39 Jie Gan          2024-11-06  2168  			};
bf469630552a39 Jie Gan          2024-11-06  2169  		};
bf469630552a39 Jie Gan          2024-11-06  2170  
bf469630552a39 Jie Gan          2024-11-06  2171  		tpdm@69d0000 {
bf469630552a39 Jie Gan          2024-11-06  2172  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2173  			reg = <0x0 0x069d0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2174  
bf469630552a39 Jie Gan          2024-11-06  2175  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2176  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2177  
bf469630552a39 Jie Gan          2024-11-06  2178  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2179  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2180  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2181  
bf469630552a39 Jie Gan          2024-11-06  2182  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2183  				port {
bf469630552a39 Jie Gan          2024-11-06  2184  					tpdm_qm_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2185  						remote-endpoint = <&tpda_qdss_in11>;
bf469630552a39 Jie Gan          2024-11-06  2186  					};
bf469630552a39 Jie Gan          2024-11-06  2187  				};
bf469630552a39 Jie Gan          2024-11-06  2188  			};
bf469630552a39 Jie Gan          2024-11-06  2189  		};
bf469630552a39 Jie Gan          2024-11-06  2190  
bf469630552a39 Jie Gan          2024-11-06  2191  		tpdm@6a00000 {
bf469630552a39 Jie Gan          2024-11-06  2192  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2193  			reg = <0x0 0x06a00000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2194  
bf469630552a39 Jie Gan          2024-11-06  2195  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2196  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2197  
bf469630552a39 Jie Gan          2024-11-06  2198  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2199  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2200  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2201  
bf469630552a39 Jie Gan          2024-11-06  2202  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2203  				port {
bf469630552a39 Jie Gan          2024-11-06  2204  					tpdm_ddr_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2205  						remote-endpoint = <&funnel_ddr_0_in>;
bf469630552a39 Jie Gan          2024-11-06  2206  					};
bf469630552a39 Jie Gan          2024-11-06  2207  				};
bf469630552a39 Jie Gan          2024-11-06  2208  			};
bf469630552a39 Jie Gan          2024-11-06  2209  		};
bf469630552a39 Jie Gan          2024-11-06  2210  
bf469630552a39 Jie Gan          2024-11-06  2211  		cti@6a02000 {
bf469630552a39 Jie Gan          2024-11-06  2212  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2213  			reg = <0x0 0x06a02000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2214  
bf469630552a39 Jie Gan          2024-11-06  2215  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2216  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2217  		};
bf469630552a39 Jie Gan          2024-11-06  2218  
bf469630552a39 Jie Gan          2024-11-06  2219  		cti@6a03000 {
bf469630552a39 Jie Gan          2024-11-06  2220  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2221  			reg = <0x0 0x06a03000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2222  
bf469630552a39 Jie Gan          2024-11-06  2223  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2224  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2225  		};
bf469630552a39 Jie Gan          2024-11-06  2226  
bf469630552a39 Jie Gan          2024-11-06  2227  		cti@6a10000 {
bf469630552a39 Jie Gan          2024-11-06  2228  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2229  			reg = <0x0 0x06a10000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2230  
bf469630552a39 Jie Gan          2024-11-06  2231  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2232  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2233  		};
bf469630552a39 Jie Gan          2024-11-06  2234  
bf469630552a39 Jie Gan          2024-11-06  2235  		cti@6a11000 {
bf469630552a39 Jie Gan          2024-11-06  2236  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2237  			reg = <0x0 0x06a11000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2238  
bf469630552a39 Jie Gan          2024-11-06  2239  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2240  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2241  		};
bf469630552a39 Jie Gan          2024-11-06  2242  
bf469630552a39 Jie Gan          2024-11-06  2243  		funnel@6a05000 {
bf469630552a39 Jie Gan          2024-11-06  2244  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2245  			reg = <0x0 0x06a05000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2246  
bf469630552a39 Jie Gan          2024-11-06  2247  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2248  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2249  
bf469630552a39 Jie Gan          2024-11-06  2250  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2251  				port {
bf469630552a39 Jie Gan          2024-11-06  2252  					funnel_ddr_0_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2253  						remote-endpoint = <&tpdm_ddr_out>;
bf469630552a39 Jie Gan          2024-11-06  2254  					};
bf469630552a39 Jie Gan          2024-11-06  2255  				};
bf469630552a39 Jie Gan          2024-11-06  2256  			};
bf469630552a39 Jie Gan          2024-11-06  2257  
bf469630552a39 Jie Gan          2024-11-06  2258  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2259  				port {
bf469630552a39 Jie Gan          2024-11-06  2260  					funnel_ddr_0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2261  						remote-endpoint = <&tpda_qdss_in5>;
bf469630552a39 Jie Gan          2024-11-06  2262  					};
bf469630552a39 Jie Gan          2024-11-06  2263  				};
bf469630552a39 Jie Gan          2024-11-06  2264  			};
bf469630552a39 Jie Gan          2024-11-06  2265  		};
bf469630552a39 Jie Gan          2024-11-06  2266  
bf469630552a39 Jie Gan          2024-11-06  2267  		tpda@6b01000 {
bf469630552a39 Jie Gan          2024-11-06  2268  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2269  			reg = <0x0 0x06b01000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2270  
bf469630552a39 Jie Gan          2024-11-06  2271  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2272  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2273  
bf469630552a39 Jie Gan          2024-11-06  2274  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2275  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2276  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2277  
bf469630552a39 Jie Gan          2024-11-06  2278  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2279  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2280  
bf469630552a39 Jie Gan          2024-11-06  2281  					tpda_swao_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2282  						remote-endpoint = <&tpdm_swao0_out>;
bf469630552a39 Jie Gan          2024-11-06  2283  					};
bf469630552a39 Jie Gan          2024-11-06  2284  				};
bf469630552a39 Jie Gan          2024-11-06  2285  
bf469630552a39 Jie Gan          2024-11-06  2286  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2287  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2288  
bf469630552a39 Jie Gan          2024-11-06  2289  					tpda_swao_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2290  						remote-endpoint = <&tpdm_swao1_out>;
bf469630552a39 Jie Gan          2024-11-06  2291  					};
bf469630552a39 Jie Gan          2024-11-06  2292  
bf469630552a39 Jie Gan          2024-11-06  2293  				};
bf469630552a39 Jie Gan          2024-11-06  2294  			};
bf469630552a39 Jie Gan          2024-11-06  2295  
bf469630552a39 Jie Gan          2024-11-06  2296  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2297  				port {
bf469630552a39 Jie Gan          2024-11-06  2298  					tpda_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2299  						remote-endpoint = <&funnel_swao_in7>;
bf469630552a39 Jie Gan          2024-11-06  2300  					};
bf469630552a39 Jie Gan          2024-11-06  2301  				};
bf469630552a39 Jie Gan          2024-11-06  2302  			};
bf469630552a39 Jie Gan          2024-11-06  2303  		};
bf469630552a39 Jie Gan          2024-11-06  2304  
bf469630552a39 Jie Gan          2024-11-06  2305  		tpdm@6b02000 {
bf469630552a39 Jie Gan          2024-11-06  2306  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2307  			reg = <0x0 0x06b02000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2308  
bf469630552a39 Jie Gan          2024-11-06  2309  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2310  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2311  
bf469630552a39 Jie Gan          2024-11-06  2312  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  2313  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2314  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2315  
bf469630552a39 Jie Gan          2024-11-06  2316  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2317  				port {
bf469630552a39 Jie Gan          2024-11-06  2318  					tpdm_swao0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2319  						remote-endpoint = <&tpda_swao_in0>;
bf469630552a39 Jie Gan          2024-11-06  2320  					};
bf469630552a39 Jie Gan          2024-11-06  2321  				};
bf469630552a39 Jie Gan          2024-11-06  2322  			};
bf469630552a39 Jie Gan          2024-11-06  2323  		};
bf469630552a39 Jie Gan          2024-11-06  2324  
bf469630552a39 Jie Gan          2024-11-06  2325  		tpdm@6b03000 {
bf469630552a39 Jie Gan          2024-11-06  2326  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2327  			reg = <0x0 0x06b03000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2328  
bf469630552a39 Jie Gan          2024-11-06  2329  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2330  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2331  
bf469630552a39 Jie Gan          2024-11-06  2332  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2333  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2334  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2335  
bf469630552a39 Jie Gan          2024-11-06  2336  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2337  				port {
bf469630552a39 Jie Gan          2024-11-06  2338  					tpdm_swao1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2339  						remote-endpoint = <&tpda_swao_in1>;
bf469630552a39 Jie Gan          2024-11-06  2340  					};
bf469630552a39 Jie Gan          2024-11-06  2341  				};
bf469630552a39 Jie Gan          2024-11-06  2342  			};
bf469630552a39 Jie Gan          2024-11-06  2343  		};
bf469630552a39 Jie Gan          2024-11-06  2344  
bf469630552a39 Jie Gan          2024-11-06  2345  		cti@6b04000 {
bf469630552a39 Jie Gan          2024-11-06  2346  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2347  			reg = <0x0 0x06b04000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2348  
bf469630552a39 Jie Gan          2024-11-06  2349  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2350  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2351  		};
bf469630552a39 Jie Gan          2024-11-06  2352  
bf469630552a39 Jie Gan          2024-11-06  2353  		cti@6b05000 {
bf469630552a39 Jie Gan          2024-11-06  2354  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2355  			reg = <0x0 0x06b05000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2356  
bf469630552a39 Jie Gan          2024-11-06  2357  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2358  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2359  		};
bf469630552a39 Jie Gan          2024-11-06  2360  
bf469630552a39 Jie Gan          2024-11-06  2361  		cti@6b06000 {
bf469630552a39 Jie Gan          2024-11-06  2362  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2363  			reg = <0x0 0x06b06000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2364  
bf469630552a39 Jie Gan          2024-11-06  2365  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2366  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2367  		};
bf469630552a39 Jie Gan          2024-11-06  2368  
bf469630552a39 Jie Gan          2024-11-06  2369  		cti@6b07000 {
bf469630552a39 Jie Gan          2024-11-06  2370  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2371  			reg = <0x0 0x06b07000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2372  
bf469630552a39 Jie Gan          2024-11-06  2373  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2374  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2375  		};
bf469630552a39 Jie Gan          2024-11-06  2376  
bf469630552a39 Jie Gan          2024-11-06  2377  		funnel@6b08000 {
bf469630552a39 Jie Gan          2024-11-06  2378  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2379  			reg = <0x0 0x06b08000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2380  
bf469630552a39 Jie Gan          2024-11-06  2381  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2382  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2383  
bf469630552a39 Jie Gan          2024-11-06  2384  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2385  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2386  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2387  
bf469630552a39 Jie Gan          2024-11-06  2388  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  2389  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  2390  
bf469630552a39 Jie Gan          2024-11-06  2391  					funnel_swao_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2392  						remote-endpoint = <&replicator1_out>;
bf469630552a39 Jie Gan          2024-11-06  2393  					};
bf469630552a39 Jie Gan          2024-11-06  2394  				};
bf469630552a39 Jie Gan          2024-11-06  2395  
bf469630552a39 Jie Gan          2024-11-06  2396  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  2397  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  2398  
bf469630552a39 Jie Gan          2024-11-06  2399  					funnel_swao_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2400  						remote-endpoint = <&tpda_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2401  					};
bf469630552a39 Jie Gan          2024-11-06  2402  				};
bf469630552a39 Jie Gan          2024-11-06  2403  			};
bf469630552a39 Jie Gan          2024-11-06  2404  
bf469630552a39 Jie Gan          2024-11-06  2405  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2406  				port {
bf469630552a39 Jie Gan          2024-11-06  2407  					funnel_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2408  						remote-endpoint = <&tmc_etf_swao_in>;
bf469630552a39 Jie Gan          2024-11-06  2409  					};
bf469630552a39 Jie Gan          2024-11-06  2410  				};
bf469630552a39 Jie Gan          2024-11-06  2411  			};
bf469630552a39 Jie Gan          2024-11-06  2412  		};
bf469630552a39 Jie Gan          2024-11-06  2413  
bf469630552a39 Jie Gan          2024-11-06  2414  		tmc@6b09000 {
bf469630552a39 Jie Gan          2024-11-06  2415  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2416  			reg = <0x0 0x06b09000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2417  
bf469630552a39 Jie Gan          2024-11-06  2418  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2419  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2420  
bf469630552a39 Jie Gan          2024-11-06  2421  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2422  				port {
bf469630552a39 Jie Gan          2024-11-06  2423  					tmc_etf_swao_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2424  						remote-endpoint = <&funnel_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2425  					};
bf469630552a39 Jie Gan          2024-11-06  2426  				};
bf469630552a39 Jie Gan          2024-11-06  2427  			};
bf469630552a39 Jie Gan          2024-11-06  2428  
bf469630552a39 Jie Gan          2024-11-06  2429  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2430  				port {
bf469630552a39 Jie Gan          2024-11-06  2431  					tmc_etf_swao_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2432  						remote-endpoint = <&replicator_swao_in>;
bf469630552a39 Jie Gan          2024-11-06  2433  					};
bf469630552a39 Jie Gan          2024-11-06  2434  				};
bf469630552a39 Jie Gan          2024-11-06  2435  			};
bf469630552a39 Jie Gan          2024-11-06  2436  		};
bf469630552a39 Jie Gan          2024-11-06  2437  
bf469630552a39 Jie Gan          2024-11-06  2438  		replicator@6b0a000 {
bf469630552a39 Jie Gan          2024-11-06  2439  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2440  			reg = <0x0 0x06b0a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2441  
bf469630552a39 Jie Gan          2024-11-06  2442  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2443  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2444  
bf469630552a39 Jie Gan          2024-11-06  2445  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2446  				port {
bf469630552a39 Jie Gan          2024-11-06  2447  					replicator_swao_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2448  						remote-endpoint = <&tmc_etf_swao_out>;
bf469630552a39 Jie Gan          2024-11-06  2449  					};
bf469630552a39 Jie Gan          2024-11-06  2450  				};
bf469630552a39 Jie Gan          2024-11-06  2451  			};
bf469630552a39 Jie Gan          2024-11-06  2452  
bf469630552a39 Jie Gan          2024-11-06  2453  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2454  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2455  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2456  
bf469630552a39 Jie Gan          2024-11-06  2457  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2458  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2459  
bf469630552a39 Jie Gan          2024-11-06  2460  					replicator_swao_out0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2461  						remote-endpoint = <&funnel_in1_in3>;
bf469630552a39 Jie Gan          2024-11-06  2462  					};
bf469630552a39 Jie Gan          2024-11-06  2463  				};
bf469630552a39 Jie Gan          2024-11-06  2464  
bf469630552a39 Jie Gan          2024-11-06  2465  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2466  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2467  
bf469630552a39 Jie Gan          2024-11-06  2468  					replicator_swao_out1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2469  						remote-endpoint = <&eud_in>;
bf469630552a39 Jie Gan          2024-11-06  2470  					};
bf469630552a39 Jie Gan          2024-11-06  2471  				};
bf469630552a39 Jie Gan          2024-11-06  2472  			};
bf469630552a39 Jie Gan          2024-11-06  2473  		};
bf469630552a39 Jie Gan          2024-11-06  2474  
bf469630552a39 Jie Gan          2024-11-06  2475  		cti@6b21000 {
bf469630552a39 Jie Gan          2024-11-06  2476  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2477  			reg = <0x0 0x06b21000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2478  
bf469630552a39 Jie Gan          2024-11-06  2479  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2480  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2481  		};
bf469630552a39 Jie Gan          2024-11-06  2482  
bf469630552a39 Jie Gan          2024-11-06  2483  		tpdm@6b48000 {
bf469630552a39 Jie Gan          2024-11-06  2484  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2485  			reg = <0x0 0x06b48000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2486  
bf469630552a39 Jie Gan          2024-11-06  2487  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2488  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2489  
bf469630552a39 Jie Gan          2024-11-06  2490  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2491  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2492  
bf469630552a39 Jie Gan          2024-11-06  2493  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2494  				port {
bf469630552a39 Jie Gan          2024-11-06  2495  					tpdm_west_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2496  						remote-endpoint = <&tpda_qdss_in12>;
bf469630552a39 Jie Gan          2024-11-06  2497  					};
bf469630552a39 Jie Gan          2024-11-06  2498  				};
bf469630552a39 Jie Gan          2024-11-06  2499  			};
bf469630552a39 Jie Gan          2024-11-06  2500  		};
bf469630552a39 Jie Gan          2024-11-06  2501  
bf469630552a39 Jie Gan          2024-11-06  2502  		cti@6c13000 {
bf469630552a39 Jie Gan          2024-11-06  2503  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2504  			reg = <0x0 0x06c13000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2505  
bf469630552a39 Jie Gan          2024-11-06  2506  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2507  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2508  		};
bf469630552a39 Jie Gan          2024-11-06  2509  
bf469630552a39 Jie Gan          2024-11-06  2510  		cti@6c20000 {
bf469630552a39 Jie Gan          2024-11-06  2511  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2512  			reg = <0x0 0x06c20000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2513  
bf469630552a39 Jie Gan          2024-11-06  2514  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2515  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2516  			status = "disabled";
bf469630552a39 Jie Gan          2024-11-06  2517  		};
bf469630552a39 Jie Gan          2024-11-06  2518  
bf469630552a39 Jie Gan          2024-11-06  2519  		tpdm@6c28000 {
bf469630552a39 Jie Gan          2024-11-06  2520  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2521  			reg = <0x0 0x06c28000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2522  
bf469630552a39 Jie Gan          2024-11-06  2523  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2524  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2525  
bf469630552a39 Jie Gan          2024-11-06  2526  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2527  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2528  
bf469630552a39 Jie Gan          2024-11-06  2529  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2530  				port {
bf469630552a39 Jie Gan          2024-11-06  2531  					tpdm_center_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2532  						remote-endpoint = <&tpda_qdss_in0>;
bf469630552a39 Jie Gan          2024-11-06  2533  					};
bf469630552a39 Jie Gan          2024-11-06  2534  				};
bf469630552a39 Jie Gan          2024-11-06  2535  			};
bf469630552a39 Jie Gan          2024-11-06  2536  		};
bf469630552a39 Jie Gan          2024-11-06  2537  
bf469630552a39 Jie Gan          2024-11-06  2538  		cti@6c29000 {
bf469630552a39 Jie Gan          2024-11-06  2539  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2540  			reg = <0x0 0x06c29000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2541  
bf469630552a39 Jie Gan          2024-11-06  2542  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2543  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2544  		};
bf469630552a39 Jie Gan          2024-11-06  2545  
bf469630552a39 Jie Gan          2024-11-06  2546  		cti@6c2a000 {
bf469630552a39 Jie Gan          2024-11-06  2547  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2548  			reg = <0x0 0x06c2a000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2549  
bf469630552a39 Jie Gan          2024-11-06  2550  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2551  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2552  		};
bf469630552a39 Jie Gan          2024-11-06  2553  
bf469630552a39 Jie Gan          2024-11-06  2554  		cti@7020000 {
bf469630552a39 Jie Gan          2024-11-06  2555  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2556  			reg = <0x0 0x07020000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2557  
bf469630552a39 Jie Gan          2024-11-06  2558  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2559  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2560  		};
bf469630552a39 Jie Gan          2024-11-06  2561  
bf469630552a39 Jie Gan          2024-11-06  2562  		etm@7040000 {
bf469630552a39 Jie Gan          2024-11-06  2563  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2564  			reg = <0x0 0x07040000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2565  			cpu = <&cpu0>;
bf469630552a39 Jie Gan          2024-11-06  2566  
bf469630552a39 Jie Gan          2024-11-06  2567  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2568  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2569  
bf469630552a39 Jie Gan          2024-11-06  2570  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2571  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2572  
bf469630552a39 Jie Gan          2024-11-06  2573  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2574  				port {
bf469630552a39 Jie Gan          2024-11-06  2575  					etm0_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2576  						remote-endpoint = <&funnel_apss_in0>;
bf469630552a39 Jie Gan          2024-11-06  2577  					};
bf469630552a39 Jie Gan          2024-11-06  2578  				};
bf469630552a39 Jie Gan          2024-11-06  2579  			};
bf469630552a39 Jie Gan          2024-11-06  2580  		};
bf469630552a39 Jie Gan          2024-11-06  2581  
bf469630552a39 Jie Gan          2024-11-06  2582  		cti@7120000 {
bf469630552a39 Jie Gan          2024-11-06  2583  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2584  			reg = <0x0 0x07120000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2585  
bf469630552a39 Jie Gan          2024-11-06  2586  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2587  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2588  		};
bf469630552a39 Jie Gan          2024-11-06  2589  
bf469630552a39 Jie Gan          2024-11-06  2590  		etm@7140000 {
bf469630552a39 Jie Gan          2024-11-06  2591  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2592  			reg = <0x0 0x07140000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2593  			cpu = <&cpu1>;
bf469630552a39 Jie Gan          2024-11-06  2594  
bf469630552a39 Jie Gan          2024-11-06  2595  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2596  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2597  
bf469630552a39 Jie Gan          2024-11-06  2598  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2599  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2600  
bf469630552a39 Jie Gan          2024-11-06  2601  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2602  				port {
bf469630552a39 Jie Gan          2024-11-06  2603  					etm1_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2604  						remote-endpoint = <&funnel_apss_in1>;
bf469630552a39 Jie Gan          2024-11-06  2605  					};
bf469630552a39 Jie Gan          2024-11-06  2606  				};
bf469630552a39 Jie Gan          2024-11-06  2607  			};
bf469630552a39 Jie Gan          2024-11-06  2608  		};
bf469630552a39 Jie Gan          2024-11-06  2609  
bf469630552a39 Jie Gan          2024-11-06  2610  		cti@7220000 {
bf469630552a39 Jie Gan          2024-11-06  2611  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2612  			reg = <0x0 0x07220000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2613  
bf469630552a39 Jie Gan          2024-11-06  2614  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2615  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2616  		};
bf469630552a39 Jie Gan          2024-11-06  2617  
bf469630552a39 Jie Gan          2024-11-06  2618  		etm@7240000 {
bf469630552a39 Jie Gan          2024-11-06  2619  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2620  			reg = <0x0 0x07240000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2621  			cpu = <&cpu2>;
bf469630552a39 Jie Gan          2024-11-06  2622  
bf469630552a39 Jie Gan          2024-11-06  2623  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2624  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2625  
bf469630552a39 Jie Gan          2024-11-06  2626  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2627  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2628  
bf469630552a39 Jie Gan          2024-11-06  2629  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2630  				port {
bf469630552a39 Jie Gan          2024-11-06  2631  					etm2_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2632  						remote-endpoint = <&funnel_apss_in2>;
bf469630552a39 Jie Gan          2024-11-06  2633  					};
bf469630552a39 Jie Gan          2024-11-06  2634  				};
bf469630552a39 Jie Gan          2024-11-06  2635  			};
bf469630552a39 Jie Gan          2024-11-06  2636  		};
bf469630552a39 Jie Gan          2024-11-06  2637  
bf469630552a39 Jie Gan          2024-11-06  2638  		cti@7320000 {
bf469630552a39 Jie Gan          2024-11-06  2639  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2640  			reg = <0x0 0x07320000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2641  
bf469630552a39 Jie Gan          2024-11-06  2642  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2643  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2644  		};
bf469630552a39 Jie Gan          2024-11-06  2645  
bf469630552a39 Jie Gan          2024-11-06  2646  		etm@7340000 {
bf469630552a39 Jie Gan          2024-11-06  2647  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2648  			reg = <0x0 0x07340000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2649  			cpu = <&cpu3>;
bf469630552a39 Jie Gan          2024-11-06  2650  
bf469630552a39 Jie Gan          2024-11-06  2651  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2652  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2653  
bf469630552a39 Jie Gan          2024-11-06  2654  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2655  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2656  
bf469630552a39 Jie Gan          2024-11-06  2657  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2658  				port {
bf469630552a39 Jie Gan          2024-11-06  2659  					etm3_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2660  						remote-endpoint = <&funnel_apss_in3>;
bf469630552a39 Jie Gan          2024-11-06  2661  					};
bf469630552a39 Jie Gan          2024-11-06  2662  				};
bf469630552a39 Jie Gan          2024-11-06  2663  			};
bf469630552a39 Jie Gan          2024-11-06  2664  		};
bf469630552a39 Jie Gan          2024-11-06  2665  
bf469630552a39 Jie Gan          2024-11-06  2666  		cti@7420000 {
bf469630552a39 Jie Gan          2024-11-06  2667  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2668  			reg = <0x0 0x07420000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2669  
bf469630552a39 Jie Gan          2024-11-06  2670  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2671  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2672  		};
bf469630552a39 Jie Gan          2024-11-06  2673  
bf469630552a39 Jie Gan          2024-11-06  2674  		etm@7440000 {
bf469630552a39 Jie Gan          2024-11-06  2675  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2676  			reg = <0x0 0x07440000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2677  			cpu = <&cpu4>;
bf469630552a39 Jie Gan          2024-11-06  2678  
bf469630552a39 Jie Gan          2024-11-06  2679  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2680  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2681  
bf469630552a39 Jie Gan          2024-11-06  2682  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2683  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2684  
bf469630552a39 Jie Gan          2024-11-06  2685  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2686  				port {
bf469630552a39 Jie Gan          2024-11-06  2687  					etm4_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2688  						remote-endpoint = <&funnel_apss_in4>;
bf469630552a39 Jie Gan          2024-11-06  2689  					};
bf469630552a39 Jie Gan          2024-11-06  2690  				};
bf469630552a39 Jie Gan          2024-11-06  2691  			};
bf469630552a39 Jie Gan          2024-11-06  2692  		};
bf469630552a39 Jie Gan          2024-11-06  2693  
bf469630552a39 Jie Gan          2024-11-06  2694  		cti@7520000 {
bf469630552a39 Jie Gan          2024-11-06  2695  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2696  			reg = <0x0 0x07520000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2697  
bf469630552a39 Jie Gan          2024-11-06  2698  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2699  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2700  		};
bf469630552a39 Jie Gan          2024-11-06  2701  
bf469630552a39 Jie Gan          2024-11-06  2702  		etm@7540000 {
bf469630552a39 Jie Gan          2024-11-06  2703  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2704  			reg = <0x0 0x07540000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2705  			cpu = <&cpu5>;
bf469630552a39 Jie Gan          2024-11-06  2706  
bf469630552a39 Jie Gan          2024-11-06  2707  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2708  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2709  
bf469630552a39 Jie Gan          2024-11-06  2710  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2711  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2712  
bf469630552a39 Jie Gan          2024-11-06  2713  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2714  				port {
bf469630552a39 Jie Gan          2024-11-06  2715  					etm5_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2716  						remote-endpoint = <&funnel_apss_in5>;
bf469630552a39 Jie Gan          2024-11-06  2717  					};
bf469630552a39 Jie Gan          2024-11-06  2718  				};
bf469630552a39 Jie Gan          2024-11-06  2719  			};
bf469630552a39 Jie Gan          2024-11-06  2720  		};
bf469630552a39 Jie Gan          2024-11-06  2721  
bf469630552a39 Jie Gan          2024-11-06  2722  		cti@7620000 {
bf469630552a39 Jie Gan          2024-11-06  2723  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2724  			reg = <0x0 0x07620000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2725  
bf469630552a39 Jie Gan          2024-11-06  2726  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2727  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2728  		};
bf469630552a39 Jie Gan          2024-11-06  2729  
bf469630552a39 Jie Gan          2024-11-06  2730  		etm@7640000 {
bf469630552a39 Jie Gan          2024-11-06  2731  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2732  			reg = <0x0 0x07640000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2733  			cpu = <&cpu6>;
bf469630552a39 Jie Gan          2024-11-06  2734  
bf469630552a39 Jie Gan          2024-11-06  2735  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2736  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2737  
bf469630552a39 Jie Gan          2024-11-06  2738  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2739  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2740  
bf469630552a39 Jie Gan          2024-11-06  2741  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2742  				port {
bf469630552a39 Jie Gan          2024-11-06  2743  					etm6_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2744  						remote-endpoint = <&funnel_apss_in6>;
bf469630552a39 Jie Gan          2024-11-06  2745  					};
bf469630552a39 Jie Gan          2024-11-06  2746  				};
bf469630552a39 Jie Gan          2024-11-06  2747  			};
bf469630552a39 Jie Gan          2024-11-06  2748  		};
bf469630552a39 Jie Gan          2024-11-06  2749  
bf469630552a39 Jie Gan          2024-11-06  2750  		cti@7720000 {
bf469630552a39 Jie Gan          2024-11-06  2751  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2752  			reg = <0x0 0x07720000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2753  
bf469630552a39 Jie Gan          2024-11-06  2754  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2755  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2756  		};
bf469630552a39 Jie Gan          2024-11-06  2757  
bf469630552a39 Jie Gan          2024-11-06  2758  		etm@7740000 {
bf469630552a39 Jie Gan          2024-11-06  2759  			compatible = "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2760  			reg = <0x0 0x07740000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2761  			cpu = <&cpu7>;
bf469630552a39 Jie Gan          2024-11-06  2762  
bf469630552a39 Jie Gan          2024-11-06  2763  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2764  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2765  
bf469630552a39 Jie Gan          2024-11-06  2766  			arm,coresight-loses-context-with-cpu;
bf469630552a39 Jie Gan          2024-11-06  2767  			qcom,skip-power-up;
bf469630552a39 Jie Gan          2024-11-06  2768  
bf469630552a39 Jie Gan          2024-11-06  2769  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2770  				port {
bf469630552a39 Jie Gan          2024-11-06  2771  					etm7_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2772  						remote-endpoint = <&funnel_apss_in7>;
bf469630552a39 Jie Gan          2024-11-06  2773  					};
bf469630552a39 Jie Gan          2024-11-06  2774  				};
bf469630552a39 Jie Gan          2024-11-06  2775  			};
bf469630552a39 Jie Gan          2024-11-06  2776  		};
bf469630552a39 Jie Gan          2024-11-06  2777  
bf469630552a39 Jie Gan          2024-11-06  2778  		funnel@7800000 {
bf469630552a39 Jie Gan          2024-11-06  2779  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2780  			reg = <0x0 0x07800000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2781  
bf469630552a39 Jie Gan          2024-11-06  2782  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2783  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2784  
bf469630552a39 Jie Gan          2024-11-06  2785  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2786  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2787  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2788  
bf469630552a39 Jie Gan          2024-11-06  2789  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2790  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2791  
bf469630552a39 Jie Gan          2024-11-06  2792  					funnel_apss_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2793  						remote-endpoint = <&etm0_out>;
bf469630552a39 Jie Gan          2024-11-06  2794  					};
bf469630552a39 Jie Gan          2024-11-06  2795  				};
bf469630552a39 Jie Gan          2024-11-06  2796  
bf469630552a39 Jie Gan          2024-11-06  2797  				port@1 {
bf469630552a39 Jie Gan          2024-11-06  2798  					reg = <1>;
bf469630552a39 Jie Gan          2024-11-06  2799  
bf469630552a39 Jie Gan          2024-11-06  2800  					funnel_apss_in1: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2801  						remote-endpoint = <&etm1_out>;
bf469630552a39 Jie Gan          2024-11-06  2802  					};
bf469630552a39 Jie Gan          2024-11-06  2803  				};
bf469630552a39 Jie Gan          2024-11-06  2804  
bf469630552a39 Jie Gan          2024-11-06  2805  				port@2 {
bf469630552a39 Jie Gan          2024-11-06  2806  					reg = <2>;
bf469630552a39 Jie Gan          2024-11-06  2807  
bf469630552a39 Jie Gan          2024-11-06  2808  					funnel_apss_in2: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2809  						remote-endpoint = <&etm2_out>;
bf469630552a39 Jie Gan          2024-11-06  2810  					};
bf469630552a39 Jie Gan          2024-11-06  2811  				};
bf469630552a39 Jie Gan          2024-11-06  2812  
bf469630552a39 Jie Gan          2024-11-06  2813  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  2814  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  2815  
bf469630552a39 Jie Gan          2024-11-06  2816  					funnel_apss_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2817  						remote-endpoint = <&etm3_out>;
bf469630552a39 Jie Gan          2024-11-06  2818  					};
bf469630552a39 Jie Gan          2024-11-06  2819  				};
bf469630552a39 Jie Gan          2024-11-06  2820  
bf469630552a39 Jie Gan          2024-11-06  2821  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  2822  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  2823  
bf469630552a39 Jie Gan          2024-11-06  2824  					funnel_apss_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2825  						remote-endpoint = <&etm4_out>;
bf469630552a39 Jie Gan          2024-11-06  2826  					};
bf469630552a39 Jie Gan          2024-11-06  2827  				};
bf469630552a39 Jie Gan          2024-11-06  2828  
bf469630552a39 Jie Gan          2024-11-06  2829  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  2830  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  2831  
bf469630552a39 Jie Gan          2024-11-06  2832  					funnel_apss_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2833  						remote-endpoint = <&etm5_out>;
bf469630552a39 Jie Gan          2024-11-06  2834  					};
bf469630552a39 Jie Gan          2024-11-06  2835  				};
bf469630552a39 Jie Gan          2024-11-06  2836  
bf469630552a39 Jie Gan          2024-11-06  2837  				port@6 {
bf469630552a39 Jie Gan          2024-11-06  2838  					reg = <6>;
bf469630552a39 Jie Gan          2024-11-06  2839  
bf469630552a39 Jie Gan          2024-11-06  2840  					funnel_apss_in6: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2841  						remote-endpoint = <&etm6_out>;
bf469630552a39 Jie Gan          2024-11-06  2842  					};
bf469630552a39 Jie Gan          2024-11-06  2843  				};
bf469630552a39 Jie Gan          2024-11-06  2844  
bf469630552a39 Jie Gan          2024-11-06  2845  				port@7 {
bf469630552a39 Jie Gan          2024-11-06  2846  					reg = <7>;
bf469630552a39 Jie Gan          2024-11-06  2847  
bf469630552a39 Jie Gan          2024-11-06  2848  					funnel_apss_in7: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2849  						remote-endpoint = <&etm7_out>;
bf469630552a39 Jie Gan          2024-11-06  2850  					};
bf469630552a39 Jie Gan          2024-11-06  2851  				};
bf469630552a39 Jie Gan          2024-11-06  2852  			};
bf469630552a39 Jie Gan          2024-11-06  2853  
bf469630552a39 Jie Gan          2024-11-06  2854  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2855  				port {
bf469630552a39 Jie Gan          2024-11-06  2856  					funnel_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2857  						remote-endpoint = <&funnel_apss_merg_in0>;
bf469630552a39 Jie Gan          2024-11-06  2858  					};
bf469630552a39 Jie Gan          2024-11-06  2859  				};
bf469630552a39 Jie Gan          2024-11-06  2860  			};
bf469630552a39 Jie Gan          2024-11-06  2861  		};
bf469630552a39 Jie Gan          2024-11-06  2862  
bf469630552a39 Jie Gan          2024-11-06  2863  		funnel@7810000 {
bf469630552a39 Jie Gan          2024-11-06  2864  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2865  			reg = <0x0 0x07810000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2866  
bf469630552a39 Jie Gan          2024-11-06  2867  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2868  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2869  
bf469630552a39 Jie Gan          2024-11-06  2870  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2871  				#address-cells = <1>;
bf469630552a39 Jie Gan          2024-11-06  2872  				#size-cells = <0>;
bf469630552a39 Jie Gan          2024-11-06  2873  
bf469630552a39 Jie Gan          2024-11-06  2874  				port@0 {
bf469630552a39 Jie Gan          2024-11-06  2875  					reg = <0>;
bf469630552a39 Jie Gan          2024-11-06  2876  
bf469630552a39 Jie Gan          2024-11-06  2877  					funnel_apss_merg_in0: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2878  						remote-endpoint = <&funnel_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2879  					};
bf469630552a39 Jie Gan          2024-11-06  2880  				};
bf469630552a39 Jie Gan          2024-11-06  2881  
bf469630552a39 Jie Gan          2024-11-06  2882  				port@2 {
bf469630552a39 Jie Gan          2024-11-06  2883  					reg = <2>;
bf469630552a39 Jie Gan          2024-11-06  2884  
bf469630552a39 Jie Gan          2024-11-06  2885  					funnel_apss_merg_in2: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2886  						remote-endpoint = <&tpda_olc_out>;
bf469630552a39 Jie Gan          2024-11-06  2887  					};
bf469630552a39 Jie Gan          2024-11-06  2888  				};
bf469630552a39 Jie Gan          2024-11-06  2889  
bf469630552a39 Jie Gan          2024-11-06  2890  				port@3 {
bf469630552a39 Jie Gan          2024-11-06  2891  					reg = <3>;
bf469630552a39 Jie Gan          2024-11-06  2892  
bf469630552a39 Jie Gan          2024-11-06  2893  					funnel_apss_merg_in3: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2894  						remote-endpoint = <&tpda_llm_silver_out>;
bf469630552a39 Jie Gan          2024-11-06  2895  					};
bf469630552a39 Jie Gan          2024-11-06  2896  				};
bf469630552a39 Jie Gan          2024-11-06  2897  
bf469630552a39 Jie Gan          2024-11-06  2898  				port@4 {
bf469630552a39 Jie Gan          2024-11-06  2899  					reg = <4>;
bf469630552a39 Jie Gan          2024-11-06  2900  
bf469630552a39 Jie Gan          2024-11-06  2901  					funnel_apss_merg_in4: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2902  						remote-endpoint = <&tpda_llm_gold_out>;
bf469630552a39 Jie Gan          2024-11-06  2903  					};
bf469630552a39 Jie Gan          2024-11-06  2904  				};
bf469630552a39 Jie Gan          2024-11-06  2905  
bf469630552a39 Jie Gan          2024-11-06  2906  				port@5 {
bf469630552a39 Jie Gan          2024-11-06  2907  					reg = <5>;
bf469630552a39 Jie Gan          2024-11-06  2908  
bf469630552a39 Jie Gan          2024-11-06  2909  					funnel_apss_merg_in5: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2910  						remote-endpoint = <&tpda_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2911  					};
bf469630552a39 Jie Gan          2024-11-06  2912  				};
bf469630552a39 Jie Gan          2024-11-06  2913  			};
bf469630552a39 Jie Gan          2024-11-06  2914  
bf469630552a39 Jie Gan          2024-11-06  2915  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2916  				port {
bf469630552a39 Jie Gan          2024-11-06  2917  					funnel_apss_merg_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2918  						remote-endpoint = <&funnel_in1_in7>;
bf469630552a39 Jie Gan          2024-11-06  2919  					};
bf469630552a39 Jie Gan          2024-11-06  2920  				};
bf469630552a39 Jie Gan          2024-11-06  2921  			};
bf469630552a39 Jie Gan          2024-11-06  2922  		};
bf469630552a39 Jie Gan          2024-11-06  2923  
bf469630552a39 Jie Gan          2024-11-06  2924  		tpdm@7830000 {
bf469630552a39 Jie Gan          2024-11-06  2925  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2926  			reg = <0x0 0x07830000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2927  
bf469630552a39 Jie Gan          2024-11-06  2928  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2929  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2930  
bf469630552a39 Jie Gan          2024-11-06  2931  			qcom,cmb-element-bits = <64>;
bf469630552a39 Jie Gan          2024-11-06  2932  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2933  
bf469630552a39 Jie Gan          2024-11-06  2934  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2935  				port {
bf469630552a39 Jie Gan          2024-11-06  2936  					tpdm_olc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2937  						remote-endpoint = <&tpda_olc_in>;
bf469630552a39 Jie Gan          2024-11-06  2938  					};
bf469630552a39 Jie Gan          2024-11-06  2939  				};
bf469630552a39 Jie Gan          2024-11-06  2940  			};
bf469630552a39 Jie Gan          2024-11-06  2941  		};
bf469630552a39 Jie Gan          2024-11-06  2942  
bf469630552a39 Jie Gan          2024-11-06  2943  		tpda@7832000 {
bf469630552a39 Jie Gan          2024-11-06  2944  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2945  			reg = <0x0 0x07832000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2946  
bf469630552a39 Jie Gan          2024-11-06  2947  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2948  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2949  
bf469630552a39 Jie Gan          2024-11-06  2950  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2951  				port {
bf469630552a39 Jie Gan          2024-11-06  2952  					tpda_olc_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2953  						remote-endpoint = <&tpdm_olc_out>;
bf469630552a39 Jie Gan          2024-11-06  2954  					};
bf469630552a39 Jie Gan          2024-11-06  2955  				};
bf469630552a39 Jie Gan          2024-11-06  2956  			};
bf469630552a39 Jie Gan          2024-11-06  2957  
bf469630552a39 Jie Gan          2024-11-06  2958  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2959  				port {
bf469630552a39 Jie Gan          2024-11-06  2960  					tpda_olc_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2961  						remote-endpoint = <&funnel_apss_merg_in2>;
bf469630552a39 Jie Gan          2024-11-06  2962  					};
bf469630552a39 Jie Gan          2024-11-06  2963  				};
bf469630552a39 Jie Gan          2024-11-06  2964  			};
bf469630552a39 Jie Gan          2024-11-06  2965  		};
bf469630552a39 Jie Gan          2024-11-06  2966  
bf469630552a39 Jie Gan          2024-11-06  2967  		tpdm@7860000 {
bf469630552a39 Jie Gan          2024-11-06  2968  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2969  			reg = <0x0 0x07860000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2970  
bf469630552a39 Jie Gan          2024-11-06  2971  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2972  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2973  
bf469630552a39 Jie Gan          2024-11-06  2974  			qcom,dsb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  2975  			qcom,dsb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  2976  
bf469630552a39 Jie Gan          2024-11-06  2977  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  2978  				port {
bf469630552a39 Jie Gan          2024-11-06  2979  					tpdm_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2980  						remote-endpoint = <&tpda_apss_in>;
bf469630552a39 Jie Gan          2024-11-06  2981  					};
bf469630552a39 Jie Gan          2024-11-06  2982  				};
bf469630552a39 Jie Gan          2024-11-06  2983  			};
bf469630552a39 Jie Gan          2024-11-06  2984  		};
bf469630552a39 Jie Gan          2024-11-06  2985  
bf469630552a39 Jie Gan          2024-11-06  2986  		tpda@7862000 {
bf469630552a39 Jie Gan          2024-11-06  2987  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  2988  			reg = <0x0 0x07862000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  2989  
bf469630552a39 Jie Gan          2024-11-06  2990  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  2991  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  2992  
bf469630552a39 Jie Gan          2024-11-06  2993  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  2994  				port {
bf469630552a39 Jie Gan          2024-11-06  2995  					tpda_apss_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  2996  						remote-endpoint = <&tpdm_apss_out>;
bf469630552a39 Jie Gan          2024-11-06  2997  					};
bf469630552a39 Jie Gan          2024-11-06  2998  				};
bf469630552a39 Jie Gan          2024-11-06  2999  			};
bf469630552a39 Jie Gan          2024-11-06  3000  
bf469630552a39 Jie Gan          2024-11-06  3001  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3002  				port {
bf469630552a39 Jie Gan          2024-11-06  3003  					tpda_apss_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3004  						remote-endpoint = <&funnel_apss_merg_in5>;
bf469630552a39 Jie Gan          2024-11-06  3005  					};
bf469630552a39 Jie Gan          2024-11-06  3006  				};
bf469630552a39 Jie Gan          2024-11-06  3007  			};
bf469630552a39 Jie Gan          2024-11-06  3008  		};
bf469630552a39 Jie Gan          2024-11-06  3009  
bf469630552a39 Jie Gan          2024-11-06  3010  		tpdm@78a0000 {
bf469630552a39 Jie Gan          2024-11-06  3011  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3012  			reg = <0x0 0x078a0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3013  
bf469630552a39 Jie Gan          2024-11-06  3014  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3015  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3016  
bf469630552a39 Jie Gan          2024-11-06  3017  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  3018  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  3019  
bf469630552a39 Jie Gan          2024-11-06  3020  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3021  				port {
bf469630552a39 Jie Gan          2024-11-06  3022  					tpdm_llm_silver_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3023  						remote-endpoint = <&tpda_llm_silver_in>;
bf469630552a39 Jie Gan          2024-11-06  3024  					};
bf469630552a39 Jie Gan          2024-11-06  3025  				};
bf469630552a39 Jie Gan          2024-11-06  3026  			};
bf469630552a39 Jie Gan          2024-11-06  3027  		};
bf469630552a39 Jie Gan          2024-11-06  3028  
bf469630552a39 Jie Gan          2024-11-06  3029  		tpdm@78b0000 {
bf469630552a39 Jie Gan          2024-11-06  3030  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3031  			reg = <0x0 0x078b0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3032  
bf469630552a39 Jie Gan          2024-11-06  3033  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3034  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3035  
bf469630552a39 Jie Gan          2024-11-06  3036  			qcom,cmb-element-bits = <32>;
bf469630552a39 Jie Gan          2024-11-06  3037  			qcom,cmb-msrs-num = <32>;
bf469630552a39 Jie Gan          2024-11-06  3038  
bf469630552a39 Jie Gan          2024-11-06  3039  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3040  				port {
bf469630552a39 Jie Gan          2024-11-06  3041  					tpdm_llm_gold_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3042  						remote-endpoint = <&tpda_llm_gold_in>;
bf469630552a39 Jie Gan          2024-11-06  3043  					};
bf469630552a39 Jie Gan          2024-11-06  3044  				};
bf469630552a39 Jie Gan          2024-11-06  3045  			};
bf469630552a39 Jie Gan          2024-11-06  3046  		};
bf469630552a39 Jie Gan          2024-11-06  3047  
bf469630552a39 Jie Gan          2024-11-06  3048  		tpda@78c0000 {
bf469630552a39 Jie Gan          2024-11-06  3049  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3050  			reg = <0x0 0x078c0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3051  
bf469630552a39 Jie Gan          2024-11-06  3052  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3053  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3054  
bf469630552a39 Jie Gan          2024-11-06  3055  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  3056  				port {
bf469630552a39 Jie Gan          2024-11-06  3057  					tpda_llm_silver_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3058  						remote-endpoint = <&tpdm_llm_silver_out>;
bf469630552a39 Jie Gan          2024-11-06  3059  					};
bf469630552a39 Jie Gan          2024-11-06  3060  				};
bf469630552a39 Jie Gan          2024-11-06  3061  			};
bf469630552a39 Jie Gan          2024-11-06  3062  
bf469630552a39 Jie Gan          2024-11-06  3063  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3064  				port {
bf469630552a39 Jie Gan          2024-11-06  3065  					tpda_llm_silver_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3066  						remote-endpoint = <&funnel_apss_merg_in3>;
bf469630552a39 Jie Gan          2024-11-06  3067  					};
bf469630552a39 Jie Gan          2024-11-06  3068  				};
bf469630552a39 Jie Gan          2024-11-06  3069  			};
bf469630552a39 Jie Gan          2024-11-06  3070  		};
bf469630552a39 Jie Gan          2024-11-06  3071  
bf469630552a39 Jie Gan          2024-11-06  3072  		tpda@78d0000 {
bf469630552a39 Jie Gan          2024-11-06  3073  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3074  			reg = <0x0 0x078d0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3075  
bf469630552a39 Jie Gan          2024-11-06  3076  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3077  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3078  
bf469630552a39 Jie Gan          2024-11-06  3079  			in-ports {
bf469630552a39 Jie Gan          2024-11-06  3080  				port {
bf469630552a39 Jie Gan          2024-11-06  3081  					tpda_llm_gold_in: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3082  						remote-endpoint = <&tpdm_llm_gold_out>;
bf469630552a39 Jie Gan          2024-11-06  3083  					};
bf469630552a39 Jie Gan          2024-11-06  3084  				};
bf469630552a39 Jie Gan          2024-11-06  3085  			};
bf469630552a39 Jie Gan          2024-11-06  3086  
bf469630552a39 Jie Gan          2024-11-06  3087  			out-ports {
bf469630552a39 Jie Gan          2024-11-06  3088  				port {
bf469630552a39 Jie Gan          2024-11-06  3089  					tpda_llm_gold_out: endpoint {
bf469630552a39 Jie Gan          2024-11-06  3090  						remote-endpoint = <&funnel_apss_merg_in4>;
bf469630552a39 Jie Gan          2024-11-06  3091  					};
bf469630552a39 Jie Gan          2024-11-06  3092  				};
bf469630552a39 Jie Gan          2024-11-06  3093  			};
bf469630552a39 Jie Gan          2024-11-06  3094  		};
bf469630552a39 Jie Gan          2024-11-06  3095  
bf469630552a39 Jie Gan          2024-11-06  3096  		cti@78e0000 {
bf469630552a39 Jie Gan          2024-11-06  3097  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3098  			reg = <0x0 0x078e0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3099  
bf469630552a39 Jie Gan          2024-11-06  3100  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3101  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3102  		};
bf469630552a39 Jie Gan          2024-11-06  3103  
bf469630552a39 Jie Gan          2024-11-06  3104  		cti@78f0000 {
bf469630552a39 Jie Gan          2024-11-06  3105  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3106  			reg = <0x0 0x078f0000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3107  
bf469630552a39 Jie Gan          2024-11-06  3108  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3109  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3110  		};
bf469630552a39 Jie Gan          2024-11-06  3111  
bf469630552a39 Jie Gan          2024-11-06  3112  		cti@7900000 {
bf469630552a39 Jie Gan          2024-11-06  3113  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 Jie Gan          2024-11-06  3114  			reg = <0x0 0x07900000 0x0 0x1000>;
bf469630552a39 Jie Gan          2024-11-06  3115  
bf469630552a39 Jie Gan          2024-11-06  3116  			clocks = <&aoss_qmp>;
bf469630552a39 Jie Gan          2024-11-06  3117  			clock-names = "apb_pclk";
bf469630552a39 Jie Gan          2024-11-06  3118  		};
bf469630552a39 Jie Gan          2024-11-06  3119  
89fc83a9472812 Lijuan Gao       2024-12-18  3120  		pmu@90b6300 {
89fc83a9472812 Lijuan Gao       2024-12-18  3121  			compatible = "qcom,qcs615-cpu-bwmon", "qcom,sdm845-bwmon";
89fc83a9472812 Lijuan Gao       2024-12-18  3122  			reg = <0x0 0x090b6300 0x0 0x600>;
89fc83a9472812 Lijuan Gao       2024-12-18  3123  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 Lijuan Gao       2024-12-18  3124  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 Lijuan Gao       2024-12-18  3125  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 Lijuan Gao       2024-12-18  3126  
89fc83a9472812 Lijuan Gao       2024-12-18  3127  			operating-points-v2 = <&cpu_bwmon_opp_table>;
89fc83a9472812 Lijuan Gao       2024-12-18  3128  
89fc83a9472812 Lijuan Gao       2024-12-18  3129  			cpu_bwmon_opp_table: opp-table {
89fc83a9472812 Lijuan Gao       2024-12-18  3130  				compatible = "operating-points-v2";
89fc83a9472812 Lijuan Gao       2024-12-18  3131  
89fc83a9472812 Lijuan Gao       2024-12-18  3132  				opp-0 {
89fc83a9472812 Lijuan Gao       2024-12-18  3133  					opp-peak-kBps = <12896000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3134  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3135  
89fc83a9472812 Lijuan Gao       2024-12-18  3136  				opp-1 {
89fc83a9472812 Lijuan Gao       2024-12-18  3137  					opp-peak-kBps = <14928000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3138  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3139  			};
89fc83a9472812 Lijuan Gao       2024-12-18  3140  		};
89fc83a9472812 Lijuan Gao       2024-12-18  3141  
89fc83a9472812 Lijuan Gao       2024-12-18  3142  		pmu@90cd000 {
89fc83a9472812 Lijuan Gao       2024-12-18  3143  			compatible = "qcom,qcs615-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
89fc83a9472812 Lijuan Gao       2024-12-18  3144  			reg = <0x0 0x090cd000 0x0 0x1000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3145  			interrupts = <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 Lijuan Gao       2024-12-18  3146  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 Lijuan Gao       2024-12-18  3147  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 Lijuan Gao       2024-12-18  3148  
89fc83a9472812 Lijuan Gao       2024-12-18  3149  			operating-points-v2 = <&llcc_bwmon_opp_table>;
89fc83a9472812 Lijuan Gao       2024-12-18  3150  
89fc83a9472812 Lijuan Gao       2024-12-18  3151  			llcc_bwmon_opp_table: opp-table {
89fc83a9472812 Lijuan Gao       2024-12-18  3152  				compatible = "operating-points-v2";
89fc83a9472812 Lijuan Gao       2024-12-18  3153  
89fc83a9472812 Lijuan Gao       2024-12-18  3154  				opp-0 {
89fc83a9472812 Lijuan Gao       2024-12-18  3155  					opp-peak-kBps = <800000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3156  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3157  
89fc83a9472812 Lijuan Gao       2024-12-18  3158  				opp-1 {
89fc83a9472812 Lijuan Gao       2024-12-18  3159  					opp-peak-kBps = <1200000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3160  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3161  
89fc83a9472812 Lijuan Gao       2024-12-18  3162  				opp-2 {
89fc83a9472812 Lijuan Gao       2024-12-18  3163  					opp-peak-kBps = <1804800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3164  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3165  
89fc83a9472812 Lijuan Gao       2024-12-18  3166  				opp-3 {
89fc83a9472812 Lijuan Gao       2024-12-18  3167  					opp-peak-kBps = <2188800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3168  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3169  
89fc83a9472812 Lijuan Gao       2024-12-18  3170  				opp-4 {
89fc83a9472812 Lijuan Gao       2024-12-18  3171  					opp-peak-kBps = <2726400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3172  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3173  
89fc83a9472812 Lijuan Gao       2024-12-18  3174  				opp-5 {
89fc83a9472812 Lijuan Gao       2024-12-18  3175  					opp-peak-kBps = <3072000>;
89fc83a9472812 Lijuan Gao       2024-12-18  3176  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3177  
89fc83a9472812 Lijuan Gao       2024-12-18  3178  				opp-6 {
89fc83a9472812 Lijuan Gao       2024-12-18  3179  					opp-peak-kBps = <4070400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3180  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3181  
89fc83a9472812 Lijuan Gao       2024-12-18  3182  				opp-7 {
89fc83a9472812 Lijuan Gao       2024-12-18  3183  					opp-peak-kBps = <5414400>;
89fc83a9472812 Lijuan Gao       2024-12-18  3184  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3185  
89fc83a9472812 Lijuan Gao       2024-12-18  3186  				opp-8 {
89fc83a9472812 Lijuan Gao       2024-12-18  3187  					opp-peak-kBps = <6220800>;
89fc83a9472812 Lijuan Gao       2024-12-18  3188  				};
89fc83a9472812 Lijuan Gao       2024-12-18  3189  			};
89fc83a9472812 Lijuan Gao       2024-12-18  3190  		};
89fc83a9472812 Lijuan Gao       2024-12-18  3191  
8009de059f8693 Yuanjie Yang     2024-12-17  3192  		sdhc_2: mmc@8804000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3193  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 Yuanjie Yang     2024-12-17  3194  			reg = <0x0 0x08804000 0x0 0x1000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3195  			reg-names = "hc";
8009de059f8693 Yuanjie Yang     2024-12-17  3196  
8009de059f8693 Yuanjie Yang     2024-12-17  3197  			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 Yuanjie Yang     2024-12-17  3198  				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 Yuanjie Yang     2024-12-17  3199  			interrupt-names = "hc_irq",
8009de059f8693 Yuanjie Yang     2024-12-17  3200  					  "pwr_irq";
8009de059f8693 Yuanjie Yang     2024-12-17  3201  
8009de059f8693 Yuanjie Yang     2024-12-17  3202  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17  3203  				 <&gcc GCC_SDCC2_APPS_CLK>,
8009de059f8693 Yuanjie Yang     2024-12-17  3204  				 <&rpmhcc RPMH_CXO_CLK>;
8009de059f8693 Yuanjie Yang     2024-12-17  3205  			clock-names = "iface",
8009de059f8693 Yuanjie Yang     2024-12-17  3206  				      "core",
8009de059f8693 Yuanjie Yang     2024-12-17  3207  				      "xo";
8009de059f8693 Yuanjie Yang     2024-12-17  3208  
8009de059f8693 Yuanjie Yang     2024-12-17  3209  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 Yuanjie Yang     2024-12-17  3210  			operating-points-v2 = <&sdhc2_opp_table>;
8009de059f8693 Yuanjie Yang     2024-12-17  3211  			iommus = <&apps_smmu 0x02a0 0x0>;
8009de059f8693 Yuanjie Yang     2024-12-17  3212  			resets = <&gcc GCC_SDCC2_BCR>;
8009de059f8693 Yuanjie Yang     2024-12-17  3213  			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
8009de059f8693 Yuanjie Yang     2024-12-17  3214  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 Yuanjie Yang     2024-12-17  3215  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 Yuanjie Yang     2024-12-17  3216  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 Yuanjie Yang     2024-12-17  3217  			interconnect-names = "sdhc-ddr",
8009de059f8693 Yuanjie Yang     2024-12-17  3218  					     "cpu-sdhc";
8009de059f8693 Yuanjie Yang     2024-12-17  3219  
8009de059f8693 Yuanjie Yang     2024-12-17  3220  			qcom,dll-config = <0x0007642c>;
8009de059f8693 Yuanjie Yang     2024-12-17  3221  			qcom,ddr-config = <0x80040868>;
8009de059f8693 Yuanjie Yang     2024-12-17  3222  			dma-coherent;
8009de059f8693 Yuanjie Yang     2024-12-17  3223  
8009de059f8693 Yuanjie Yang     2024-12-17  3224  			status = "disabled";
8009de059f8693 Yuanjie Yang     2024-12-17  3225  
8009de059f8693 Yuanjie Yang     2024-12-17  3226  			sdhc2_opp_table: opp-table {
8009de059f8693 Yuanjie Yang     2024-12-17  3227  				compatible = "operating-points-v2";
8009de059f8693 Yuanjie Yang     2024-12-17  3228  
8009de059f8693 Yuanjie Yang     2024-12-17  3229  				opp-50000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3230  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3231  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17  3232  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3233  
8009de059f8693 Yuanjie Yang     2024-12-17  3234  				opp-100000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3235  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3236  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 Yuanjie Yang     2024-12-17  3237  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3238  
8009de059f8693 Yuanjie Yang     2024-12-17  3239  				opp-202000000 {
8009de059f8693 Yuanjie Yang     2024-12-17  3240  					opp-hz = /bits/ 64 <202000000>;
8009de059f8693 Yuanjie Yang     2024-12-17  3241  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 Yuanjie Yang     2024-12-17  3242  				};
8009de059f8693 Yuanjie Yang     2024-12-17  3243  			};
8009de059f8693 Yuanjie Yang     2024-12-17  3244  		};
8009de059f8693 Yuanjie Yang     2024-12-17  3245  
8e266654a2fe82 Lijuan Gao       2024-11-04  3246  		dc_noc: interconnect@9160000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3247  			reg = <0x0 0x09160000 0x0 0x3200>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3248  			compatible = "qcom,qcs615-dc-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3249  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3250  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3251  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3252  
29af58ab4d17f5 Song Xue         2024-10-31  3253  		llcc: system-cache-controller@9200000 {
29af58ab4d17f5 Song Xue         2024-10-31  3254  			compatible = "qcom,qcs615-llcc";
29af58ab4d17f5 Song Xue         2024-10-31  3255  			reg = <0x0 0x09200000 0x0 0x50000>,
29af58ab4d17f5 Song Xue         2024-10-31  3256  			      <0x0 0x09600000 0x0 0x50000>;
29af58ab4d17f5 Song Xue         2024-10-31  3257  			reg-names = "llcc0_base",
29af58ab4d17f5 Song Xue         2024-10-31  3258  				    "llcc_broadcast_base";
29af58ab4d17f5 Song Xue         2024-10-31  3259  		};
29af58ab4d17f5 Song Xue         2024-10-31  3260  
8e266654a2fe82 Lijuan Gao       2024-11-04  3261  		gem_noc: interconnect@9680000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3262  			reg = <0x0 0x09680000 0x0 0x3e200>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3263  			compatible = "qcom,qcs615-gem-noc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3264  			#interconnect-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3265  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3266  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3267  
8e266654a2fe82 Lijuan Gao       2024-11-04  3268  		pdc: interrupt-controller@b220000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3269  			compatible = "qcom,qcs615-pdc", "qcom,pdc";
8e266654a2fe82 Lijuan Gao       2024-11-04  3270  			reg = <0x0 0x0b220000 0x0 0x30000>,
8e266654a2fe82 Lijuan Gao       2024-11-04  3271  			      <0x0 0x17c000f0 0x0 0x64>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3272  			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3273  			interrupt-parent = <&intc>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3274  			#interrupt-cells = <2>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3275  			interrupt-controller;
8e266654a2fe82 Lijuan Gao       2024-11-04  3276  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3277  
bc09537f4745aa Konrad Dybcio    2025-03-06  3278  		aoss_qmp: power-management@c300000 {
0775021783b553 Kyle Deng        2024-10-18  3279  			compatible = "qcom,qcs615-aoss-qmp", "qcom,aoss-qmp";
0775021783b553 Kyle Deng        2024-10-18  3280  			reg = <0x0 0x0c300000 0x0 0x400>;
0775021783b553 Kyle Deng        2024-10-18  3281  			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
0775021783b553 Kyle Deng        2024-10-18  3282  			mboxes = <&apss_shared 0>;
0775021783b553 Kyle Deng        2024-10-18  3283  
0775021783b553 Kyle Deng        2024-10-18  3284  			#clock-cells = <0>;
0775021783b553 Kyle Deng        2024-10-18  3285  			#power-domain-cells = <1>;
0775021783b553 Kyle Deng        2024-10-18  3286  		};
0775021783b553 Kyle Deng        2024-10-18  3287  
8e266654a2fe82 Lijuan Gao       2024-11-04  3288  		sram@c3f0000 {
8e266654a2fe82 Lijuan Gao       2024-11-04  3289  			compatible = "qcom,rpmh-stats";
8e266654a2fe82 Lijuan Gao       2024-11-04  3290  			reg = <0x0 0x0c3f0000 0x0 0x400>;
8e266654a2fe82 Lijuan Gao       2024-11-04  3291  		};
8e266654a2fe82 Lijuan Gao       2024-11-04  3292  
d5bc480197ed80 Lijuan Gao       2025-05-16 @3293  		sram@146aa000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
