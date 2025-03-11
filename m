Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70C1F09AC
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Mar 2025 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741677751; cv=none; b=PKMRUJqLgAtqnI+lToLYKv6JYpX3UPvigbOlS+4G3xjEJg+ZkUd3uDdlkF33nqhORlL0KiRKfBITyy7n9/mUDragJVgPT/eruB1gPD6PtzxYEdG1vHSWrPwpZSteU64wKY+V9UIiw8pVgEzWgCrLf56DZNuR7Q1jZoillS/Sdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741677751; c=relaxed/simple;
	bh=TZWG9adiZNeiLGhwGizY0JV2Io4fA0vDR+QLR8wvkm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rREE1uyCrscS33gsGpN21URSMH/2w6YSEfJ2c1NeKyjbkiz2xT7yRBiI2owTGLYYiWCtOg/JywG0FNsHDLFlMBP+XIxmJf9mG/BRGG5zTMMKnmCE+38280LpcrFaEkBOLR1jLSgd3ixy4cETu4162yW8poogmIvVAxvL06W/7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ4vOIwr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ4vOIwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741677747; x=1773213747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZWG9adiZNeiLGhwGizY0JV2Io4fA0vDR+QLR8wvkm8=;
  b=gQ4vOIwrh+2M7u2XSpieJTWh5bnlViaU9rQGqmJIpVBVx3sCmrcTCMkr
   XPFmUKX6ehGyO7adhD7FaWvbTblD/ujyTxiaRaVEVadsjk+W7cp4cdR4m
   QtB5r6Yq38UXvgjRKx5DLHO/qst2czTTEPvuXEi5DPJqsLA+qvQqUtiMM
   0gOvhL0/5OCm1yzAbM8bBJmN+QxlJGdPm1zGTuQYz9/+e4bZIyLyL3PQH
   tZPRyoWJ7Ldp41DjAQYE5HlQ6D0JJqif50jwOFBuxjNuHvSK3hpie/hxc
   IKoSF1AuPsWBG++Ea0RUOFqloMHQssnGMcuJ5FBD7ZCzSHzt9Ftr2Faob
   Q==;
X-CSE-ConnectionGUID: awtTjUraT/OrRmpc5XMQfw==
X-CSE-MsgGUID: XzZwlRjhSnyAMd5oM7zoqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53329090"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="53329090"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 00:22:25 -0700
X-CSE-ConnectionGUID: 3z5pe1cQTy6hwRYJnHloVg==
X-CSE-MsgGUID: 0ba+sI9YQo+om6/rZFsqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="151031855"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2025 00:22:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trtwR-0006Ro-0N;
	Tue, 11 Mar 2025 07:22:20 +0000
Date: Tue, 11 Mar 2025 15:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: qcs615: enable pcie
Message-ID: <202503111445.VVGEEPRP-lkp@intel.com>
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
In-Reply-To: <20250310065613.151598-3-quic_ziyuzhan@quicinc.com>
References: <20250310065613.151598-3-quic_ziyuzhan@quicinc.com>
TO: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
TO: bhelgaas@google.com
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: dmitry.baryshkov@linaro.org
TO: neil.armstrong@linaro.org
TO: abel.vesa@linaro.org
CC: quic_ziyuzhan@quicinc.com
CC: quic_qianyu@quicinc.com
CC: quic_krichai@quicinc.com
CC: johan+linaro@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Ziyue,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c674aa7c289e51659e40dda0f954886ef7f80042]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyue-Zhang/dt-bindings-PCI-qcom-Document-the-QCS615-PCIe-Controller/20250310-145902
base:   c674aa7c289e51659e40dda0f954886ef7f80042
patch link:    https://lore.kernel.org/r/20250310065613.151598-3-quic_ziyuzhan%40quicinc.com
patch subject: [PATCH v3 2/4] arm64: dts: qcom: qcs615: enable pcie
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-003-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111445.VVGEEPRP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111445.VVGEEPRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503111445.VVGEEPRP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs615.dtsi:1050.3-1054.33: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Cell 12 is not a phandle(0)

vim +1050 arch/arm64/boot/dts/qcom/qcs615.dtsi

8e266654a2fe824 Lijuan Gao                2024-11-04    15  
8e266654a2fe824 Lijuan Gao                2024-11-04    16  / {
8e266654a2fe824 Lijuan Gao                2024-11-04    17  	interrupt-parent = <&intc>;
8e266654a2fe824 Lijuan Gao                2024-11-04    18  	#address-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    19  	#size-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    20  
8e266654a2fe824 Lijuan Gao                2024-11-04    21  	cpus {
8e266654a2fe824 Lijuan Gao                2024-11-04    22  		#address-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    23  		#size-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    24  
8e266654a2fe824 Lijuan Gao                2024-11-04    25  		cpu0: cpu@0 {
8e266654a2fe824 Lijuan Gao                2024-11-04    26  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04    27  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04    28  			reg = <0x0 0x0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    29  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04    30  			power-domains = <&cpu_pd0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    31  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11    32  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11    33  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    34  			next-level-cache = <&l2_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    35  			#cooling-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    36  
8e266654a2fe824 Lijuan Gao                2024-11-04    37  			l2_0: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04    38  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04    39  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    40  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04    41  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    42  			};
8e266654a2fe824 Lijuan Gao                2024-11-04    43  		};
8e266654a2fe824 Lijuan Gao                2024-11-04    44  
8e266654a2fe824 Lijuan Gao                2024-11-04    45  		cpu1: cpu@100 {
8e266654a2fe824 Lijuan Gao                2024-11-04    46  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04    47  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04    48  			reg = <0x0 0x100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    49  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04    50  			power-domains = <&cpu_pd1>;
8e266654a2fe824 Lijuan Gao                2024-11-04    51  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11    52  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11    53  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    54  			next-level-cache = <&l2_100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    55  
8e266654a2fe824 Lijuan Gao                2024-11-04    56  			l2_100: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04    57  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04    58  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    59  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04    60  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    61  			};
8e266654a2fe824 Lijuan Gao                2024-11-04    62  		};
8e266654a2fe824 Lijuan Gao                2024-11-04    63  
8e266654a2fe824 Lijuan Gao                2024-11-04    64  		cpu2: cpu@200 {
8e266654a2fe824 Lijuan Gao                2024-11-04    65  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04    66  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04    67  			reg = <0x0 0x200>;
8e266654a2fe824 Lijuan Gao                2024-11-04    68  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04    69  			power-domains = <&cpu_pd2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    70  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11    71  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11    72  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    73  			next-level-cache = <&l2_200>;
8e266654a2fe824 Lijuan Gao                2024-11-04    74  
8e266654a2fe824 Lijuan Gao                2024-11-04    75  			l2_200: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04    76  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04    77  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    78  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04    79  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    80  			};
8e266654a2fe824 Lijuan Gao                2024-11-04    81  		};
8e266654a2fe824 Lijuan Gao                2024-11-04    82  
8e266654a2fe824 Lijuan Gao                2024-11-04    83  		cpu3: cpu@300 {
8e266654a2fe824 Lijuan Gao                2024-11-04    84  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04    85  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04    86  			reg = <0x0 0x300>;
8e266654a2fe824 Lijuan Gao                2024-11-04    87  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04    88  			power-domains = <&cpu_pd3>;
8e266654a2fe824 Lijuan Gao                2024-11-04    89  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11    90  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11    91  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04    92  			next-level-cache = <&l2_300>;
8e266654a2fe824 Lijuan Gao                2024-11-04    93  
8e266654a2fe824 Lijuan Gao                2024-11-04    94  			l2_300: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04    95  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04    96  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04    97  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04    98  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04    99  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   100  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   101  
8e266654a2fe824 Lijuan Gao                2024-11-04   102  		cpu4: cpu@400 {
8e266654a2fe824 Lijuan Gao                2024-11-04   103  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04   104  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04   105  			reg = <0x0 0x400>;
8e266654a2fe824 Lijuan Gao                2024-11-04   106  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04   107  			power-domains = <&cpu_pd4>;
8e266654a2fe824 Lijuan Gao                2024-11-04   108  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11   109  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11   110  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04   111  			next-level-cache = <&l2_400>;
8e266654a2fe824 Lijuan Gao                2024-11-04   112  
8e266654a2fe824 Lijuan Gao                2024-11-04   113  			l2_400: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04   114  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04   115  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   116  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04   117  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   118  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   119  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   120  
8e266654a2fe824 Lijuan Gao                2024-11-04   121  		cpu5: cpu@500 {
8e266654a2fe824 Lijuan Gao                2024-11-04   122  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04   123  			compatible = "arm,cortex-a55";
8e266654a2fe824 Lijuan Gao                2024-11-04   124  			reg = <0x0 0x500>;
8e266654a2fe824 Lijuan Gao                2024-11-04   125  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04   126  			power-domains = <&cpu_pd5>;
8e266654a2fe824 Lijuan Gao                2024-11-04   127  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11   128  			capacity-dmips-mhz = <1024>;
82db707eb97d96f Lijuan Gao                2024-12-11   129  			dynamic-power-coefficient = <100>;
8e266654a2fe824 Lijuan Gao                2024-11-04   130  			next-level-cache = <&l2_500>;
8e266654a2fe824 Lijuan Gao                2024-11-04   131  
8e266654a2fe824 Lijuan Gao                2024-11-04   132  			l2_500: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04   133  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04   134  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   135  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04   136  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   137  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   138  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   139  
8e266654a2fe824 Lijuan Gao                2024-11-04   140  		cpu6: cpu@600 {
8e266654a2fe824 Lijuan Gao                2024-11-04   141  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04   142  			compatible = "arm,cortex-a76";
8e266654a2fe824 Lijuan Gao                2024-11-04   143  			reg = <0x0 0x600>;
8e266654a2fe824 Lijuan Gao                2024-11-04   144  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04   145  			power-domains = <&cpu_pd6>;
8e266654a2fe824 Lijuan Gao                2024-11-04   146  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11   147  			capacity-dmips-mhz = <1740>;
82db707eb97d96f Lijuan Gao                2024-12-11   148  			dynamic-power-coefficient = <404>;
8e266654a2fe824 Lijuan Gao                2024-11-04   149  			next-level-cache = <&l2_600>;
8e266654a2fe824 Lijuan Gao                2024-11-04   150  			#cooling-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   151  
8e266654a2fe824 Lijuan Gao                2024-11-04   152  			l2_600: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04   153  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04   154  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   155  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04   156  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   157  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   158  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   159  
8e266654a2fe824 Lijuan Gao                2024-11-04   160  		cpu7: cpu@700 {
8e266654a2fe824 Lijuan Gao                2024-11-04   161  			device_type = "cpu";
8e266654a2fe824 Lijuan Gao                2024-11-04   162  			compatible = "arm,cortex-a76";
8e266654a2fe824 Lijuan Gao                2024-11-04   163  			reg = <0x0 0x700>;
8e266654a2fe824 Lijuan Gao                2024-11-04   164  			enable-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04   165  			power-domains = <&cpu_pd7>;
8e266654a2fe824 Lijuan Gao                2024-11-04   166  			power-domain-names = "psci";
82db707eb97d96f Lijuan Gao                2024-12-11   167  			capacity-dmips-mhz = <1740>;
82db707eb97d96f Lijuan Gao                2024-12-11   168  			dynamic-power-coefficient = <404>;
8e266654a2fe824 Lijuan Gao                2024-11-04   169  			next-level-cache = <&l2_700>;
8e266654a2fe824 Lijuan Gao                2024-11-04   170  
8e266654a2fe824 Lijuan Gao                2024-11-04   171  			l2_700: l2-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04   172  			      compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04   173  			      cache-level = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   174  			      cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04   175  			      next-level-cache = <&l3_0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   176  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   177  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   178  
8e266654a2fe824 Lijuan Gao                2024-11-04   179  		cpu-map {
8e266654a2fe824 Lijuan Gao                2024-11-04   180  			cluster0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   181  				core0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   182  					cpu = <&cpu0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   183  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   184  
8e266654a2fe824 Lijuan Gao                2024-11-04   185  				core1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   186  					cpu = <&cpu1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   187  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   188  
8e266654a2fe824 Lijuan Gao                2024-11-04   189  				core2 {
8e266654a2fe824 Lijuan Gao                2024-11-04   190  					cpu = <&cpu2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   191  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   192  
8e266654a2fe824 Lijuan Gao                2024-11-04   193  				core3 {
8e266654a2fe824 Lijuan Gao                2024-11-04   194  					cpu = <&cpu3>;
8e266654a2fe824 Lijuan Gao                2024-11-04   195  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   196  
8e266654a2fe824 Lijuan Gao                2024-11-04   197  				core4 {
8e266654a2fe824 Lijuan Gao                2024-11-04   198  					cpu = <&cpu4>;
8e266654a2fe824 Lijuan Gao                2024-11-04   199  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   200  
8e266654a2fe824 Lijuan Gao                2024-11-04   201  				core5 {
8e266654a2fe824 Lijuan Gao                2024-11-04   202  					cpu = <&cpu5>;
8e266654a2fe824 Lijuan Gao                2024-11-04   203  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   204  
8e266654a2fe824 Lijuan Gao                2024-11-04   205  				core6 {
8e266654a2fe824 Lijuan Gao                2024-11-04   206  					cpu = <&cpu6>;
8e266654a2fe824 Lijuan Gao                2024-11-04   207  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   208  
8e266654a2fe824 Lijuan Gao                2024-11-04   209  				core7 {
8e266654a2fe824 Lijuan Gao                2024-11-04   210  					cpu = <&cpu7>;
8e266654a2fe824 Lijuan Gao                2024-11-04   211  				};
8e266654a2fe824 Lijuan Gao                2024-11-04   212  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   213  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   214  
8e266654a2fe824 Lijuan Gao                2024-11-04   215  		l3_0: l3-cache {
8e266654a2fe824 Lijuan Gao                2024-11-04   216  			compatible = "cache";
8e266654a2fe824 Lijuan Gao                2024-11-04   217  			cache-level = <3>;
8e266654a2fe824 Lijuan Gao                2024-11-04   218  			cache-unified;
8e266654a2fe824 Lijuan Gao                2024-11-04   219  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   220  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   221  
bf469630552a395 Jie Gan                   2024-11-06   222  	dummy_eud: dummy-sink {
bf469630552a395 Jie Gan                   2024-11-06   223  		compatible = "arm,coresight-dummy-sink";
bf469630552a395 Jie Gan                   2024-11-06   224  
bf469630552a395 Jie Gan                   2024-11-06   225  		in-ports {
bf469630552a395 Jie Gan                   2024-11-06   226  			port {
bf469630552a395 Jie Gan                   2024-11-06   227  				eud_in: endpoint {
bf469630552a395 Jie Gan                   2024-11-06   228  					remote-endpoint = <&replicator_swao_out1>;
bf469630552a395 Jie Gan                   2024-11-06   229  				};
bf469630552a395 Jie Gan                   2024-11-06   230  			};
bf469630552a395 Jie Gan                   2024-11-06   231  		};
bf469630552a395 Jie Gan                   2024-11-06   232  	};
bf469630552a395 Jie Gan                   2024-11-06   233  
8e266654a2fe824 Lijuan Gao                2024-11-04   234  	idle-states {
8e266654a2fe824 Lijuan Gao                2024-11-04   235  		entry-method = "psci";
8e266654a2fe824 Lijuan Gao                2024-11-04   236  
8e266654a2fe824 Lijuan Gao                2024-11-04   237  		little_cpu_sleep_0: cpu-sleep-0-0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   238  			compatible = "arm,idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   239  			idle-state-name = "silver-power-collapse";
8e266654a2fe824 Lijuan Gao                2024-11-04   240  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe824 Lijuan Gao                2024-11-04   241  			entry-latency-us = <549>;
8e266654a2fe824 Lijuan Gao                2024-11-04   242  			exit-latency-us = <901>;
8e266654a2fe824 Lijuan Gao                2024-11-04   243  			min-residency-us = <1774>;
8e266654a2fe824 Lijuan Gao                2024-11-04   244  			local-timer-stop;
8e266654a2fe824 Lijuan Gao                2024-11-04   245  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   246  
8e266654a2fe824 Lijuan Gao                2024-11-04   247  		little_cpu_sleep_1: cpu-sleep-0-1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   248  			compatible = "arm,idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   249  			idle-state-name = "silver-rail-power-collapse";
8e266654a2fe824 Lijuan Gao                2024-11-04   250  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe824 Lijuan Gao                2024-11-04   251  			entry-latency-us = <702>;
8e266654a2fe824 Lijuan Gao                2024-11-04   252  			exit-latency-us = <915>;
8e266654a2fe824 Lijuan Gao                2024-11-04   253  			min-residency-us = <4001>;
8e266654a2fe824 Lijuan Gao                2024-11-04   254  			local-timer-stop;
8e266654a2fe824 Lijuan Gao                2024-11-04   255  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   256  
8e266654a2fe824 Lijuan Gao                2024-11-04   257  		big_cpu_sleep_0: cpu-sleep-1-0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   258  			compatible = "arm,idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   259  			idle-state-name = "gold-power-collapse";
8e266654a2fe824 Lijuan Gao                2024-11-04   260  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe824 Lijuan Gao                2024-11-04   261  			entry-latency-us = <523>;
8e266654a2fe824 Lijuan Gao                2024-11-04   262  			exit-latency-us = <1244>;
8e266654a2fe824 Lijuan Gao                2024-11-04   263  			min-residency-us = <2207>;
8e266654a2fe824 Lijuan Gao                2024-11-04   264  			local-timer-stop;
8e266654a2fe824 Lijuan Gao                2024-11-04   265  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   266  
8e266654a2fe824 Lijuan Gao                2024-11-04   267  		big_cpu_sleep_1: cpu-sleep-1-1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   268  			compatible = "arm,idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   269  			idle-state-name = "gold-rail-power-collapse";
8e266654a2fe824 Lijuan Gao                2024-11-04   270  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe824 Lijuan Gao                2024-11-04   271  			entry-latency-us = <526>;
8e266654a2fe824 Lijuan Gao                2024-11-04   272  			exit-latency-us = <1854>;
8e266654a2fe824 Lijuan Gao                2024-11-04   273  			min-residency-us = <5555>;
8e266654a2fe824 Lijuan Gao                2024-11-04   274  			local-timer-stop;
8e266654a2fe824 Lijuan Gao                2024-11-04   275  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   276  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   277  
8e266654a2fe824 Lijuan Gao                2024-11-04   278  	domain-idle-states {
8e266654a2fe824 Lijuan Gao                2024-11-04   279  		cluster_sleep_0: cluster-sleep-0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   280  			compatible = "domain-idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   281  			arm,psci-suspend-param = <0x41000044>;
8e266654a2fe824 Lijuan Gao                2024-11-04   282  			entry-latency-us = <2752>;
8e266654a2fe824 Lijuan Gao                2024-11-04   283  			exit-latency-us = <3048>;
8e266654a2fe824 Lijuan Gao                2024-11-04   284  			min-residency-us = <6118>;
8e266654a2fe824 Lijuan Gao                2024-11-04   285  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   286  
8e266654a2fe824 Lijuan Gao                2024-11-04   287  		cluster_sleep_1: cluster-sleep-1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   288  			compatible = "domain-idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   289  			arm,psci-suspend-param = <0x41001344>;
8e266654a2fe824 Lijuan Gao                2024-11-04   290  			entry-latency-us = <3263>;
8e266654a2fe824 Lijuan Gao                2024-11-04   291  			exit-latency-us = <4562>;
8e266654a2fe824 Lijuan Gao                2024-11-04   292  			min-residency-us = <8467>;
8e266654a2fe824 Lijuan Gao                2024-11-04   293  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   294  
8e266654a2fe824 Lijuan Gao                2024-11-04   295  		cluster_sleep_2: cluster-sleep-2 {
8e266654a2fe824 Lijuan Gao                2024-11-04   296  			compatible = "domain-idle-state";
8e266654a2fe824 Lijuan Gao                2024-11-04   297  			arm,psci-suspend-param = <0x4100b344>;
8e266654a2fe824 Lijuan Gao                2024-11-04   298  			entry-latency-us = <3638>;
8e266654a2fe824 Lijuan Gao                2024-11-04   299  			exit-latency-us = <6562>;
8e266654a2fe824 Lijuan Gao                2024-11-04   300  			min-residency-us = <9826>;
8e266654a2fe824 Lijuan Gao                2024-11-04   301  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   302  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   303  
8e266654a2fe824 Lijuan Gao                2024-11-04   304  	memory@80000000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   305  		device_type = "memory";
8e266654a2fe824 Lijuan Gao                2024-11-04   306  		/* We expect the bootloader to fill in the size */
8e266654a2fe824 Lijuan Gao                2024-11-04   307  		reg = <0 0x80000000 0 0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   308  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   309  
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   310  	firmware {
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   311  		scm {
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   312  			compatible = "qcom,scm-qcs615", "qcom,scm";
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   313  			qcom,dload-mode = <&tcsr 0x13000>;
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   314  		};
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   315  	};
8c7f9d73de1bdb7 Qingqing Zhou             2024-11-05   316  
8e266654a2fe824 Lijuan Gao                2024-11-04   317  	camnoc_virt: interconnect-0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   318  		compatible = "qcom,qcs615-camnoc-virt";
8e266654a2fe824 Lijuan Gao                2024-11-04   319  		#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   320  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   321  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   322  
8e266654a2fe824 Lijuan Gao                2024-11-04   323  	ipa_virt: interconnect-1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   324  		compatible = "qcom,qcs615-ipa-virt";
8e266654a2fe824 Lijuan Gao                2024-11-04   325  		#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   326  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   327  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   328  
8e266654a2fe824 Lijuan Gao                2024-11-04   329  	mc_virt: interconnect-2 {
8e266654a2fe824 Lijuan Gao                2024-11-04   330  		compatible = "qcom,qcs615-mc-virt";
8e266654a2fe824 Lijuan Gao                2024-11-04   331  		#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   332  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   333  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   334  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   335  	qup_opp_table: opp-table-qup {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   336  		compatible = "operating-points-v2";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   337  		opp-shared;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   338  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   339  		opp-75000000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   340  			opp-hz = /bits/ 64 <75000000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   341  			required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   342  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   343  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   344  		opp-100000000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   345  			opp-hz = /bits/ 64 <100000000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   346  			required-opps = <&rpmhpd_opp_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   347  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   348  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   349  		opp-128000000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   350  			opp-hz = /bits/ 64 <128000000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   351  			required-opps = <&rpmhpd_opp_nom>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   352  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   353  	};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   354  
8e266654a2fe824 Lijuan Gao                2024-11-04   355  	psci {
8e266654a2fe824 Lijuan Gao                2024-11-04   356  		compatible = "arm,psci-1.0";
8e266654a2fe824 Lijuan Gao                2024-11-04   357  		method = "smc";
8e266654a2fe824 Lijuan Gao                2024-11-04   358  
8e266654a2fe824 Lijuan Gao                2024-11-04   359  		cpu_pd0: power-domain-cpu0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   360  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   361  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   362  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   363  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   364  
8e266654a2fe824 Lijuan Gao                2024-11-04   365  		cpu_pd1: power-domain-cpu1 {
8e266654a2fe824 Lijuan Gao                2024-11-04   366  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   367  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   368  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   369  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   370  
8e266654a2fe824 Lijuan Gao                2024-11-04   371  		cpu_pd2: power-domain-cpu2 {
8e266654a2fe824 Lijuan Gao                2024-11-04   372  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   373  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   374  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   375  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   376  
8e266654a2fe824 Lijuan Gao                2024-11-04   377  		cpu_pd3: power-domain-cpu3 {
8e266654a2fe824 Lijuan Gao                2024-11-04   378  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   379  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   380  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   381  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   382  
8e266654a2fe824 Lijuan Gao                2024-11-04   383  		cpu_pd4: power-domain-cpu4 {
8e266654a2fe824 Lijuan Gao                2024-11-04   384  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   385  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   386  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   387  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   388  
8e266654a2fe824 Lijuan Gao                2024-11-04   389  		cpu_pd5: power-domain-cpu5 {
8e266654a2fe824 Lijuan Gao                2024-11-04   390  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   391  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   392  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   393  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   394  
8e266654a2fe824 Lijuan Gao                2024-11-04   395  		cpu_pd6: power-domain-cpu6 {
8e266654a2fe824 Lijuan Gao                2024-11-04   396  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   397  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   398  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   399  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   400  
8e266654a2fe824 Lijuan Gao                2024-11-04   401  		cpu_pd7: power-domain-cpu7 {
8e266654a2fe824 Lijuan Gao                2024-11-04   402  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   403  			power-domains = <&cluster_pd>;
8e266654a2fe824 Lijuan Gao                2024-11-04   404  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   405  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   406  
8e266654a2fe824 Lijuan Gao                2024-11-04   407  		cluster_pd: power-domain-cluster {
8e266654a2fe824 Lijuan Gao                2024-11-04   408  			#power-domain-cells = <0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   409  			domain-idle-states = <&cluster_sleep_0
8e266654a2fe824 Lijuan Gao                2024-11-04   410  					      &cluster_sleep_1
8e266654a2fe824 Lijuan Gao                2024-11-04   411  					      &cluster_sleep_2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   412  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   413  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   414  
8e266654a2fe824 Lijuan Gao                2024-11-04   415  	reserved-memory {
8e266654a2fe824 Lijuan Gao                2024-11-04   416  		#address-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   417  		#size-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   418  		ranges;
8e266654a2fe824 Lijuan Gao                2024-11-04   419  
8e266654a2fe824 Lijuan Gao                2024-11-04   420  		smem_region: smem@86000000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   421  			compatible = "qcom,smem";
8e266654a2fe824 Lijuan Gao                2024-11-04   422  			reg = <0x0 0x86000000 0x0 0x200000>;
8e266654a2fe824 Lijuan Gao                2024-11-04   423  			no-map;
8e266654a2fe824 Lijuan Gao                2024-11-04   424  			hwlocks = <&tcsr_mutex 3>;
8e266654a2fe824 Lijuan Gao                2024-11-04   425  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   426  	};
8e266654a2fe824 Lijuan Gao                2024-11-04   427  
8e266654a2fe824 Lijuan Gao                2024-11-04   428  	soc: soc@0 {
8e266654a2fe824 Lijuan Gao                2024-11-04   429  		compatible = "simple-bus";
8e266654a2fe824 Lijuan Gao                2024-11-04   430  		ranges = <0 0 0 0 0x10 0>;
58241be90050e53 Qingqing Zhou             2024-11-05   431  		dma-ranges = <0 0 0 0 0x10 0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   432  		#address-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   433  		#size-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   434  
8e266654a2fe824 Lijuan Gao                2024-11-04   435  		gcc: clock-controller@100000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   436  			compatible = "qcom,qcs615-gcc";
8e266654a2fe824 Lijuan Gao                2024-11-04   437  			reg = <0 0x00100000 0 0x1f0000>;
8e266654a2fe824 Lijuan Gao                2024-11-04   438  
8e266654a2fe824 Lijuan Gao                2024-11-04   439  			#clock-cells = <1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   440  			#reset-cells = <1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   441  			#power-domain-cells = <1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   442  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   443  
8e266654a2fe824 Lijuan Gao                2024-11-04   444  		qfprom: efuse@780000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   445  			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
8e266654a2fe824 Lijuan Gao                2024-11-04   446  			reg = <0x0 0x00780000 0x0 0x7000>;
8e266654a2fe824 Lijuan Gao                2024-11-04   447  			#address-cells = <1>;
8e266654a2fe824 Lijuan Gao                2024-11-04   448  			#size-cells = <1>;
4b2769c7d7ce47a Krishna Kurapati          2024-11-21   449  
4b2769c7d7ce47a Krishna Kurapati          2024-11-21   450  			qusb2_hstx_trim: hstx-trim@1f8 {
4b2769c7d7ce47a Krishna Kurapati          2024-11-21   451  				reg = <0x1fb 0x1>;
4b2769c7d7ce47a Krishna Kurapati          2024-11-21   452  				bits = <1 4>;
4b2769c7d7ce47a Krishna Kurapati          2024-11-21   453  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   454  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   455  
8009de059f86931 Yuanjie Yang              2024-12-17   456  		sdhc_1: mmc@7c4000 {
8009de059f86931 Yuanjie Yang              2024-12-17   457  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f86931 Yuanjie Yang              2024-12-17   458  			reg = <0x0 0x007c4000 0x0 0x1000>,
8009de059f86931 Yuanjie Yang              2024-12-17   459  			      <0x0 0x007c5000 0x0 0x1000>,
8009de059f86931 Yuanjie Yang              2024-12-17   460  			      <0x0 0x007c8000 0x0 0x8000>;
8009de059f86931 Yuanjie Yang              2024-12-17   461  			reg-names = "hc",
8009de059f86931 Yuanjie Yang              2024-12-17   462  				    "cqhci",
8009de059f86931 Yuanjie Yang              2024-12-17   463  				    "ice";
8009de059f86931 Yuanjie Yang              2024-12-17   464  
8009de059f86931 Yuanjie Yang              2024-12-17   465  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
8009de059f86931 Yuanjie Yang              2024-12-17   466  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
8009de059f86931 Yuanjie Yang              2024-12-17   467  			interrupt-names = "hc_irq",
8009de059f86931 Yuanjie Yang              2024-12-17   468  					  "pwr_irq";
8009de059f86931 Yuanjie Yang              2024-12-17   469  
8009de059f86931 Yuanjie Yang              2024-12-17   470  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
8009de059f86931 Yuanjie Yang              2024-12-17   471  				 <&gcc GCC_SDCC1_APPS_CLK>,
8009de059f86931 Yuanjie Yang              2024-12-17   472  				 <&rpmhcc RPMH_CXO_CLK>,
8009de059f86931 Yuanjie Yang              2024-12-17   473  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
8009de059f86931 Yuanjie Yang              2024-12-17   474  			clock-names = "iface",
8009de059f86931 Yuanjie Yang              2024-12-17   475  				      "core",
8009de059f86931 Yuanjie Yang              2024-12-17   476  				      "xo",
8009de059f86931 Yuanjie Yang              2024-12-17   477  				      "ice";
8009de059f86931 Yuanjie Yang              2024-12-17   478  
8009de059f86931 Yuanjie Yang              2024-12-17   479  			resets = <&gcc GCC_SDCC1_BCR>;
8009de059f86931 Yuanjie Yang              2024-12-17   480  
8009de059f86931 Yuanjie Yang              2024-12-17   481  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f86931 Yuanjie Yang              2024-12-17   482  			operating-points-v2 = <&sdhc1_opp_table>;
8009de059f86931 Yuanjie Yang              2024-12-17   483  			iommus = <&apps_smmu 0x02c0 0x0>;
8009de059f86931 Yuanjie Yang              2024-12-17   484  			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
8009de059f86931 Yuanjie Yang              2024-12-17   485  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f86931 Yuanjie Yang              2024-12-17   486  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f86931 Yuanjie Yang              2024-12-17   487  					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f86931 Yuanjie Yang              2024-12-17   488  			interconnect-names = "sdhc-ddr",
8009de059f86931 Yuanjie Yang              2024-12-17   489  					     "cpu-sdhc";
8009de059f86931 Yuanjie Yang              2024-12-17   490  
8009de059f86931 Yuanjie Yang              2024-12-17   491  			qcom,dll-config = <0x000f642c>;
8009de059f86931 Yuanjie Yang              2024-12-17   492  			qcom,ddr-config = <0x80040868>;
8009de059f86931 Yuanjie Yang              2024-12-17   493  			supports-cqe;
8009de059f86931 Yuanjie Yang              2024-12-17   494  			dma-coherent;
8009de059f86931 Yuanjie Yang              2024-12-17   495  
8009de059f86931 Yuanjie Yang              2024-12-17   496  			status = "disabled";
8009de059f86931 Yuanjie Yang              2024-12-17   497  
8009de059f86931 Yuanjie Yang              2024-12-17   498  			sdhc1_opp_table: opp-table {
8009de059f86931 Yuanjie Yang              2024-12-17   499  				compatible = "operating-points-v2";
8009de059f86931 Yuanjie Yang              2024-12-17   500  
8009de059f86931 Yuanjie Yang              2024-12-17   501  				opp-50000000 {
8009de059f86931 Yuanjie Yang              2024-12-17   502  					opp-hz = /bits/ 64 <50000000>;
8009de059f86931 Yuanjie Yang              2024-12-17   503  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f86931 Yuanjie Yang              2024-12-17   504  				};
8009de059f86931 Yuanjie Yang              2024-12-17   505  
8009de059f86931 Yuanjie Yang              2024-12-17   506  				opp-100000000 {
8009de059f86931 Yuanjie Yang              2024-12-17   507  					opp-hz = /bits/ 64 <100000000>;
8009de059f86931 Yuanjie Yang              2024-12-17   508  					required-opps = <&rpmhpd_opp_svs>;
8009de059f86931 Yuanjie Yang              2024-12-17   509  				};
8009de059f86931 Yuanjie Yang              2024-12-17   510  
8009de059f86931 Yuanjie Yang              2024-12-17   511  				opp-200000000 {
8009de059f86931 Yuanjie Yang              2024-12-17   512  					opp-hz = /bits/ 64 <200000000>;
8009de059f86931 Yuanjie Yang              2024-12-17   513  					required-opps = <&rpmhpd_opp_svs_l1>;
8009de059f86931 Yuanjie Yang              2024-12-17   514  				};
8009de059f86931 Yuanjie Yang              2024-12-17   515  
8009de059f86931 Yuanjie Yang              2024-12-17   516  				opp-384000000 {
8009de059f86931 Yuanjie Yang              2024-12-17   517  					opp-hz = /bits/ 64 <384000000>;
8009de059f86931 Yuanjie Yang              2024-12-17   518  					required-opps = <&rpmhpd_opp_nom>;
8009de059f86931 Yuanjie Yang              2024-12-17   519  				};
8009de059f86931 Yuanjie Yang              2024-12-17   520  			};
8009de059f86931 Yuanjie Yang              2024-12-17   521  		};
8009de059f86931 Yuanjie Yang              2024-12-17   522  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   523  		gpi_dma0: dma-controller@800000  {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   524  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   525  			reg = <0x0 0x800000 0x0 0x60000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   526  			#dma-cells = <3>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   527  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   528  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   529  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   530  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   531  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   532  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   533  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   534  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   535  			dma-channels = <8>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   536  			dma-channel-mask = <0xf>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   537  			iommus = <&apps_smmu 0xd6 0x0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   538  			status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   539  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   540  
8e266654a2fe824 Lijuan Gao                2024-11-04   541  		qupv3_id_0: geniqup@8c0000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   542  			compatible = "qcom,geni-se-qup";
8e266654a2fe824 Lijuan Gao                2024-11-04   543  			reg = <0x0 0x008c0000 0x0 0x6000>;
8e266654a2fe824 Lijuan Gao                2024-11-04   544  			ranges;
8e266654a2fe824 Lijuan Gao                2024-11-04   545  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
8e266654a2fe824 Lijuan Gao                2024-11-04   546  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
8e266654a2fe824 Lijuan Gao                2024-11-04   547  			clock-names = "m-ahb",
8e266654a2fe824 Lijuan Gao                2024-11-04   548  				      "s-ahb";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   549  			iommus = <&apps_smmu 0xc3 0x0>;
8e266654a2fe824 Lijuan Gao                2024-11-04   550  			#address-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   551  			#size-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   552  			status = "disabled";
8e266654a2fe824 Lijuan Gao                2024-11-04   553  
8e266654a2fe824 Lijuan Gao                2024-11-04   554  			uart0: serial@880000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   555  				compatible = "qcom,geni-debug-uart";
8e266654a2fe824 Lijuan Gao                2024-11-04   556  				reg = <0x0 0x00880000 0x0 0x4000>;
8e266654a2fe824 Lijuan Gao                2024-11-04   557  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
8e266654a2fe824 Lijuan Gao                2024-11-04   558  				clock-names = "se";
8e266654a2fe824 Lijuan Gao                2024-11-04   559  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
8e266654a2fe824 Lijuan Gao                2024-11-04   560  				pinctrl-names = "default";
8e266654a2fe824 Lijuan Gao                2024-11-04   561  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   562  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   563  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   564  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   565  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   566  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   567  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   568  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   569  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   570  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   571  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   572  			i2c1: i2c@884000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   573  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   574  				reg = <0x0 0x884000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   575  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   576  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   577  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   578  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   579  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   580  				pinctrl-0 = <&qup_i2c1_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   581  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   582  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   583  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   584  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   585  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   586  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   587  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   588  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   589  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   590  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   591  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   592  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   593  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   594  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   595  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   596  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   597  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   598  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   599  			i2c2: i2c@888000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   600  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   601  				reg = <0x0 0x888000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   602  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   603  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   604  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   605  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   606  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   607  				pinctrl-0 = <&qup_i2c2_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   608  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   609  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   610  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   611  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   612  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   613  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   614  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   615  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   616  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   617  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   618  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   619  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   620  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   621  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   622  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   623  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   624  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   625  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   626  			spi2: spi@888000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   627  				compatible = "qcom,geni-spi";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   628  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   629  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   630  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   631  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   632  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   633  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   634  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   635  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   636  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   637  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   638  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   639  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   640  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   641  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   642  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   643  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   644  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   645  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   646  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   647  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   648  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   649  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   650  			uart2: serial@888000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   651  				compatible = "qcom,geni-uart";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   652  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   653  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   654  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   655  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   656  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   657  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   658  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   659  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   660  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   661  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   662  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   663  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   664  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   665  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   666  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   667  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   668  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   669  			i2c3: i2c@88c000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   670  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   671  				reg = <0x0 0x88c000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   672  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   673  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   674  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   675  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   676  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   677  				pinctrl-0 = <&qup_i2c3_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   678  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   679  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   680  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   681  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   682  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   683  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   684  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   685  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   686  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   687  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   688  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   689  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   690  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   691  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   692  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   693  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   694  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   695  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   696  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   697  		gpi_dma1: dma-controller@a00000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   698  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   699  			reg = <0x0 0xa00000 0x0 0x60000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   700  			#dma-cells = <3>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   701  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   702  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   703  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   704  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   705  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   706  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   707  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   708  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   709  			dma-channels = <8>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   710  			dma-channel-mask = <0xf>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   711  			iommus = <&apps_smmu 0x376 0x0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   712  			status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   713  		};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   714  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   715  		qupv3_id_1: geniqup@ac0000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   716  			compatible = "qcom,geni-se-qup";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   717  			reg = <0x0 0xac0000 0x0 0x2000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   718  			ranges;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   719  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   720  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   721  			clock-names = "m-ahb",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   722  				      "s-ahb";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   723  			iommus = <&apps_smmu 0x363 0x0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   724  			#address-cells = <2>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   725  			#size-cells = <2>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   726  			status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   727  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   728  			i2c4: i2c@a80000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   729  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   730  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   731  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   732  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   733  				pinctrl-0 = <&qup_i2c4_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   734  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   735  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   736  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   737  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   738  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   739  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   740  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   741  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   742  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   743  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   744  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   745  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   746  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   747  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   748  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   749  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   750  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   751  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   752  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   753  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   754  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   755  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   756  			spi4: spi@a80000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   757  				compatible = "qcom,geni-spi";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   758  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   759  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   760  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   761  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   762  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   763  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   764  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   765  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   766  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   767  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   768  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   769  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   770  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   771  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   772  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   773  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   774  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   775  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   776  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   777  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   778  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   779  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   780  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   781  			uart4: serial@a80000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   782  				compatible = "qcom,geni-uart";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   783  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   784  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   785  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   786  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   787  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   788  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   789  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   790  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   791  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   792  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   793  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   794  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   795  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   796  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   797  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   798  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   799  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   800  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   801  			i2c5: i2c@a84000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   802  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   803  				reg = <0x0 0xa84000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   804  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   805  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   806  				pinctrl-0 = <&qup_i2c5_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   807  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   808  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   809  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   810  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   811  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   812  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   813  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   814  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   815  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   816  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   817  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   818  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   819  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   820  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   821  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   822  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   823  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   824  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   825  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   826  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   827  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   828  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   829  			i2c6: i2c@a88000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   830  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   831  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   832  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   833  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   834  				pinctrl-0 = <&qup_i2c6_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   835  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   836  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   837  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   838  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   839  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   840  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   841  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   842  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   843  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   844  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   845  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   846  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   847  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   848  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   849  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   850  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   851  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   852  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   853  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   854  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   855  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   856  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   857  			spi6: spi@a88000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   858  				compatible = "qcom,geni-spi";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   859  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   860  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   861  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   862  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   863  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   864  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   865  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   866  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   867  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   868  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   869  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   870  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   871  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   872  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   873  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   874  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   875  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   876  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   877  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   878  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   879  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   880  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   881  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   882  			uart6: serial@a88000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   883  				compatible = "qcom,geni-uart";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   884  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   885  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   886  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   887  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   888  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   889  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   890  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   891  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   892  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   893  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   894  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   895  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   896  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   897  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   898  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   899  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   900  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   901  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   902  			i2c7: i2c@a8c000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   903  				compatible = "qcom,geni-i2c";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   904  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   905  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   906  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   907  				pinctrl-0 = <&qup_i2c7_data_clk>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   908  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   909  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   910  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   911  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   912  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   913  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   914  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   915  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   916  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   917  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   918  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   919  						     "qup-config",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   920  						     "qup-memory";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   921  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   922  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   923  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   924  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   925  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   926  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   927  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   928  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   929  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   930  			spi7: spi@a8c000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   931  				compatible = "qcom,geni-spi";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   932  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   933  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   934  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   935  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   936  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   937  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   938  				#address-cells = <1>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   939  				#size-cells = <0>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   940  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   941  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   942  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   943  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
8e266654a2fe824 Lijuan Gao                2024-11-04   944  				interconnect-names = "qup-core",
8e266654a2fe824 Lijuan Gao                2024-11-04   945  						     "qup-config";
8e266654a2fe824 Lijuan Gao                2024-11-04   946  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   947  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   948  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   949  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   950  				dma-names = "tx",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   951  					    "rx";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   952  				status = "disabled";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   953  			};
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   954  
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   955  			uart7: serial@a8c000 {
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   956  				compatible = "qcom,geni-uart";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   957  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   958  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   959  				clock-names = "se";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   960  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   961  					    <&qup_uart7_tx>, <&qup_uart7_rx>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   962  				pinctrl-names = "default";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   963  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   964  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   965  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   966  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   967  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   968  				interconnect-names = "qup-core",
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   969  						     "qup-config";
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   970  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379eaa Viken Dadhaniya           2024-11-15   971  				operating-points-v2 = <&qup_opp_table>;
8e266654a2fe824 Lijuan Gao                2024-11-04   972  				status = "disabled";
8e266654a2fe824 Lijuan Gao                2024-11-04   973  			};
8e266654a2fe824 Lijuan Gao                2024-11-04   974  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   975  
8e266654a2fe824 Lijuan Gao                2024-11-04   976  		config_noc: interconnect@1500000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   977  			reg = <0x0 0x01500000 0x0 0x5080>;
8e266654a2fe824 Lijuan Gao                2024-11-04   978  			compatible = "qcom,qcs615-config-noc";
8e266654a2fe824 Lijuan Gao                2024-11-04   979  			#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   980  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   981  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   982  
8e266654a2fe824 Lijuan Gao                2024-11-04   983  		system_noc: interconnect@1620000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   984  			reg = <0x0 0x01620000 0x0 0x1f300>;
8e266654a2fe824 Lijuan Gao                2024-11-04   985  			compatible = "qcom,qcs615-system-noc";
8e266654a2fe824 Lijuan Gao                2024-11-04   986  			#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   987  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   988  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   989  
8e266654a2fe824 Lijuan Gao                2024-11-04   990  		aggre1_noc: interconnect@1700000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   991  			reg = <0x0 0x01700000 0x0 0x3f200>;
8e266654a2fe824 Lijuan Gao                2024-11-04   992  			compatible = "qcom,qcs615-aggre1-noc";
8e266654a2fe824 Lijuan Gao                2024-11-04   993  			#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04   994  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04   995  		};
8e266654a2fe824 Lijuan Gao                2024-11-04   996  
8e266654a2fe824 Lijuan Gao                2024-11-04   997  		mmss_noc: interconnect@1740000 {
8e266654a2fe824 Lijuan Gao                2024-11-04   998  			reg = <0x0 0x01740000 0x0 0x1c100>;
8e266654a2fe824 Lijuan Gao                2024-11-04   999  			compatible = "qcom,qcs615-mmss-noc";
8e266654a2fe824 Lijuan Gao                2024-11-04  1000  			#interconnect-cells = <2>;
8e266654a2fe824 Lijuan Gao                2024-11-04  1001  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe824 Lijuan Gao                2024-11-04  1002  		};
8e266654a2fe824 Lijuan Gao                2024-11-04  1003  
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1004  	pcie: pcie@1c08000 {
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1005  		device_type = "pci";
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1006  		compatible = "qcom,pcie-sm8550", "qcom,qcs615-pcie";
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1007  		reg = <0x0 0x01c08000 0x0 0x3000>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1008  		      <0x0 0x40000000 0x0 0xf1d>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1009  		      <0x0 0x40000f20 0x0 0xa8>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1010  		      <0x0 0x40001000 0x0 0x1000>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1011  		      <0x0 0x40100000 0x0 0x100000>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1012  		      <0x0 0x01c0b000 0x0 0x1000>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1013  		reg-names = "parf",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1014  			    "dbi",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1015  			    "elbi",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1016  			    "atu",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1017  			    "config",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1018  			    "mhi";
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1019  		#address-cells = <3>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1020  		#size-cells = <2>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1021  		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1022  			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1023  		bus-range = <0x00 0xff>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1024  
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1025  		dma-coherent;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1026  
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1027  		linux,pci-domain = <0>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1028  		num-lanes = <1>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1029  
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1030  		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1031  			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1032  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1033  			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1034  			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1035  			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1036  			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1037  			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1038  		interrupt-names = "msi0",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1039  				  "msi1",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1040  				  "msi2",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1041  				  "msi3",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1042  				  "msi4",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1043  				  "msi5",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1044  				  "msi6",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1045  				  "msi7",
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1046  				  "global";
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1047  
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1048  		#interrupt-cells = <1>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10  1049  		interrupt-map-mask = <0 0 0 0x7>;
09e34e7770a6520 Krishna chaitanya chundru 2025-03-10 @1050  		interrupt-map = <0 0 0 0 &intc 0 0 0 140 IRQ_TYPE_LEVEL_HIGH>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
