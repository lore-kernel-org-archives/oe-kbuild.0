Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B762128E7
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756274914; cv=none; b=ouhdJckImhTW24YAYX4x/VFDYHrsNphEyONM/Mw8Crab2oVp6GKrlyIRyMyizWVNSG95ivSbsMEPnK20vyN3E8JRaCROct+7y1/jVGQkGCKSTw/nuFP0Wv2kekWVeoZOZ83Nt85lxuf45hTDeMZP/5qPogW2KT7nrftlKiaarXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756274914; c=relaxed/simple;
	bh=JZXBMoiikTHCtla0Jj9Py25seXqfhCUFlrXXJVXOTpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ic1QhHYjOgiSZzW1Ed2fkBuQPUlqjb8IZDvgQJXIq6TJdRQzlwRRqVz205i8dj9O+NiRNriJ9DQOj5EUQcFv0Nnj7eezP9A6VnEb3B5enWm8W6GxBJO3LGJJU7A+CGlOxkbVgSo6YywwQ5Tf3Gqh8lISIviTQh+pkeREh7BUe4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx7qyHSG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx7qyHSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756274907; x=1787810907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZXBMoiikTHCtla0Jj9Py25seXqfhCUFlrXXJVXOTpo=;
  b=jx7qyHSGP0jI1QCqbovaqGG1UnaDw2okVchjWmvFT4Ji1otJW8+hjFZz
   /DB9xlNF56orAnA+fP324fQFLPr8x1UsoNkiYuAERnIWAx0SDoZPvR4q5
   hSpgiE6MlpjGF4sVVFBafH6hpeCTDaxF8oHirLMU61wxSrVR48HuQSV35
   Nd1ClePBPyqDKzaWbEh4/B0d/9fcqfMxj3+Quuv2DdH1kI2EZKyyA3Vz4
   26ZINSylD1XHbIyFbNw9YvYSVVoXTVC7QfLAUXIhdDd9IHSDeoOQ6gyCj
   gKT8NywhKqKbcZgYhxEHjv0HQqwD93CGu+WDxgrqxoRB5rdwWO6401guz
   g==;
X-CSE-ConnectionGUID: U/uZ0g7fR9KB65ygooNFWg==
X-CSE-MsgGUID: vEhWheQaTJW0+VMd/ugeAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58463084"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58463084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:08:26 -0700
X-CSE-ConnectionGUID: hIOSkhPZT1GYym3p6utMaw==
X-CSE-MsgGUID: t2nymbNzQNGIQBsTYz5b5A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Aug 2025 23:08:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur9KX-000SjB-05;
	Wed, 27 Aug 2025 06:08:21 +0000
Date: Wed, 27 Aug 2025 14:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 2/5] arm64: dts: qcom: qcs8300: enable pcie0
Message-ID: <202508271321.BuK8o8oy-lkp@intel.com>
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
In-Reply-To: <20250826091205.3625138-3-ziyue.zhang@oss.qualcomm.com>
References: <20250826091205.3625138-3-ziyue.zhang@oss.qualcomm.com>
TO: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: jingoohan1@gmail.com
TO: mani@kernel.org
TO: lpieralisi@kernel.org
TO: kwilczynski@kernel.org
TO: bhelgaas@google.com
TO: johan+linaro@kernel.org
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: neil.armstrong@linaro.org
TO: abel.vesa@linaro.org
TO: kw@linux.com
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: qiang.yu@oss.qualcomm.com
CC: quic_krichai@quicinc.com
CC: quic_vbadigan@quicinc.com
CC: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hi Ziyue,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6c68f4c0a147c025ae0b25fab688c7c47964a02f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyue-Zhang/dt-bindings-phy-qcom-sc8280xp-qmp-pcie-phy-Update-pcie-phy-bindings-for-qcs8300/20250826-171601
base:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
patch link:    https://lore.kernel.org/r/20250826091205.3625138-3-ziyue.zhang%40oss.qualcomm.com
patch subject: [PATCH v11 2/5] arm64: dts: qcom: qcs8300: enable pcie0
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-001-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271321.BuK8o8oy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271321.BuK8o8oy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508271321.BuK8o8oy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:2299.4-2302.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:2299.4-2302.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:2299.4-2302.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:2299.4-2302.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

vim +2299 arch/arm64/boot/dts/qcom/qcs8300.dtsi

7be190e4bdd2bd1 Jingyi Wang          2024-12-03    22  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    23  / {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    24  	interrupt-parent = <&intc>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    25  	#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    26  	#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    27  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    28  	clocks {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    29  		xo_board_clk: xo-board-clk {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    30  			compatible = "fixed-clock";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    31  			#clock-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    32  			clock-frequency = <38400000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    33  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    34  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    35  		sleep_clk: sleep-clk {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    36  			compatible = "fixed-clock";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    37  			#clock-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    38  			clock-frequency = <32000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    39  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    40  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    41  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    42  	cpus {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    43  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    44  		#size-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    45  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    46  		cpu0: cpu@0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    47  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    48  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    49  			reg = <0x0 0x0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    50  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    51  			next-level-cache = <&l2_0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    52  			power-domains = <&cpu_pd0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    53  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06    54  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06    55  			dynamic-power-coefficient = <472>;
2ed8ee662660577 Imran Shaik          2025-04-30    56  			qcom,freq-domain = <&cpufreq_hw 0>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    57  			operating-points-v2 = <&cpu0_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    58  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    59  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    60  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    61  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    62  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    63  			l2_0: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    64  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    65  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    66  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    67  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    68  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    69  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    70  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    71  		cpu1: cpu@100 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    72  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    73  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    74  			reg = <0x0 0x100>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    75  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    76  			next-level-cache = <&l2_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    77  			power-domains = <&cpu_pd1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    78  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06    79  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06    80  			dynamic-power-coefficient = <472>;
2ed8ee662660577 Imran Shaik          2025-04-30    81  			qcom,freq-domain = <&cpufreq_hw 0>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    82  			operating-points-v2 = <&cpu0_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    83  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    84  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    85  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22    86  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    87  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    88  			l2_1: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    89  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    90  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    91  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    92  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    93  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    94  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    95  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    96  		cpu2: cpu@200 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    97  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    98  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03    99  			reg = <0x0 0x200>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   100  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   101  			next-level-cache = <&l2_2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   102  			power-domains = <&cpu_pd2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   103  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   104  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   105  			dynamic-power-coefficient = <507>;
2ed8ee662660577 Imran Shaik          2025-04-30   106  			qcom,freq-domain = <&cpufreq_hw 2>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   107  			operating-points-v2 = <&cpu2_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   108  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   109  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   110  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   111  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   112  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   113  			l2_2: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   114  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   115  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   116  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   117  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   118  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   119  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   120  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   121  		cpu3: cpu@300 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   122  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   123  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   124  			reg = <0x0 0x300>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   125  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   126  			next-level-cache = <&l2_3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   127  			power-domains = <&cpu_pd3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   128  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   129  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   130  			dynamic-power-coefficient = <507>;
2ed8ee662660577 Imran Shaik          2025-04-30   131  			qcom,freq-domain = <&cpufreq_hw 2>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   132  			operating-points-v2 = <&cpu2_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   133  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   134  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   135  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   136  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   137  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   138  			l2_3: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   139  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   140  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   141  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   142  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   143  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   144  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   145  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   146  		cpu4: cpu@10000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   147  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   148  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   149  			reg = <0x0 0x10000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   150  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   151  			next-level-cache = <&l2_4>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   152  			power-domains = <&cpu_pd4>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   153  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   154  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   155  			dynamic-power-coefficient = <100>;
2ed8ee662660577 Imran Shaik          2025-04-30   156  			qcom,freq-domain = <&cpufreq_hw 1>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   157  			operating-points-v2 = <&cpu4_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   158  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   159  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   160  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   161  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   162  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   163  			l2_4: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   164  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   165  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   166  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   167  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   168  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   169  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   170  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   171  		cpu5: cpu@10100 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   172  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   173  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   174  			reg = <0x0 0x10100>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   175  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   176  			next-level-cache = <&l2_5>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   177  			power-domains = <&cpu_pd5>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   178  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   179  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   180  			dynamic-power-coefficient = <100>;
2ed8ee662660577 Imran Shaik          2025-04-30   181  			qcom,freq-domain = <&cpufreq_hw 1>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   182  			operating-points-v2 = <&cpu4_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   183  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   184  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   185  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   186  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   187  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   188  			l2_5: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   189  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   190  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   191  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   192  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   193  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   194  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   195  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   196  		cpu6: cpu@10200 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   197  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   198  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   199  			reg = <0x0 0x10200>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   200  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   201  			next-level-cache = <&l2_6>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   202  			power-domains = <&cpu_pd6>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   203  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   204  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   205  			dynamic-power-coefficient = <100>;
2ed8ee662660577 Imran Shaik          2025-04-30   206  			qcom,freq-domain = <&cpufreq_hw 1>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   207  			operating-points-v2 = <&cpu4_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   208  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   209  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   210  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   211  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   212  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   213  			l2_6: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   214  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   215  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   216  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   217  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   218  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   219  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   220  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   221  		cpu7: cpu@10300 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   222  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   223  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   224  			reg = <0x0 0x10300>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   225  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   226  			next-level-cache = <&l2_7>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   227  			power-domains = <&cpu_pd7>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   228  			power-domain-names = "psci";
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   229  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a2 Jingyi Wang          2024-12-06   230  			dynamic-power-coefficient = <100>;
2ed8ee662660577 Imran Shaik          2025-04-30   231  			qcom,freq-domain = <&cpufreq_hw 1>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   232  			operating-points-v2 = <&cpu4_opp_table>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   233  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   234  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   235  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   236  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   237  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   238  			l2_7: l2-cache {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   239  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   240  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   241  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   242  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   243  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   244  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   245  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   246  		cpu-map {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   247  			cluster0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   248  				core0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   249  					cpu = <&cpu0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   250  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   251  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   252  				core1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   253  					cpu = <&cpu1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   254  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   255  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   256  				core2 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   257  					cpu = <&cpu2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   258  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   259  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   260  				core3 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   261  					cpu = <&cpu3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   262  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   263  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   264  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   265  			cluster1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   266  				core0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   267  					cpu = <&cpu4>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   268  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   269  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   270  				core1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   271  					cpu = <&cpu5>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   272  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   273  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   274  				core2 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   275  					cpu = <&cpu6>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   276  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   277  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   278  				core3 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   279  					cpu = <&cpu7>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   280  				};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   281  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   282  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   283  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   284  		l3_0: l3-cache-0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   285  			compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   286  			cache-level = <3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   287  			cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   288  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   289  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   290  		l3_1: l3-cache-1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   291  			compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   292  			cache-level = <3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   293  			cache-unified;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   294  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   295  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   296  		idle-states {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   297  			entry-method = "psci";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   298  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   299  			little_cpu_sleep_0: cpu-sleep-0-0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   300  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   301  				idle-state-name = "silver-power-collapse";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   302  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   303  				entry-latency-us = <449>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   304  				exit-latency-us = <801>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   305  				min-residency-us = <1574>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   306  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   307  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   308  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   309  			little_cpu_sleep_1: cpu-sleep-0-1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   310  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   311  				idle-state-name = "silver-rail-power-collapse";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   312  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   313  				entry-latency-us = <602>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   314  				exit-latency-us = <961>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   315  				min-residency-us = <4288>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   316  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   317  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   318  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   319  			big_cpu_sleep_0: cpu-sleep-1-0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   320  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   321  				idle-state-name = "gold-power-collapse";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   322  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   323  				entry-latency-us = <549>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   324  				exit-latency-us = <901>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   325  				min-residency-us = <1774>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   326  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   327  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   328  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   329  			big_cpu_sleep_1: cpu-sleep-1-1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   330  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   331  				idle-state-name = "gold-rail-power-collapse";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   332  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   333  				entry-latency-us = <702>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   334  				exit-latency-us = <1061>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   335  				min-residency-us = <4488>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   336  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   337  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   338  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   339  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   340  		domain-idle-states {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   341  			silver_cluster_sleep: cluster-sleep-0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   342  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   343  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   344  				entry-latency-us = <2552>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   345  				exit-latency-us = <2848>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   346  				min-residency-us = <5908>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   347  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   348  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   349  			gold_cluster_sleep: cluster-sleep-1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   350  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   351  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   352  				entry-latency-us = <2752>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   353  				exit-latency-us = <3048>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   354  				min-residency-us = <6118>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   355  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   356  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   357  			system_sleep: domain-sleep {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   358  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   359  				arm,psci-suspend-param = <0x42000144>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   360  				entry-latency-us = <3263>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   361  				exit-latency-us = <6562>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   362  				min-residency-us = <9987>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   363  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   364  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   365  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   366  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   367  	cpu0_opp_table: opp-table-cpu0 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   368  		compatible = "operating-points-v2";
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   369  		opp-shared;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   370  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   371  		opp-902400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   372  			opp-hz = /bits/ 64 <902400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   373  			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   374  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   375  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   376  		opp-1017600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   377  			opp-hz = /bits/ 64 <1017600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   378  			opp-peak-kBps = <(1017600 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   379  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   380  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   381  		opp-1190400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   382  			opp-hz = /bits/ 64 <1190400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   383  			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   384  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   385  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   386  		opp-1267200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   387  			opp-hz = /bits/ 64 <1267200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   388  			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   389  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   390  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   391  		opp-1344000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   392  			opp-hz = /bits/ 64 <1344000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   393  			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   394  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   395  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   396  		opp-1420800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   397  			opp-hz = /bits/ 64 <1420800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   398  			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   399  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   400  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   401  		opp-1497600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   402  			opp-hz = /bits/ 64 <1497600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   403  			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   404  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   405  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   406  		opp-1574400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   407  			opp-hz = /bits/ 64 <1574400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   408  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   409  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   410  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   411  		opp-1670400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   412  			opp-hz = /bits/ 64 <1670400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   413  			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   414  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   415  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   416  		opp-1747200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   417  			opp-hz = /bits/ 64 <1747200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   418  			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   419  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   420  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   421  		opp-1824000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   422  			opp-hz = /bits/ 64 <1824000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   423  			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   424  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   425  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   426  		opp-1900800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   427  			opp-hz = /bits/ 64 <1900800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   428  			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   429  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   430  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   431  		opp-1977600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   432  			opp-hz = /bits/ 64 <1977600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   433  			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   434  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   435  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   436  		opp-2054400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   437  			opp-hz = /bits/ 64 <2054400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   438  			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   439  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   440  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   441  		opp-2112000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   442  			opp-hz = /bits/ 64 <2112000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   443  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   444  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   445  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   446  	};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   447  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   448  	cpu2_opp_table: opp-table-cpu2 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   449  		compatible = "operating-points-v2";
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   450  		opp-shared;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   451  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   452  		opp-940800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   453  			opp-hz = /bits/ 64 <940800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   454  			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   455  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   456  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   457  		opp-1094400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   458  			opp-hz = /bits/ 64 <1094400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   459  			opp-peak-kBps = <(1017600 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   460  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   461  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   462  		opp-1267200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   463  			opp-hz = /bits/ 64 <1267200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   464  			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   465  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   466  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   467  		opp-1344000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   468  			opp-hz = /bits/ 64 <1344000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   469  			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   470  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   471  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   472  		opp-1420800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   473  			opp-hz = /bits/ 64 <1420800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   474  			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   475  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   476  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   477  		opp-1497600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   478  			opp-hz = /bits/ 64 <1497600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   479  			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   480  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   481  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   482  		opp-1574400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   483  			opp-hz = /bits/ 64 <1574400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   484  			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   485  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   486  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   487  		opp-1632000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   488  			opp-hz = /bits/ 64 <1632000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   489  			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   490  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   491  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   492  		opp-1708800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   493  			opp-hz = /bits/ 64 <1708800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   494  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   495  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   496  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   497  		opp-1804800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   498  			opp-hz = /bits/ 64 <1804800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   499  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   500  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   501  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   502  		opp-1900800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   503  			opp-hz = /bits/ 64 <1900800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   504  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   505  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   506  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   507  		opp-1977600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   508  			opp-hz = /bits/ 64 <1977600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   509  			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   510  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   511  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   512  		opp-2054400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   513  			opp-hz = /bits/ 64 <2054400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   514  			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   515  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   516  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   517  		opp-2131200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   518  			opp-hz = /bits/ 64 <2131200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   519  			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   520  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   521  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   522  		opp-2208000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   523  			opp-hz = /bits/ 64 <2208000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   524  			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   525  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   526  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   527  		opp-2284800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   528  			opp-hz = /bits/ 64 <2284800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   529  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   530  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   531  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   532  		opp-2361600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   533  			opp-hz = /bits/ 64 <2361600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   534  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   535  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   536  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   537  	};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   538  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   539  	cpu4_opp_table: opp-table-cpu4 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   540  		compatible = "operating-points-v2";
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   541  		opp-shared;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   542  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   543  		opp-844800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   544  			opp-hz = /bits/ 64 <844800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   545  			opp-peak-kBps = <(681600 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   546  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   547  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   548  		opp-1113600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   549  			opp-hz = /bits/ 64 <1113600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   550  			opp-peak-kBps = <(1708800 * 4) (921600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   551  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   552  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   553  		opp-1209600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   554  			opp-hz = /bits/ 64 <1209600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   555  			opp-peak-kBps = <(2092800 * 4) (998400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   556  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   557  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   558  		opp-1305600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   559  			opp-hz = /bits/ 64 <1305600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   560  			opp-peak-kBps = <(2092800 * 4) (1075200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   561  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   562  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   563  		opp-1382400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   564  			opp-hz = /bits/ 64 <1382400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   565  			opp-peak-kBps = <(2092800 * 4) (1152000 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   566  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   567  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   568  		opp-1459200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   569  			opp-hz = /bits/ 64 <1459200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   570  			opp-peak-kBps = <(2092800 * 4) (1228800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   571  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   572  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   573  		opp-1497600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   574  			opp-hz = /bits/ 64 <1497600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   575  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   576  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   577  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   578  		opp-1574400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   579  			opp-hz = /bits/ 64 <1574400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   580  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   581  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   582  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   583  		opp-1651200000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   584  			opp-hz = /bits/ 64 <1651200000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   585  			opp-peak-kBps = <(2736000 * 4) (1324800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   586  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   587  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   588  		opp-1728000000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   589  			opp-hz = /bits/ 64 <1728000000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   590  			opp-peak-kBps = <(2736000 * 4) (1401600 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   591  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   592  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   593  		opp-1804800000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   594  			opp-hz = /bits/ 64 <1804800000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   595  			opp-peak-kBps = <(2736000 * 4) (1478400 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   596  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   597  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   598  		opp-1881600000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   599  			opp-hz = /bits/ 64 <1881600000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   600  			opp-peak-kBps = <(3196800 * 4) (1555200 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   601  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   602  
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   603  		opp-1958400000 {
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   604  			opp-hz = /bits/ 64 <1958400000>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   605  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   606  		};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   607  	};
bebacd802b51fae Raviteja Laggyshetty 2025-07-22   608  
0f43254763b3a16 Jie Gan              2024-12-19   609  	dummy_eud: dummy-sink {
0f43254763b3a16 Jie Gan              2024-12-19   610  		compatible = "arm,coresight-dummy-sink";
0f43254763b3a16 Jie Gan              2024-12-19   611  
0f43254763b3a16 Jie Gan              2024-12-19   612  		in-ports {
0f43254763b3a16 Jie Gan              2024-12-19   613  			port {
0f43254763b3a16 Jie Gan              2024-12-19   614  				eud_in: endpoint {
0f43254763b3a16 Jie Gan              2024-12-19   615  					remote-endpoint = <&swao_rep_out1>;
0f43254763b3a16 Jie Gan              2024-12-19   616  				};
0f43254763b3a16 Jie Gan              2024-12-19   617  			};
0f43254763b3a16 Jie Gan              2024-12-19   618  		};
0f43254763b3a16 Jie Gan              2024-12-19   619  	};
0f43254763b3a16 Jie Gan              2024-12-19   620  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   621  	firmware {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   622  		scm: scm {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   623  			compatible = "qcom,scm-qcs8300", "qcom,scm";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   624  			qcom,dload-mode = <&tcsr 0x13000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   625  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   626  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   627  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   628  	memory@80000000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   629  		device_type = "memory";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   630  		/* We expect the bootloader to fill in the size */
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   631  		reg = <0x0 0x80000000 0x0 0x0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   632  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   633  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   634  	clk_virt: interconnect-0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   635  		compatible = "qcom,qcs8300-clk-virt";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   636  		#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   637  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   638  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   639  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   640  	mc_virt: interconnect-1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   641  		compatible = "qcom,qcs8300-mc-virt";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   642  		#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   643  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   644  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   645  
467284a3097f434 Viken Dadhaniya      2025-02-24   646  	qup_opp_table: opp-table-qup {
467284a3097f434 Viken Dadhaniya      2025-02-24   647  		compatible = "operating-points-v2";
467284a3097f434 Viken Dadhaniya      2025-02-24   648  
467284a3097f434 Viken Dadhaniya      2025-02-24   649  		opp-120000000 {
467284a3097f434 Viken Dadhaniya      2025-02-24   650  			opp-hz = /bits/ 64 <120000000>;
467284a3097f434 Viken Dadhaniya      2025-02-24   651  			required-opps = <&rpmhpd_opp_svs_l1>;
467284a3097f434 Viken Dadhaniya      2025-02-24   652  		};
467284a3097f434 Viken Dadhaniya      2025-02-24   653  	};
467284a3097f434 Viken Dadhaniya      2025-02-24   654  
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   655  	pmu-a55 {
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   656  		compatible = "arm,cortex-a55-pmu";
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   657  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   658  	};
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   659  
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   660  	pmu-a78 {
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   661  		compatible = "arm,cortex-a78-pmu";
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   662  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   663  	};
09d8a3ef91f69f3 Jingyi Wang          2024-11-01   664  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   665  	psci {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   666  		compatible = "arm,psci-1.0";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   667  		method = "smc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   668  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   669  		cpu_pd0: power-domain-cpu0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   670  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   671  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   672  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   673  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   674  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   675  		cpu_pd1: power-domain-cpu1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   676  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   677  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   678  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   679  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   680  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   681  		cpu_pd2: power-domain-cpu2 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   682  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   683  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   684  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   685  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   686  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   687  		cpu_pd3: power-domain-cpu3 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   688  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   689  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   690  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   691  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   692  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   693  		cpu_pd4: power-domain-cpu4 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   694  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   695  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   696  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   697  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   698  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   699  		cpu_pd5: power-domain-cpu5 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   700  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   701  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   702  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   703  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   704  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   705  		cpu_pd6: power-domain-cpu6 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   706  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   707  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   708  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   709  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   710  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   711  		cpu_pd7: power-domain-cpu7 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   712  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   713  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   714  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   715  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   716  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   717  		cluster_pd0: power-domain-cluster0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   718  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   719  			power-domains = <&system_pd>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   720  			domain-idle-states = <&gold_cluster_sleep>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   721  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   722  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   723  		cluster_pd1: power-domain-cluster1 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   724  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   725  			power-domains = <&system_pd>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   726  			domain-idle-states = <&silver_cluster_sleep>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   727  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   728  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   729  		system_pd: power-domain-system {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   730  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   731  			domain-idle-states = <&system_sleep>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   732  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   733  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   734  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   735  	reserved-memory {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   736  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   737  		#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   738  		ranges;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   739  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   740  		aop_image_mem: aop-image-region@90800000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   741  			reg = <0x0 0x90800000 0x0 0x60000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   742  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   743  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   744  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   745  		aop_cmd_db_mem: aop-cmd-db-region@90860000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   746  			compatible = "qcom,cmd-db";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   747  			reg = <0x0 0x90860000 0x0 0x20000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   748  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   749  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   750  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   751  		smem_mem: smem@90900000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   752  			compatible = "qcom,smem";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   753  			reg = <0x0 0x90900000 0x0 0x200000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   754  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   755  			hwlocks = <&tcsr_mutex 3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   756  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   757  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   758  		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   759  			reg = <0x0 0x93b00000 0x0 0xf00000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   760  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   761  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   762  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   763  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap-region@94a00000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   764  			reg = <0x0 0x94a00000 0x0 0x800000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   765  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   766  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   767  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   768  		camera_mem: camera-region@95200000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   769  			reg = <0x0 0x95200000 0x0 0x500000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   770  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   771  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   772  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   773  		adsp_mem: adsp-region@95c00000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   774  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   775  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   776  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   777  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   778  		q6_adsp_dtb_mem: q6-adsp-dtb-region@97a00000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   779  			reg = <0x0 0x97a00000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   780  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   781  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   782  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   783  		q6_gpdsp_dtb_mem: q6-gpdsp-dtb-region@97a80000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   784  			reg = <0x0 0x97a80000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   785  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   786  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   787  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   788  		gpdsp_mem: gpdsp-region@97b00000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   789  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   790  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   791  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   792  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   793  		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   794  			reg = <0x0 0x99900000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   795  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   796  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   797  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   798  		cdsp_mem: cdsp-region@99980000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   799  			reg = <0x0 0x99980000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   800  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   801  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   802  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   803  		gpu_microcode_mem: gpu-microcode-region@9b780000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   804  			reg = <0x0 0x9b780000 0x0 0x2000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   805  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   806  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   807  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   808  		cvp_mem: cvp-region@9b782000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   809  			reg = <0x0 0x9b782000 0x0 0x700000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   810  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   811  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   812  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   813  		video_mem: video-region@9be82000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   814  			reg = <0x0 0x9be82000 0x0 0x700000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   815  			no-map;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   816  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   817  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   818  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   819  	smp2p-adsp {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   820  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   821  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   822  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   823  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   824  		mboxes = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   825  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   826  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   827  		qcom,smem = <443>, <429>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   828  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   829  		qcom,remote-pid = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   830  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   831  		smp2p_adsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   832  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   833  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   834  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   835  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   836  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   837  		smp2p_adsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   838  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   839  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   840  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   841  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   842  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   843  	smp2p-cdsp {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   844  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   845  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   846  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   847  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   848  		mboxes = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   849  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   850  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   851  		qcom,smem = <94>, <432>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   852  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   853  		qcom,remote-pid = <5>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   854  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   855  		smp2p_cdsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   856  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   857  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   858  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   859  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   860  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   861  		smp2p_cdsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   862  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   863  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   864  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   865  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   866  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   867  	smp2p-gpdsp {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   868  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   869  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   870  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   871  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   872  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   873  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   874  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   875  		qcom,smem = <617>, <616>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   876  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   877  		qcom,remote-pid = <17>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   878  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   879  		smp2p_gpdsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   880  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   881  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   882  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   883  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   884  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   885  		smp2p_gpdsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   886  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   887  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   888  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   889  	};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   890  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   891  	soc: soc@0 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   892  		compatible = "simple-bus";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   893  		ranges = <0 0 0 0 0x10 0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   894  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   895  		#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   896  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   897  		gcc: clock-controller@100000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   898  			compatible = "qcom,qcs8300-gcc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   899  			reg = <0x0 0x00100000 0x0 0xc7018>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   900  			#clock-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   901  			#reset-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   902  			#power-domain-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   903  			clocks = <&rpmhcc RPMH_CXO_CLK>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   904  				 <&sleep_clk>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26   905  				 <&pcie0_phy>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   906  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   907  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   908  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   909  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   910  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   911  				 <0>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   912  				 <0>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   913  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   914  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   915  		ipcc: mailbox@408000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   916  			compatible = "qcom,qcs8300-ipcc", "qcom,ipcc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   917  			reg = <0x0 0x408000 0x0 0x1000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   918  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   919  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   920  			#interrupt-cells = <3>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   921  			#mbox-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   922  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   923  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   924  		qfprom: efuse@784000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   925  			compatible = "qcom,qcs8300-qfprom", "qcom,qfprom";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   926  			reg = <0x0 0x00784000 0x0 0x1200>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   927  			#address-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   928  			#size-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   929  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   930  
467284a3097f434 Viken Dadhaniya      2025-02-24   931  		gpi_dma0: dma-controller@900000 {
467284a3097f434 Viken Dadhaniya      2025-02-24   932  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f434 Viken Dadhaniya      2025-02-24   933  			reg = <0x0 0x900000 0x0 0x60000>;
467284a3097f434 Viken Dadhaniya      2025-02-24   934  			#dma-cells = <3>;
467284a3097f434 Viken Dadhaniya      2025-02-24   935  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   936  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   937  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   938  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   939  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   940  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   941  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   942  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   943  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   944  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   945  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24   946  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24   947  			iommus = <&apps_smmu 0x416 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24   948  			dma-channels = <12>;
467284a3097f434 Viken Dadhaniya      2025-02-24   949  			dma-channel-mask = <0xfff>;
467284a3097f434 Viken Dadhaniya      2025-02-24   950  			dma-coherent;
467284a3097f434 Viken Dadhaniya      2025-02-24   951  			status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24   952  		};
467284a3097f434 Viken Dadhaniya      2025-02-24   953  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   954  		qupv3_id_0: geniqup@9c0000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   955  			compatible = "qcom,geni-se-qup";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   956  			reg = <0x0 0x9c0000 0x0 0x2000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   957  			ranges;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   958  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   959  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   960  			clock-names = "m-ahb",
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   961  				      "s-ahb";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   962  			#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   963  			#size-cells = <2>;
467284a3097f434 Viken Dadhaniya      2025-02-24   964  			iommus = <&apps_smmu 0x403 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24   965  			dma-coherent;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   966  			status = "disabled";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03   967  
467284a3097f434 Viken Dadhaniya      2025-02-24   968  			i2c0: i2c@980000 {
467284a3097f434 Viken Dadhaniya      2025-02-24   969  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24   970  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24   971  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24   972  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24   973  				pinctrl-0 = <&qup_i2c0_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24   974  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24   975  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24   976  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24   977  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24   978  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24   979  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24   980  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24   981  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24   982  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24   983  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24   984  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24   985  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24   986  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24   987  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24   988  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24   989  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24   990  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24   991  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24   992  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24   993  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24   994  			};
467284a3097f434 Viken Dadhaniya      2025-02-24   995  
467284a3097f434 Viken Dadhaniya      2025-02-24   996  			spi0: spi@980000 {
467284a3097f434 Viken Dadhaniya      2025-02-24   997  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24   998  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24   999  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1000  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1001  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1002  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1003  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1004  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1005  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1006  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1007  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1008  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1009  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1010  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1011  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1012  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1013  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1014  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1015  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1016  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1017  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1018  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1019  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1020  
467284a3097f434 Viken Dadhaniya      2025-02-24  1021  			uart0: serial@980000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1022  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1023  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1024  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1025  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1026  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1027  					    <&qup_uart0_tx>, <&qup_uart0_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1028  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1029  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1030  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1031  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1032  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1033  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1034  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1035  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1036  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1037  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1038  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1039  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1040  
467284a3097f434 Viken Dadhaniya      2025-02-24  1041  			i2c1: i2c@984000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1042  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1043  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1044  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1045  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1046  				pinctrl-0 = <&qup_i2c1_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1047  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1048  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1049  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1050  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1051  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1052  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1053  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1054  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1055  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1056  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1057  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1058  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1059  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1060  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1061  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1062  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1063  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1064  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1065  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1066  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1067  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1068  
467284a3097f434 Viken Dadhaniya      2025-02-24  1069  			spi1: spi@984000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1070  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1071  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1072  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1073  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1074  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1075  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1076  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1077  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1078  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1079  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1080  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1081  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1082  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1083  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1084  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1085  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1086  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1087  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1088  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1089  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1090  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1091  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1092  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1093  
467284a3097f434 Viken Dadhaniya      2025-02-24  1094  			uart1: serial@984000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1095  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1096  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1097  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1098  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1099  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1100  					    <&qup_uart1_tx>, <&qup_uart1_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1101  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1102  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1103  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1104  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1105  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1106  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1107  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1108  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1109  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1110  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1111  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1112  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1113  
467284a3097f434 Viken Dadhaniya      2025-02-24  1114  			i2c2: i2c@988000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1115  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1116  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1117  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1118  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1119  				pinctrl-0 = <&qup_i2c2_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1120  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1121  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1122  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1123  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1124  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1125  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1126  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1127  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1128  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1129  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1130  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1131  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1132  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1133  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1134  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1135  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1136  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1137  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1138  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1139  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1140  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1141  
467284a3097f434 Viken Dadhaniya      2025-02-24  1142  			spi2: spi@988000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1143  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1144  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1145  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1146  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1147  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1148  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1149  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1150  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1151  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1152  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1153  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1154  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1155  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1156  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1157  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1158  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1159  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1160  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1161  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1162  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1163  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1164  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1165  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1166  
467284a3097f434 Viken Dadhaniya      2025-02-24  1167  			uart2: serial@988000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1168  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1169  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1170  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1171  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1172  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1173  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1174  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1175  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1176  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1177  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1178  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1179  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1180  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1181  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1182  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1183  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1184  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1185  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1186  
467284a3097f434 Viken Dadhaniya      2025-02-24  1187  			i2c3: i2c@98c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1188  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1189  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1190  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1191  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1192  				pinctrl-0 = <&qup_i2c3_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1193  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1194  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1195  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1196  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1197  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1198  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1199  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1200  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1201  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1202  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1203  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1204  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1205  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1206  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1207  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1208  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1209  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1210  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1211  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1212  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1213  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1214  
467284a3097f434 Viken Dadhaniya      2025-02-24  1215  			spi3: spi@98c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1216  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1217  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1218  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1219  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1220  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1221  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1222  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1223  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1224  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1225  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1226  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1227  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1228  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1229  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1230  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1231  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1232  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1233  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1234  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1235  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1236  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1237  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1238  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1239  
467284a3097f434 Viken Dadhaniya      2025-02-24  1240  			uart3: serial@98c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1241  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1242  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1243  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1244  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1245  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1246  					    <&qup_uart3_tx>, <&qup_uart3_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1247  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1248  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1249  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1250  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1251  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1252  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1253  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1254  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1255  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1256  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1257  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1258  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1259  
467284a3097f434 Viken Dadhaniya      2025-02-24  1260  			i2c4: i2c@990000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1261  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1262  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1263  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1264  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1265  				pinctrl-0 = <&qup_i2c4_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1266  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1267  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1268  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1269  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1270  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1271  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1272  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1273  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1274  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1275  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1276  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1277  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1278  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1279  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1280  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1281  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1282  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1283  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1284  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1285  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1286  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1287  
467284a3097f434 Viken Dadhaniya      2025-02-24  1288  			spi4: spi@990000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1289  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1290  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1291  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1292  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1293  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1294  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1295  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1296  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1297  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1298  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1299  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1300  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1301  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1302  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1303  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1304  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1305  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1306  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1307  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1308  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1309  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1310  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1311  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1312  
467284a3097f434 Viken Dadhaniya      2025-02-24  1313  			uart4: serial@990000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1314  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1315  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1316  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1317  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1318  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1319  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1320  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1321  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1322  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1323  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1324  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1325  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1326  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1327  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1328  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1329  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1330  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1331  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1332  
467284a3097f434 Viken Dadhaniya      2025-02-24  1333  			i2c5: i2c@994000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1334  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1335  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1336  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1337  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1338  				pinctrl-0 = <&qup_i2c5_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1339  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1340  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1341  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1342  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1343  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1344  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1345  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1346  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1347  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1348  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1349  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1350  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1351  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1352  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1353  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1354  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1355  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1356  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1357  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1358  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1359  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1360  
467284a3097f434 Viken Dadhaniya      2025-02-24  1361  			spi5: spi@994000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1362  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1363  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1364  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1365  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1366  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1367  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1368  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1369  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1370  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1371  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1372  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1373  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1374  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1375  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1376  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1377  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1378  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1379  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1380  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1381  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1382  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1383  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1384  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1385  
467284a3097f434 Viken Dadhaniya      2025-02-24  1386  			uart5: serial@994000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1387  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1388  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1389  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1390  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1391  				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1392  					    <&qup_uart5_tx>, <&qup_uart5_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1393  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1394  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1395  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1396  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1397  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1398  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1399  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1400  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1401  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1402  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1403  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1404  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1405  
467284a3097f434 Viken Dadhaniya      2025-02-24  1406  			i2c6: i2c@998000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1407  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1408  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1409  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1410  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1411  				pinctrl-0 = <&qup_i2c6_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1412  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1413  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1414  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1415  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1416  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1417  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1418  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1419  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1420  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1421  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1422  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1423  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1424  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1425  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1426  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1427  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1428  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1429  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1430  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1431  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1432  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1433  
467284a3097f434 Viken Dadhaniya      2025-02-24  1434  			spi6: spi@998000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1435  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1436  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1437  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1438  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1439  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1440  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1441  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1442  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1443  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1444  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1445  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1446  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1447  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1448  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1449  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1450  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1451  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1452  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1453  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1454  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1455  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1456  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1457  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1458  
467284a3097f434 Viken Dadhaniya      2025-02-24  1459  			uart6: serial@998000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1460  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1461  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1462  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1463  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1464  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1465  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1466  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1467  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1468  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1469  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1470  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1471  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1472  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1473  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1474  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1475  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1476  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1477  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1478  
467284a3097f434 Viken Dadhaniya      2025-02-24  1479  			uart7: serial@99c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1480  				compatible = "qcom,geni-debug-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1481  				reg = <0x0 0x0099c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1482  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1483  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1484  				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1485  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1486  				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1487  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1488  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1489  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1490  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1491  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1492  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1493  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1494  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1495  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1496  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1497  		};
467284a3097f434 Viken Dadhaniya      2025-02-24  1498  
467284a3097f434 Viken Dadhaniya      2025-02-24  1499  		gpi_dma1: dma-controller@a00000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1500  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f434 Viken Dadhaniya      2025-02-24  1501  			reg = <0x0 0xa00000 0x0 0x60000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1502  			#dma-cells = <3>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1503  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1504  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1505  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1506  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1507  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1508  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1509  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1510  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1511  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1512  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1513  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1514  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1515  			iommus = <&apps_smmu 0x456 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1516  			dma-channels = <12>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1517  			dma-channel-mask = <0xfff>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1518  			dma-coherent;
467284a3097f434 Viken Dadhaniya      2025-02-24  1519  			status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1520  		};
467284a3097f434 Viken Dadhaniya      2025-02-24  1521  
467284a3097f434 Viken Dadhaniya      2025-02-24  1522  		qupv3_id_1: geniqup@ac0000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1523  			compatible = "qcom,geni-se-qup";
467284a3097f434 Viken Dadhaniya      2025-02-24  1524  			reg = <0x0 0xac0000 0x0 0x2000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1525  			ranges;
467284a3097f434 Viken Dadhaniya      2025-02-24  1526  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1527  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1528  			clock-names = "m-ahb",
467284a3097f434 Viken Dadhaniya      2025-02-24  1529  				      "s-ahb";
467284a3097f434 Viken Dadhaniya      2025-02-24  1530  			#address-cells = <2>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1531  			#size-cells = <2>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1532  			iommus = <&apps_smmu 0x443 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1533  			dma-coherent;
467284a3097f434 Viken Dadhaniya      2025-02-24  1534  			status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1535  
467284a3097f434 Viken Dadhaniya      2025-02-24  1536  			i2c8: i2c@a80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1537  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1538  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1539  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1540  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1541  				pinctrl-0 = <&qup_i2c8_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1542  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1543  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1544  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1545  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1546  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1547  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1548  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1549  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1550  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1551  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1552  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1553  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1554  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1555  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1556  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1557  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1558  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1559  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1560  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1561  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1562  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1563  
467284a3097f434 Viken Dadhaniya      2025-02-24  1564  			spi8: spi@a80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1565  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1566  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1567  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1568  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1569  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1570  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1571  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1572  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1573  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1574  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1575  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1576  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1577  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1578  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1579  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1580  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1581  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1582  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1583  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1584  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1585  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1586  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1587  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1588  
467284a3097f434 Viken Dadhaniya      2025-02-24  1589  			uart8: serial@a80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1590  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1591  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1592  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1593  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1594  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1595  					    <&qup_uart8_tx>, <&qup_uart8_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1596  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1597  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1598  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1599  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1600  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1601  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1602  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1603  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1604  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1605  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1606  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1607  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1608  
467284a3097f434 Viken Dadhaniya      2025-02-24  1609  			i2c9: i2c@a84000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1610  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1611  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1612  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1613  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1614  				pinctrl-0 = <&qup_i2c9_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1615  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1616  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1617  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1618  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1619  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1620  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1621  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1622  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1623  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1624  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1625  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1626  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1627  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1628  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1629  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1630  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1631  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1632  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1633  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1634  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1635  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1636  
467284a3097f434 Viken Dadhaniya      2025-02-24  1637  			spi9: spi@a84000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1638  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1639  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1640  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1641  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1642  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1643  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1644  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1645  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1646  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1647  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1648  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1649  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1650  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1651  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1652  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1653  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1654  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1655  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1656  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1657  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1658  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1659  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1660  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1661  
467284a3097f434 Viken Dadhaniya      2025-02-24  1662  			uart9: serial@a84000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1663  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1664  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1665  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1666  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1667  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1668  					    <&qup_uart9_tx>, <&qup_uart9_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1669  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1670  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1671  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1672  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1673  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1674  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1675  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1676  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1677  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1678  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1679  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1680  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1681  
467284a3097f434 Viken Dadhaniya      2025-02-24  1682  			i2c10: i2c@a88000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1683  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1684  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1685  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1686  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1687  				pinctrl-0 = <&qup_i2c10_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1688  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1689  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1690  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1691  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1692  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1693  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1694  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1695  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1696  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1697  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1698  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1699  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1700  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1701  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1702  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1703  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1704  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1705  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1706  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1707  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1708  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1709  
467284a3097f434 Viken Dadhaniya      2025-02-24  1710  			spi10: spi@a88000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1711  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1712  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1713  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1714  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1715  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1716  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1717  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1718  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1719  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1720  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1721  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1722  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1723  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1724  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1725  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1726  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1727  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1728  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1729  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1730  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1731  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1732  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1733  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1734  
467284a3097f434 Viken Dadhaniya      2025-02-24  1735  			uart10: serial@a88000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1736  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1737  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1738  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1739  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1740  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1741  					    <&qup_uart10_tx>, <&qup_uart10_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1742  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1743  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1744  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1745  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1746  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1747  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1748  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1749  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1750  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1751  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1752  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1753  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1754  
467284a3097f434 Viken Dadhaniya      2025-02-24  1755  			i2c11: i2c@a8c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1756  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1757  				reg = <0x0 0xa8c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1758  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1759  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1760  				pinctrl-0 = <&qup_i2c11_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1761  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1762  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1763  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1764  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1765  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1766  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1767  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1768  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1769  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1770  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1771  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1772  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1773  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1774  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1775  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1776  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1777  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1778  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1779  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1780  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1781  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1782  
467284a3097f434 Viken Dadhaniya      2025-02-24  1783  			uart11: serial@a8c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1784  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1785  				reg = <0x0 0xa8c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1786  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1787  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1788  				pinctrl-0 = <&qup_uart11_tx>, <&qup_uart11_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1789  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1790  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1791  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1792  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1793  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1794  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1795  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1796  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1797  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1798  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1799  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1800  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1801  
467284a3097f434 Viken Dadhaniya      2025-02-24  1802  			i2c12: i2c@a90000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1803  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1804  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1805  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1806  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1807  				pinctrl-0 = <&qup_i2c12_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1808  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1809  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1810  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1811  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1812  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1813  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1814  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1815  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1816  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1817  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1818  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1819  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1820  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1821  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1822  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1823  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1824  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1825  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1826  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1827  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1828  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1829  
467284a3097f434 Viken Dadhaniya      2025-02-24  1830  			spi12: spi@a90000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1831  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1832  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1833  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1834  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1835  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1836  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1837  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1838  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1839  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1840  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1841  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1842  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1843  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1844  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1845  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1846  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1847  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1848  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1849  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1850  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1851  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1852  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1853  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1854  
467284a3097f434 Viken Dadhaniya      2025-02-24  1855  			uart12: serial@a90000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1856  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1857  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1858  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1859  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1860  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1861  					    <&qup_uart12_tx>, <&qup_uart12_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1862  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1863  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1864  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1865  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1866  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1867  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1868  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1869  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1870  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1871  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1872  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1873  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1874  
467284a3097f434 Viken Dadhaniya      2025-02-24  1875  			i2c13: i2c@a94000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1876  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1877  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1878  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1879  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1880  				pinctrl-0 = <&qup_i2c13_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1881  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1882  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1883  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1884  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1885  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1886  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1887  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1888  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1889  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1890  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1891  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1892  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1893  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1894  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1895  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1896  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1897  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1898  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1899  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1900  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1901  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1902  
467284a3097f434 Viken Dadhaniya      2025-02-24  1903  			spi13: spi@a94000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1904  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1905  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1906  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1907  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1908  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1909  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1910  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1911  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1912  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1913  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1914  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1915  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1916  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1917  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1918  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1919  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1920  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1921  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1922  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1923  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1924  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1925  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1926  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1927  
467284a3097f434 Viken Dadhaniya      2025-02-24  1928  			uart13: serial@a94000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1929  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  1930  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1931  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1932  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1933  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1934  					    <&qup_uart13_tx>, <&qup_uart13_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1935  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1936  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1937  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1938  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1939  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1940  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1941  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1942  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1943  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1944  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1945  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1946  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1947  
467284a3097f434 Viken Dadhaniya      2025-02-24  1948  			i2c14: i2c@a98000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1949  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  1950  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1951  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1952  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1953  				pinctrl-0 = <&qup_i2c14_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1954  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1955  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1956  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1957  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1958  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1959  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1960  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1961  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1962  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1963  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1964  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1965  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  1966  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  1967  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1968  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1969  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1970  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1971  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1972  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1973  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1974  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  1975  
467284a3097f434 Viken Dadhaniya      2025-02-24  1976  			spi14: spi@a98000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  1977  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  1978  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1979  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1980  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  1981  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1982  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  1983  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1984  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1985  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1986  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1987  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1988  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  1989  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1990  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  1991  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  1992  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1993  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1994  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  1995  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  1996  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  1997  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  1998  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  1999  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2000  
467284a3097f434 Viken Dadhaniya      2025-02-24  2001  			uart14: serial@a98000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2002  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  2003  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2004  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2005  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2006  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2007  					    <&qup_uart14_tx>, <&qup_uart14_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2008  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2009  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2010  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2011  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2012  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2013  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2014  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2015  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  2016  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2017  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2018  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2019  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2020  
467284a3097f434 Viken Dadhaniya      2025-02-24  2021  			i2c15: i2c@a9c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2022  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  2023  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2024  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2025  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2026  				pinctrl-0 = <&qup_i2c15_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2027  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2028  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2029  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2030  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2031  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2032  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2033  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2034  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2035  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2036  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2037  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2038  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  2039  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  2040  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2041  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2042  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2043  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2044  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  2045  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  2046  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2047  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2048  
467284a3097f434 Viken Dadhaniya      2025-02-24  2049  			spi15: spi@a9c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2050  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  2051  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2052  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2053  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2054  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2055  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2056  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2057  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2058  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2059  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2060  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2061  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2062  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2063  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2064  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  2065  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2066  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2067  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2068  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2069  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  2070  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  2071  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2072  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2073  
467284a3097f434 Viken Dadhaniya      2025-02-24  2074  			uart15: serial@a9c000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2075  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  2076  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2077  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2078  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2079  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2080  					    <&qup_uart15_tx>, <&qup_uart15_rx>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2081  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2082  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2083  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2084  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2085  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2086  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2087  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2088  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  2089  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2090  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2091  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2092  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2093  		};
467284a3097f434 Viken Dadhaniya      2025-02-24  2094  
467284a3097f434 Viken Dadhaniya      2025-02-24  2095  		gpi_dma3: dma-controller@b00000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2096  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f434 Viken Dadhaniya      2025-02-24  2097  			reg = <0x0 0xb00000 0x0 0x60000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2098  			#dma-cells = <3>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2099  			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2100  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2101  				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2102  				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2103  			iommus = <&apps_smmu 0x56 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2104  			dma-channels = <4>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2105  			dma-channel-mask = <0xf>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2106  			dma-coherent;
467284a3097f434 Viken Dadhaniya      2025-02-24  2107  			status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2108  		};
467284a3097f434 Viken Dadhaniya      2025-02-24  2109  
467284a3097f434 Viken Dadhaniya      2025-02-24  2110  		qupv3_id_3: geniqup@bc0000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2111  			compatible = "qcom,geni-se-qup";
467284a3097f434 Viken Dadhaniya      2025-02-24  2112  			reg = <0x0 0xbc0000 0x0 0x2000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2113  			ranges;
467284a3097f434 Viken Dadhaniya      2025-02-24  2114  			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2115  				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2116  			clock-names = "m-ahb",
467284a3097f434 Viken Dadhaniya      2025-02-24  2117  				      "s-ahb";
467284a3097f434 Viken Dadhaniya      2025-02-24  2118  			#address-cells = <2>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2119  			#size-cells = <2>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2120  			iommus = <&apps_smmu 0x43 0x0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2121  			dma-coherent;
467284a3097f434 Viken Dadhaniya      2025-02-24  2122  			status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2123  
467284a3097f434 Viken Dadhaniya      2025-02-24  2124  			i2c16: i2c@b80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2125  				compatible = "qcom,geni-i2c";
467284a3097f434 Viken Dadhaniya      2025-02-24  2126  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2127  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2128  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2129  				pinctrl-0 = <&qup_i2c16_data_clk>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2130  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2131  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2132  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2133  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2134  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2135  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2136  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2137  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2138  						<&aggre2_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2139  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2140  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2141  						     "qup-config",
467284a3097f434 Viken Dadhaniya      2025-02-24  2142  						     "qup-memory";
467284a3097f434 Viken Dadhaniya      2025-02-24  2143  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2144  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2145  				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2146  				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2147  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  2148  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  2149  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2150  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2151  
467284a3097f434 Viken Dadhaniya      2025-02-24  2152  			spi16: spi@b80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2153  				compatible = "qcom,geni-spi";
467284a3097f434 Viken Dadhaniya      2025-02-24  2154  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2155  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2156  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2157  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2158  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2159  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2160  				#address-cells = <1>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2161  				#size-cells = <0>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2162  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2163  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2164  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2165  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2166  				interconnect-names = "qup-core",
467284a3097f434 Viken Dadhaniya      2025-02-24  2167  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  2168  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2169  				operating-points-v2 = <&qup_opp_table>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2170  				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2171  				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2172  				dma-names = "tx",
467284a3097f434 Viken Dadhaniya      2025-02-24  2173  					    "rx";
467284a3097f434 Viken Dadhaniya      2025-02-24  2174  				status = "disabled";
467284a3097f434 Viken Dadhaniya      2025-02-24  2175  			};
467284a3097f434 Viken Dadhaniya      2025-02-24  2176  
467284a3097f434 Viken Dadhaniya      2025-02-24  2177  			uart16: serial@b80000 {
467284a3097f434 Viken Dadhaniya      2025-02-24  2178  				compatible = "qcom,geni-uart";
467284a3097f434 Viken Dadhaniya      2025-02-24  2179  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2180  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2181  				clock-names = "se";
467284a3097f434 Viken Dadhaniya      2025-02-24  2182  				pinctrl-0 = <&qup_uart16_cts>, <&qup_uart16_rts>,
467284a3097f434 Viken Dadhaniya      2025-02-24  2183  					    <&qup_uart16_tx>, <&qup_uart16_rx>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2184  				pinctrl-names = "default";
467284a3097f434 Viken Dadhaniya      2025-02-24  2185  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2186  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2187  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2188  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f434 Viken Dadhaniya      2025-02-24  2189  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2190  				interconnect-names = "qup-core",
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2191  						     "qup-config";
467284a3097f434 Viken Dadhaniya      2025-02-24  2192  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f434 Viken Dadhaniya      2025-02-24  2193  				operating-points-v2 = <&qup_opp_table>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2194  				status = "disabled";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2195  			};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2196  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2197  
f1b359bdf0a51cc Yuvaraj Ranganathan  2024-11-25  2198  		rng: rng@10d2000 {
f1b359bdf0a51cc Yuvaraj Ranganathan  2024-11-25  2199  			compatible = "qcom,qcs8300-trng", "qcom,trng";
f1b359bdf0a51cc Yuvaraj Ranganathan  2024-11-25  2200  			reg = <0x0 0x010d2000 0x0 0x1000>;
f1b359bdf0a51cc Yuvaraj Ranganathan  2024-11-25  2201  		};
f1b359bdf0a51cc Yuvaraj Ranganathan  2024-11-25  2202  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2203  		config_noc: interconnect@14c0000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2204  			compatible = "qcom,qcs8300-config-noc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2205  			reg = <0x0 0x014c0000 0x0 0x13080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2206  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2207  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2208  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2209  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2210  		system_noc: interconnect@1680000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2211  			compatible = "qcom,qcs8300-system-noc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2212  			reg = <0x0 0x01680000 0x0 0x15080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2213  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2214  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2215  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2216  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2217  		aggre1_noc: interconnect@16c0000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2218  			compatible = "qcom,qcs8300-aggre1-noc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2219  			reg = <0x0 0x016c0000 0x0 0x17080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2220  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2221  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2222  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2223  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2224  		aggre2_noc: interconnect@1700000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2225  			compatible = "qcom,qcs8300-aggre2-noc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2226  			reg = <0x0 0x01700000 0x0 0x1a080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2227  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2228  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2229  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2230  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2231  		pcie_anoc: interconnect@1760000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2232  			compatible = "qcom,qcs8300-pcie-anoc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2233  			reg = <0x0 0x01760000 0x0 0xc080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2234  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2235  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2236  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2237  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2238  		gpdsp_anoc: interconnect@1780000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2239  			compatible = "qcom,qcs8300-gpdsp-anoc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2240  			reg = <0x0 0x01780000 0x0 0xd080>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2241  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2242  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2243  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2244  
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2245  		mmss_noc: interconnect@17a0000 {
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2246  			compatible = "qcom,qcs8300-mmss-noc";
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2247  			reg = <0x0 0x017a0000 0x0 0x40000>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2248  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2249  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2250  		};
7be190e4bdd2bd1 Jingyi Wang          2024-12-03  2251  
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2252  		pcie0: pci@1c00000 {
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2253  			device_type = "pci";
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2254  			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2255  			reg = <0x0 0x01c00000 0x0 0x3000>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2256  			      <0x0 0x40000000 0x0 0xf20>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2257  			      <0x0 0x40000f20 0x0 0xa8>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2258  			      <0x0 0x40001000 0x0 0x4000>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2259  			      <0x0 0x40100000 0x0 0x100000>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2260  			      <0x0 0x01c03000 0x0 0x1000>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2261  			reg-names = "parf",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2262  				    "dbi",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2263  				    "elbi",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2264  				    "atu",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2265  				    "config",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2266  				    "mhi";
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2267  			#address-cells = <3>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2268  			#size-cells = <2>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2269  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2270  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2271  			bus-range = <0x00 0xff>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2272  
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2273  			dma-coherent;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2274  
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2275  			linux,pci-domain = <0>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2276  			num-lanes = <2>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2277  
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2278  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2279  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2280  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2281  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2282  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2283  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2284  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2285  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2286  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2287  			interrupt-names = "msi0",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2288  					  "msi1",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2289  					  "msi2",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2290  					  "msi3",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2291  					  "msi4",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2292  					  "msi5",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2293  					  "msi6",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2294  					  "msi7",
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2295  					  "global";
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2296  
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2297  			#interrupt-cells = <1>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26  2298  			interrupt-map-mask = <0 0 0 0x7>;
a1d5fa8b664cf1f Ziyue Zhang          2025-08-26 @2299  			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
