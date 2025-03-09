Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD962BAF4
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741493277; cv=none; b=eh4tzI+yCnrxTi9UmBMQ29S+CfEFXtz+J25owLlCRNKy0TeTsHDQqBzFuCPq0LcGVuQxNR97KA5GbbYsrUwZwRK1lU7AtpbDNE79Ddr3u4OR9JjN0CC5FKheofB850oz1f4Z1xpf/QOBEHodSBOA5F4WGkERYR/LyJtlbJnx+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741493277; c=relaxed/simple;
	bh=3p1x8O6AjcJp6LPKpZP6mZ5HcH+e+vMMQKlRrCUF9kI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZVH1N1adsxjb4ZZlvgRf/ip9iPQl0eUwazdDwjriBqT1SpmQB6RnJaM+tZMTjvoCNLxqGX1Py8PQJkAFpdlKcgfNDDJFhIrnLTI8hnrvXzsNDQo29qmAtGeqFECj+CiGWexQ174Sc5AUB2qZKcmdf+CSIxTzAweEw4yd+Zohbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NS38QLfy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NS38QLfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741493269; x=1773029269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3p1x8O6AjcJp6LPKpZP6mZ5HcH+e+vMMQKlRrCUF9kI=;
  b=NS38QLfygbem2+4mayrwoGBu7/Om8iGJLdodQQR1VOSqNowCTyAC23zz
   A4LkWWLXU+hdpwZL5AGiDxeM3gfyIGtZCCRYRwnP4Ofy5uOwevGOOXLCl
   lRt+siLPUqSw+iRSODYn/qzSMdwPjTsu2m9jTi4W9IUTUsc9oAjmuK8ch
   zjJwCRzAMjddZTmnQK1K2OPW7lzNkxrgzUqjSK1UZf31fXDx/Ev02/o3l
   eGU1rDyOir+bPDd/nOBzxJjSkn7C9fa39hQZ8HuqHPWtPYQWYJE76IX4d
   fT0+uWcDG89dhNj2z+cjNDimrOnLX305IG954u3KTi6hKMBEia/ycNxXa
   g==;
X-CSE-ConnectionGUID: ASXAauHRSXytipLTz1HNYw==
X-CSE-MsgGUID: w0nAIG4dRn2dNIVOHWeHFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="67873528"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="67873528"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 20:07:48 -0800
X-CSE-ConnectionGUID: qGY1Cp4WTIqOyYhlyjO2ZA==
X-CSE-MsgGUID: yr4QjCbbSYu97shfAD7QJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119661704"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2025 20:07:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr7x2-0002ea-0P;
	Sun, 09 Mar 2025 04:07:44 +0000
Date: Sun, 9 Mar 2025 12:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <202503091116.tLqYO5nz-lkp@intel.com>
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
In-Reply-To: <20250308-sar2130p-display-v1-10-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-10-1d4c30f43822@linaro.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Rob Clark <robdclark@gmail.com>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Sean Paul <sean@poorly.run>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kuogee Hsieh <quic_khsieh@quicinc.com>
TO: Krishna Manikandan <quic_mkrishn@quicinc.com>
TO: Jonathan Marek <jonathan@marek.ca>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: iommu@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-display-msm-dp-controller-describe-SAR2130P/20250308-094544
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250308-sar2130p-display-v1-10-1d4c30f43822%40linaro.org
patch subject: [PATCH 10/10] arm64: dts: qcom: sar2130p: add display nodes
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091116.tLqYO5nz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091116.tLqYO5nz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503091116.tLqYO5nz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2149.27-2224.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2245.27-2301.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +2149 arch/arm64/boot/dts/qcom/sar2130p.dtsi

be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    22  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    23  / {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    24  	interrupt-parent = <&intc>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    25  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    26  	#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    27  	#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    28  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    29  	chosen { };
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    30  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    31  	clocks {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    32  		xo_board: xo-board {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    33  			compatible = "fixed-clock";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    34  			#clock-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    35  			clock-frequency = <19200000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    36  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    37  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    38  		sleep_clk: sleep-clk {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    39  			compatible = "fixed-clock";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    40  			#clock-cells = <0>;
7fb01ef4907e388 Dmitry Baryshkov 2024-12-24    41  			clock-frequency = <32764>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    42  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    43  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    44  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    45  	cpus {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    46  		#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    47  		#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    48  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    49  		cpu0: cpu@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    50  			device_type = "cpu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    51  			compatible = "arm,cortex-a55";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    52  			reg = <0x0 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    53  			clocks = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    54  			enable-method = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    55  			next-level-cache = <&l2_0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    56  			qcom,freq-domain = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    57  			power-domains = <&cpu_pd0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    58  			power-domain-names = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    59  			#cooling-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    60  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    61  			l2_0: l2-cache {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    62  				compatible = "cache";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    63  				cache-level = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    64  				cache-unified;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    65  				next-level-cache = <&l3_0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    66  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    67  				l3_0: l3-cache {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    68  					compatible = "cache";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    69  					cache-level = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    70  					cache-unified;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    71  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    72  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    73  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    74  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    75  		cpu1: cpu@100 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    76  			device_type = "cpu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    77  			compatible = "arm,cortex-a55";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    78  			reg = <0x0 0x100>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    79  			clocks = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    80  			enable-method = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    81  			next-level-cache = <&l2_100>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    82  			qcom,freq-domain = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    83  			power-domains = <&cpu_pd1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    84  			power-domain-names = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    85  			#cooling-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    86  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    87  			l2_100: l2-cache {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    88  				compatible = "cache";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    89  				cache-level = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    90  				cache-unified;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    91  				next-level-cache = <&l3_0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    92  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    93  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    94  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    95  		cpu2: cpu@200 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    96  			device_type = "cpu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    97  			compatible = "arm,cortex-a55";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    98  			reg = <0x0 0x200>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02    99  			clocks = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   100  			enable-method = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   101  			next-level-cache = <&l2_200>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   102  			qcom,freq-domain = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   103  			power-domains = <&cpu_pd2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   104  			power-domain-names = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   105  			#cooling-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   106  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   107  			l2_200: l2-cache {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   108  				compatible = "cache";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   109  				cache-level = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   110  				cache-unified;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   111  				next-level-cache = <&l3_0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   112  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   113  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   114  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   115  		cpu3: cpu@300 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   116  			device_type = "cpu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   117  			compatible = "arm,cortex-a55";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   118  			reg = <0x0 0x300>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   119  			clocks = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   120  			enable-method = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   121  			next-level-cache = <&l2_300>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   122  			qcom,freq-domain = <&cpufreq_hw 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   123  			power-domains = <&cpu_pd3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   124  			power-domain-names = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   125  			#cooling-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   126  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   127  			l2_300: l2-cache {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   128  				compatible = "cache";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   129  				cache-level = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   130  				cache-unified;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   131  				next-level-cache = <&l3_0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   132  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   133  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   134  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   135  		cpu-map {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   136  			cluster0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   137  				core0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   138  					cpu = <&cpu0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   139  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   140  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   141  				core1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   142  					cpu = <&cpu1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   143  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   144  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   145  				core2 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   146  					cpu = <&cpu2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   147  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   148  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   149  				core3 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   150  					cpu = <&cpu3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   151  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   152  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   153  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   154  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   155  		idle-states {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   156  			entry-method = "psci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   157  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   158  			cpu_sleep_0: cpu-sleep-0-0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   159  				compatible = "arm,idle-state";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   160  				idle-state-name = "silver-power-collapse";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   161  				arm,psci-suspend-param = <0x40000003>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   162  				entry-latency-us = <549>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   163  				exit-latency-us = <901>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   164  				min-residency-us = <1774>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   165  				local-timer-stop;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   166  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   167  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   168  			cpu_sleep_1: cpu-sleep-0-1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   169  				compatible = "arm,idle-state";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   170  				idle-state-name = "silver-rail-power-collapse";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   171  				arm,psci-suspend-param = <0x40000004>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   172  				entry-latency-us = <702>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   173  				exit-latency-us = <915>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   174  				min-residency-us = <4001>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   175  				local-timer-stop;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   176  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   177  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   178  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   179  		domain-idle-states {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   180  			cluster_sleep_0: cluster-sleep-0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   181  				compatible = "domain-idle-state";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   182  				arm,psci-suspend-param = <0x41000044>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   183  				entry-latency-us = <2752>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   184  				exit-latency-us = <3048>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   185  				min-residency-us = <6118>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   186  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   187  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   188  			cluster_sleep_1: cluster-sleep-1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   189  				compatible = "domain-idle-state";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   190  				arm,psci-suspend-param = <0x41002344>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   191  				entry-latency-us = <3263>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   192  				exit-latency-us = <4562>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   193  				min-residency-us = <8467>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   194  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   195  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   196  			cluster_sleep_2: cluster-sleep-2 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   197  				compatible = "domain-idle-state";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   198  				arm,psci-suspend-param = <0x4100c344>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   199  				entry-latency-us = <3638>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   200  				exit-latency-us = <6562>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   201  				min-residency-us = <9862>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   202  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   203  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   204  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   205  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   206  	firmware {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   207  		scm: scm {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   208  			compatible = "qcom,scm-sar2130p", "qcom,scm";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   209  			qcom,dload-mode = <&tcsr_mutex 0x13000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   210  			interconnects = <&system_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   211  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   212  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   213  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   214  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   215  	clk_virt: interconnect-0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   216  		compatible = "qcom,sar2130p-clk-virt";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   217  		#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   218  		qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   219  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   220  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   221  	mc_virt: interconnect-1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   222  		compatible = "qcom,sar2130p-mc-virt";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   223  		#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   224  		qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   225  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   226  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   227  	memory@80000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   228  		device_type = "memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   229  		/* We expect the bootloader to fill in the size */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   230  		reg = <0x0 0x80000000 0x0 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   231  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   232  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   233  	pmu {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   234  		compatible = "arm,armv8-pmuv3";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   235  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   236  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   237  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   238  	psci {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   239  		compatible = "arm,psci-1.0";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   240  		method = "smc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   241  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   242  		cpu_pd0: power-domain-cpu0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   243  			#power-domain-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   244  			power-domains = <&cluster_pd>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   245  			domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   246  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   247  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   248  		cpu_pd1: power-domain-cpu1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   249  			#power-domain-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   250  			power-domains = <&cluster_pd>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   251  			domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   252  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   253  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   254  		cpu_pd2: power-domain-cpu2 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   255  			#power-domain-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   256  			power-domains = <&cluster_pd>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   257  			domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   258  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   259  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   260  		cpu_pd3: power-domain-cpu3 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   261  			#power-domain-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   262  			power-domains = <&cluster_pd>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   263  			domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   264  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   265  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   266  		cluster_pd: power-domain-cpu-cluster0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   267  			#power-domain-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   268  			domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>, <&cluster_sleep_2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   269  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   270  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   271  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   272  	reserved_memory: reserved-memory {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   273  		#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   274  		#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   275  		ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   276  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   277  		hyp_mem: hyp@80000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   278  			reg = <0x0 0x80000000 0x0 0x600000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   279  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   280  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   281  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   282  		xbl_dt_log_mem: xbl-dt-log@80600000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   283  			reg = <0x0 0x80600000 0x0 0x40000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   284  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   285  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   286  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   287  		xbl_ramdump_mem: xbl-ramdump@80640000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   288  			reg = <0x0 0x80640000 0x0 0x1c0000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   289  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   290  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   291  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   292  		aop_image_mem: aop-image@80800000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   293  			reg = <0x0 0x80800000 0x0 0x60000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   294  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   295  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   296  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   297  		aop_cmd_db_mem: aop-cmd-db@80860000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   298  			compatible = "qcom,cmd-db";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   299  			reg = <0x0 0x80860000 0x0 0x20000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   300  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   301  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   302  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   303  		aop_config_mem: aop-config@80880000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   304  			reg = <0x0 0x80880000 0x0 0x20000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   305  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   306  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   307  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   308  		tme_crash_dump_mem: tme-crash-dump@808a0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   309  			reg = <0x0 0x808a0000 0x0 0x40000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   310  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   311  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   312  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   313  		tme_log_mem: tme-log@808e0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   314  			reg = <0x0 0x808e0000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   315  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   316  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   317  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   318  		uefi_log_mem: uefi-log@808e4000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   319  			reg = <0x0 0x808e4000 0x0 0x10000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   320  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   321  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   322  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   323  		secdata_apss_mem: secdata-apss@808ff000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   324  			reg = <0x0 0x808ff000 0x0 0x1000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   325  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   326  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   327  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   328  		smem: smem@80900000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   329  			compatible = "qcom,smem";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   330  			reg = <0x0 0x80900000 0x0 0x200000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   331  			hwlocks = <&tcsr_mutex 3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   332  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   333  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   334  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   335  		cpucp_fw_mem: cpucp-fw@80b00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   336  			reg = <0x0 0x80b00000 0x0 0x100000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   337  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   338  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   339  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   340  		helios_ram_dump_mem: helios-ram-dump@80c00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   341  			reg = <0x0 0x80c00000 0x0 0xe00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   342  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   343  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   344  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   345  		camera_mem: camera@84e00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   346  			reg = <0x0 0x84e00000 0x0 0x800000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   347  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   348  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   349  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   350  		video_mem: video@86f00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   351  			reg = <0x0 0x86f00000 0x0 0x500000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   352  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   353  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   354  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   355  		adsp_mem: adsp@87600000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   356  			reg = <0x0 0x87600000 0x0 0x1e00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   357  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   358  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   359  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   360  		cdsp_mem: cdsp@89400000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   361  			reg = <0x0 0x89400000 0x0 0xf00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   362  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   363  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   364  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   365  		ipa_fw_mem: ipa-fw@8a300000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   366  			reg = <0x0 0x8a300000 0x0 0x10000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   367  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   368  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   369  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   370  		ipa_gsi_mem: ipa-gsi@8a3a0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   371  			reg = <0x0 0x8a310000 0x0 0xa000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   372  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   373  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   374  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   375  		gpu_micro_code_mem: gpu-micro-code@8a31a000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   376  			reg = <0x0 0x8a31a000 0x0 0x2000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   377  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   378  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   379  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   380  		cvp_mem: cvp@8a400000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   381  			reg = <0x0 0x8a400000 0x0 0x700000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   382  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   383  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   384  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   385  		xbl_sc_mem: xbl-sc@a6e00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   386  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   387  			reg = <0x0 0xa6e00000 0x0 0x40000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   388  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   389  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   390  		global_sync_mem: global-sync@a6f00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   391  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   392  			reg = <0x0 0xa6f00000 0x0 0x100000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   393  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   394  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   395  		tz_stat_mem: tz-stat@e8800000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   396  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   397  			reg = <0x0 0xe8800000 0x0 0x100000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   398  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   399  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   400  		tags_mem: tags@e8900000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   401  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   402  			reg = <0x0 0xe8900000 0x0 0x500000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   403  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   404  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   405  		qtee_mem: qtee@e8e00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   406  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   407  			reg = <0x0 0xe8e00000 0x0 0x500000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   408  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   409  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   410  		trusted_apps_mem: trusted-apps@e9300000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   411  			no-map;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   412  			reg = <0x0 0xe9300000 0x0 0xc00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   413  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   414  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   415  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   416  	smp2p-adsp {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   417  		compatible = "qcom,smp2p";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   418  		qcom,smem = <443>, <429>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   419  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   420  					     IPCC_MPROC_SIGNAL_SMP2P
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   421  					     IRQ_TYPE_EDGE_RISING>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   422  		mboxes = <&ipcc IPCC_CLIENT_LPASS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   423  				IPCC_MPROC_SIGNAL_SMP2P>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   424  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   425  		qcom,local-pid = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   426  		qcom,remote-pid = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   427  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   428  		smp2p_adsp_out: master-kernel {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   429  			qcom,entry-name = "master-kernel";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   430  			#qcom,smem-state-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   431  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   432  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   433  		smp2p_adsp_in: slave-kernel {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   434  			qcom,entry-name = "slave-kernel";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   435  			interrupt-controller;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   436  			#interrupt-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   437  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   438  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   439  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   440  	smp2p-cdsp {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   441  		compatible = "qcom,smp2p";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   442  		qcom,smem = <94>, <432>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   443  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   444  					     IPCC_MPROC_SIGNAL_SMP2P
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   445  					     IRQ_TYPE_EDGE_RISING>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   446  		mboxes = <&ipcc IPCC_CLIENT_CDSP
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   447  				IPCC_MPROC_SIGNAL_SMP2P>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   448  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   449  		qcom,local-pid = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   450  		qcom,remote-pid = <5>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   451  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   452  		smp2p_cdsp_out: master-kernel {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   453  			qcom,entry-name = "master-kernel";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   454  			#qcom,smem-state-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   455  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   456  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   457  		smp2p_cdsp_in: slave-kernel {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   458  			qcom,entry-name = "slave-kernel";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   459  			interrupt-controller;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   460  			#interrupt-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   461  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   462  	};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   463  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   464  	soc: soc@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   465  		compatible = "simple-bus";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   466  		#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   467  		#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   468  		ranges = <0 0 0 0 0x10 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   469  		dma-ranges = <0 0 0 0 0x10 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   470  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   471  		gcc: clock-controller@100000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   472  			compatible = "qcom,sar2130p-gcc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   473  			reg = <0x0 0x00100000 0x0 0x1f4200>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   474  			#clock-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   475  			#reset-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   476  			#power-domain-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   477  			clocks = <&rpmhcc RPMH_CXO_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   478  				 <&sleep_clk>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   479  				 <&pcie0_phy>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   480  				 <&pcie1_phy>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   481  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   482  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   483  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   484  		sdhc_1: mmc@7c4000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   485  			compatible = "qcom,sar2130p-sdhci", "qcom,sdhci-msm-v5";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   486  			reg = <0x0 0x007c4000 0x0 0x1000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   487  			      <0x0 0x007c5000 0x0 0x1000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   488  			reg-names = "hc", "cqhci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   489  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   490  			iommus = <&apps_smmu 0x160 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   491  			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   492  				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   493  			interrupt-names = "hc_irq", "pwr_irq";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   494  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   495  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   496  				 <&gcc GCC_SDCC1_APPS_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   497  				 <&rpmhcc RPMH_CXO_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   498  			clock-names = "iface", "core", "xo";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   499  			interconnects = <&system_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   500  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   501  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   502  					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   503  			interconnect-names = "sdhc-ddr","cpu-sdhc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   504  			power-domains = <&rpmhpd RPMHPD_CX>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   505  			operating-points-v2 = <&sdhc1_opp_table>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   506  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   507  			pinctrl-0 = <&sdc1_default>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   508  			pinctrl-1 = <&sdc1_sleep>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   509  			pinctrl-names = "default", "sleep";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   510  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   511  			bus-width = <8>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   512  			non-removable;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   513  			supports-cqe;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   514  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   515  			mmc-ddr-1_8v;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   516  			mmc-hs200-1_8v;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   517  			mmc-hs400-1_8v;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   518  			mmc-hs400-enhanced-strobe;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   519  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   520  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   521  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   522  			sdhc1_opp_table: opp-table {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   523  				compatible = "operating-points-v2";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   524  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   525  				opp-100000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   526  					opp-hz = /bits/ 64 <100000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   527  					required-opps = <&rpmhpd_opp_low_svs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   528  					opp-peak-kBps = <500000 200000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   529  					opp-avg-kBps = <104000 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   530  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   531  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   532  				opp-384000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   533  					opp-hz = /bits/ 64 <384000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   534  					required-opps = <&rpmhpd_opp_nom>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   535  					opp-peak-kBps = <2500000 1000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   536  					opp-avg-kBps = <400000 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   537  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   538  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   539  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   540  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   541  		gpi_dma0: dma-controller@900000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   542  			compatible = "qcom,sar2130p-gpi-dma", "qcom,sm6350-gpi-dma";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   543  			reg = <0x0 0x00900000 0x0 0x60000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   544  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   545  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   546  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   547  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   548  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   549  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   550  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   551  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   552  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   553  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   554  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   555  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   556  			#dma-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   557  			dma-channels = <12>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   558  			dma-channel-mask = <0x7e>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   559  			iommus = <&apps_smmu 0x76 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   560  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   561  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   562  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   563  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   564  		qupv3_id_0: geniqup@9c0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   565  			compatible = "qcom,geni-se-qup";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   566  			reg = <0x0 0x009c0000 0x0 0x2000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   567  			clock-names = "m-ahb", "s-ahb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   568  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   569  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   570  			iommus = <&apps_smmu 0x63 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   571  			interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   572  					 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   573  			interconnect-names = "qup-core";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   574  			#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   575  			#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   576  			ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   577  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   578  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   579  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   580  			i2c0: i2c@980000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   581  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   582  				reg = <0x0 0x00980000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   583  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   584  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   585  				pinctrl-0 = <&qup_i2c0_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   586  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   587  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   588  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   589  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   590  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   591  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   592  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   593  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   594  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   595  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   596  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   597  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   598  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   599  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   600  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   601  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   602  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   603  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   604  			spi0: spi@980000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   605  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   606  				reg = <0x0 0x00980000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   607  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   608  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   609  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   610  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   611  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   612  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   613  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   614  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   615  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   616  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   617  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   618  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   619  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   620  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   621  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   622  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   623  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   624  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   625  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   626  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   627  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   628  			i2c1: i2c@984000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   629  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   630  				reg = <0x0 0x00984000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   631  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   632  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   633  				pinctrl-0 = <&qup_i2c1_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   634  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   635  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   636  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   637  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   638  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   639  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   640  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   641  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   642  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   643  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   644  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   645  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   646  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   647  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   648  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   649  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   650  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   651  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   652  			spi1: spi@984000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   653  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   654  				reg = <0x0 0x00984000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   655  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   656  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   657  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   658  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   659  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   660  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   661  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   662  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   663  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   664  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   665  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   666  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   667  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   668  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   669  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   670  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   671  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   672  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   673  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   674  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   675  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   676  			i2c2: i2c@988000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   677  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   678  				reg = <0x0 0x00988000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   679  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   680  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   681  				pinctrl-0 = <&qup_i2c2_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   682  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   683  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   684  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   685  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   686  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   687  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   688  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   689  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   690  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   691  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   692  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   693  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   694  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   695  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   696  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   697  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   698  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   699  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   700  			spi2: spi@988000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   701  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   702  				reg = <0x0 0x00988000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   703  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   704  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   705  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   706  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   707  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   708  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   709  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   710  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   711  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   712  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   713  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   714  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   715  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   716  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   717  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   718  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   719  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   720  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   721  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   722  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   723  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   724  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   725  			i2c3: i2c@98c000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   726  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   727  				reg = <0x0 0x0098c000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   728  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   729  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   730  				pinctrl-0 = <&qup_i2c3_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   731  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   732  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   733  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   734  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   735  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   736  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   737  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   738  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   739  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   740  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   741  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   742  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   743  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   744  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   745  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   746  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   747  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   748  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   749  			spi3: spi@98c000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   750  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   751  				reg = <0x0 0x0098c000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   752  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   753  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   754  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   755  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   756  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   757  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   758  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   759  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   760  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   761  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   762  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   763  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   764  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   765  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   766  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   767  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   768  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   769  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   770  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   771  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   772  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   773  			i2c4: i2c@990000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   774  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   775  				reg = <0x0 0x00990000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   776  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   777  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   778  				pinctrl-0 = <&qup_i2c4_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   779  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   780  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   781  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   782  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   783  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   784  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   785  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   786  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   787  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   788  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   789  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   790  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   791  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   792  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   793  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   794  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   795  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   796  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   797  			spi4: spi@990000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   798  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   799  				reg = <0x0 0x00990000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   800  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   801  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   802  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   803  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   804  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   805  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   806  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   807  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   808  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   809  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   810  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   811  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   812  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   813  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   814  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   815  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   816  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   817  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   818  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   819  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   820  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   821  			i2c5: i2c@994000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   822  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   823  				reg = <0x0 0x00994000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   824  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   825  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   826  				pinctrl-0 = <&qup_i2c5_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   827  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   828  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   829  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   830  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   831  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   832  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   833  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   834  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   835  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   836  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   837  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   838  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   839  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   840  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   841  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   842  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   843  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   844  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   845  			spi5: spi@994000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   846  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   847  				reg = <0x0 0x00994000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   848  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   849  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   850  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   851  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   852  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   853  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   854  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   855  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   856  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   857  						<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   858  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   859  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   860  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   861  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   862  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   863  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   864  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   865  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   866  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   867  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   868  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   869  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   870  		gpi_dma1: dma-controller@a00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   871  			compatible = "qcom,sar2130p-gpi-dma", "qcom,sm6350-gpi-dma";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   872  			#dma-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   873  			reg = <0x0 0x00a00000 0x0 0x60000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   874  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   875  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   876  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   877  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   878  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   879  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   880  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   881  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   882  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   883  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   884  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   885  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   886  			dma-channels = <12>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   887  			dma-channel-mask = <0x7e>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   888  			iommus = <&apps_smmu 0x16 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   889  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   890  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   891  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   892  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   893  		qupv3_id_1: geniqup@ac0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   894  			compatible = "qcom,geni-se-qup";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   895  			reg = <0x0 0x00ac0000 0x0 0x6000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   896  			clock-names = "m-ahb", "s-ahb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   897  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   898  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   899  			iommus = <&apps_smmu 0x3 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   900  			interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   901  					 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   902  			interconnect-names = "qup-core";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   903  			#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   904  			#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   905  			ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   906  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   907  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   908  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   909  			i2c6: i2c@a80000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   910  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   911  				reg = <0x0 0x00a80000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   912  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   913  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   914  				pinctrl-0 = <&qup_i2c6_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   915  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   916  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   917  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   918  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   919  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   920  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   921  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   922  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   923  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   924  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   925  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   926  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   927  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   928  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   929  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   930  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   931  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   932  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   933  			spi6: spi@a80000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   934  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   935  				reg = <0x0 0x00a80000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   936  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   937  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   938  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   939  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   940  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   941  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   942  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   943  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   944  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   945  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   946  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   947  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   948  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   949  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   950  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   951  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   952  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   953  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   954  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   955  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   956  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   957  			i2c7: i2c@a84000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   958  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   959  				reg = <0x0 0x00a84000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   960  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   961  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   962  				pinctrl-0 = <&qup_i2c7_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   963  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   964  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   965  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   966  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   967  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   968  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   969  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   970  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   971  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   972  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   973  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   974  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   975  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   976  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   977  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   978  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   979  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   980  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   981  			spi7: spi@a84000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   982  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   983  				reg = <0x0 0x00a84000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   984  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   985  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   986  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   987  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   988  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   989  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   990  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   991  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   992  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   993  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   994  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   995  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   996  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   997  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   998  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02   999  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1000  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1001  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1002  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1003  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1004  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1005  			uart7: serial@a84000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1006  				compatible = "qcom,geni-uart";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1007  				reg = <0x0 0x00a84000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1008  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1009  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1010  				pinctrl-0 = <&qup_uart7_default>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1011  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1012  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1013  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1014  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1015  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1016  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1017  				interconnect-names = "qup-core", "qup-config";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1018  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1019  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1020  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1021  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1022  			i2c8: i2c@a88000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1023  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1024  				reg = <0x0 0x00a88000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1025  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1026  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1027  				pinctrl-0 = <&qup_i2c8_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1028  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1029  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1030  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1031  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1032  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1033  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1034  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1035  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1036  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1037  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1038  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1039  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1040  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1041  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1042  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1043  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1044  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1045  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1046  			spi8: spi@a88000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1047  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1048  				reg = <0x0 0x00a88000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1049  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1050  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1051  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1052  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1053  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1054  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1055  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1056  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1057  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1058  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1059  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1060  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1061  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1062  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1063  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1064  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1065  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1066  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1067  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1068  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1069  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1070  			i2c9: i2c@a8c000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1071  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1072  				reg = <0x0 0x00a8c000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1073  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1074  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1075  				pinctrl-0 = <&qup_i2c9_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1076  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1077  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1078  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1079  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1080  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1081  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1082  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1083  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1084  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1085  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1086  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1087  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1088  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1089  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1090  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1091  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1092  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1093  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1094  			spi9: spi@a8c000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1095  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1096  				reg = <0x0 0x00a8c000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1097  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1098  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1099  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1100  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1101  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1102  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1103  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1104  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1105  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1106  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1107  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1108  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1109  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1110  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1111  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1112  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1113  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1114  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1115  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1116  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1117  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1118  			i2c10: i2c@a90000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1119  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1120  				reg = <0x0 0x00a90000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1121  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1122  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1123  				pinctrl-0 = <&qup_i2c10_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1124  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1125  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1126  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1127  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1128  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1129  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1130  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1131  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1132  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1133  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1134  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1135  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1136  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1137  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1138  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1139  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1140  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1141  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1142  			spi10: spi@a90000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1143  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1144  				reg = <0x0 0x00a90000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1145  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1146  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1147  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1148  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1149  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1150  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1151  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1152  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1153  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1154  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1155  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1156  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1157  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1158  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1159  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1160  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1161  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1162  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1163  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1164  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1165  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1166  			i2c11: i2c@a94000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1167  				compatible = "qcom,geni-i2c";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1168  				reg = <0x0 0x00a94000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1169  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1170  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1171  				pinctrl-0 = <&qup_i2c11_data_clk>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1172  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1173  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1174  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1175  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1176  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1177  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1178  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1179  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1180  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1181  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1182  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1183  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1184  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1185  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1186  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1187  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1188  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1189  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1190  			spi11: spi@a94000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1191  				compatible = "qcom,geni-spi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1192  				reg = <0x0 0x00a94000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1193  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1194  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1195  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1196  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1197  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1198  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1199  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1200  						<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1201  						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1202  						<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1203  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1204  				interconnect-names = "qup-core", "qup-config", "qup-memory";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1205  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1206  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1207  				dma-names = "tx", "rx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1208  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1209  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1210  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1211  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1212  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1213  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1214  			uart11: serial@a94000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1215  				compatible = "qcom,geni-debug-uart";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1216  				reg = <0x0 0x00a94000 0x0 0x4000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1217  				clock-names = "se";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1218  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1219  				pinctrl-0 = <&qup_uart11_default>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1220  				pinctrl-names = "default";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1221  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1222  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1223  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1224  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1225  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1226  				interconnect-names = "qup-core",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1227  						     "qup-config";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1228  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1229  				status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1230  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1231  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1232  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1233  		config_noc: interconnect@1500000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1234  			compatible = "qcom,sar2130p-config-noc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1235  			reg = <0x0 0x01500000 0x0 0x10>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1236  			#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1237  			qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1238  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1239  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1240  		system_noc: interconnect@1680000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1241  			compatible = "qcom,sar2130p-system-noc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1242  			reg = <0x0 0x01680000 0x0 0x29080>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1243  			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1244  			#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1245  			qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1246  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1247  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1248  		pcie_noc: interconnect@16c0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1249  			compatible = "qcom,sar2130p-pcie-anoc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1250  			reg = <0x0 0x016c0000 0x0 0xa080>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1251  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1252  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1253  			#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1254  			qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1255  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1256  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1257  		mmss_noc: interconnect@1740000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1258  			compatible = "qcom,sar2130p-mmss-noc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1259  			reg = <0x0 0x01740000 0x0 0x1f100>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1260  			#interconnect-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1261  			qcom,bcm-voters = <&apps_bcm_voter>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1262  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1263  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1264  		pcie0: pcie@1c00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1265  			device_type = "pci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1266  			compatible = "qcom,sar2130p-pcie", "qcom,pcie-sm8550";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1267  			reg = <0x0 0x01c00000 0x0 0x3000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1268  			      <0x0 0x60000000 0x0 0xf1d>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1269  			      <0x0 0x60000f20 0x0 0xa8>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1270  			      <0x0 0x60001000 0x0 0x1000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1271  			      <0x0 0x60100000 0x0 0x100000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1272  			      <0x0 0x01c0c000 0x0 0x1000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1273  			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1274  			#address-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1275  			#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1276  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1277  				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1278  			bus-range = <0x00 0xff>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1279  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1280  			dma-coherent;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1281  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1282  			linux,pci-domain = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1283  			num-lanes = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1284  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1285  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1286  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1287  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1288  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1289  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1290  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1291  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1292  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1293  			interrupt-names = "msi0",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1294  					  "msi1",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1295  					  "msi2",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1296  					  "msi3",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1297  					  "msi4",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1298  					  "msi5",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1299  					  "msi6",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1300  					  "msi7";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1301  			#interrupt-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1302  			interrupt-map-mask = <0 0 0 0x7>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1303  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1304  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1305  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1306  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1307  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1308  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1309  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1310  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1311  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1312  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1313  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1314  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1315  			clock-names = "aux",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1316  				      "cfg",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1317  				      "bus_master",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1318  				      "bus_slave",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1319  				      "slave_q2a",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1320  				      "ddrss_sf_tbu",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1321  				      "noc_aggr";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1322  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1323  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1324  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1325  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1326  					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1327  			interconnect-names = "pcie-mem", "cpu-pcie";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1328  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1329  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1330  				    <0x100 &apps_smmu 0x1c01 0x1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1331  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1332  			resets = <&gcc GCC_PCIE_0_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1333  			reset-names = "pci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1334  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1335  			power-domains = <&gcc PCIE_0_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1336  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1337  			phys = <&pcie0_phy>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1338  			phy-names = "pciephy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1339  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1340  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1341  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1342  			pcieport0: pcie@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1343  				device_type = "pci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1344  				reg = <0x0 0x0 0x0 0x0 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1345  				bus-range = <0x01 0xff>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1346  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1347  				#address-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1348  				#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1349  				ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1350  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1351  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1352  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1353  		pcie0_phy: phy@1c06000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1354  			compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1355  			reg = <0x0 0x01c06000 0x0 0x2000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1356  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1357  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1358  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1359  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1360  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1361  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1362  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1363  				      "pipe";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1364  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1365  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1366  			reset-names = "phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1367  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1368  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1369  			assigned-clock-rates = <100000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1370  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1371  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1372  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1373  			#clock-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1374  			clock-output-names = "pcie0_pipe_clk";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1375  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1376  			#phy-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1377  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1378  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1379  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1380  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1381  		pcie1: pcie@1c08000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1382  			device_type = "pci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1383  			compatible = "qcom,sar2130p-pcie", "qcom,pcie-sm8550";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1384  			reg = <0x0 0x01c08000 0x0 0x3000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1385  			      <0x0 0x40000000 0x0 0xf1d>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1386  			      <0x0 0x40000f20 0x0 0xa8>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1387  			      <0x0 0x40001000 0x0 0x1000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1388  			      <0x0 0x40100000 0x0 0x100000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1389  			      <0x0 0x01c0b000 0x0 0x1000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1390  			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1391  			#address-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1392  			#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1393  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1394  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1395  			bus-range = <0x00 0xff>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1396  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1397  			dma-coherent;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1398  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1399  			linux,pci-domain = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1400  			num-lanes = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1401  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1402  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1403  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1404  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1405  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1406  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1407  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1408  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1409  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1410  			interrupt-names = "msi0",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1411  					  "msi1",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1412  					  "msi2",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1413  					  "msi3",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1414  					  "msi4",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1415  					  "msi5",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1416  					  "msi6",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1417  					  "msi7";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1418  			#interrupt-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1419  			interrupt-map-mask = <0 0 0 0x7>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1420  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1421  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1422  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1423  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1424  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1425  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1426  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1427  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1428  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1429  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1430  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1431  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1432  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1433  				 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1434  			clock-names = "aux",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1435  				      "cfg",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1436  				      "bus_master",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1437  				      "bus_slave",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1438  				      "slave_q2a",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1439  				      "ddrss_sf_tbu",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1440  				      "noc_aggr",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1441  				      "cnoc_sf_axi",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1442  				      "qmip_pcie_ahb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1443  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1444  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1445  			assigned-clock-rates = <19200000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1446  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1447  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1448  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1449  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1450  					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1451  			interconnect-names = "pcie-mem", "cpu-pcie";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1452  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1453  			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1454  				    <0x100 &apps_smmu 0x1e01 0x1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1455  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1456  			resets = <&gcc GCC_PCIE_1_BCR>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1457  				<&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1458  			reset-names = "pci", "link_down";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1459  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1460  			power-domains = <&gcc PCIE_1_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1461  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1462  			phys = <&pcie1_phy>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1463  			phy-names = "pciephy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1464  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1465  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1466  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1467  			pcie@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1468  				device_type = "pci";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1469  				reg = <0x0 0x0 0x0 0x0 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1470  				bus-range = <0x01 0xff>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1471  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1472  				#address-cells = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1473  				#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1474  				ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1475  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1476  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1477  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1478  		pcie1_phy: phy@1c0e000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1479  			compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1480  			reg = <0x0 0x01c0e000 0x0 0x2000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1481  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1482  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1483  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1484  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1485  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1486  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1487  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1488  				      "pipe";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1489  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1490  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1491  			reset-names = "phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1492  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1493  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1494  			assigned-clock-rates = <100000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1495  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1496  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1497  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1498  			#clock-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1499  			clock-output-names = "pcie1_pipe_clk";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1500  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1501  			#phy-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1502  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1503  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1504  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1505  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1506  		tcsr_mutex: hwlock@1f40000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1507  			compatible = "qcom,tcsr-mutex";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1508  			reg = <0x0 0x01f40000 0x0 0x20000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1509  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1510  			#hwlock-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1511  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1512  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1513  		tcsr: clock-controller@1fc0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1514  			compatible = "qcom,sar2130p-tcsr", "syscon";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1515  			reg = <0x0 0x01fc0000 0x0 0x30000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1516  			clocks = <&rpmhcc RPMH_CXO_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1517  			#clock-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1518  			#reset-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1519  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1520  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1521  		remoteproc_adsp: remoteproc@3000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1522  			compatible = "qcom,sar2130p-adsp-pas";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1523  			reg = <0x0 0x03000000 0x0 0x10000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1524  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1525  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1526  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1527  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1528  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1529  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1530  			interrupt-names = "wdog", "fatal", "ready",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1531  					  "handover", "stop-ack";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1532  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1533  			clocks = <&rpmhcc RPMH_CXO_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1534  			clock-names = "xo";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1535  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1536  			power-domains = <&rpmhpd RPMHPD_LCX>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1537  					<&rpmhpd RPMHPD_LMX>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1538  			power-domain-names = "lcx", "lmx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1539  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1540  			memory-region = <&adsp_mem>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1541  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1542  			qcom,qmp = <&aoss_qmp>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1543  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1544  			qcom,smem-states = <&smp2p_adsp_out 0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1545  			qcom,smem-state-names = "stop";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1546  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1547  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1548  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1549  			remoteproc_adsp_glink: glink-edge {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1550  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1551  							     IPCC_MPROC_SIGNAL_GLINK_QMP
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1552  							     IRQ_TYPE_EDGE_RISING>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1553  				mboxes = <&ipcc IPCC_CLIENT_LPASS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1554  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1555  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1556  				label = "lpass";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1557  				qcom,remote-pid = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1558  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1559  				gpr {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1560  					compatible = "qcom,gpr";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1561  					qcom,glink-channels = "adsp_apps";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1562  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1563  					qcom,intents = <512 20>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1564  					#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1565  					#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1566  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1567  					q6apm: service@1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1568  						compatible = "qcom,q6apm";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1569  						reg = <GPR_APM_MODULE_IID>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1570  						#sound-dai-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1571  						qcom,protection-domain = "avs/audio",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1572  									 "msm/adsp/audio_pd";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1573  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1574  						q6apmdai: dais {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1575  							compatible = "qcom,q6apm-dais";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1576  							iommus = <&apps_smmu 0x1801 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1577  						};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1578  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1579  						q6apmbedai: bedais {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1580  							compatible = "qcom,q6apm-lpass-dais";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1581  							#sound-dai-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1582  						};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1583  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1584  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1585  					q6prm: service@2 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1586  						compatible = "qcom,q6prm";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1587  						reg = <GPR_PRM_MODULE_IID>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1588  						qcom,protection-domain = "avs/audio",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1589  									 "msm/adsp/audio_pd";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1590  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1591  						q6prmcc: clock-controller {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1592  							compatible = "qcom,q6prm-lpass-clocks";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1593  							#clock-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1594  						};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1595  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1596  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1597  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1598  				fastrpc {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1599  					compatible = "qcom,fastrpc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1600  					qcom,glink-channels = "fastrpcglink-apps-dsp";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1601  					label = "adsp";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1602  					qcom,non-secure-domain;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1603  					#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1604  					#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1605  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1606  					compute-cb@3 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1607  						compatible = "qcom,fastrpc-compute-cb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1608  						reg = <3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1609  						iommus = <&apps_smmu 0x1803 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1610  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1611  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1612  					compute-cb@4 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1613  						compatible = "qcom,fastrpc-compute-cb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1614  						reg = <4>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1615  						iommus = <&apps_smmu 0x1804 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1616  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1617  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1618  					compute-cb@5 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1619  						compatible = "qcom,fastrpc-compute-cb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1620  						reg = <5>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1621  						iommus = <&apps_smmu 0x1805 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1622  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1623  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1624  					compute-cb@6 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1625  						compatible = "qcom,fastrpc-compute-cb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1626  						reg = <6>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1627  						iommus = <&apps_smmu 0x1806 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1628  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1629  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1630  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1631  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1632  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1633  		gpu: gpu@3d00000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1634  			compatible = "qcom,adreno-621.0", "qcom,adreno";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1635  			reg = <0x0 0x03d00000 0x0 0x40000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1636  			      <0x0 0x03d9e000 0x0 0x2000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1637  			      <0x0 0x03d61000 0x0 0x800>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1638  			reg-names = "kgsl_3d0_reg_memory",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1639  				    "cx_mem",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1640  				    "cx_dbgc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1641  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1642  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1643  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1644  			iommus = <&adreno_smmu 0 0x401>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1645  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1646  			operating-points-v2 = <&gpu_opp_table>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1647  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1648  			qcom,gmu = <&gmu>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1649  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1650  			nvmem-cells = <&gpu_speed_bin>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1651  			nvmem-cell-names = "speed_bin";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1652  			#cooling-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1653  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1654  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1655  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1656  			gpu_zap_shader: zap-shader {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1657  				memory-region = <&gpu_micro_code_mem>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1658  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1659  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1660  			gpu_opp_table: opp-table {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1661  				compatible = "operating-points-v2";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1662  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1663  				opp-843000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1664  					opp-hz = /bits/ 64 <843000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1665  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1666  					opp-supported-hw = <0x1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1667  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1668  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1669  				opp-780000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1670  					opp-hz = /bits/ 64 <780000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1671  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1672  					opp-supported-hw = <0x1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1673  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1674  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1675  				opp-644000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1676  					opp-hz = /bits/ 64 <644000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1677  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1678  					opp-supported-hw = <0x3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1679  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1680  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1681  				opp-570000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1682  					opp-hz = /bits/ 64 <570000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1683  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1684  					opp-supported-hw = <0x3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1685  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1686  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1687  				opp-450000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1688  					opp-hz = /bits/ 64 <450000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1689  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1690  					opp-supported-hw = <0x3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1691  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1692  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1693  				opp-320000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1694  					opp-hz = /bits/ 64 <320000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1695  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1696  					opp-supported-hw = <0x3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1697  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1698  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1699  				opp-235000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1700  					opp-hz = /bits/ 64 <235000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1701  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1702  					opp-supported-hw = <0x3>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1703  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1704  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1705  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1706  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1707  		gmu: gmu@3d6a000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1708  			compatible = "qcom,adreno-gmu-621.0", "qcom,adreno-gmu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1709  			reg = <0x0 0x03d6a000 0x0 0x35000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1710  			      <0x0 0x03de0000 0x0 0x10000>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1711  			      <0x0 0x0b290000 0x0 0x10000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1712  			reg-names = "gmu", "rscc", "gmu_pdc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1713  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1714  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1715  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1716  			interrupt-names = "hfi", "gmu";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1717  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1718  			clocks = <&gpucc GPU_CC_AHB_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1719  				 <&gpucc GPU_CC_CX_GMU_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1720  				 <&gpucc GPU_CC_CXO_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1721  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1722  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1723  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1724  			clock-names = "ahb",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1725  				      "gmu",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1726  				      "cxo",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1727  				      "axi",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1728  				      "memnoc",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1729  				      "hub";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1730  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1731  			power-domains = <&gpucc GPU_CX_GDSC>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1732  					<&gpucc GPU_GX_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1733  			power-domain-names = "cx",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1734  					     "gx";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1735  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1736  			iommus = <&adreno_smmu 5 0x400>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1737  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1738  			qcom,qmp = <&aoss_qmp>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1739  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1740  			operating-points-v2 = <&gmu_opp_table>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1741  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1742  			gmu_opp_table: opp-table {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1743  				compatible = "operating-points-v2";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1744  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1745  				opp-220000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1746  					opp-hz = /bits/ 64 <220000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1747  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1748  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1749  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1750  				opp-550000000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1751  					opp-hz = /bits/ 64 <550000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1752  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1753  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1754  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1755  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1756  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1757  		gpucc: clock-controller@3d90000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1758  			compatible = "qcom,sar2130p-gpucc";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1759  			reg = <0x0 0x03d90000 0x0 0xa000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1760  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1761  			clocks = <&rpmhcc RPMH_CXO_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1762  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1763  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1764  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1765  			#clock-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1766  			#reset-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1767  			#power-domain-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1768  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1769  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1770  		adreno_smmu: iommu@3da0000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1771  			compatible = "qcom,sar2130p-smmu-500", "qcom,adreno-smmu",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1772  				     "qcom,smmu-500", "arm,mmu-500";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1773  			reg = <0x0 0x03da0000 0x0 0x10000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1774  			#iommu-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1775  			#global-interrupts = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1776  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1777  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1778  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1779  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1780  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1781  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1782  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1783  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1784  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1785  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1786  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1787  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1788  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1789  				 <&gpucc GPU_CC_AHB_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1790  			clock-names = "hlos",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1791  				      "bus",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1792  				      "iface",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1793  				      "ahb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1794  			power-domains = <&gpucc GPU_CX_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1795  			dma-coherent;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1796  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1797  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1798  		usb_1_hsphy: phy@88e3000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1799  			compatible = "qcom,sar2130p-snps-eusb2-phy",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1800  				     "qcom,sm8550-snps-eusb2-phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1801  			reg = <0x0 0x088e3000 0x0 0x154>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1802  			#phy-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1803  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1804  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1805  			clock-names = "ref";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1806  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1807  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1808  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1809  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1810  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1811  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1812  		usb_dp_qmpphy: phy@88e8000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1813  			compatible = "qcom,sar2130p-qmp-usb3-dp-phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1814  			reg = <0x0 0x088e8000 0x0 0x3000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1815  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1816  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1817  				 <&rpmhcc RPMH_CXO_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1818  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1819  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1820  			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1821  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1822  			power-domains = <&gcc USB3_PHY_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1823  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1824  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1825  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1826  			reset-names = "phy", "common";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1827  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1828  			#clock-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1829  			#phy-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1830  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1831  			orientation-switch;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1832  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1833  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1834  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1835  			ports {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1836  				#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1837  				#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1838  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1839  				port@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1840  					reg = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1841  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1842  					usb_dp_qmpphy_out: endpoint {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1843  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1844  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1845  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1846  				port@1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1847  					reg = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1848  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1849  					usb_dp_qmpphy_usb_ss_in: endpoint {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1850  						remote-endpoint = <&usb_1_dwc3_ss>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1851  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1852  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1853  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1854  				port@2 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1855  					reg = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1856  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1857  					usb_dp_qmpphy_dp_in: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1858  						remote-endpoint = <&mdss_dp0_out>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1859  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1860  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1861  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1862  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1863  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1864  		usb_1: usb@a6f8800 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1865  			compatible = "qcom,sar2130p-dwc3", "qcom,dwc3";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1866  			reg = <0x0 0x0a6f8800 0x0 0x400>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1867  			#address-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1868  			#size-cells = <2>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1869  			ranges;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1870  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1871  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1872  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1873  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1874  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1875  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1876  				 <&tcsr TCSR_USB3_CLKREF_EN>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1877  			clock-names = "cfg_noc",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1878  				      "core",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1879  				      "iface",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1880  				      "sleep",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1881  				      "mock_utmi",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1882  				      "xo";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1883  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1884  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1885  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1886  			assigned-clock-rates = <19200000>, <200000000>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1887  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1888  			interrupts-extended = <&intc GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1889  					      <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1890  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1891  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1892  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1893  			interrupt-names = "pwr_event",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1894  					  "hs_phy_irq",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1895  					  "dp_hs_phy_irq",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1896  					  "dm_hs_phy_irq",
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1897  					  "ss_phy_irq";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1898  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1899  			power-domains = <&gcc USB30_PRIM_GDSC>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1900  			required-opps = <&rpmhpd_opp_nom>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1901  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1902  			resets = <&gcc GCC_USB30_PRIM_BCR>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1903  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1904  			interconnects = <&system_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1905  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1906  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1907  					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1908  			interconnect-names = "usb-ddr", "apps-usb";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1909  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1910  			status = "disabled";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1911  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1912  			usb_1_dwc3: usb@a600000 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1913  				compatible = "snps,dwc3";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1914  				reg = <0x0 0x0a600000 0x0 0xcd00>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1915  				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1916  				iommus = <&apps_smmu 0x20 0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1917  				phys = <&usb_1_hsphy>,
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1918  				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1919  				phy-names = "usb2-phy", "usb3-phy";
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1920  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1921  				snps,has-lpm-erratum;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1922  				snps,hird-threshold = /bits/ 8 <0x0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1923  				snps,is-utmi-l1-suspend;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1924  				snps,dis-u1-entry-quirk;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1925  				snps,dis-u2-entry-quirk;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1926  				snps,dis_u2_susphy_quirk;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1927  				snps,dis_u3_susphy_quirk;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1928  				snps,parkmode-disable-ss-quirk;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1929  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1930  				tx-fifo-resize;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1931  				dma-coherent;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1932  				usb-role-switch;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1933  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1934  				ports {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1935  					#address-cells = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1936  					#size-cells = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1937  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1938  					port@0 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1939  						reg = <0>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1940  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1941  						usb_1_dwc3_hs: endpoint {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1942  						};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1943  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1944  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1945  					port@1 {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1946  						reg = <1>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1947  
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1948  						usb_1_dwc3_ss: endpoint {
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1949  							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1950  						};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1951  					};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1952  				};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1953  			};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1954  		};
be9115bfe5bf612 Dmitry Baryshkov 2024-11-02  1955  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1956  		mdss: display-subsystem@ae00000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1957  			compatible = "qcom,sar2130p-mdss";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1958  			reg = <0x0 0x0ae00000 0x0 0x1000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1959  			reg-names = "mdss";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1960  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1961  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1962  			interrupt-controller;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1963  			#interrupt-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1964  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1965  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1966  				 <&gcc GCC_DISP_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1967  				 <&gcc GCC_DISP_HF_AXI_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1968  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1969  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1970  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1971  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1972  			power-domains = <&dispcc MDSS_GDSC>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1973  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1974  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1975  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1976  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1977  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1978  			interconnect-names = "mdp0-mem", "cpu-cfg";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1979  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1980  			iommus = <&apps_smmu 0x2000 0x402>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1981  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1982  			#address-cells = <2>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1983  			#size-cells = <2>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1984  			ranges;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1985  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1986  			status = "disabled";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1987  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1988  			mdss_mdp: display-controller@ae01000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1989  				compatible = "qcom,sar2130p-dpu";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1990  				reg = <0x0 0x0ae01000 0x0 0x8f000>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1991  				      <0x0 0x0aeb0000 0x0 0x2008>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1992  				reg-names = "mdp",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1993  					    "vbif";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1994  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1995  				interrupt-parent = <&mdss>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1996  				interrupts = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1997  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1998  				clocks = <&gcc GCC_DISP_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  1999  					 <&gcc GCC_DISP_HF_AXI_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2000  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2001  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2002  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2003  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2004  				clock-names = "bus",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2005  					      "nrt_bus",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2006  					      "iface",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2007  					      "lut",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2008  					      "core",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2009  					      "vsync";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2010  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2011  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2012  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2013  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2014  				assigned-clock-rates = <19200000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2015  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2016  				operating-points-v2 = <&mdp_opp_table>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2017  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2018  				ports {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2019  					#address-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2020  					#size-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2021  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2022  					port@0 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2023  						reg = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2024  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2025  						dpu_intf1_out: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2026  							remote-endpoint = <&mdss_dsi0_in>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2027  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2028  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2029  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2030  					port@1 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2031  						reg = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2032  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2033  						dpu_intf2_out: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2034  							remote-endpoint = <&mdss_dsi1_in>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2035  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2036  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2037  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2038  					port@2 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2039  						reg = <2>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2040  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2041  						dpu_intf0_out: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2042  							remote-endpoint = <&mdss_dp0_in>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2043  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2044  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2045  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2046  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2047  				mdp_opp_table: opp-table {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2048  					compatible = "operating-points-v2";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2049  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2050  					opp-200000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2051  						opp-hz = /bits/ 64 <200000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2052  						required-opps = <&rpmhpd_opp_low_svs>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2053  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2054  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2055  					opp-325000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2056  						opp-hz = /bits/ 64 <325000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2057  						required-opps = <&rpmhpd_opp_svs>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2058  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2059  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2060  					opp-514000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2061  						opp-hz = /bits/ 64 <514000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2062  						required-opps = <&rpmhpd_opp_turbo>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2063  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2064  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2065  			};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2066  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2067  			mdss_dp0: displayport-controller@ae90000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2068  				compatible = "qcom,sar2130p-dp",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2069  					     "qcom,sm8350-dp";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2070  				reg = <0x0 0xae90000 0x0 0x200>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2071  				      <0x0 0xae90200 0x0 0x200>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2072  				      <0x0 0xae90400 0x0 0xc00>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2073  				      <0x0 0xae91000 0x0 0x400>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2074  				      <0x0 0xae91400 0x0 0x400>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2075  				interrupt-parent = <&mdss>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2076  				interrupts = <12>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2077  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2078  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2079  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2080  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2081  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2082  				clock-names = "core_iface",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2083  					      "core_aux",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2084  					      "ctrl_link",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2085  					      "ctrl_link_iface",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2086  					      "stream_pixel";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2087  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2088  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2089  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2090  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2091  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2092  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2093  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2094  				phy-names = "dp";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2095  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2096  				#sound-dai-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2097  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2098  				operating-points-v2 = <&dp_opp_table>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2099  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2100  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2101  				status = "disabled";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2102  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2103  				ports {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2104  					#address-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2105  					#size-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2106  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2107  					port@0 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2108  						reg = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2109  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2110  						mdss_dp0_in: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2111  							remote-endpoint = <&dpu_intf0_out>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2112  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2113  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2114  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2115  					port@1 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2116  						reg = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2117  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2118  						mdss_dp0_out: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2119  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2120  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2121  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2122  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2123  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2124  				dp_opp_table: opp-table {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2125  					compatible = "operating-points-v2";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2126  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2127  					opp-162000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2128  						opp-hz = /bits/ 64 <162000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2129  						required-opps = <&rpmhpd_opp_low_svs_d1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2130  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2131  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2132  					opp-270000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2133  						opp-hz = /bits/ 64 <270000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2134  						required-opps = <&rpmhpd_opp_low_svs>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2135  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2136  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2137  					opp-540000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2138  						opp-hz = /bits/ 64 <540000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2139  						required-opps = <&rpmhpd_opp_svs_l1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2140  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2141  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2142  					opp-810000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2143  						opp-hz = /bits/ 64 <810000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2144  						required-opps = <&rpmhpd_opp_nom>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2145  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2146  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2147  			};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2148  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08 @2149  			mdss_dsi0: dsi@ae94000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2150  				compatible = "qcom,sar2130p-dsi-ctrl",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2151  					     "qcom,mdss-dsi-ctrl";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2152  				reg = <0x0 0x0ae94000 0x0 0x400>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2153  				reg-names = "dsi_ctrl";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2154  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2155  				interrupt-parent = <&mdss>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2156  				interrupts = <4>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2157  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2158  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2159  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2160  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2161  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2162  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2163  					 <&gcc GCC_DISP_HF_AXI_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2164  				clock-names = "byte",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2165  					      "byte_intf",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2166  					      "pixel",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2167  					      "core",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2168  					      "iface",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2169  					      "bus";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2170  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2171  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2172  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2173  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2174  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2175  				assigned-clock-parents = <&mdss_dsi0_phy 0>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2176  							 <&mdss_dsi0_phy 1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2177  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2178  				operating-points-v2 = <&mdss_dsi_opp_table>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2179  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2180  				phys = <&mdss_dsi0_phy>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2181  				phy-names = "dsi";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2182  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2183  				#address-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2184  				#size-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2185  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2186  				status = "disabled";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2187  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2188  				ports {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2189  					#address-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2190  					#size-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2191  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2192  					port@0 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2193  						reg = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2194  						mdss_dsi0_in: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2195  							remote-endpoint = <&dpu_intf1_out>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2196  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2197  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2198  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2199  					port@1 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2200  						reg = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2201  						mdss_dsi0_out: endpoint {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2202  						};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2203  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2204  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2205  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2206  				mdss_dsi_opp_table: opp-table {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2207  					compatible = "operating-points-v2";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2208  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2209  					opp-187500000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2210  						opp-hz = /bits/ 64 <187500000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2211  						required-opps = <&rpmhpd_opp_low_svs>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2212  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2213  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2214  					opp-300000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2215  						opp-hz = /bits/ 64 <300000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2216  						required-opps = <&rpmhpd_opp_svs>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2217  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2218  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2219  					opp-358000000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2220  						opp-hz = /bits/ 64 <358000000>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2221  						required-opps = <&rpmhpd_opp_nom>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2222  					};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2223  				};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2224  			};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2225  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2226  			mdss_dsi0_phy: phy@ae95000 {
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2227  				compatible = "qcom,sar2130p-dsi-phy-5nm";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2228  				reg = <0x0 0x0ae95000 0x0 0x200>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2229  				      <0x0 0x0ae95200 0x0 0x280>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2230  				      <0x0 0x0ae95500 0x0 0x400>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2231  				reg-names = "dsi_phy",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2232  					    "dsi_phy_lane",
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2233  					    "dsi_pll";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2234  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2235  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2236  					 <&rpmhcc RPMH_CXO_CLK>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2237  				clock-names = "iface", "ref";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2238  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2239  				#clock-cells = <1>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2240  				#phy-cells = <0>;
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2241  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2242  				status = "disabled";
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2243  			};
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08  2244  
d825bde1aa1c5e7 Dmitry Baryshkov 2025-03-08 @2245  			mdss_dsi1: dsi@ae96000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
