Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7DDF59
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845479; cv=none; b=k4p7dNCilswvYWmq5HXU+ZyYKpngQrj5cTXfFcRl8PiDPE9ee4o3osxvvCC+4ZqDPbQfS4Kxwi1WWqDJR1rqmJ3FMupS8myeYnVb8a2wuEyUFY1flBuYvQ8Oj6/tdGxFOjNt1bcpRCVqr65B1O3GG1efSs/z7kz3Y+7X+NyYbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845479; c=relaxed/simple;
	bh=i5JPisxLsrHlCXV6hlwX9zFgannUIi04MFjYRTGOG6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mFoO9xOkqG6YLVWKP3GWUg3i4rrwZCJwU546w4K0omNegve9mBa2M3MoJ3k0IDztoU++KFIbtxmoyQYa37CceMLKSkpDDd4pzyk6FErqnRqove0Kf2icThrxXEyHI48euXpRnvxe5E2tkNYjm6NuDUQZOEV41bnI5pc/QEQPmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Agvpv1tT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Agvpv1tT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743845468; x=1775381468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5JPisxLsrHlCXV6hlwX9zFgannUIi04MFjYRTGOG6E=;
  b=Agvpv1tTPik/03Y9bXAy9agyFyfvSICY1+lgZYBD5pLdMn4uUsSAOiAq
   dePdpHTyn23SO+0CcE5GQyef19T162cS13T4vFrlL6MJ/qepOGsU6Znme
   mxgxbaEcBhYvfHjD5cdYST92GefQgb7d+3JrWiqC/JcwX9bTUx2ZWfQ2E
   69lDRUHu7IULm280MD6+GA7cLLBIUlHT0TQGqw2ZHoYkCKf41TwxEi27E
   ba2ZOSuu7h8D4lYTTSRe5bg7NxnrPIZr10+tCTs58tMczPp9cwub9hs4W
   pF43tSJ32HQqPHgHDEUFd5439YzuTkd2JaEbgaIoA6oLRgV/EpAqhNBBX
   w==;
X-CSE-ConnectionGUID: L4liECjIS7CSrG/JOuX0Wg==
X-CSE-MsgGUID: C5YSdSbqSCSp4vG/AUo3nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49075664"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="49075664"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 02:31:06 -0700
X-CSE-ConnectionGUID: oilkanXjTKmEkHm5QpxzSA==
X-CSE-MsgGUID: j+XHtyGSTA2heLkud5kJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127502346"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 02:31:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0zrh-0001vn-2K;
	Sat, 05 Apr 2025 09:31:01 +0000
Date: Sat, 5 Apr 2025 17:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <202504051742.IhvWSLsL-lkp@intel.com>
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
In-Reply-To: <20250404115539.1151201-7-quic_amakhija@quicinc.com>
References: <20250404115539.1151201-7-quic_amakhija@quicinc.com>
TO: Ayushi Makhija <quic_amakhija@quicinc.com>
TO: linux-arm-msm@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
TO: freedreno@lists.freedesktop.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Ayushi Makhija <quic_amakhija@quicinc.com>
CC: robdclark@gmail.com
CC: dmitry.baryshkov@linaro.org
CC: sean@poorly.run
CC: marijn.suijten@somainline.org
CC: andersson@kernel.org
CC: robh@kernel.org
CC: robh+dt@kernel.org
CC: krzk+dt@kernel.org
CC: konradybcio@kernel.org
CC: conor+dt@kernel.org
CC: andrzej.hajda@intel.com
CC: neil.armstrong@linaro.org
CC: rfoss@kernel.org
CC: Laurent.pinchart@ideasonboard.com
CC: jonas@kwiboo.se
CC: jernej.skrabec@gmail.com
CC: quic_abhinavk@quicinc.com
CC: quic_rajeevny@quicinc.com
CC: quic_vproddut@quicinc.com
CC: quic_jesszhan@quicinc.com
CC: Dmitry Baryshkov <lumag@kernel.org>

Hi Ayushi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20250404]
[cannot apply to robh/for-next drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayushi-Makhija/dt-bindings-display-msm-dsi-phy-7nm-document-the-SA8775P-DSI-PHY/20250404-195808
base:   linus/master
patch link:    https://lore.kernel.org/r/20250404115539.1151201-7-quic_amakhija%40quicinc.com
patch subject: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051742.IhvWSLsL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051742.IhvWSLsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504051742.IhvWSLsL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:3937.28-3998.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:4019.28-4080.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +3937 arch/arm64/boot/dts/qcom/sa8775p.dtsi

603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    21  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    22  / {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    23  	interrupt-parent = <&intc>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    24  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    25  	#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    26  	#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    27  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    28  	clocks {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    29  		xo_board_clk: xo-board-clk {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    30  			compatible = "fixed-clock";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    31  			#clock-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    32  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    33  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    34  		sleep_clk: sleep-clk {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    35  			compatible = "fixed-clock";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    36  			#clock-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    37  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    38  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    39  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    40  	cpus {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    41  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    42  		#size-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    43  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    44  		cpu0: cpu@0 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    45  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    46  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    47  			reg = <0x0 0x0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    48  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12    49  			power-domains = <&cpu_pd0>;
736f50489e08ba Maulik Shah           2024-11-12    50  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21    51  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    52  			next-level-cache = <&l2_0>;
717ca334afd7ce Ankit Sharma          2024-07-31    53  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31    54  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    55  			l2_0: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    56  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    57  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    58  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    59  				next-level-cache = <&l3_0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    60  				l3_0: l3-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    61  					compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    62  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    63  					cache-unified;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    64  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    65  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    66  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    67  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    68  		cpu1: cpu@100 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    69  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    70  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    71  			reg = <0x0 0x100>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    72  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12    73  			power-domains = <&cpu_pd1>;
736f50489e08ba Maulik Shah           2024-11-12    74  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21    75  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    76  			next-level-cache = <&l2_1>;
717ca334afd7ce Ankit Sharma          2024-07-31    77  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31    78  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    79  			l2_1: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    80  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    81  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    82  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    83  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    84  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    85  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    86  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    87  		cpu2: cpu@200 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    88  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    89  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    90  			reg = <0x0 0x200>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    91  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12    92  			power-domains = <&cpu_pd2>;
736f50489e08ba Maulik Shah           2024-11-12    93  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21    94  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    95  			next-level-cache = <&l2_2>;
717ca334afd7ce Ankit Sharma          2024-07-31    96  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31    97  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22    98  			l2_2: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14    99  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   100  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   101  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   102  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   103  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   104  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   105  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   106  		cpu3: cpu@300 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   107  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   108  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   109  			reg = <0x0 0x300>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   110  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12   111  			power-domains = <&cpu_pd3>;
736f50489e08ba Maulik Shah           2024-11-12   112  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21   113  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   114  			next-level-cache = <&l2_3>;
717ca334afd7ce Ankit Sharma          2024-07-31   115  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31   116  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   117  			l2_3: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   118  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   119  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   120  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   121  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   122  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   123  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   124  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   125  		cpu4: cpu@10000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   126  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   127  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   128  			reg = <0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   129  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12   130  			power-domains = <&cpu_pd4>;
736f50489e08ba Maulik Shah           2024-11-12   131  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21   132  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   133  			next-level-cache = <&l2_4>;
717ca334afd7ce Ankit Sharma          2024-07-31   134  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31   135  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   136  			l2_4: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   137  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   138  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   139  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   140  				next-level-cache = <&l3_1>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   141  				l3_1: l3-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   142  					compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   143  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   144  					cache-unified;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   145  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   146  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   147  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   148  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   149  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   150  		cpu5: cpu@10100 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   151  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   152  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   153  			reg = <0x0 0x10100>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   154  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12   155  			power-domains = <&cpu_pd5>;
736f50489e08ba Maulik Shah           2024-11-12   156  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21   157  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   158  			next-level-cache = <&l2_5>;
717ca334afd7ce Ankit Sharma          2024-07-31   159  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31   160  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   161  			l2_5: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   162  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   163  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   164  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   165  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   166  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   167  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   168  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   169  		cpu6: cpu@10200 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   170  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   171  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   172  			reg = <0x0 0x10200>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   173  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12   174  			power-domains = <&cpu_pd6>;
736f50489e08ba Maulik Shah           2024-11-12   175  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21   176  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   177  			next-level-cache = <&l2_6>;
717ca334afd7ce Ankit Sharma          2024-07-31   178  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31   179  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   180  			l2_6: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   181  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   182  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   183  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   184  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   185  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   186  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   187  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   188  		cpu7: cpu@10300 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   189  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   190  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   191  			reg = <0x0 0x10300>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   192  			enable-method = "psci";
736f50489e08ba Maulik Shah           2024-11-12   193  			power-domains = <&cpu_pd7>;
736f50489e08ba Maulik Shah           2024-11-12   194  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski   2023-02-21   195  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   196  			next-level-cache = <&l2_7>;
717ca334afd7ce Ankit Sharma          2024-07-31   197  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma          2024-07-31   198  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   199  			l2_7: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   200  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   201  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   202  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   203  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   204  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   205  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   206  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   207  		cpu-map {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   208  			cluster0 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   209  				core0 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   210  					cpu = <&cpu0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   211  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   212  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   213  				core1 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   214  					cpu = <&cpu1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   215  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   216  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   217  				core2 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   218  					cpu = <&cpu2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   219  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   220  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   221  				core3 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   222  					cpu = <&cpu3>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   223  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   224  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   225  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   226  			cluster1 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   227  				core0 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   228  					cpu = <&cpu4>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   229  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   230  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   231  				core1 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   232  					cpu = <&cpu5>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   233  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   234  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   235  				core2 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   236  					cpu = <&cpu6>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   237  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   238  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   239  				core3 {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   240  					cpu = <&cpu7>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   241  				};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   242  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   243  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   244  
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   245  		idle-states {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   246  			entry-method = "psci";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   247  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   248  			gold_cpu_sleep_0: cpu-sleep-0 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   249  				compatible = "arm,idle-state";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   250  				idle-state-name = "gold-power-collapse";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   251  				arm,psci-suspend-param = <0x40000003>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   252  				entry-latency-us = <549>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   253  				exit-latency-us = <901>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   254  				min-residency-us = <1774>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   255  				local-timer-stop;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   256  			};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   257  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   258  			gold_rail_cpu_sleep_0: cpu-sleep-1 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   259  				compatible = "arm,idle-state";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   260  				idle-state-name = "gold-rail-power-collapse";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   261  				arm,psci-suspend-param = <0x40000004>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   262  				entry-latency-us = <702>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   263  				exit-latency-us = <1061>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   264  				min-residency-us = <4488>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   265  				local-timer-stop;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   266  			};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   267  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   268  
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   269  		domain-idle-states {
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   270  			cluster_sleep_gold: cluster-sleep-0 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   271  				compatible = "domain-idle-state";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   272  				arm,psci-suspend-param = <0x41000044>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   273  				entry-latency-us = <2752>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   274  				exit-latency-us = <3048>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   275  				min-residency-us = <6118>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   276  			};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   277  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   278  			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   279  				compatible = "domain-idle-state";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   280  				arm,psci-suspend-param = <0x42000144>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   281  				entry-latency-us = <3263>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   282  				exit-latency-us = <6562>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   283  				min-residency-us = <9987>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   284  			};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   285  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   286  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   287  
6596118ccdcdb3 Jie Gan               2024-05-21   288  	dummy-sink {
6596118ccdcdb3 Jie Gan               2024-05-21   289  		compatible = "arm,coresight-dummy-sink";
6596118ccdcdb3 Jie Gan               2024-05-21   290  
6596118ccdcdb3 Jie Gan               2024-05-21   291  		in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21   292  			port {
6596118ccdcdb3 Jie Gan               2024-05-21   293  				eud_in: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21   294  					remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21   295  					<&swao_rep_out1>;
6596118ccdcdb3 Jie Gan               2024-05-21   296  				};
6596118ccdcdb3 Jie Gan               2024-05-21   297  			};
6596118ccdcdb3 Jie Gan               2024-05-21   298  		};
6596118ccdcdb3 Jie Gan               2024-05-21   299  	};
6596118ccdcdb3 Jie Gan               2024-05-21   300  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   301  	firmware {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   302  		scm {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   303  			compatible = "qcom,scm-sa8775p", "qcom,scm";
1a82fbfc87fd76 Mukesh Ojha           2024-08-30   304  			qcom,dload-mode = <&tcsr 0x13000>;
d7aeff30093888 Bartosz Golaszewski   2024-05-27   305  			memory-region = <&tz_ffi_mem>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   306  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   307  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   308  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   309  	aggre1_noc: interconnect-aggre1-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   310  		compatible = "qcom,sa8775p-aggre1-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   311  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   312  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   313  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   314  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   315  	aggre2_noc: interconnect-aggre2-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   316  		compatible = "qcom,sa8775p-aggre2-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   317  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   318  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   319  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   320  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   321  	clk_virt: interconnect-clk-virt {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   322  		compatible = "qcom,sa8775p-clk-virt";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   323  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   324  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   325  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   326  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   327  	config_noc: interconnect-config-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   328  		compatible = "qcom,sa8775p-config-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   329  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   330  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   331  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   332  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   333  	dc_noc: interconnect-dc-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   334  		compatible = "qcom,sa8775p-dc-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   335  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   336  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   337  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   338  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   339  	gem_noc: interconnect-gem-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   340  		compatible = "qcom,sa8775p-gem-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   341  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   342  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   343  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   344  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   345  	gpdsp_anoc: interconnect-gpdsp-anoc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   346  		compatible = "qcom,sa8775p-gpdsp-anoc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   347  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   348  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   349  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   350  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   351  	lpass_ag_noc: interconnect-lpass-ag-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   352  		compatible = "qcom,sa8775p-lpass-ag-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   353  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   354  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   355  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   356  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   357  	mc_virt: interconnect-mc-virt {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   358  		compatible = "qcom,sa8775p-mc-virt";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   359  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   360  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   361  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   362  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   363  	mmss_noc: interconnect-mmss-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   364  		compatible = "qcom,sa8775p-mmss-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   365  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   366  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   367  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   368  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   369  	nspa_noc: interconnect-nspa-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   370  		compatible = "qcom,sa8775p-nspa-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   371  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   372  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   373  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   374  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   375  	nspb_noc: interconnect-nspb-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   376  		compatible = "qcom,sa8775p-nspb-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   377  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   378  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   379  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   380  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   381  	pcie_anoc: interconnect-pcie-anoc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   382  		compatible = "qcom,sa8775p-pcie-anoc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   383  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   384  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   385  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   386  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   387  	system_noc: interconnect-system-noc {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   388  		compatible = "qcom,sa8775p-system-noc";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   389  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   390  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   391  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   392  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   393  	/* Will be updated by the bootloader. */
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   394  	memory@80000000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   395  		device_type = "memory";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   396  		reg = <0x0 0x80000000 0x0 0x0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   397  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   398  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   399  	qup_opp_table_100mhz: opp-table-qup100mhz {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   400  		compatible = "operating-points-v2";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   401  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   402  		opp-100000000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   403  			opp-hz = /bits/ 64 <100000000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   404  			required-opps = <&rpmhpd_opp_svs_l1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   405  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   406  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   407  
86c96823d4b5f0 Bartosz Golaszewski   2023-04-14   408  	pmu {
86c96823d4b5f0 Bartosz Golaszewski   2023-04-14   409  		compatible = "arm,armv8-pmuv3";
86c96823d4b5f0 Bartosz Golaszewski   2023-04-14   410  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
86c96823d4b5f0 Bartosz Golaszewski   2023-04-14   411  	};
86c96823d4b5f0 Bartosz Golaszewski   2023-04-14   412  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   413  	psci {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   414  		compatible = "arm,psci-1.0";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   415  		method = "smc";
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   416  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   417  		cpu_pd0: power-domain-cpu0 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   418  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   419  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   420  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   421  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   422  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   423  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   424  		cpu_pd1: power-domain-cpu1 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   425  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   426  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   427  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   428  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   429  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   430  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   431  		cpu_pd2: power-domain-cpu2 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   432  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   433  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   434  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   435  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   436  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   437  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   438  		cpu_pd3: power-domain-cpu3 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   439  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   440  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   441  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   442  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   443  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   444  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   445  		cpu_pd4: power-domain-cpu4 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   446  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   447  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   448  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   449  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   450  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   451  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   452  		cpu_pd5: power-domain-cpu5 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   453  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   454  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   455  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   456  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   457  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   458  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   459  		cpu_pd6: power-domain-cpu6 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   460  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   461  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   462  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   463  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   464  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   465  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   466  		cpu_pd7: power-domain-cpu7 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   467  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   468  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   469  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   470  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   471  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   472  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   473  		cluster_0_pd: power-domain-cluster0 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   474  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   475  			power-domains = <&cluster_2_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   476  			domain-idle-states = <&cluster_sleep_gold>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   477  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   478  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   479  		cluster_1_pd: power-domain-cluster1 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   480  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   481  			power-domains = <&cluster_2_pd>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   482  			domain-idle-states = <&cluster_sleep_gold>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   483  		};
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   484  
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   485  		cluster_2_pd: power-domain-cluster2 {
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   486  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22   487  			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
4f79d0deae37c2 Bartosz Golaszewski   2024-08-07   488  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   489  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   490  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   491  	reserved-memory {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   492  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   493  		#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   494  		ranges;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   495  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   496  		sail_ss_mem: sail-ss@80000000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   497  			reg = <0x0 0x80000000 0x0 0x10000000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   498  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   499  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   500  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   501  		hyp_mem: hyp@90000000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   502  			reg = <0x0 0x90000000 0x0 0x600000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   503  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   504  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   505  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   506  		xbl_boot_mem: xbl-boot@90600000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   507  			reg = <0x0 0x90600000 0x0 0x200000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   508  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   509  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   510  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   511  		aop_image_mem: aop-image@90800000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   512  			reg = <0x0 0x90800000 0x0 0x60000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   513  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   514  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   515  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   516  		aop_cmd_db_mem: aop-cmd-db@90860000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   517  			compatible = "qcom,cmd-db";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   518  			reg = <0x0 0x90860000 0x0 0x20000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   519  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   520  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   521  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   522  		uefi_log: uefi-log@908b0000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   523  			reg = <0x0 0x908b0000 0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   524  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   525  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   526  
f9491ad2318d5c Ninad Naik            2024-01-25   527  		ddr_training_checksum: ddr-training-checksum@908c0000 {
f9491ad2318d5c Ninad Naik            2024-01-25   528  			reg = <0x0 0x908c0000 0x0 0x1000>;
f9491ad2318d5c Ninad Naik            2024-01-25   529  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   530  		};
f9491ad2318d5c Ninad Naik            2024-01-25   531  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   532  		reserved_mem: reserved@908f0000 {
f9491ad2318d5c Ninad Naik            2024-01-25   533  			reg = <0x0 0x908f0000 0x0 0xe000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   534  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   535  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   536  
f9491ad2318d5c Ninad Naik            2024-01-25   537  		secdata_apss_mem: secdata-apss@908fe000 {
f9491ad2318d5c Ninad Naik            2024-01-25   538  			reg = <0x0 0x908fe000 0x0 0x2000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   539  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   540  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   541  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   542  		smem_mem: smem@90900000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   543  			compatible = "qcom,smem";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   544  			reg = <0x0 0x90900000 0x0 0x200000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   545  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   546  			hwlocks = <&tcsr_mutex 3>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   547  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   548  
f9491ad2318d5c Ninad Naik            2024-01-25   549  		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
f9491ad2318d5c Ninad Naik            2024-01-25   550  			reg = <0x0 0x90c00000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik            2024-01-25   551  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   552  		};
f9491ad2318d5c Ninad Naik            2024-01-25   553  
f9491ad2318d5c Ninad Naik            2024-01-25   554  		sail_mailbox_mem: sail-ss@90d00000 {
f9491ad2318d5c Ninad Naik            2024-01-25   555  			reg = <0x0 0x90d00000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik            2024-01-25   556  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   557  		};
f9491ad2318d5c Ninad Naik            2024-01-25   558  
f9491ad2318d5c Ninad Naik            2024-01-25   559  		sail_ota_mem: sail-ss@90e00000 {
f9491ad2318d5c Ninad Naik            2024-01-25   560  			reg = <0x0 0x90e00000 0x0 0x300000>;
f9491ad2318d5c Ninad Naik            2024-01-25   561  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   562  		};
f9491ad2318d5c Ninad Naik            2024-01-25   563  
f9491ad2318d5c Ninad Naik            2024-01-25   564  		aoss_backup_mem: aoss-backup@91b00000 {
f9491ad2318d5c Ninad Naik            2024-01-25   565  			reg = <0x0 0x91b00000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik            2024-01-25   566  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   567  		};
f9491ad2318d5c Ninad Naik            2024-01-25   568  
f9491ad2318d5c Ninad Naik            2024-01-25   569  		cpucp_backup_mem: cpucp-backup@91b40000 {
f9491ad2318d5c Ninad Naik            2024-01-25   570  			reg = <0x0 0x91b40000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik            2024-01-25   571  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   572  		};
f9491ad2318d5c Ninad Naik            2024-01-25   573  
f9491ad2318d5c Ninad Naik            2024-01-25   574  		tz_config_backup_mem: tz-config-backup@91b80000 {
f9491ad2318d5c Ninad Naik            2024-01-25   575  			reg = <0x0 0x91b80000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik            2024-01-25   576  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   577  		};
f9491ad2318d5c Ninad Naik            2024-01-25   578  
f9491ad2318d5c Ninad Naik            2024-01-25   579  		ddr_training_data_mem: ddr-training-data@91b90000 {
f9491ad2318d5c Ninad Naik            2024-01-25   580  			reg = <0x0 0x91b90000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik            2024-01-25   581  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   582  		};
f9491ad2318d5c Ninad Naik            2024-01-25   583  
f9491ad2318d5c Ninad Naik            2024-01-25   584  		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
f9491ad2318d5c Ninad Naik            2024-01-25   585  			reg = <0x0 0x91ba0000 0x0 0x1000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   586  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   587  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   588  
d7aeff30093888 Bartosz Golaszewski   2024-05-27   589  		tz_ffi_mem: tz-ffi@91c00000 {
d7aeff30093888 Bartosz Golaszewski   2024-05-27   590  			compatible = "shared-dma-pool";
d7aeff30093888 Bartosz Golaszewski   2024-05-27   591  			reg = <0x0 0x91c00000 0x0 0x1400000>;
d7aeff30093888 Bartosz Golaszewski   2024-05-27   592  			no-map;
d7aeff30093888 Bartosz Golaszewski   2024-05-27   593  		};
d7aeff30093888 Bartosz Golaszewski   2024-05-27   594  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   595  		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   596  			reg = <0x0 0x93b00000 0x0 0xf00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   597  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   598  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   599  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   600  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   601  			reg = <0x0 0x94a00000 0x0 0x800000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   602  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   603  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   604  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   605  		pil_camera_mem: pil-camera@95200000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   606  			reg = <0x0 0x95200000 0x0 0x500000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   607  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   608  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   609  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   610  		pil_adsp_mem: pil-adsp@95c00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   611  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   612  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   613  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   614  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   615  		pil_gdsp0_mem: pil-gdsp0@97b00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   616  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   617  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   618  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   619  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   620  		pil_gdsp1_mem: pil-gdsp1@99900000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   621  			reg = <0x0 0x99900000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   622  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   623  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   624  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   625  		pil_cdsp0_mem: pil-cdsp0@9b800000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   626  			reg = <0x0 0x9b800000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   627  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   628  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   629  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   630  		pil_gpu_mem: pil-gpu@9d600000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   631  			reg = <0x0 0x9d600000 0x0 0x2000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   632  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   633  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   634  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   635  		pil_cdsp1_mem: pil-cdsp1@9d700000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   636  			reg = <0x0 0x9d700000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   637  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   638  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   639  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   640  		pil_cvp_mem: pil-cvp@9f500000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   641  			reg = <0x0 0x9f500000 0x0 0x700000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   642  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   643  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   644  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   645  		pil_video_mem: pil-video@9fc00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   646  			reg = <0x0 0x9fc00000 0x0 0x700000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   647  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   648  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   649  
f9491ad2318d5c Ninad Naik            2024-01-25   650  		audio_mdf_mem: audio-mdf-region@ae000000 {
f9491ad2318d5c Ninad Naik            2024-01-25   651  			reg = <0x0 0xae000000 0x0 0x1000000>;
f9491ad2318d5c Ninad Naik            2024-01-25   652  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   653  		};
f9491ad2318d5c Ninad Naik            2024-01-25   654  
f9491ad2318d5c Ninad Naik            2024-01-25   655  		firmware_mem: firmware-region@b0000000 {
f9491ad2318d5c Ninad Naik            2024-01-25   656  			reg = <0x0 0xb0000000 0x0 0x800000>;
f9491ad2318d5c Ninad Naik            2024-01-25   657  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   658  		};
f9491ad2318d5c Ninad Naik            2024-01-25   659  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   660  		hyptz_reserved_mem: hyptz-reserved@beb00000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   661  			reg = <0x0 0xbeb00000 0x0 0x11500000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   662  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   663  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   664  
f9491ad2318d5c Ninad Naik            2024-01-25   665  		scmi_mem: scmi-region@d0000000 {
f9491ad2318d5c Ninad Naik            2024-01-25   666  			reg = <0x0 0xd0000000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik            2024-01-25   667  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   668  		};
f9491ad2318d5c Ninad Naik            2024-01-25   669  
f9491ad2318d5c Ninad Naik            2024-01-25   670  		firmware_logs_mem: firmware-logs@d0040000 {
f9491ad2318d5c Ninad Naik            2024-01-25   671  			reg = <0x0 0xd0040000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik            2024-01-25   672  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   673  		};
f9491ad2318d5c Ninad Naik            2024-01-25   674  
f9491ad2318d5c Ninad Naik            2024-01-25   675  		firmware_audio_mem: firmware-audio@d0050000 {
f9491ad2318d5c Ninad Naik            2024-01-25   676  			reg = <0x0 0xd0050000 0x0 0x4000>;
f9491ad2318d5c Ninad Naik            2024-01-25   677  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   678  		};
f9491ad2318d5c Ninad Naik            2024-01-25   679  
f9491ad2318d5c Ninad Naik            2024-01-25   680  		firmware_reserved_mem: firmware-reserved@d0054000 {
f9491ad2318d5c Ninad Naik            2024-01-25   681  			reg = <0x0 0xd0054000 0x0 0x9c000>;
f9491ad2318d5c Ninad Naik            2024-01-25   682  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   683  		};
f9491ad2318d5c Ninad Naik            2024-01-25   684  
f9491ad2318d5c Ninad Naik            2024-01-25   685  		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
f9491ad2318d5c Ninad Naik            2024-01-25   686  			reg = <0x0 0xd00f0000 0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   687  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   688  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   689  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   690  		tags_mem: tags@d0100000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   691  			reg = <0x0 0xd0100000 0x0 0x1200000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   692  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   693  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   694  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   695  		qtee_mem: qtee@d1300000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   696  			reg = <0x0 0xd1300000 0x0 0x500000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   697  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   698  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   699  
f9491ad2318d5c Ninad Naik            2024-01-25   700  		deepsleep_backup_mem: deepsleep-backup@d1800000 {
f9491ad2318d5c Ninad Naik            2024-01-25   701  			reg = <0x0 0xd1800000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik            2024-01-25   702  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   703  		};
f9491ad2318d5c Ninad Naik            2024-01-25   704  
f9491ad2318d5c Ninad Naik            2024-01-25   705  		trusted_apps_mem: trusted-apps@d1900000 {
f9491ad2318d5c Ninad Naik            2024-01-25   706  			reg = <0x0 0xd1900000 0x0 0x3800000>;
f9491ad2318d5c Ninad Naik            2024-01-25   707  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   708  		};
f9491ad2318d5c Ninad Naik            2024-01-25   709  
f9491ad2318d5c Ninad Naik            2024-01-25   710  		tz_stat_mem: tz-stat@db100000 {
f9491ad2318d5c Ninad Naik            2024-01-25   711  			reg = <0x0 0xdb100000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik            2024-01-25   712  			no-map;
f9491ad2318d5c Ninad Naik            2024-01-25   713  		};
f9491ad2318d5c Ninad Naik            2024-01-25   714  
f9491ad2318d5c Ninad Naik            2024-01-25   715  		cpucp_fw_mem: cpucp-fw@db200000 {
f9491ad2318d5c Ninad Naik            2024-01-25   716  			reg = <0x0 0xdb200000 0x0 0x100000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   717  			no-map;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   718  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   719  	};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   720  
df54dcb34ff2ea Tengfei Fan           2024-08-05   721  	smp2p-adsp {
df54dcb34ff2ea Tengfei Fan           2024-08-05   722  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan           2024-08-05   723  		qcom,smem = <443>, <429>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   724  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
df54dcb34ff2ea Tengfei Fan           2024-08-05   725  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan           2024-08-05   726  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   727  		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   728  
df54dcb34ff2ea Tengfei Fan           2024-08-05   729  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   730  		qcom,remote-pid = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   731  
df54dcb34ff2ea Tengfei Fan           2024-08-05   732  		smp2p_adsp_out: master-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   733  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   734  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   735  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   736  
df54dcb34ff2ea Tengfei Fan           2024-08-05   737  		smp2p_adsp_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   738  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   739  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan           2024-08-05   740  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   741  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   742  	};
df54dcb34ff2ea Tengfei Fan           2024-08-05   743  
df54dcb34ff2ea Tengfei Fan           2024-08-05   744  	smp2p-cdsp0 {
df54dcb34ff2ea Tengfei Fan           2024-08-05   745  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan           2024-08-05   746  		qcom,smem = <94>, <432>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   747  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df54dcb34ff2ea Tengfei Fan           2024-08-05   748  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan           2024-08-05   749  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   750  		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   751  
df54dcb34ff2ea Tengfei Fan           2024-08-05   752  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   753  		qcom,remote-pid = <5>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   754  
df54dcb34ff2ea Tengfei Fan           2024-08-05   755  		smp2p_cdsp0_out: master-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   756  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   757  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   758  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   759  
df54dcb34ff2ea Tengfei Fan           2024-08-05   760  		smp2p_cdsp0_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   761  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   762  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan           2024-08-05   763  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   764  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   765  	};
df54dcb34ff2ea Tengfei Fan           2024-08-05   766  
df54dcb34ff2ea Tengfei Fan           2024-08-05   767  	smp2p-cdsp1 {
df54dcb34ff2ea Tengfei Fan           2024-08-05   768  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan           2024-08-05   769  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   770  		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
df54dcb34ff2ea Tengfei Fan           2024-08-05   771  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan           2024-08-05   772  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   773  		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   774  
df54dcb34ff2ea Tengfei Fan           2024-08-05   775  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   776  		qcom,remote-pid = <12>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   777  
df54dcb34ff2ea Tengfei Fan           2024-08-05   778  		smp2p_cdsp1_out: master-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   779  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   780  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   781  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   782  
df54dcb34ff2ea Tengfei Fan           2024-08-05   783  		smp2p_cdsp1_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   784  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   785  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan           2024-08-05   786  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   787  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   788  	};
df54dcb34ff2ea Tengfei Fan           2024-08-05   789  
df54dcb34ff2ea Tengfei Fan           2024-08-05   790  	smp2p-gpdsp0 {
df54dcb34ff2ea Tengfei Fan           2024-08-05   791  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan           2024-08-05   792  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   793  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
df54dcb34ff2ea Tengfei Fan           2024-08-05   794  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan           2024-08-05   795  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   796  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   797  
df54dcb34ff2ea Tengfei Fan           2024-08-05   798  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   799  		qcom,remote-pid = <17>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   800  
df54dcb34ff2ea Tengfei Fan           2024-08-05   801  		smp2p_gpdsp0_out: master-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   802  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   803  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   804  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   805  
df54dcb34ff2ea Tengfei Fan           2024-08-05   806  		smp2p_gpdsp0_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   807  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   808  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan           2024-08-05   809  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   810  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   811  	};
df54dcb34ff2ea Tengfei Fan           2024-08-05   812  
df54dcb34ff2ea Tengfei Fan           2024-08-05   813  	smp2p-gpdsp1 {
df54dcb34ff2ea Tengfei Fan           2024-08-05   814  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan           2024-08-05   815  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   816  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
df54dcb34ff2ea Tengfei Fan           2024-08-05   817  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan           2024-08-05   818  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   819  		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   820  
df54dcb34ff2ea Tengfei Fan           2024-08-05   821  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   822  		qcom,remote-pid = <18>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   823  
df54dcb34ff2ea Tengfei Fan           2024-08-05   824  		smp2p_gpdsp1_out: master-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   825  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   826  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   827  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   828  
df54dcb34ff2ea Tengfei Fan           2024-08-05   829  		smp2p_gpdsp1_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan           2024-08-05   830  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan           2024-08-05   831  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan           2024-08-05   832  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan           2024-08-05   833  		};
df54dcb34ff2ea Tengfei Fan           2024-08-05   834  	};
df54dcb34ff2ea Tengfei Fan           2024-08-05   835  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   836  	soc: soc@0 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   837  		compatible = "simple-bus";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   838  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   839  		#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   840  		ranges = <0 0 0 0 0x10 0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   841  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   842  		gcc: clock-controller@100000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   843  			compatible = "qcom,sa8775p-gcc";
3fd7e2eec8f4fe Bartosz Golaszewski   2023-03-27   844  			reg = <0x0 0x00100000 0x0 0xc7018>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   845  			#clock-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   846  			#reset-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   847  			#power-domain-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   848  			clocks = <&rpmhcc RPMH_CXO_CLK>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   849  				 <&sleep_clk>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   850  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   851  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   852  				 <0>,
de1001525c1aa2 Shazad Hussain        2023-04-28   853  				 <&usb_0_qmpphy>,
de1001525c1aa2 Shazad Hussain        2023-04-28   854  				 <&usb_1_qmpphy>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   855  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   856  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   857  				 <0>,
489f14be0e0a19 Mrinmay Sarkar        2023-07-21   858  				 <&pcie0_phy>,
489f14be0e0a19 Mrinmay Sarkar        2023-07-21   859  				 <&pcie1_phy>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   860  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   861  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   862  				 <0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   863  			power-domains = <&rpmhpd SA8775P_CX>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   864  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   865  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   866  		ipcc: mailbox@408000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   867  			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
3fd7e2eec8f4fe Bartosz Golaszewski   2023-03-27   868  			reg = <0x0 0x00408000 0x0 0x1000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   869  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   870  			interrupt-controller;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   871  			#interrupt-cells = <3>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   872  			#mbox-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   873  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14   874  
86348c7587f556 Konrad Dybcio         2024-11-07   875  		gpi_dma2: dma-controller@800000  {
a8d18df5a5a114 Konrad Dybcio         2024-11-08   876  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya       2024-10-21   877  			reg = <0x0 0x00800000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   878  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   879  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   880  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   881  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   882  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   883  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   884  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   885  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   886  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   887  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   888  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   889  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   890  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   891  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   892  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   893  			iommus = <&apps_smmu 0x5b6 0x0>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   894  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya       2024-10-21   895  		};
34d17ccb5db804 Viken Dadhaniya       2024-10-21   896  
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   897  		qupv3_id_2: geniqup@8c0000 {
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   898  			compatible = "qcom,geni-se-qup";
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   899  			reg = <0x0 0x008c0000 0x0 0x6000>;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   900  			ranges;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   901  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   902  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   903  			clock-names = "m-ahb", "s-ahb";
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   904  			iommus = <&apps_smmu 0x5a3 0x0>;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   905  			#address-cells = <2>;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   906  			#size-cells = <2>;
dc3ad22112de7f Bartosz Golaszewski   2023-03-09   907  			status = "disabled";
a23d122572a4ad Bartosz Golaszewski   2023-03-09   908  
ee2f5f906d69d9 Shazad Hussain        2023-05-26   909  			i2c14: i2c@880000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26   910  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   911  				reg = <0x0 0x880000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   912  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   913  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   914  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   915  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   916  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   917  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   918  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26   919  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   920  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26   921  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   922  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   923  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26   924  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26   925  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   926  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   927  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   928  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   929  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21   930  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   931  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   932  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26   933  
1b2d7ad5ac14df Shazad Hussain        2023-05-26   934  			spi14: spi@880000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26   935  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26   936  				reg = <0x0 0x880000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   937  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   938  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   939  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   940  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   941  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26   942  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26   943  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26   944  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26   945  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26   946  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26   947  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26   948  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26   949  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26   950  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26   951  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   952  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   953  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   954  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21   955  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26   956  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26   957  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26   958  
34a407316b7d37 Viken Dadhaniya       2024-10-07   959  			uart14: serial@880000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07   960  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07   961  				reg = <0x0 0x00880000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07   962  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07   963  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07   964  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07   965  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07   966  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07   967  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07   968  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07   969  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07   970  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07   971  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07   972  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07   973  
ee2f5f906d69d9 Shazad Hussain        2023-05-26   974  			i2c15: i2c@884000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26   975  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   976  				reg = <0x0 0x884000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   977  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   978  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   979  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   980  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   981  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   982  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   983  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26   984  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   985  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26   986  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26   987  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26   988  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26   989  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26   990  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   991  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   992  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21   993  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21   994  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21   995  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   996  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26   997  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26   998  
1b2d7ad5ac14df Shazad Hussain        2023-05-26   999  			spi15: spi@884000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1000  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1001  				reg = <0x0 0x884000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1002  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1003  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1004  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1005  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1006  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1007  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1008  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1009  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1010  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1011  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1012  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1013  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1014  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1015  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1016  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1017  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1018  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1019  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1020  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1021  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1022  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1023  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1024  			uart15: serial@884000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1025  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1026  				reg = <0x0 0x00884000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1027  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1028  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1029  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1030  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1031  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1032  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1033  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1034  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1035  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1036  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1037  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1038  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1039  			i2c16: i2c@888000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1040  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1041  				reg = <0x0 0x888000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1042  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1043  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1044  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1045  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1046  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1047  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1048  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1049  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1050  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1051  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1052  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1053  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1054  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1055  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1056  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1057  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1058  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1059  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1060  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1061  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1062  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1063  
cfd975f588400e Bartosz Golaszewski   2023-03-09  1064  			spi16: spi@888000 {
cfd975f588400e Bartosz Golaszewski   2023-03-09  1065  				compatible = "qcom,geni-spi";
cfd975f588400e Bartosz Golaszewski   2023-03-09  1066  				reg = <0x0 0x00888000 0x0 0x4000>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1067  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1068  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1069  				clock-names = "se";
cfd975f588400e Bartosz Golaszewski   2023-03-09  1070  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski   2023-03-09  1071  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski   2023-03-09  1072  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski   2023-03-09  1073  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski   2023-03-09  1074  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski   2023-03-09  1075  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1076  				interconnect-names = "qup-core",
cfd975f588400e Bartosz Golaszewski   2023-03-09  1077  						     "qup-config",
cfd975f588400e Bartosz Golaszewski   2023-03-09  1078  						     "qup-memory";
cfd975f588400e Bartosz Golaszewski   2023-03-09  1079  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1080  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1081  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1082  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1083  					    "rx";
cfd975f588400e Bartosz Golaszewski   2023-03-09  1084  				#address-cells = <1>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1085  				#size-cells = <0>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  1086  				status = "disabled";
cfd975f588400e Bartosz Golaszewski   2023-03-09  1087  			};
cfd975f588400e Bartosz Golaszewski   2023-03-09  1088  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1089  			uart16: serial@888000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1090  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1091  				reg = <0x0 0x00888000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1092  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1093  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1094  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1095  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1096  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1097  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1098  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1099  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1100  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1101  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1102  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1103  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1104  			i2c17: i2c@88c000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1105  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1106  				reg = <0x0 0x88c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1107  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1108  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1109  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1110  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1111  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1112  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1113  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1114  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1115  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1116  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1117  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1118  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1119  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1120  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1121  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1122  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1123  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1124  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1125  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1126  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1127  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1128  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1129  			spi17: spi@88c000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1130  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1131  				reg = <0x0 0x88c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1132  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1133  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1134  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1135  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1136  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1137  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1138  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1139  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1140  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1141  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1142  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1143  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1144  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1145  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1146  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1147  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1148  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1149  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1150  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1151  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1152  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1153  
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1154  			uart17: serial@88c000 {
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1155  				compatible = "qcom,geni-uart";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1156  				reg = <0x0 0x0088c000 0x0 0x4000>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1157  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1158  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1159  				clock-names = "se";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1160  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1161  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1162  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1163  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1164  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1165  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1166  				status = "disabled";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1167  			};
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  1168  
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1169  			i2c18: i2c@890000 {
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1170  				compatible = "qcom,geni-i2c";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1171  				reg = <0x0 0x00890000 0x0 0x4000>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1172  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1173  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1174  				clock-names = "se";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1175  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1176  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1177  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1178  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1179  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1180  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1181  				interconnect-names = "qup-core",
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1182  						     "qup-config",
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1183  						     "qup-memory";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1184  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1185  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1186  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1187  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1188  					    "rx";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1189  				#address-cells = <1>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1190  				#size-cells = <0>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1191  				status = "disabled";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  1192  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1193  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1194  			spi18: spi@890000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1195  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1196  				reg = <0x0 0x890000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1197  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1198  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1199  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1200  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1201  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1202  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1203  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1204  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1205  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1206  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1207  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1208  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1209  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1210  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1211  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1212  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1213  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1214  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1215  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1216  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1217  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1218  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1219  			uart18: serial@890000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1220  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1221  				reg = <0x0 0x00890000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1222  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1223  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1224  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1225  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1226  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1227  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1228  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1229  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1230  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1231  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1232  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1233  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1234  			i2c19: i2c@894000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1235  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1236  				reg = <0x0 0x894000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1237  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1238  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1239  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1240  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1241  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1242  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1243  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1244  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1245  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1246  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1247  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1248  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1249  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1250  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1251  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1252  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1253  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1254  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1255  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1256  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1257  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1258  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1259  			spi19: spi@894000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1260  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1261  				reg = <0x0 0x894000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1262  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1263  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1264  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1265  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1266  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1267  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1268  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1269  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1270  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1271  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1272  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1273  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1274  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1275  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1276  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1277  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1278  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1279  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1280  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1281  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1282  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1283  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1284  			uart19: serial@894000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1285  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1286  				reg = <0x0 0x00894000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1287  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1288  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1289  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1290  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1291  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1292  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1293  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1294  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1295  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1296  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1297  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1298  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1299  			i2c20: i2c@898000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1300  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1301  				reg = <0x0 0x898000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1302  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1303  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1304  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1305  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1306  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1307  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1308  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1309  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1310  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1311  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1312  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1313  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1314  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1315  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1316  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1317  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1318  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1319  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1320  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1321  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1322  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1323  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1324  			spi20: spi@898000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1325  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1326  				reg = <0x0 0x898000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1327  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1328  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1329  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1330  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1331  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1332  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1333  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1334  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1335  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1336  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1337  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1338  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1339  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1340  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1341  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1342  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1343  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1344  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1345  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1346  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1347  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1348  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1349  			uart20: serial@898000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1350  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1351  				reg = <0x0 0x00898000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1352  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1353  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1354  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1355  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1356  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1357  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1358  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1359  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1360  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1361  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1362  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1363  
dc3ad22112de7f Bartosz Golaszewski   2023-03-09  1364  		};
dc3ad22112de7f Bartosz Golaszewski   2023-03-09  1365  
86348c7587f556 Konrad Dybcio         2024-11-07  1366  		gpi_dma0: dma-controller@900000  {
a8d18df5a5a114 Konrad Dybcio         2024-11-08  1367  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1368  			reg = <0x0 0x00900000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1369  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1370  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1371  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1372  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1373  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1374  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1375  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1376  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1377  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1378  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1379  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1380  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1381  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1382  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1383  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1384  			iommus = <&apps_smmu 0x416 0x0>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1385  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1386  		};
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1387  
07e3e17205794c Shazad Hussain        2023-05-26  1388  		qupv3_id_0: geniqup@9c0000 {
07e3e17205794c Shazad Hussain        2023-05-26  1389  			compatible = "qcom,geni-se-qup";
07e3e17205794c Shazad Hussain        2023-05-26  1390  			reg = <0x0 0x9c0000 0x0 0x6000>;
07e3e17205794c Shazad Hussain        2023-05-26  1391  			#address-cells = <2>;
07e3e17205794c Shazad Hussain        2023-05-26  1392  			#size-cells = <2>;
07e3e17205794c Shazad Hussain        2023-05-26  1393  			ranges;
07e3e17205794c Shazad Hussain        2023-05-26  1394  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c Shazad Hussain        2023-05-26  1395  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
07e3e17205794c Shazad Hussain        2023-05-26  1396  				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
07e3e17205794c Shazad Hussain        2023-05-26  1397  			iommus = <&apps_smmu 0x403 0x0>;
07e3e17205794c Shazad Hussain        2023-05-26  1398  			status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1399  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1400  			i2c0: i2c@980000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1401  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1402  				reg = <0x0 0x980000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1403  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1404  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1405  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1406  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1407  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1408  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1409  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1410  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1411  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1412  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1413  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1414  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1415  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1416  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1417  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1418  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1419  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1420  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1421  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1422  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1423  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1424  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1425  			spi0: spi@980000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1426  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1427  				reg = <0x0 0x980000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1428  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1429  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1430  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1431  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1432  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1433  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1434  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1435  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1436  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1437  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1438  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1439  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1440  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1441  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1442  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1443  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1444  				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1445  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1446  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1447  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1448  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1449  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1450  			uart0: serial@980000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1451  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1452  				reg = <0x0 0x980000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1453  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1454  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1455  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1456  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1457  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1458  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1459  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1460  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1461  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1462  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1463  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1464  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1465  			i2c1: i2c@984000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1466  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1467  				reg = <0x0 0x984000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1468  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1469  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1470  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1471  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1472  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1473  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1474  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1475  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1476  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1477  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1478  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1479  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1480  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1481  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1482  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1483  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1484  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1485  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1486  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1487  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1488  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1489  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1490  			spi1: spi@984000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1491  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1492  				reg = <0x0 0x984000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1493  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1494  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1495  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1496  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1497  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1498  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1499  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1500  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1501  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1502  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1503  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1504  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1505  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1506  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1507  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1508  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1509  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1510  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1511  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1512  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1513  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1514  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1515  			uart1: serial@984000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1516  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1517  				reg = <0x0 0x984000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1518  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1519  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1520  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1521  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1522  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1523  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1524  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1525  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1526  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1527  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1528  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1529  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1530  			i2c2: i2c@988000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1531  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1532  				reg = <0x0 0x988000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1533  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1534  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1535  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1536  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1537  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1538  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1539  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1540  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1541  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1542  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1543  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1544  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1545  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1546  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1547  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1548  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1549  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1550  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1551  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1552  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1553  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1554  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1555  			spi2: spi@988000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1556  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1557  				reg = <0x0 0x988000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1558  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1559  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1560  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1561  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1562  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1563  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1564  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1565  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1566  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1567  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1568  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1569  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1570  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1571  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1572  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1573  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1574  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1575  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1576  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1577  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1578  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1579  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1580  			uart2: serial@988000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1581  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1582  				reg = <0x0 0x988000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1583  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1584  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1585  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1586  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1587  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1588  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1589  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1590  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1591  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1592  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1593  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1594  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1595  			i2c3: i2c@98c000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1596  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1597  				reg = <0x0 0x98c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1598  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1599  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1600  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1601  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1602  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1603  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1604  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1605  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1606  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1607  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1608  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1609  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1610  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1611  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1612  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1613  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1614  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1615  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1616  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1617  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1618  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1619  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1620  			spi3: spi@98c000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1621  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1622  				reg = <0x0 0x98c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1623  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1624  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1625  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1626  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1627  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1628  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1629  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1630  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1631  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1632  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1633  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1634  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1635  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1636  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1637  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1638  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1639  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1640  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1641  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1642  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1643  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1644  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1645  			uart3: serial@98c000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1646  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1647  				reg = <0x0 0x98c000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1648  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1649  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1650  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1651  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1652  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1653  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1654  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1655  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1656  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1657  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1658  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1659  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1660  			i2c4: i2c@990000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1661  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1662  				reg = <0x0 0x990000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1663  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1664  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1665  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1666  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1667  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1668  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1669  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1670  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1671  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1672  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1673  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1674  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1675  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1676  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1677  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1678  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1679  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1680  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1681  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1682  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1683  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1684  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1685  			spi4: spi@990000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1686  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1687  				reg = <0x0 0x990000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1688  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1689  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1690  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1691  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1692  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1693  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1694  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1695  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1696  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1697  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1698  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1699  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1700  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1701  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1702  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1703  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1704  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1705  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1706  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1707  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1708  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1709  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1710  			uart4: serial@990000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1711  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1712  				reg = <0x0 0x990000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1713  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1714  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1715  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1716  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1717  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1718  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1719  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1720  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1721  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1722  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1723  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1724  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1725  			i2c5: i2c@994000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1726  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1727  				reg = <0x0 0x994000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1728  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1729  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1730  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1731  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1732  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1733  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1734  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1735  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1736  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1737  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1738  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1739  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1740  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1741  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1742  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1743  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1744  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1745  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1746  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1747  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1748  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1749  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1750  			spi5: spi@994000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1751  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1752  				reg = <0x0 0x994000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1753  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1754  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1755  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1756  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1757  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1758  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1759  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1760  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1761  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1762  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1763  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1764  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1765  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1766  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1767  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1768  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1769  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1770  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1771  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1772  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1773  			};
445a523d462432 Shazad Hussain        2023-05-26  1774  
445a523d462432 Shazad Hussain        2023-05-26  1775  			uart5: serial@994000 {
445a523d462432 Shazad Hussain        2023-05-26  1776  				compatible = "qcom,geni-uart";
445a523d462432 Shazad Hussain        2023-05-26  1777  				reg = <0x0 0x994000 0x0 0x4000>;
445a523d462432 Shazad Hussain        2023-05-26  1778  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 Shazad Hussain        2023-05-26  1779  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
445a523d462432 Shazad Hussain        2023-05-26  1780  				clock-names = "se";
445a523d462432 Shazad Hussain        2023-05-26  1781  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain        2023-05-26  1782  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 Shazad Hussain        2023-05-26  1783  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain        2023-05-26  1784  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 Shazad Hussain        2023-05-26  1785  				interconnect-names = "qup-core", "qup-config";
445a523d462432 Shazad Hussain        2023-05-26  1786  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 Shazad Hussain        2023-05-26  1787  				status = "disabled";
445a523d462432 Shazad Hussain        2023-05-26  1788  			};
07e3e17205794c Shazad Hussain        2023-05-26  1789  		};
07e3e17205794c Shazad Hussain        2023-05-26  1790  
86348c7587f556 Konrad Dybcio         2024-11-07  1791  		gpi_dma1: dma-controller@a00000  {
a8d18df5a5a114 Konrad Dybcio         2024-11-08  1792  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1793  			reg = <0x0 0x00a00000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1794  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1795  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1796  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1797  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1798  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1799  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1800  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1801  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1802  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1803  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1804  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1805  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1806  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1807  			iommus = <&apps_smmu 0x456 0x0>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1808  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1809  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1810  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1811  		};
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1812  
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1813  		qupv3_id_1: geniqup@ac0000 {
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1814  			compatible = "qcom,geni-se-qup";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1815  			reg = <0x0 0x00ac0000 0x0 0x6000>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1816  			#address-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1817  			#size-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1818  			ranges;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1819  			clock-names = "m-ahb", "s-ahb";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1820  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1821  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  1822  			iommus = <&apps_smmu 0x443 0x0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  1823  			status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  1824  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1825  			i2c7: i2c@a80000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1826  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1827  				reg = <0x0 0xa80000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1828  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1829  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1830  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1831  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1832  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1833  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1834  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1835  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1836  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1837  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1838  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1839  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1840  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1841  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1842  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1843  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1844  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1845  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1846  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1847  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1848  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1849  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1850  			spi7: spi@a80000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1851  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1852  				reg = <0x0 0xa80000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1853  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1854  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1855  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1856  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1857  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1858  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1859  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1860  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1861  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1862  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1863  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1864  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1865  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1866  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1867  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1868  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1869  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1870  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1871  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1872  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1873  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1874  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1875  			uart7: serial@a80000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1876  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1877  				reg = <0x0 0x00a80000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1878  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1879  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1880  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1881  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1882  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1883  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1884  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1885  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1886  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1887  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1888  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1889  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1890  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1891  			i2c8: i2c@a84000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1892  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1893  				reg = <0x0 0xa84000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1894  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1895  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1896  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1897  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1898  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1899  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1900  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1901  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1902  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1903  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1904  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1905  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1906  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1907  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1908  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1909  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1910  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1911  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1912  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1913  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1914  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1915  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1916  			spi8: spi@a84000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1917  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1918  				reg = <0x0 0xa84000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1919  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1920  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1921  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1922  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1923  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1924  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1925  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1926  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1927  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1928  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1929  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1930  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1931  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1932  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1933  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1934  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1935  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1936  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1937  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1938  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1939  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1940  
34a407316b7d37 Viken Dadhaniya       2024-10-07  1941  			uart8: serial@a84000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  1942  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1943  				reg = <0x0 0x00a84000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1944  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1945  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1946  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1947  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1948  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1949  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  1950  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  1951  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1952  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1953  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  1954  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  1955  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  1956  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1957  			i2c9: i2c@a88000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1958  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1959  				reg = <0x0 0xa88000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1960  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1961  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1962  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1963  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1964  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1965  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1966  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1967  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1968  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1969  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1970  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1971  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1972  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1973  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1974  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1975  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1976  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1977  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  1978  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1979  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1980  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  1981  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1982  			spi9: spi@a88000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1983  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1984  				reg = <0x0 0xa88000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1985  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1986  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1987  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1988  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1989  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1990  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1991  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1992  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1993  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1994  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1995  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1996  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1997  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1998  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  1999  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2000  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2001  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2002  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2003  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2004  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2005  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2006  
445a523d462432 Shazad Hussain        2023-05-26  2007  			uart9: serial@a88000 {
445a523d462432 Shazad Hussain        2023-05-26  2008  				compatible = "qcom,geni-uart";
445a523d462432 Shazad Hussain        2023-05-26  2009  				reg = <0x0 0xa88000 0x0 0x4000>;
445a523d462432 Shazad Hussain        2023-05-26  2010  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 Shazad Hussain        2023-05-26  2011  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
445a523d462432 Shazad Hussain        2023-05-26  2012  				clock-names = "se";
445a523d462432 Shazad Hussain        2023-05-26  2013  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain        2023-05-26  2014  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 Shazad Hussain        2023-05-26  2015  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain        2023-05-26  2016  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 Shazad Hussain        2023-05-26  2017  				interconnect-names = "qup-core", "qup-config";
445a523d462432 Shazad Hussain        2023-05-26  2018  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 Shazad Hussain        2023-05-26  2019  				status = "disabled";
445a523d462432 Shazad Hussain        2023-05-26  2020  			};
445a523d462432 Shazad Hussain        2023-05-26  2021  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2022  			i2c10: i2c@a8c000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2023  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2024  				reg = <0x0 0xa8c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2025  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2026  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2027  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2028  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2029  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2030  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2031  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2032  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2033  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2034  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2035  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2036  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2037  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2038  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2039  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2040  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2041  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2042  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2043  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2044  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2045  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2046  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2047  			spi10: spi@a8c000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2048  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2049  				reg = <0x0 0xa8c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2050  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2051  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2052  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2053  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2054  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2055  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2056  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2057  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2058  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2059  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2060  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2061  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2062  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2063  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2064  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2065  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2066  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2067  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2068  					    "rx";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2069  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2070  			};
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2071  
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2072  			uart10: serial@a8c000 {
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2073  				compatible = "qcom,geni-uart";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2074  				reg = <0x0 0x00a8c000 0x0 0x4000>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2075  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2076  				clock-names = "se";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2077  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2078  				interconnect-names = "qup-core", "qup-config";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2079  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2080  						 &clk_virt SLAVE_QUP_CORE_1 0>,
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2081  						<&gem_noc MASTER_APPSS_PROC 0
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2082  						 &config_noc SLAVE_QUP_1 0>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2083  				power-domains = <&rpmhpd SA8775P_CX>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2084  				operating-points-v2 = <&qup_opp_table_100mhz>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2085  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2086  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2087  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2088  			i2c11: i2c@a90000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2089  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2090  				reg = <0x0 0xa90000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2091  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2092  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2093  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2094  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2095  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2096  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2097  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2098  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2099  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2100  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2101  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2102  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2103  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2104  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2105  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2106  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2107  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2108  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2109  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2110  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2111  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2112  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2113  			spi11: spi@a90000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2114  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2115  				reg = <0x0 0xa90000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2116  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2117  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2118  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2119  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2120  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2121  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2122  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2123  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2124  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2125  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2126  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2127  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2128  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2129  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2130  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2131  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2132  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2133  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2134  					    "rx";
dc3ad22112de7f Bartosz Golaszewski   2023-03-09  2135  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2136  			};
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2137  
34a407316b7d37 Viken Dadhaniya       2024-10-07  2138  			uart11: serial@a90000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  2139  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2140  				reg = <0x0 0x00a90000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2141  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2142  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2143  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2144  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2145  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  2146  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  2147  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  2148  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2149  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2150  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2151  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2152  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  2153  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2154  			i2c12: i2c@a94000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2155  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2156  				reg = <0x0 0xa94000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2157  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2158  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2159  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2160  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  2161  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2162  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2163  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski   2023-03-09  2164  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2165  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2166  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski   2023-03-09  2167  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  2168  				interconnect-names = "qup-core",
cfd975f588400e Bartosz Golaszewski   2023-03-09  2169  						     "qup-config",
cfd975f588400e Bartosz Golaszewski   2023-03-09  2170  						     "qup-memory";
cfd975f588400e Bartosz Golaszewski   2023-03-09  2171  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2172  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2173  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2174  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2175  					    "rx";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2176  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2177  			};
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2178  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2179  			spi12: spi@a94000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2180  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2181  				reg = <0x0 0xa94000 0x0 0x4000>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  2182  				#address-cells = <1>;
cfd975f588400e Bartosz Golaszewski   2023-03-09  2183  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2184  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2185  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2186  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2187  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2188  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2189  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2190  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2191  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2192  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2193  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2194  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2195  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2196  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2197  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2198  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2199  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2200  					    "rx";
cfd975f588400e Bartosz Golaszewski   2023-03-09  2201  				status = "disabled";
cfd975f588400e Bartosz Golaszewski   2023-03-09  2202  			};
cfd975f588400e Bartosz Golaszewski   2023-03-09  2203  
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2204  			uart12: serial@a94000 {
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2205  				compatible = "qcom,geni-uart";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2206  				reg = <0x0 0x00a94000 0x0 0x4000>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2207  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2208  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2209  				clock-names = "se";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2210  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2211  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2212  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2213  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2214  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2215  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2216  				status = "disabled";
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2217  			};
41ae5ca448c21a Bartosz Golaszewski   2023-03-09  2218  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2219  			i2c13: i2c@a98000 {
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2220  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2221  				reg = <0x0 0xa98000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2222  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2223  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2224  				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2225  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2226  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2227  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2228  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2229  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2230  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2231  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2232  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2233  				interconnect-names = "qup-core",
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2234  						     "qup-config",
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2235  						     "qup-memory";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2236  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2237  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2238  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2239  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2240  					    "rx";
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2241  				status = "disabled";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2242  
a23d122572a4ad Bartosz Golaszewski   2023-03-09  2243  			};
dc3ad22112de7f Bartosz Golaszewski   2023-03-09  2244  		};
dc3ad22112de7f Bartosz Golaszewski   2023-03-09  2245  
86348c7587f556 Konrad Dybcio         2024-11-07  2246  		gpi_dma3: dma-controller@b00000  {
a8d18df5a5a114 Konrad Dybcio         2024-11-08  2247  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2248  			reg = <0x0 0x00b00000 0x0 0x58000>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2249  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2250  			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2251  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2252  				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2253  				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2254  			iommus = <&apps_smmu 0x056 0x0>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2255  			dma-channels = <4>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2256  			dma-channel-mask = <0xf>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2257  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2258  		};
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2259  
07e3e17205794c Shazad Hussain        2023-05-26  2260  		qupv3_id_3: geniqup@bc0000 {
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2261  			compatible = "qcom,geni-se-qup";
07e3e17205794c Shazad Hussain        2023-05-26  2262  			reg = <0x0 0xbc0000 0x0 0x6000>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2263  			#address-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2264  			#size-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2265  			ranges;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2266  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c Shazad Hussain        2023-05-26  2267  			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
07e3e17205794c Shazad Hussain        2023-05-26  2268  				<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
07e3e17205794c Shazad Hussain        2023-05-26  2269  			iommus = <&apps_smmu 0x43 0x0>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2270  			status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2271  
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2272  			i2c21: i2c@b80000 {
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2273  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2274  				reg = <0x0 0xb80000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2275  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2276  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2277  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2278  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2279  				clock-names = "se";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2280  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2281  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2282  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2283  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2284  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2285  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2286  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2287  							 "qup-config",
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2288  							 "qup-memory";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2289  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2290  				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2291  				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2292  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2293  					    "rx";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2294  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2295  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2296  
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2297  			spi21: spi@b80000 {
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2298  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain        2023-05-26  2299  				reg = <0x0 0xb80000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2300  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2301  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2302  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2303  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2304  				clock-names = "se";
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2305  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2306  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2307  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2308  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2309  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2310  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2311  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2312  							 "qup-config",
ee2f5f906d69d9 Shazad Hussain        2023-05-26  2313  							 "qup-memory";
f95f988cf7b609 Bartosz Golaszewski   2023-03-27  2314  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2315  				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2316  				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2317  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya       2024-10-21  2318  					    "rx";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2319  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2320  			};
34a407316b7d37 Viken Dadhaniya       2024-10-07  2321  
34a407316b7d37 Viken Dadhaniya       2024-10-07  2322  			uart21: serial@b80000 {
34a407316b7d37 Viken Dadhaniya       2024-10-07  2323  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2324  				reg = <0x0 0x00b80000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2325  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2326  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2327  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2328  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2329  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  2330  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya       2024-10-07  2331  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya       2024-10-07  2332  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2333  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2334  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya       2024-10-07  2335  				status = "disabled";
34a407316b7d37 Viken Dadhaniya       2024-10-07  2336  			};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2337  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  2338  
2d04f31103921b Om Prakash Singh      2023-10-16  2339  		rng: rng@10d2000 {
2d04f31103921b Om Prakash Singh      2023-10-16  2340  			compatible = "qcom,sa8775p-trng", "qcom,trng";
2d04f31103921b Om Prakash Singh      2023-10-16  2341  			reg = <0 0x010d2000 0 0x1000>;
2d04f31103921b Om Prakash Singh      2023-10-16  2342  		};
2d04f31103921b Om Prakash Singh      2023-10-16  2343  
15288649e4c037 Manivannan Sadhasivam 2024-05-14  2344  		ufs_mem_hc: ufshc@1d84000 {
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2345  			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2346  			reg = <0x0 0x01d84000 0x0 0x3000>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2347  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2348  			phys = <&ufs_mem_phy>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2349  			phy-names = "ufsphy";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2350  			lanes-per-direction = <2>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2351  			#reset-cells = <1>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2352  			resets = <&gcc GCC_UFS_PHY_BCR>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2353  			reset-names = "rst";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2354  			power-domains = <&gcc UFS_PHY_GDSC>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2355  			required-opps = <&rpmhpd_opp_nom>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2356  			iommus = <&apps_smmu 0x100 0x0>;
2b967894f80aac Bartosz Golaszewski   2023-05-15  2357  			dma-coherent;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2358  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2359  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2360  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2361  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2362  				 <&rpmhcc RPMH_CXO_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2363  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2364  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2365  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2366  			clock-names = "core_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2367  				      "bus_aggr_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2368  				      "iface_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2369  				      "core_clk_unipro",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2370  				      "ref_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2371  				      "tx_lane0_sync_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2372  				      "rx_lane0_sync_clk",
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2373  				      "rx_lane1_sync_clk";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2374  			freq-table-hz = <75000000 300000000>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2375  					<0 0>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2376  					<0 0>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2377  					<75000000 300000000>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2378  					<0 0>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2379  					<0 0>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2380  					<0 0>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2381  					<0 0>;
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2382  			qcom,ice = <&ice>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2383  			status = "disabled";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2384  		};
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2385  
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2386  		ufs_mem_phy: phy@1d87000 {
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2387  			compatible = "qcom,sa8775p-qmp-ufs-phy";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2388  			reg = <0x0 0x01d87000 0x0 0xe10>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2389  			/*
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2390  			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2391  			 * enables the CXO clock to eDP *and* UFS PHY.
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2392  			 */
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2393  			clocks = <&rpmhcc RPMH_CXO_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2394  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2395  				 <&gcc GCC_EDP_REF_CLKREF_EN>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2396  			clock-names = "ref", "ref_aux", "qref";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2397  			power-domains = <&gcc UFS_PHY_GDSC>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2398  			resets = <&ufs_mem_hc 0>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2399  			reset-names = "ufsphy";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2400  			#phy-cells = <0>;
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2401  			status = "disabled";
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2402  		};
be543efeee17b9 Bartosz Golaszewski   2023-04-11  2403  
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2404  		ice: crypto@1d88000 {
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2405  			compatible = "qcom,sa8775p-inline-crypto-engine",
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2406  				     "qcom,inline-crypto-engine";
dcf8ef1c8d3046 Bartosz Golaszewski   2024-10-07  2407  			reg = <0x0 0x01d88000 0x0 0x18000>;
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2408  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2409  		};
96272ba7103d45 Bartosz Golaszewski   2023-09-13  2410  
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2411  		cryptobam: dma-controller@1dc4000 {
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2412  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2413  			reg = <0x0 0x01dc4000 0x0 0x28000>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2414  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2415  			#dma-cells = <1>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2416  			qcom,ee = <0>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2417  			qcom,controlled-remotely;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2418  			iommus = <&apps_smmu 0x480 0x00>,
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2419  				 <&apps_smmu 0x481 0x00>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2420  		};
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2421  
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2422  		crypto: crypto@1dfa000 {
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2423  			compatible = "qcom,sa8775p-qce", "qcom,qce";
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2424  			reg = <0x0 0x01dfa000 0x0 0x6000>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2425  			dmas = <&cryptobam 4>, <&cryptobam 5>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2426  			dma-names = "rx", "tx";
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2427  			iommus = <&apps_smmu 0x480 0x00>,
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2428  				 <&apps_smmu 0x481 0x00>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2429  			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0 &mc_virt SLAVE_EBI1 0>;
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2430  			interconnect-names = "memory";
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2431  		};
7ff3da43ef4453 Yuvaraj Ranganathan   2024-10-17  2432  
6596118ccdcdb3 Jie Gan               2024-05-21  2433  		stm: stm@4002000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2434  			compatible = "arm,coresight-stm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2435  			reg = <0x0 0x4002000 0x0 0x1000>,
6596118ccdcdb3 Jie Gan               2024-05-21  2436  				  <0x0 0x16280000 0x0 0x180000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2437  			reg-names = "stm-base", "stm-stimulus-base";
6596118ccdcdb3 Jie Gan               2024-05-21  2438  
6596118ccdcdb3 Jie Gan               2024-05-21  2439  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2440  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2441  
6596118ccdcdb3 Jie Gan               2024-05-21  2442  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2443  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2444  					stm_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2445  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2446  						<&funnel0_in7>;
6596118ccdcdb3 Jie Gan               2024-05-21  2447  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2448  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2449  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2450  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2451  
6596118ccdcdb3 Jie Gan               2024-05-21  2452  		tpdm@4003000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2453  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2454  			reg = <0x0 0x4003000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2455  
6596118ccdcdb3 Jie Gan               2024-05-21  2456  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2457  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2458  
6596118ccdcdb3 Jie Gan               2024-05-21  2459  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2460  			qcom,cmb-msrs-num = <32>;
8a6442ec343708 Jie Gan               2024-12-19  2461  			status = "disabled";
6596118ccdcdb3 Jie Gan               2024-05-21  2462  
6596118ccdcdb3 Jie Gan               2024-05-21  2463  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2464  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2465  					qdss_tpdm0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2466  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2467  						<&qdss_tpda_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2468  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2469  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2470  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2471  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2472  
6596118ccdcdb3 Jie Gan               2024-05-21  2473  		tpda@4004000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2474  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2475  			reg = <0x0 0x4004000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2476  
6596118ccdcdb3 Jie Gan               2024-05-21  2477  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2478  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2479  
6596118ccdcdb3 Jie Gan               2024-05-21  2480  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2481  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2482  					qdss_tpda_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2483  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2484  						<&funnel0_in6>;
6596118ccdcdb3 Jie Gan               2024-05-21  2485  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2486  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2487  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2488  
6596118ccdcdb3 Jie Gan               2024-05-21  2489  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2490  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2491  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2492  
6596118ccdcdb3 Jie Gan               2024-05-21  2493  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  2494  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2495  					qdss_tpda_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2496  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2497  						<&qdss_tpdm0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2498  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2499  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2500  
6596118ccdcdb3 Jie Gan               2024-05-21  2501  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  2502  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2503  					qdss_tpda_in1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2504  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2505  						<&qdss_tpdm1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2506  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2507  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2508  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2509  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2510  
6596118ccdcdb3 Jie Gan               2024-05-21  2511  		tpdm@400f000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2512  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2513  			reg = <0x0 0x400f000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2514  
6596118ccdcdb3 Jie Gan               2024-05-21  2515  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2516  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2517  
6596118ccdcdb3 Jie Gan               2024-05-21  2518  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2519  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2520  
6596118ccdcdb3 Jie Gan               2024-05-21  2521  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2522  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2523  					qdss_tpdm1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2524  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2525  						<&qdss_tpda_in1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2526  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2527  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2528  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2529  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2530  
6596118ccdcdb3 Jie Gan               2024-05-21  2531  		funnel@4041000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2532  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2533  			reg = <0x0 0x4041000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2534  
6596118ccdcdb3 Jie Gan               2024-05-21  2535  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2536  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2537  
6596118ccdcdb3 Jie Gan               2024-05-21  2538  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2539  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2540  					funnel0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2541  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2542  						<&qdss_funnel_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2543  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2544  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2545  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2546  
6596118ccdcdb3 Jie Gan               2024-05-21  2547  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2548  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2549  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2550  
6596118ccdcdb3 Jie Gan               2024-05-21  2551  				port@6 {
6596118ccdcdb3 Jie Gan               2024-05-21  2552  					reg = <6>;
6596118ccdcdb3 Jie Gan               2024-05-21  2553  					funnel0_in6: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2554  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2555  						<&qdss_tpda_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2556  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2557  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2558  
6596118ccdcdb3 Jie Gan               2024-05-21  2559  				port@7 {
6596118ccdcdb3 Jie Gan               2024-05-21  2560  					reg = <7>;
6596118ccdcdb3 Jie Gan               2024-05-21  2561  					funnel0_in7: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2562  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2563  						<&stm_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2564  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2565  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2566  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2567  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2568  
6596118ccdcdb3 Jie Gan               2024-05-21  2569  		funnel@4042000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2570  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2571  			reg = <0x0 0x4042000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2572  
6596118ccdcdb3 Jie Gan               2024-05-21  2573  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2574  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2575  
6596118ccdcdb3 Jie Gan               2024-05-21  2576  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2577  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2578  					funnel1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2579  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2580  						<&qdss_funnel_in1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2581  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2582  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2583  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2584  
6596118ccdcdb3 Jie Gan               2024-05-21  2585  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2586  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2587  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2588  
6596118ccdcdb3 Jie Gan               2024-05-21  2589  				port@4 {
6596118ccdcdb3 Jie Gan               2024-05-21  2590  					reg = <4>;
6596118ccdcdb3 Jie Gan               2024-05-21  2591  					funnel1_in4: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2592  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2593  						<&apss_funnel1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2594  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2595  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2596  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2597  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2598  
6596118ccdcdb3 Jie Gan               2024-05-21  2599  		funnel@4045000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2600  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2601  			reg = <0x0 0x4045000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2602  
6596118ccdcdb3 Jie Gan               2024-05-21  2603  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2604  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2605  
6596118ccdcdb3 Jie Gan               2024-05-21  2606  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2607  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2608  					qdss_funnel_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2609  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2610  						<&aoss_funnel_in7>;
6596118ccdcdb3 Jie Gan               2024-05-21  2611  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2612  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2613  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2614  
6596118ccdcdb3 Jie Gan               2024-05-21  2615  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2616  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2617  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2618  
6596118ccdcdb3 Jie Gan               2024-05-21  2619  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  2620  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2621  					qdss_funnel_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2622  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2623  						<&funnel0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2624  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2625  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2626  
6596118ccdcdb3 Jie Gan               2024-05-21  2627  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  2628  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2629  					qdss_funnel_in1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2630  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2631  						<&funnel1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2632  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2633  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2634  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2635  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2636  
6596118ccdcdb3 Jie Gan               2024-05-21  2637  		funnel@4b04000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2638  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2639  			reg = <0x0 0x4b04000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2640  
6596118ccdcdb3 Jie Gan               2024-05-21  2641  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2642  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2643  
6596118ccdcdb3 Jie Gan               2024-05-21  2644  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2645  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2646  					aoss_funnel_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2647  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2648  						<&etf0_in>;
6596118ccdcdb3 Jie Gan               2024-05-21  2649  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2650  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2651  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2652  
6596118ccdcdb3 Jie Gan               2024-05-21  2653  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2654  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2655  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2656  
6596118ccdcdb3 Jie Gan               2024-05-21  2657  				port@6 {
6596118ccdcdb3 Jie Gan               2024-05-21  2658  					reg = <6>;
6596118ccdcdb3 Jie Gan               2024-05-21  2659  					aoss_funnel_in6: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2660  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2661  						<&aoss_tpda_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2662  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2663  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2664  
6596118ccdcdb3 Jie Gan               2024-05-21  2665  				port@7 {
6596118ccdcdb3 Jie Gan               2024-05-21  2666  					reg = <7>;
6596118ccdcdb3 Jie Gan               2024-05-21  2667  					aoss_funnel_in7: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2668  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2669  						<&qdss_funnel_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2670  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2671  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2672  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2673  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2674  
6596118ccdcdb3 Jie Gan               2024-05-21  2675  		tmc_etf: tmc@4b05000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2676  			compatible = "arm,coresight-tmc", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2677  			reg = <0x0 0x4b05000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2678  
6596118ccdcdb3 Jie Gan               2024-05-21  2679  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2680  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2681  
6596118ccdcdb3 Jie Gan               2024-05-21  2682  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2683  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2684  					etf0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2685  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2686  						<&swao_rep_in>;
6596118ccdcdb3 Jie Gan               2024-05-21  2687  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2688  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2689  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2690  
6596118ccdcdb3 Jie Gan               2024-05-21  2691  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2692  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2693  					etf0_in: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2694  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2695  						<&aoss_funnel_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2696  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2697  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2698  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2699  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2700  
6596118ccdcdb3 Jie Gan               2024-05-21  2701  		replicator@4b06000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2702  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2703  			reg = <0x0 0x4b06000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2704  
6596118ccdcdb3 Jie Gan               2024-05-21  2705  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2706  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2707  
6596118ccdcdb3 Jie Gan               2024-05-21  2708  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2709  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2710  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2711  
6596118ccdcdb3 Jie Gan               2024-05-21  2712  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  2713  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2714  					swao_rep_out1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2715  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2716  						<&eud_in>;
6596118ccdcdb3 Jie Gan               2024-05-21  2717  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2718  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2719  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2720  
6596118ccdcdb3 Jie Gan               2024-05-21  2721  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2722  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2723  					swao_rep_in: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2724  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2725  						<&etf0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2726  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2727  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2728  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2729  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2730  
6596118ccdcdb3 Jie Gan               2024-05-21  2731  		tpda@4b08000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2732  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2733  			reg = <0x0 0x4b08000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2734  
6596118ccdcdb3 Jie Gan               2024-05-21  2735  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2736  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2737  
6596118ccdcdb3 Jie Gan               2024-05-21  2738  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2739  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2740  					aoss_tpda_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2741  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2742  						<&aoss_funnel_in6>;
6596118ccdcdb3 Jie Gan               2024-05-21  2743  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2744  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2745  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2746  
6596118ccdcdb3 Jie Gan               2024-05-21  2747  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2748  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2749  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2750  
6596118ccdcdb3 Jie Gan               2024-05-21  2751  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  2752  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2753  					aoss_tpda_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2754  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2755  						<&aoss_tpdm0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2756  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2757  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2758  
6596118ccdcdb3 Jie Gan               2024-05-21  2759  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  2760  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2761  					aoss_tpda_in1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2762  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2763  						<&aoss_tpdm1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2764  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2765  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2766  
6596118ccdcdb3 Jie Gan               2024-05-21  2767  				port@2 {
6596118ccdcdb3 Jie Gan               2024-05-21  2768  					reg = <2>;
6596118ccdcdb3 Jie Gan               2024-05-21  2769  					aoss_tpda_in2: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2770  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2771  						<&aoss_tpdm2_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2772  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2773  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2774  
6596118ccdcdb3 Jie Gan               2024-05-21  2775  				port@3 {
6596118ccdcdb3 Jie Gan               2024-05-21  2776  					reg = <3>;
6596118ccdcdb3 Jie Gan               2024-05-21  2777  					aoss_tpda_in3: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2778  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2779  						<&aoss_tpdm3_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2780  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2781  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2782  
6596118ccdcdb3 Jie Gan               2024-05-21  2783  				port@4 {
6596118ccdcdb3 Jie Gan               2024-05-21  2784  					reg = <4>;
6596118ccdcdb3 Jie Gan               2024-05-21  2785  					aoss_tpda_in4: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2786  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2787  						<&aoss_tpdm4_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  2788  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2789  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2790  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2791  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2792  
6596118ccdcdb3 Jie Gan               2024-05-21  2793  		tpdm@4b09000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2794  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2795  			reg = <0x0 0x4b09000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2796  
6596118ccdcdb3 Jie Gan               2024-05-21  2797  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2798  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2799  
6596118ccdcdb3 Jie Gan               2024-05-21  2800  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 Jie Gan               2024-05-21  2801  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2802  
6596118ccdcdb3 Jie Gan               2024-05-21  2803  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2804  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2805  					aoss_tpdm0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2806  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2807  						<&aoss_tpda_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2808  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2809  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2810  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2811  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2812  
6596118ccdcdb3 Jie Gan               2024-05-21  2813  		tpdm@4b0a000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2814  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2815  			reg = <0x0 0x4b0a000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2816  
6596118ccdcdb3 Jie Gan               2024-05-21  2817  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2818  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2819  
6596118ccdcdb3 Jie Gan               2024-05-21  2820  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 Jie Gan               2024-05-21  2821  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2822  
6596118ccdcdb3 Jie Gan               2024-05-21  2823  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2824  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2825  					aoss_tpdm1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2826  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2827  						<&aoss_tpda_in1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2828  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2829  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2830  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2831  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2832  
6596118ccdcdb3 Jie Gan               2024-05-21  2833  		tpdm@4b0b000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2834  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2835  			reg = <0x0 0x4b0b000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2836  
6596118ccdcdb3 Jie Gan               2024-05-21  2837  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2838  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2839  
6596118ccdcdb3 Jie Gan               2024-05-21  2840  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 Jie Gan               2024-05-21  2841  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2842  
6596118ccdcdb3 Jie Gan               2024-05-21  2843  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2844  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2845  					aoss_tpdm2_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2846  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2847  						<&aoss_tpda_in2>;
6596118ccdcdb3 Jie Gan               2024-05-21  2848  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2849  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2850  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2851  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2852  
6596118ccdcdb3 Jie Gan               2024-05-21  2853  		tpdm@4b0c000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2854  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2855  			reg = <0x0 0x4b0c000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2856  
6596118ccdcdb3 Jie Gan               2024-05-21  2857  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2858  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2859  
6596118ccdcdb3 Jie Gan               2024-05-21  2860  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 Jie Gan               2024-05-21  2861  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2862  
6596118ccdcdb3 Jie Gan               2024-05-21  2863  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2864  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2865  					aoss_tpdm3_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2866  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2867  						<&aoss_tpda_in3>;
6596118ccdcdb3 Jie Gan               2024-05-21  2868  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2869  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2870  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2871  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2872  
6596118ccdcdb3 Jie Gan               2024-05-21  2873  		tpdm@4b0d000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2874  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2875  			reg = <0x0 0x4b0d000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2876  
6596118ccdcdb3 Jie Gan               2024-05-21  2877  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2878  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2879  
6596118ccdcdb3 Jie Gan               2024-05-21  2880  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2881  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  2882  
6596118ccdcdb3 Jie Gan               2024-05-21  2883  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2884  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2885  					aoss_tpdm4_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2886  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2887  						<&aoss_tpda_in4>;
6596118ccdcdb3 Jie Gan               2024-05-21  2888  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2889  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2890  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2891  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2892  
6596118ccdcdb3 Jie Gan               2024-05-21  2893  		aoss_cti: cti@4b13000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2894  			compatible = "arm,coresight-cti", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2895  			reg = <0x0 0x4b13000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  2896  
6596118ccdcdb3 Jie Gan               2024-05-21  2897  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2898  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2899  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2900  
6596118ccdcdb3 Jie Gan               2024-05-21  2901  		etm@6040000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2902  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2903  			reg = <0x0 0x6040000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  2904  			cpu = <&cpu0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2905  
6596118ccdcdb3 Jie Gan               2024-05-21  2906  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2907  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2908  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  2909  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  2910  
6596118ccdcdb3 Jie Gan               2024-05-21  2911  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2912  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2913  					etm0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2914  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2915  						<&apss_funnel0_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  2916  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2917  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2918  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2919  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2920  
6596118ccdcdb3 Jie Gan               2024-05-21  2921  		etm@6140000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2922  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2923  			reg = <0x0 0x6140000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  2924  			cpu = <&cpu1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2925  
6596118ccdcdb3 Jie Gan               2024-05-21  2926  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2927  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2928  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  2929  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  2930  
6596118ccdcdb3 Jie Gan               2024-05-21  2931  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2932  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2933  					etm1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2934  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2935  						<&apss_funnel0_in1>;
6596118ccdcdb3 Jie Gan               2024-05-21  2936  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2937  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2938  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2939  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2940  
6596118ccdcdb3 Jie Gan               2024-05-21  2941  		etm@6240000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2942  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2943  			reg = <0x0 0x6240000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  2944  			cpu = <&cpu2>;
6596118ccdcdb3 Jie Gan               2024-05-21  2945  
6596118ccdcdb3 Jie Gan               2024-05-21  2946  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2947  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2948  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  2949  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  2950  
6596118ccdcdb3 Jie Gan               2024-05-21  2951  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2952  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2953  					etm2_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2954  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2955  						<&apss_funnel0_in2>;
6596118ccdcdb3 Jie Gan               2024-05-21  2956  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2957  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2958  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2959  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2960  
6596118ccdcdb3 Jie Gan               2024-05-21  2961  		etm@6340000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2962  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2963  			reg = <0x0 0x6340000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  2964  			cpu = <&cpu3>;
6596118ccdcdb3 Jie Gan               2024-05-21  2965  
6596118ccdcdb3 Jie Gan               2024-05-21  2966  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2967  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2968  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  2969  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  2970  
6596118ccdcdb3 Jie Gan               2024-05-21  2971  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2972  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2973  					etm3_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2974  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2975  						<&apss_funnel0_in3>;
6596118ccdcdb3 Jie Gan               2024-05-21  2976  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2977  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2978  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2979  		};
6596118ccdcdb3 Jie Gan               2024-05-21  2980  
6596118ccdcdb3 Jie Gan               2024-05-21  2981  		etm@6440000 {
6596118ccdcdb3 Jie Gan               2024-05-21  2982  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  2983  			reg = <0x0 0x6440000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  2984  			cpu = <&cpu4>;
6596118ccdcdb3 Jie Gan               2024-05-21  2985  
6596118ccdcdb3 Jie Gan               2024-05-21  2986  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  2987  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  2988  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  2989  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  2990  
6596118ccdcdb3 Jie Gan               2024-05-21  2991  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  2992  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  2993  					etm4_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  2994  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  2995  						<&apss_funnel0_in4>;
6596118ccdcdb3 Jie Gan               2024-05-21  2996  					};
6596118ccdcdb3 Jie Gan               2024-05-21  2997  				};
6596118ccdcdb3 Jie Gan               2024-05-21  2998  			};
6596118ccdcdb3 Jie Gan               2024-05-21  2999  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3000  
6596118ccdcdb3 Jie Gan               2024-05-21  3001  		etm@6540000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3002  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3003  			reg = <0x0 0x6540000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  3004  			cpu = <&cpu5>;
6596118ccdcdb3 Jie Gan               2024-05-21  3005  
6596118ccdcdb3 Jie Gan               2024-05-21  3006  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3007  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3008  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  3009  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  3010  
6596118ccdcdb3 Jie Gan               2024-05-21  3011  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3012  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3013  					etm5_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3014  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3015  						<&apss_funnel0_in5>;
6596118ccdcdb3 Jie Gan               2024-05-21  3016  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3017  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3018  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3019  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3020  
6596118ccdcdb3 Jie Gan               2024-05-21  3021  		etm@6640000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3022  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3023  			reg = <0x0 0x6640000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  3024  			cpu = <&cpu6>;
6596118ccdcdb3 Jie Gan               2024-05-21  3025  
6596118ccdcdb3 Jie Gan               2024-05-21  3026  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3027  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3028  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  3029  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  3030  
6596118ccdcdb3 Jie Gan               2024-05-21  3031  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3032  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3033  					etm6_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3034  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3035  						<&apss_funnel0_in6>;
6596118ccdcdb3 Jie Gan               2024-05-21  3036  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3037  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3038  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3039  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3040  
6596118ccdcdb3 Jie Gan               2024-05-21  3041  		etm@6740000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3042  			compatible = "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3043  			reg = <0x0 0x6740000 0x0 0x1000>;
6a3649903ccd95 Krzysztof Kozlowski   2024-10-22  3044  			cpu = <&cpu7>;
6596118ccdcdb3 Jie Gan               2024-05-21  3045  
6596118ccdcdb3 Jie Gan               2024-05-21  3046  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3047  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3048  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 Jie Gan               2024-05-21  3049  			qcom,skip-power-up;
6596118ccdcdb3 Jie Gan               2024-05-21  3050  
6596118ccdcdb3 Jie Gan               2024-05-21  3051  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3052  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3053  					etm7_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3054  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3055  						<&apss_funnel0_in7>;
6596118ccdcdb3 Jie Gan               2024-05-21  3056  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3057  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3058  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3059  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3060  
6596118ccdcdb3 Jie Gan               2024-05-21  3061  		funnel@6800000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3062  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3063  			reg = <0x0 0x6800000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3064  
6596118ccdcdb3 Jie Gan               2024-05-21  3065  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3066  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3067  
6596118ccdcdb3 Jie Gan               2024-05-21  3068  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3069  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3070  					apss_funnel0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3071  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3072  						<&apss_funnel1_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3073  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3074  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3075  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3076  
6596118ccdcdb3 Jie Gan               2024-05-21  3077  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3078  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3079  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3080  
6596118ccdcdb3 Jie Gan               2024-05-21  3081  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  3082  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3083  					apss_funnel0_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3084  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3085  						<&etm0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3086  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3087  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3088  
6596118ccdcdb3 Jie Gan               2024-05-21  3089  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  3090  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3091  					apss_funnel0_in1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3092  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3093  						<&etm1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3094  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3095  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3096  
6596118ccdcdb3 Jie Gan               2024-05-21  3097  				port@2 {
6596118ccdcdb3 Jie Gan               2024-05-21  3098  					reg = <2>;
6596118ccdcdb3 Jie Gan               2024-05-21  3099  					apss_funnel0_in2: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3100  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3101  						<&etm2_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3102  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3103  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3104  
6596118ccdcdb3 Jie Gan               2024-05-21  3105  				port@3 {
6596118ccdcdb3 Jie Gan               2024-05-21  3106  					reg = <3>;
6596118ccdcdb3 Jie Gan               2024-05-21  3107  					apss_funnel0_in3: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3108  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3109  						<&etm3_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3110  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3111  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3112  
6596118ccdcdb3 Jie Gan               2024-05-21  3113  				port@4 {
6596118ccdcdb3 Jie Gan               2024-05-21  3114  					reg = <4>;
6596118ccdcdb3 Jie Gan               2024-05-21  3115  					apss_funnel0_in4: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3116  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3117  						<&etm4_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3118  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3119  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3120  
6596118ccdcdb3 Jie Gan               2024-05-21  3121  				port@5 {
6596118ccdcdb3 Jie Gan               2024-05-21  3122  					reg = <5>;
6596118ccdcdb3 Jie Gan               2024-05-21  3123  					apss_funnel0_in5: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3124  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3125  						<&etm5_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3126  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3127  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3128  
6596118ccdcdb3 Jie Gan               2024-05-21  3129  				port@6 {
6596118ccdcdb3 Jie Gan               2024-05-21  3130  					reg = <6>;
6596118ccdcdb3 Jie Gan               2024-05-21  3131  					apss_funnel0_in6: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3132  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3133  						<&etm6_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3134  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3135  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3136  
6596118ccdcdb3 Jie Gan               2024-05-21  3137  				port@7 {
6596118ccdcdb3 Jie Gan               2024-05-21  3138  					reg = <7>;
6596118ccdcdb3 Jie Gan               2024-05-21  3139  					apss_funnel0_in7: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3140  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3141  						<&etm7_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3142  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3143  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3144  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3145  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3146  
6596118ccdcdb3 Jie Gan               2024-05-21  3147  		funnel@6810000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3148  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3149  			reg = <0x0 0x6810000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3150  
6596118ccdcdb3 Jie Gan               2024-05-21  3151  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3152  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3153  
6596118ccdcdb3 Jie Gan               2024-05-21  3154  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3155  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3156  					apss_funnel1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3157  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3158  						<&funnel1_in4>;
6596118ccdcdb3 Jie Gan               2024-05-21  3159  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3160  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3161  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3162  
6596118ccdcdb3 Jie Gan               2024-05-21  3163  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3164  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3165  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3166  
6596118ccdcdb3 Jie Gan               2024-05-21  3167  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  3168  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3169  					apss_funnel1_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3170  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3171  						<&apss_funnel0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3172  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3173  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3174  
6596118ccdcdb3 Jie Gan               2024-05-21  3175  				port@3 {
6596118ccdcdb3 Jie Gan               2024-05-21  3176  					reg = <3>;
6596118ccdcdb3 Jie Gan               2024-05-21  3177  					apss_funnel1_in3: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3178  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3179  						<&apss_tpda_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3180  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3181  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3182  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3183  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3184  
6596118ccdcdb3 Jie Gan               2024-05-21  3185  		tpdm@6860000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3186  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3187  			reg = <0x0 0x6860000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3188  
6596118ccdcdb3 Jie Gan               2024-05-21  3189  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3190  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3191  
6596118ccdcdb3 Jie Gan               2024-05-21  3192  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 Jie Gan               2024-05-21  3193  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3194  
6596118ccdcdb3 Jie Gan               2024-05-21  3195  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3196  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3197  					apss_tpdm3_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3198  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3199  						<&apss_tpda_in3>;
6596118ccdcdb3 Jie Gan               2024-05-21  3200  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3201  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3202  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3203  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3204  
6596118ccdcdb3 Jie Gan               2024-05-21  3205  		tpdm@6861000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3206  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3207  			reg = <0x0 0x6861000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3208  
6596118ccdcdb3 Jie Gan               2024-05-21  3209  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3210  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3211  
6596118ccdcdb3 Jie Gan               2024-05-21  3212  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3213  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3214  
6596118ccdcdb3 Jie Gan               2024-05-21  3215  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3216  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3217  					apss_tpdm4_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3218  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3219  						<&apss_tpda_in4>;
6596118ccdcdb3 Jie Gan               2024-05-21  3220  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3221  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3222  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3223  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3224  
6596118ccdcdb3 Jie Gan               2024-05-21  3225  		tpda@6863000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3226  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3227  			reg = <0x0 0x6863000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3228  
6596118ccdcdb3 Jie Gan               2024-05-21  3229  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3230  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3231  
6596118ccdcdb3 Jie Gan               2024-05-21  3232  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3233  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3234  					apss_tpda_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3235  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3236  						<&apss_funnel1_in3>;
6596118ccdcdb3 Jie Gan               2024-05-21  3237  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3238  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3239  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3240  
6596118ccdcdb3 Jie Gan               2024-05-21  3241  			in-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3242  				#address-cells = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3243  				#size-cells = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3244  
6596118ccdcdb3 Jie Gan               2024-05-21  3245  				port@0 {
6596118ccdcdb3 Jie Gan               2024-05-21  3246  					reg = <0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3247  					apss_tpda_in0: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3248  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3249  						<&apss_tpdm0_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3250  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3251  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3252  
6596118ccdcdb3 Jie Gan               2024-05-21  3253  				port@1 {
6596118ccdcdb3 Jie Gan               2024-05-21  3254  					reg = <1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3255  					apss_tpda_in1: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3256  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3257  						<&apss_tpdm1_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3258  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3259  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3260  
6596118ccdcdb3 Jie Gan               2024-05-21  3261  				port@2 {
6596118ccdcdb3 Jie Gan               2024-05-21  3262  					reg = <2>;
6596118ccdcdb3 Jie Gan               2024-05-21  3263  					apss_tpda_in2: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3264  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3265  						<&apss_tpdm2_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3266  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3267  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3268  
6596118ccdcdb3 Jie Gan               2024-05-21  3269  				port@3 {
6596118ccdcdb3 Jie Gan               2024-05-21  3270  					reg = <3>;
6596118ccdcdb3 Jie Gan               2024-05-21  3271  					apss_tpda_in3: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3272  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3273  						<&apss_tpdm3_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3274  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3275  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3276  
6596118ccdcdb3 Jie Gan               2024-05-21  3277  				port@4 {
6596118ccdcdb3 Jie Gan               2024-05-21  3278  					reg = <4>;
6596118ccdcdb3 Jie Gan               2024-05-21  3279  					apss_tpda_in4: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3280  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3281  						<&apss_tpdm4_out>;
6596118ccdcdb3 Jie Gan               2024-05-21  3282  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3283  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3284  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3285  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3286  
6596118ccdcdb3 Jie Gan               2024-05-21  3287  		tpdm@68a0000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3288  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3289  			reg = <0x0 0x68a0000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3290  
6596118ccdcdb3 Jie Gan               2024-05-21  3291  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3292  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3293  
6596118ccdcdb3 Jie Gan               2024-05-21  3294  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3295  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3296  
6596118ccdcdb3 Jie Gan               2024-05-21  3297  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3298  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3299  					apss_tpdm0_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3300  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3301  						<&apss_tpda_in0>;
6596118ccdcdb3 Jie Gan               2024-05-21  3302  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3303  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3304  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3305  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3306  
6596118ccdcdb3 Jie Gan               2024-05-21  3307  		tpdm@68b0000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3308  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3309  			reg = <0x0 0x68b0000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3310  
6596118ccdcdb3 Jie Gan               2024-05-21  3311  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3312  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3313  
6596118ccdcdb3 Jie Gan               2024-05-21  3314  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3315  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3316  
6596118ccdcdb3 Jie Gan               2024-05-21  3317  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3318  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3319  					apss_tpdm1_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3320  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3321  						<&apss_tpda_in1>;
6596118ccdcdb3 Jie Gan               2024-05-21  3322  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3323  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3324  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3325  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3326  
6596118ccdcdb3 Jie Gan               2024-05-21  3327  		tpdm@68c0000 {
6596118ccdcdb3 Jie Gan               2024-05-21  3328  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 Jie Gan               2024-05-21  3329  			reg = <0x0 0x68c0000 0x0 0x1000>;
6596118ccdcdb3 Jie Gan               2024-05-21  3330  
6596118ccdcdb3 Jie Gan               2024-05-21  3331  			clocks = <&aoss_qmp>;
6596118ccdcdb3 Jie Gan               2024-05-21  3332  			clock-names = "apb_pclk";
6596118ccdcdb3 Jie Gan               2024-05-21  3333  
6596118ccdcdb3 Jie Gan               2024-05-21  3334  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3335  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 Jie Gan               2024-05-21  3336  
6596118ccdcdb3 Jie Gan               2024-05-21  3337  			out-ports {
6596118ccdcdb3 Jie Gan               2024-05-21  3338  				port {
6596118ccdcdb3 Jie Gan               2024-05-21  3339  					apss_tpdm2_out: endpoint {
6596118ccdcdb3 Jie Gan               2024-05-21  3340  						remote-endpoint =
6596118ccdcdb3 Jie Gan               2024-05-21  3341  						<&apss_tpda_in2>;
6596118ccdcdb3 Jie Gan               2024-05-21  3342  					};
6596118ccdcdb3 Jie Gan               2024-05-21  3343  				};
6596118ccdcdb3 Jie Gan               2024-05-21  3344  			};
6596118ccdcdb3 Jie Gan               2024-05-21  3345  		};
6596118ccdcdb3 Jie Gan               2024-05-21  3346  
de1001525c1aa2 Shazad Hussain        2023-04-28  3347  		usb_0_hsphy: phy@88e4000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3348  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 Shazad Hussain        2023-04-28  3349  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3350  			reg = <0 0x088e4000 0 0x120>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3351  			clocks = <&rpmhcc RPMH_CXO_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3352  			clock-names = "ref";
de1001525c1aa2 Shazad Hussain        2023-04-28  3353  			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3354  
de1001525c1aa2 Shazad Hussain        2023-04-28  3355  			#phy-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3356  
de1001525c1aa2 Shazad Hussain        2023-04-28  3357  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3358  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3359  
de1001525c1aa2 Shazad Hussain        2023-04-28  3360  		usb_0_qmpphy: phy@88e8000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3361  			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3362  			reg = <0 0x088e8000 0 0x2000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3363  
de1001525c1aa2 Shazad Hussain        2023-04-28  3364  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3365  				 <&gcc GCC_USB_CLKREF_EN>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3366  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3367  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3368  			clock-names = "aux", "ref", "com_aux", "pipe";
de1001525c1aa2 Shazad Hussain        2023-04-28  3369  
de1001525c1aa2 Shazad Hussain        2023-04-28  3370  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3371  				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3372  			reset-names = "phy", "phy_phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3373  
de1001525c1aa2 Shazad Hussain        2023-04-28  3374  			power-domains = <&gcc USB30_PRIM_GDSC>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3375  
de1001525c1aa2 Shazad Hussain        2023-04-28  3376  			#clock-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3377  			clock-output-names = "usb3_prim_phy_pipe_clk_src";
de1001525c1aa2 Shazad Hussain        2023-04-28  3378  
de1001525c1aa2 Shazad Hussain        2023-04-28  3379  			#phy-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3380  
de1001525c1aa2 Shazad Hussain        2023-04-28  3381  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3382  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3383  
de1001525c1aa2 Shazad Hussain        2023-04-28  3384  		usb_0: usb@a6f8800 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3385  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3386  			reg = <0 0x0a6f8800 0 0x400>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3387  			#address-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3388  			#size-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3389  			ranges;
de1001525c1aa2 Shazad Hussain        2023-04-28  3390  
de1001525c1aa2 Shazad Hussain        2023-04-28  3391  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3392  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3393  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3394  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3395  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3396  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 Shazad Hussain        2023-04-28  3397  
de1001525c1aa2 Shazad Hussain        2023-04-28  3398  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3399  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3400  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3401  
de1001525c1aa2 Shazad Hussain        2023-04-28  3402  			interrupts-extended = <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati      2024-01-26  3403  					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3404  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3405  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3406  					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3407  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati      2024-01-26  3408  					  "hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3409  					  "dp_hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3410  					  "dm_hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3411  					  "ss_phy_irq";
de1001525c1aa2 Shazad Hussain        2023-04-28  3412  
de1001525c1aa2 Shazad Hussain        2023-04-28  3413  			power-domains = <&gcc USB30_PRIM_GDSC>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3414  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3415  
de1001525c1aa2 Shazad Hussain        2023-04-28  3416  			resets = <&gcc GCC_USB30_PRIM_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3417  
de1001525c1aa2 Shazad Hussain        2023-04-28  3418  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3419  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3420  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 Shazad Hussain        2023-04-28  3421  
de1001525c1aa2 Shazad Hussain        2023-04-28  3422  			wakeup-source;
de1001525c1aa2 Shazad Hussain        2023-04-28  3423  
de1001525c1aa2 Shazad Hussain        2023-04-28  3424  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3425  
de1001525c1aa2 Shazad Hussain        2023-04-28  3426  			usb_0_dwc3: usb@a600000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3427  				compatible = "snps,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3428  				reg = <0 0x0a600000 0 0xe000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3429  				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3430  				iommus = <&apps_smmu 0x080 0x0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3431  				phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3432  				phy-names = "usb2-phy", "usb3-phy";
1052c4c63639ad Krishna Kurapati      2024-12-31  3433  				snps,dis-u1-entry-quirk;
1052c4c63639ad Krishna Kurapati      2024-12-31  3434  				snps,dis-u2-entry-quirk;
de1001525c1aa2 Shazad Hussain        2023-04-28  3435  			};
de1001525c1aa2 Shazad Hussain        2023-04-28  3436  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3437  
de1001525c1aa2 Shazad Hussain        2023-04-28  3438  		usb_1_hsphy: phy@88e6000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3439  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 Shazad Hussain        2023-04-28  3440  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3441  			reg = <0 0x088e6000 0 0x120>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3442  			clocks = <&gcc GCC_USB_CLKREF_EN>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3443  			clock-names = "ref";
de1001525c1aa2 Shazad Hussain        2023-04-28  3444  			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3445  
de1001525c1aa2 Shazad Hussain        2023-04-28  3446  			#phy-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3447  
de1001525c1aa2 Shazad Hussain        2023-04-28  3448  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3449  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3450  
de1001525c1aa2 Shazad Hussain        2023-04-28  3451  		usb_1_qmpphy: phy@88ea000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3452  			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3453  			reg = <0 0x088ea000 0 0x2000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3454  
de1001525c1aa2 Shazad Hussain        2023-04-28  3455  			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3456  				 <&gcc GCC_USB_CLKREF_EN>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3457  				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3458  				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3459  			clock-names = "aux", "ref", "com_aux", "pipe";
de1001525c1aa2 Shazad Hussain        2023-04-28  3460  
de1001525c1aa2 Shazad Hussain        2023-04-28  3461  			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3462  				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3463  			reset-names = "phy", "phy_phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3464  
de1001525c1aa2 Shazad Hussain        2023-04-28  3465  			power-domains = <&gcc USB30_SEC_GDSC>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3466  
de1001525c1aa2 Shazad Hussain        2023-04-28  3467  			#clock-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3468  			clock-output-names = "usb3_sec_phy_pipe_clk_src";
de1001525c1aa2 Shazad Hussain        2023-04-28  3469  
de1001525c1aa2 Shazad Hussain        2023-04-28  3470  			#phy-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3471  
de1001525c1aa2 Shazad Hussain        2023-04-28  3472  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3473  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3474  
de1001525c1aa2 Shazad Hussain        2023-04-28  3475  		usb_1: usb@a8f8800 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3476  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3477  			reg = <0 0x0a8f8800 0 0x400>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3478  			#address-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3479  			#size-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3480  			ranges;
de1001525c1aa2 Shazad Hussain        2023-04-28  3481  
de1001525c1aa2 Shazad Hussain        2023-04-28  3482  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3483  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3484  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3485  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3486  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3487  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 Shazad Hussain        2023-04-28  3488  
de1001525c1aa2 Shazad Hussain        2023-04-28  3489  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3490  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3491  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3492  
de1001525c1aa2 Shazad Hussain        2023-04-28  3493  			interrupts-extended = <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati      2024-01-26  3494  					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3495  					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3496  					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3497  					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3498  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati      2024-01-26  3499  					  "hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3500  					  "dp_hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3501  					  "dm_hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3502  					  "ss_phy_irq";
de1001525c1aa2 Shazad Hussain        2023-04-28  3503  
de1001525c1aa2 Shazad Hussain        2023-04-28  3504  			power-domains = <&gcc USB30_SEC_GDSC>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3505  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3506  
de1001525c1aa2 Shazad Hussain        2023-04-28  3507  			resets = <&gcc GCC_USB30_SEC_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3508  
de1001525c1aa2 Shazad Hussain        2023-04-28  3509  			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3510  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3511  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 Shazad Hussain        2023-04-28  3512  
de1001525c1aa2 Shazad Hussain        2023-04-28  3513  			wakeup-source;
de1001525c1aa2 Shazad Hussain        2023-04-28  3514  
de1001525c1aa2 Shazad Hussain        2023-04-28  3515  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3516  
de1001525c1aa2 Shazad Hussain        2023-04-28  3517  			usb_1_dwc3: usb@a800000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3518  				compatible = "snps,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3519  				reg = <0 0x0a800000 0 0xe000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3520  				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3521  				iommus = <&apps_smmu 0x0a0 0x0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3522  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3523  				phy-names = "usb2-phy", "usb3-phy";
1052c4c63639ad Krishna Kurapati      2024-12-31  3524  				snps,dis-u1-entry-quirk;
1052c4c63639ad Krishna Kurapati      2024-12-31  3525  				snps,dis-u2-entry-quirk;
de1001525c1aa2 Shazad Hussain        2023-04-28  3526  			};
de1001525c1aa2 Shazad Hussain        2023-04-28  3527  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3528  
de1001525c1aa2 Shazad Hussain        2023-04-28  3529  		usb_2_hsphy: phy@88e7000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3530  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 Shazad Hussain        2023-04-28  3531  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 Shazad Hussain        2023-04-28  3532  			reg = <0 0x088e7000 0 0x120>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3533  			clocks = <&gcc GCC_USB_CLKREF_EN>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3534  			clock-names = "ref";
de1001525c1aa2 Shazad Hussain        2023-04-28  3535  			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3536  
de1001525c1aa2 Shazad Hussain        2023-04-28  3537  			#phy-cells = <0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3538  
de1001525c1aa2 Shazad Hussain        2023-04-28  3539  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3540  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3541  
de1001525c1aa2 Shazad Hussain        2023-04-28  3542  		usb_2: usb@a4f8800 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3543  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3544  			reg = <0 0x0a4f8800 0 0x400>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3545  			#address-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3546  			#size-cells = <2>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3547  			ranges;
de1001525c1aa2 Shazad Hussain        2023-04-28  3548  
de1001525c1aa2 Shazad Hussain        2023-04-28  3549  			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3550  				 <&gcc GCC_USB20_MASTER_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3551  				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3552  				 <&gcc GCC_USB20_SLEEP_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3553  				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3554  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 Shazad Hussain        2023-04-28  3555  
de1001525c1aa2 Shazad Hussain        2023-04-28  3556  			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3557  					  <&gcc GCC_USB20_MASTER_CLK>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3558  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3559  
de1001525c1aa2 Shazad Hussain        2023-04-28  3560  			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati      2024-01-26  3561  					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3562  					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 Johan Hovold          2023-11-20  3563  					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3564  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati      2024-01-26  3565  					  "hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3566  					  "dp_hs_phy_irq",
de1001525c1aa2 Shazad Hussain        2023-04-28  3567  					  "dm_hs_phy_irq";
de1001525c1aa2 Shazad Hussain        2023-04-28  3568  
de1001525c1aa2 Shazad Hussain        2023-04-28  3569  			power-domains = <&gcc USB20_PRIM_GDSC>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3570  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3571  
de1001525c1aa2 Shazad Hussain        2023-04-28  3572  			resets = <&gcc GCC_USB20_PRIM_BCR>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3573  
de1001525c1aa2 Shazad Hussain        2023-04-28  3574  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 Shazad Hussain        2023-04-28  3575  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3576  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 Shazad Hussain        2023-04-28  3577  
de1001525c1aa2 Shazad Hussain        2023-04-28  3578  			wakeup-source;
de1001525c1aa2 Shazad Hussain        2023-04-28  3579  
de1001525c1aa2 Shazad Hussain        2023-04-28  3580  			status = "disabled";
de1001525c1aa2 Shazad Hussain        2023-04-28  3581  
de1001525c1aa2 Shazad Hussain        2023-04-28  3582  			usb_2_dwc3: usb@a400000 {
de1001525c1aa2 Shazad Hussain        2023-04-28  3583  				compatible = "snps,dwc3";
de1001525c1aa2 Shazad Hussain        2023-04-28  3584  				reg = <0 0x0a400000 0 0xe000>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3585  				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3586  				iommus = <&apps_smmu 0x020 0x0>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3587  				phys = <&usb_2_hsphy>;
de1001525c1aa2 Shazad Hussain        2023-04-28  3588  				phy-names = "usb2-phy";
1052c4c63639ad Krishna Kurapati      2024-12-31  3589  				snps,dis-u1-entry-quirk;
1052c4c63639ad Krishna Kurapati      2024-12-31  3590  				snps,dis-u2-entry-quirk;
de1001525c1aa2 Shazad Hussain        2023-04-28  3591  			};
de1001525c1aa2 Shazad Hussain        2023-04-28  3592  		};
de1001525c1aa2 Shazad Hussain        2023-04-28  3593  
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  3594  		tcsr_mutex: hwlock@1f40000 {
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  3595  			compatible = "qcom,tcsr-mutex";
3fd7e2eec8f4fe Bartosz Golaszewski   2023-03-27  3596  			reg = <0x0 0x01f40000 0x0 0x20000>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  3597  			#hwlock-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  3598  		};
603f96d4c9d0cb Bartosz Golaszewski   2023-02-14  3599  
1a82fbfc87fd76 Mukesh Ojha           2024-08-30  3600  		tcsr: syscon@1fc0000 {
1a82fbfc87fd76 Mukesh Ojha           2024-08-30  3601  			compatible = "qcom,sa8775p-tcsr", "syscon";
1a82fbfc87fd76 Mukesh Ojha           2024-08-30  3602  			reg = <0x0 0x1fc0000 0x0 0x30000>;
1a82fbfc87fd76 Mukesh Ojha           2024-08-30  3603  		};
1a82fbfc87fd76 Mukesh Ojha           2024-08-30  3604  
597cfc178829ac Bartosz Golaszewski   2023-04-17  3605  		gpucc: clock-controller@3d90000 {
597cfc178829ac Bartosz Golaszewski   2023-04-17  3606  			compatible = "qcom,sa8775p-gpucc";
597cfc178829ac Bartosz Golaszewski   2023-04-17  3607  			reg = <0x0 0x03d90000 0x0 0xa000>;
597cfc178829ac Bartosz Golaszewski   2023-04-17  3608  			clocks = <&rpmhcc RPMH_CXO_CLK>,
597cfc178829ac Bartosz Golaszewski   2023-04-17  3609  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
597cfc178829ac Bartosz Golaszewski   2023-04-17  3610  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
597cfc178829ac Bartosz Golaszewski   2023-04-17  3611  			clock-names = "bi_tcxo",
597cfc178829ac Bartosz Golaszewski   2023-04-17  3612  				      "gcc_gpu_gpll0_clk_src",
597cfc178829ac Bartosz Golaszewski   2023-04-17  3613  				      "gcc_gpu_gpll0_div_clk_src";
597cfc178829ac Bartosz Golaszewski   2023-04-17  3614  			#clock-cells = <1>;
597cfc178829ac Bartosz Golaszewski   2023-04-17  3615  			#reset-cells = <1>;
597cfc178829ac Bartosz Golaszewski   2023-04-17  3616  			#power-domain-cells = <1>;
597cfc178829ac Bartosz Golaszewski   2023-04-17  3617  		};
597cfc178829ac Bartosz Golaszewski   2023-04-17  3618  
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3619  		adreno_smmu: iommu@3da0000 {
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3620  			compatible = "qcom,sa8775p-smmu-500", "qcom,adreno-smmu",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3621  				     "qcom,smmu-500", "arm,mmu-500";
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3622  			reg = <0x0 0x03da0000 0x0 0x20000>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3623  			#iommu-cells = <2>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3624  			#global-interrupts = <2>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3625  			dma-coherent;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3626  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3627  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3628  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3629  				 <&gpucc GPU_CC_AHB_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3630  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3631  				 <&gpucc GPU_CC_CX_GMU_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3632  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3633  				 <&gpucc GPU_CC_HUB_AON_CLK>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3634  			clock-names = "gcc_gpu_memnoc_gfx_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3635  				      "gcc_gpu_snoc_dvm_gfx_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3636  				      "gpu_cc_ahb_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3637  				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3638  				      "gpu_cc_cx_gmu_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3639  				      "gpu_cc_hub_cx_int_clk",
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3640  				      "gpu_cc_hub_aon_clk";
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3641  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3642  				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3643  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3644  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3645  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3646  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3647  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3648  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3649  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3650  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3651  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3652  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3653  		};
1a1ff00c1626c8 Bartosz Golaszewski   2023-04-17  3654  
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3655  		serdes0: phy@8901000 {
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3656  			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3657  			reg = <0x0 0x08901000 0x0 0xe10>;
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3658  			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3659  			clock-names = "sgmi_ref";
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3660  			#phy-cells = <0>;
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3661  			status = "disabled";
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3662  		};
683ef77158cbb5 Bartosz Golaszewski   2023-06-22  3663  
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3664  		serdes1: phy@8902000 {
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3665  			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3666  			reg = <0x0 0x08902000 0x0 0xe10>;
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3667  			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3668  			clock-names = "sgmi_ref";
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3669  			#phy-cells = <0>;
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3670  			status = "disabled";
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3671  		};
31cd8caf0cbe19 Bartosz Golaszewski   2023-08-10  3672  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3673  		pmu@9091000 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3674  			compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3675  			reg = <0x0 0x9091000 0x0 0x1000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3676  			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3677  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3678  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3679  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3680  			operating-points-v2 = <&llcc_bwmon_opp_table>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3681  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3682  			llcc_bwmon_opp_table: opp-table {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3683  				compatible = "operating-points-v2";
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3684  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3685  				opp-0 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3686  					opp-peak-kBps = <762000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3687  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3688  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3689  				opp-1 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3690  					opp-peak-kBps = <1720000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3691  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3692  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3693  				opp-2 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3694  					opp-peak-kBps = <2086000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3695  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3696  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3697  				opp-3 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3698  					opp-peak-kBps = <2601000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3699  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3700  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3701  				opp-4 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3702  					opp-peak-kBps = <2929000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3703  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3704  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3705  				opp-5 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3706  					opp-peak-kBps = <5931000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3707  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3708  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3709  				opp-6 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3710  					opp-peak-kBps = <6515000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3711  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3712  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3713  				opp-7 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3714  					opp-peak-kBps = <7984000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3715  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3716  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3717  				opp-8 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3718  					opp-peak-kBps = <10437000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3719  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3720  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3721  				opp-9 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3722  					opp-peak-kBps = <12195000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3723  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3724  			};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3725  		};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3726  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3727  		pmu@90b5400 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3728  			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3729  			reg = <0x0 0x90b5400 0x0 0x600>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3730  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3731  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3732  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3733  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3734  			operating-points-v2 = <&cpu_bwmon_opp_table>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3735  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3736  			cpu_bwmon_opp_table: opp-table {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3737  				compatible = "operating-points-v2";
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3738  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3739  				opp-0 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3740  					opp-peak-kBps = <9155000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3741  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3742  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3743  				opp-1 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3744  					opp-peak-kBps = <12298000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3745  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3746  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3747  				opp-2 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3748  					opp-peak-kBps = <14236000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3749  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3750  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3751  				opp-3 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3752  					opp-peak-kBps = <16265000>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3753  				};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3754  			};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3755  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3756  		};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3757  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3758  		pmu@90b6400 {
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3759  			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3760  			reg = <0x0 0x90b6400 0x0 0x600>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3761  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3762  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3763  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3764  
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3765  			operating-points-v2 = <&cpu_bwmon_opp_table>;
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3766  		};
1dd1a6d2b1851f Tengfei Fan           2024-07-30  3767  
809c20b1ffc802 Tengfei Fan           2024-05-29  3768  		llcc: system-cache-controller@9200000 {
809c20b1ffc802 Tengfei Fan           2024-05-29  3769  			compatible = "qcom,sa8775p-llcc";
809c20b1ffc802 Tengfei Fan           2024-05-29  3770  			reg = <0x0 0x09200000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3771  			      <0x0 0x09300000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3772  			      <0x0 0x09400000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3773  			      <0x0 0x09500000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3774  			      <0x0 0x09600000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3775  			      <0x0 0x09700000 0x0 0x80000>,
809c20b1ffc802 Tengfei Fan           2024-05-29  3776  			      <0x0 0x09a00000 0x0 0x80000>;
809c20b1ffc802 Tengfei Fan           2024-05-29  3777  			reg-names = "llcc0_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3778  				    "llcc1_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3779  				    "llcc2_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3780  				    "llcc3_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3781  				    "llcc4_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3782  				    "llcc5_base",
809c20b1ffc802 Tengfei Fan           2024-05-29  3783  				    "llcc_broadcast_base";
809c20b1ffc802 Tengfei Fan           2024-05-29  3784  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
809c20b1ffc802 Tengfei Fan           2024-05-29  3785  		};
809c20b1ffc802 Tengfei Fan           2024-05-29  3786  
727dc481e50a4d Taniya Das            2024-10-25  3787  		videocc: clock-controller@abf0000 {
727dc481e50a4d Taniya Das            2024-10-25  3788  			compatible = "qcom,sa8775p-videocc";
727dc481e50a4d Taniya Das            2024-10-25  3789  			reg = <0x0 0x0abf0000 0x0 0x10000>;
727dc481e50a4d Taniya Das            2024-10-25  3790  			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
727dc481e50a4d Taniya Das            2024-10-25  3791  				 <&rpmhcc RPMH_CXO_CLK>,
727dc481e50a4d Taniya Das            2024-10-25  3792  				 <&rpmhcc RPMH_CXO_CLK_A>,
727dc481e50a4d Taniya Das            2024-10-25  3793  				 <&sleep_clk>;
727dc481e50a4d Taniya Das            2024-10-25  3794  			power-domains = <&rpmhpd SA8775P_MMCX>;
727dc481e50a4d Taniya Das            2024-10-25  3795  			#clock-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3796  			#reset-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3797  			#power-domain-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3798  		};
727dc481e50a4d Taniya Das            2024-10-25  3799  
727dc481e50a4d Taniya Das            2024-10-25  3800  		camcc: clock-controller@ade0000 {
727dc481e50a4d Taniya Das            2024-10-25  3801  			compatible = "qcom,sa8775p-camcc";
727dc481e50a4d Taniya Das            2024-10-25  3802  			reg = <0x0 0x0ade0000 0x0 0x20000>;
727dc481e50a4d Taniya Das            2024-10-25  3803  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
727dc481e50a4d Taniya Das            2024-10-25  3804  				 <&rpmhcc RPMH_CXO_CLK>,
727dc481e50a4d Taniya Das            2024-10-25  3805  				 <&rpmhcc RPMH_CXO_CLK_A>,
727dc481e50a4d Taniya Das            2024-10-25  3806  				 <&sleep_clk>;
727dc481e50a4d Taniya Das            2024-10-25  3807  			power-domains = <&rpmhpd SA8775P_MMCX>;
727dc481e50a4d Taniya Das            2024-10-25  3808  			#clock-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3809  			#reset-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3810  			#power-domain-cells = <1>;
727dc481e50a4d Taniya Das            2024-10-25  3811  		};
727dc481e50a4d Taniya Das            2024-10-25  3812  
2f39d2d46c73ad Mahadevan             2024-10-19  3813  		mdss0: display-subsystem@ae00000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3814  			compatible = "qcom,sa8775p-mdss";
2f39d2d46c73ad Mahadevan             2024-10-19  3815  			reg = <0x0 0x0ae00000 0x0 0x1000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3816  			reg-names = "mdss";
2f39d2d46c73ad Mahadevan             2024-10-19  3817  
2f39d2d46c73ad Mahadevan             2024-10-19  3818  			/* same path used twice */
2f39d2d46c73ad Mahadevan             2024-10-19  3819  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
2f39d2d46c73ad Mahadevan             2024-10-19  3820  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
2f39d2d46c73ad Mahadevan             2024-10-19  3821  					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
2f39d2d46c73ad Mahadevan             2024-10-19  3822  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
2f39d2d46c73ad Mahadevan             2024-10-19  3823  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
2f39d2d46c73ad Mahadevan             2024-10-19  3824  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
2f39d2d46c73ad Mahadevan             2024-10-19  3825  			interconnect-names = "mdp0-mem",
2f39d2d46c73ad Mahadevan             2024-10-19  3826  					     "mdp1-mem",
2f39d2d46c73ad Mahadevan             2024-10-19  3827  					     "cpu-cfg";
2f39d2d46c73ad Mahadevan             2024-10-19  3828  
2f39d2d46c73ad Mahadevan             2024-10-19  3829  			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
2f39d2d46c73ad Mahadevan             2024-10-19  3830  
2f39d2d46c73ad Mahadevan             2024-10-19  3831  			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
2f39d2d46c73ad Mahadevan             2024-10-19  3832  
2f39d2d46c73ad Mahadevan             2024-10-19  3833  			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3834  				 <&gcc GCC_DISP_HF_AXI_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3835  				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
2f39d2d46c73ad Mahadevan             2024-10-19  3836  
2f39d2d46c73ad Mahadevan             2024-10-19  3837  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
2f39d2d46c73ad Mahadevan             2024-10-19  3838  			interrupt-controller;
2f39d2d46c73ad Mahadevan             2024-10-19  3839  			#interrupt-cells = <1>;
2f39d2d46c73ad Mahadevan             2024-10-19  3840  
2f39d2d46c73ad Mahadevan             2024-10-19  3841  			iommus = <&apps_smmu 0x1000 0x402>;
2f39d2d46c73ad Mahadevan             2024-10-19  3842  
2f39d2d46c73ad Mahadevan             2024-10-19  3843  			#address-cells = <2>;
2f39d2d46c73ad Mahadevan             2024-10-19  3844  			#size-cells = <2>;
2f39d2d46c73ad Mahadevan             2024-10-19  3845  			ranges;
2f39d2d46c73ad Mahadevan             2024-10-19  3846  
2f39d2d46c73ad Mahadevan             2024-10-19  3847  			status = "disabled";
2f39d2d46c73ad Mahadevan             2024-10-19  3848  
2f39d2d46c73ad Mahadevan             2024-10-19  3849  			mdss0_mdp: display-controller@ae01000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3850  				compatible = "qcom,sa8775p-dpu";
2f39d2d46c73ad Mahadevan             2024-10-19  3851  				reg = <0x0 0x0ae01000 0x0 0x8f000>,
2f39d2d46c73ad Mahadevan             2024-10-19  3852  				      <0x0 0x0aeb0000 0x0 0x2008>;
2f39d2d46c73ad Mahadevan             2024-10-19  3853  				reg-names = "mdp", "vbif";
2f39d2d46c73ad Mahadevan             2024-10-19  3854  
2f39d2d46c73ad Mahadevan             2024-10-19  3855  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3856  					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3857  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3858  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
2f39d2d46c73ad Mahadevan             2024-10-19  3859  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
2f39d2d46c73ad Mahadevan             2024-10-19  3860  				clock-names = "bus",
2f39d2d46c73ad Mahadevan             2024-10-19  3861  					      "iface",
2f39d2d46c73ad Mahadevan             2024-10-19  3862  					      "lut",
2f39d2d46c73ad Mahadevan             2024-10-19  3863  					      "core",
2f39d2d46c73ad Mahadevan             2024-10-19  3864  					      "vsync";
2f39d2d46c73ad Mahadevan             2024-10-19  3865  
2f39d2d46c73ad Mahadevan             2024-10-19  3866  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
2f39d2d46c73ad Mahadevan             2024-10-19  3867  				assigned-clock-rates = <19200000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3868  
2f39d2d46c73ad Mahadevan             2024-10-19  3869  				operating-points-v2 = <&mdss0_mdp_opp_table>;
2f39d2d46c73ad Mahadevan             2024-10-19  3870  				power-domains = <&rpmhpd SA8775P_MMCX>;
2f39d2d46c73ad Mahadevan             2024-10-19  3871  
2f39d2d46c73ad Mahadevan             2024-10-19  3872  				interrupt-parent = <&mdss0>;
2f39d2d46c73ad Mahadevan             2024-10-19  3873  				interrupts = <0>;
2f39d2d46c73ad Mahadevan             2024-10-19  3874  
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3875  				ports {
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3876  					#address-cells = <1>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3877  					#size-cells = <0>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3878  
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3879  					port@0 {
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3880  						reg = <0>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3881  
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3882  						dpu_intf0_out: endpoint {
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3883  							remote-endpoint = <&mdss0_dp0_in>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3884  						};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3885  					};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3886  
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3887  					port@1 {
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3888  						reg = <1>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3889  
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3890  						dpu_intf4_out: endpoint {
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3891  							remote-endpoint = <&mdss0_dp1_in>;
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3892  						};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3893  					};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3894  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3895  					port@2 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3896  						reg = <2>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3897  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3898  						dpu_intf1_out: endpoint {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3899  							remote-endpoint = <&mdss0_dsi0_in>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3900  						};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3901  					};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3902  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3903  					port@3 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3904  						reg = <3>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3905  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3906  						dpu_intf2_out: endpoint {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3907  							remote-endpoint = <&mdss0_dsi1_in>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3908  						};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3909  					};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3910  				};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3911  
2f39d2d46c73ad Mahadevan             2024-10-19  3912  				mdss0_mdp_opp_table: opp-table {
2f39d2d46c73ad Mahadevan             2024-10-19  3913  					compatible = "operating-points-v2";
2f39d2d46c73ad Mahadevan             2024-10-19  3914  
2f39d2d46c73ad Mahadevan             2024-10-19  3915  					opp-375000000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3916  						opp-hz = /bits/ 64 <375000000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3917  						required-opps = <&rpmhpd_opp_svs_l1>;
2f39d2d46c73ad Mahadevan             2024-10-19  3918  					};
2f39d2d46c73ad Mahadevan             2024-10-19  3919  
2f39d2d46c73ad Mahadevan             2024-10-19  3920  					opp-500000000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3921  						opp-hz = /bits/ 64 <500000000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3922  						required-opps = <&rpmhpd_opp_nom>;
2f39d2d46c73ad Mahadevan             2024-10-19  3923  					};
2f39d2d46c73ad Mahadevan             2024-10-19  3924  
2f39d2d46c73ad Mahadevan             2024-10-19  3925  					opp-575000000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3926  						opp-hz = /bits/ 64 <575000000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3927  						required-opps = <&rpmhpd_opp_turbo>;
2f39d2d46c73ad Mahadevan             2024-10-19  3928  					};
2f39d2d46c73ad Mahadevan             2024-10-19  3929  
2f39d2d46c73ad Mahadevan             2024-10-19  3930  					opp-650000000 {
2f39d2d46c73ad Mahadevan             2024-10-19  3931  						opp-hz = /bits/ 64 <650000000>;
2f39d2d46c73ad Mahadevan             2024-10-19  3932  						required-opps = <&rpmhpd_opp_turbo_l1>;
2f39d2d46c73ad Mahadevan             2024-10-19  3933  					};
2f39d2d46c73ad Mahadevan             2024-10-19  3934  				};
2f39d2d46c73ad Mahadevan             2024-10-19  3935  			};
e1e3e5673f8d77 Soutrik Mukhopadhyay  2024-11-25  3936  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04 @3937  			mdss0_dsi0: dsi@ae94000 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3938  				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3939  				reg = <0x0 0x0ae94000 0x0 0x400>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3940  				reg-names = "dsi_ctrl";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3941  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3942  				interrupt-parent = <&mdss0>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3943  				interrupts = <4>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3944  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3945  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3946  					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3947  					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3948  					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3949  					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3950  					 <&gcc GCC_DISP_HF_AXI_CLK>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3951  				clock-names = "byte",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3952  					      "byte_intf",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3953  					      "pixel",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3954  					      "core",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3955  					      "iface",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3956  					      "bus";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3957  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3958  						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3959  				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3960  							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3961  				phys = <&mdss0_dsi0_phy>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3962  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3963  				operating-points-v2 = <&dsi0_opp_table>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3964  				power-domains = <&rpmhpd SA8775P_MMCX>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3965  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3966  				#address-cells = <1>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3967  				#size-cells = <0>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3968  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3969  				status = "disabled";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3970  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3971  				ports {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3972  					#address-cells = <1>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3973  					#size-cells = <0>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3974  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3975  					port@0 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3976  						reg = <0>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3977  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3978  						mdss0_dsi0_in: endpoint {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3979  							remote-endpoint = <&dpu_intf1_out>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3980  						};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3981  					};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3982  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3983  					port@1 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3984  						reg = <1>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3985  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3986  						mdss0_dsi0_out: endpoint{ };
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3987  					};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3988  				};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3989  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3990  				dsi0_opp_table: opp-table {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3991  					compatible = "operating-points-v2";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3992  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3993  					opp-358000000 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3994  						opp-hz = /bits/ 64 <358000000>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3995  						required-opps = <&rpmhpd_opp_svs_l1>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3996  					};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3997  				};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3998  			};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  3999  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4000  			mdss0_dsi0_phy: phy@ae94400 {
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4001  				compatible = "qcom,sa8775p-dsi-phy-5nm";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4002  				reg = <0x0 0x0ae94400 0x0 0x200>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4003  				      <0x0 0x0ae94600 0x0 0x280>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4004  				      <0x0 0x0ae94900 0x0 0x27c>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4005  				reg-names = "dsi_phy",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4006  					    "dsi_phy_lane",
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4007  					    "dsi_pll";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4008  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4009  				#clock-cells = <1>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4010  				#phy-cells = <0>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4011  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4012  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4013  					 <&rpmhcc RPMH_CXO_CLK>;
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4014  				clock-names = "iface", "ref";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4015  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4016  				status = "disabled";
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4017  			};
2f539e4c1a8d1a Ayushi Makhija        2025-04-04  4018  
2f539e4c1a8d1a Ayushi Makhija        2025-04-04 @4019  			mdss0_dsi1: dsi@ae96000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
