Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BD1799F
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Oct 2024 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703679; cv=none; b=ol5VkSlHU/cosYAlenf32NZkgf25lEajaHbmEMZsQuM382DolgLLbbEqt4w3Vh2e1e+SDgxv5sRs6a3Y7tvFV8aieU0AuQqvded55Z5AfJrkuwZL8h/pEanH0+eZ5ZypK5m2TGvRFaH/SmKamBUgZq3Lomn+KvIsofSJuGaeSzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703679; c=relaxed/simple;
	bh=DwUEhvmZqEiqskWFVn8JH7cs0aUMUAp9IP0lGRIOjio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gu+pTwH2Ux5ASRo9hbucr634/hL7H8/fc2nBmILy02JvcxjEgQuk5XKAfrLJJQN2Vqb1JLawkS+F3vGPOXkvIIaFRczw6xu9USsst1D383YTe/jwfnqaCPKxsysfI+yXaJSJNYvtvf6OoxmYNhnUDxZ4frkCm0+fwss8Cs2dBBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeqqsPI2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeqqsPI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728703673; x=1760239673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DwUEhvmZqEiqskWFVn8JH7cs0aUMUAp9IP0lGRIOjio=;
  b=ZeqqsPI2UiIlARxNaUPCsT4xQPEEcTGvzN65M2Xo2Yyi/BAPoll9GM2q
   su5aWUWl7kmEgxqKQZ7ejvDG1Oi+oQQwuiHmITvuCtDFvuxDxPRbMO6n8
   Dw0AQN/2pvdoYXQ+X/ApxVQwYa6OopRj3EtVneXMXHV8QgNGKI+GK8tlW
   hSGVFVG09YYM4OH8flECEytj7fIXJL9y+2jRJ1zPx1UrdJRkyrfL9zNsh
   ypp2KY+/NSLMLsyU1KLGlzWq52s77jDrv5FjFu4FAga745DoZb0q2dNzv
   v81DYrNfXtNxYy9abrbRIPtrU2ZJdI4+K7Uay3dsv9JtwD0jm4W3+A/Ew
   A==;
X-CSE-ConnectionGUID: IkbNKCb6Tq6LfDkB5HB6ag==
X-CSE-MsgGUID: lBdR2cJkRYSxuVvWmjkN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27989821"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="27989821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 20:27:52 -0700
X-CSE-ConnectionGUID: ncySnvJjSCueGl4dvO6Wyg==
X-CSE-MsgGUID: srWfLOQISD6iv6vSpT8qHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77182684"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Oct 2024 20:27:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szSnE-000D0J-0W;
	Sat, 12 Oct 2024 03:27:48 +0000
Date: Sat, 12 Oct 2024 11:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <202410121116.p8Dxinh0-lkp@intel.com>
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
In-Reply-To: <20241011023724.614584-12-mailingradian@gmail.com>
References: <20241011023724.614584-12-mailingradian@gmail.com>
TO: Richard Acayan <mailingradian@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Todor Tomov <todor.too@gmail.com>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: linux-arm-msm@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Richard Acayan <mailingradian@gmail.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next media-tree/master linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Acayan/dt-bindings-clock-qcom-sdm845-camcc-add-sdm670-compatible/20241011-103914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241011023724.614584-12-mailingradian%40gmail.com
patch subject: [PATCH v6 5/5] arm64: dts: qcom: sdm670: add camss and cci
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-001-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121116.p8Dxinh0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121116.p8Dxinh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410121116.p8Dxinh0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sdm670.dtsi:1471.36-1586.5: Warning (simple_bus_reg): /soc@0/camera-controller@ac65000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:1765.27-1817.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +/acb3000 +1471 arch/arm64/boot/dts/qcom/sdm670.dtsi

07c8ded6e37383 Richard Acayan      2022-11-10    21  
07c8ded6e37383 Richard Acayan      2022-11-10    22  / {
07c8ded6e37383 Richard Acayan      2022-11-10    23  	interrupt-parent = <&intc>;
07c8ded6e37383 Richard Acayan      2022-11-10    24  
07c8ded6e37383 Richard Acayan      2022-11-10    25  	#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10    26  	#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10    27  
07c8ded6e37383 Richard Acayan      2022-11-10    28  	aliases { };
07c8ded6e37383 Richard Acayan      2022-11-10    29  
07c8ded6e37383 Richard Acayan      2022-11-10    30  	chosen { };
07c8ded6e37383 Richard Acayan      2022-11-10    31  
07c8ded6e37383 Richard Acayan      2022-11-10    32  	cpus {
07c8ded6e37383 Richard Acayan      2022-11-10    33  		#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10    34  		#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10    35  
07c8ded6e37383 Richard Acayan      2022-11-10    36  		CPU0: cpu@0 {
07c8ded6e37383 Richard Acayan      2022-11-10    37  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10    38  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10    39  			reg = <0x0 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10    40  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01    41  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01    42  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01    43  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01    44  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01    45  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01    46  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10    47  			power-domains = <&CPU_PD0>;
07c8ded6e37383 Richard Acayan      2022-11-10    48  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10    49  			next-level-cache = <&L2_0>;
07c8ded6e37383 Richard Acayan      2022-11-10    50  			L2_0: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10    51  				compatible = "cache";
07c8ded6e37383 Richard Acayan      2022-11-10    52  				next-level-cache = <&L3_0>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    53  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    54  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10    55  				L3_0: l3-cache {
07c8ded6e37383 Richard Acayan      2022-11-10    56  					compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    57  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    58  					cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10    59  				};
07c8ded6e37383 Richard Acayan      2022-11-10    60  			};
07c8ded6e37383 Richard Acayan      2022-11-10    61  		};
07c8ded6e37383 Richard Acayan      2022-11-10    62  
07c8ded6e37383 Richard Acayan      2022-11-10    63  		CPU1: cpu@100 {
07c8ded6e37383 Richard Acayan      2022-11-10    64  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10    65  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10    66  			reg = <0x0 0x100>;
07c8ded6e37383 Richard Acayan      2022-11-10    67  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01    68  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01    69  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01    70  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01    71  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01    72  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01    73  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10    74  			power-domains = <&CPU_PD1>;
07c8ded6e37383 Richard Acayan      2022-11-10    75  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10    76  			next-level-cache = <&L2_100>;
07c8ded6e37383 Richard Acayan      2022-11-10    77  			L2_100: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10    78  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    79  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    80  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10    81  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10    82  			};
07c8ded6e37383 Richard Acayan      2022-11-10    83  		};
07c8ded6e37383 Richard Acayan      2022-11-10    84  
07c8ded6e37383 Richard Acayan      2022-11-10    85  		CPU2: cpu@200 {
07c8ded6e37383 Richard Acayan      2022-11-10    86  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10    87  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10    88  			reg = <0x0 0x200>;
07c8ded6e37383 Richard Acayan      2022-11-10    89  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01    90  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01    91  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01    92  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01    93  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01    94  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01    95  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10    96  			power-domains = <&CPU_PD2>;
07c8ded6e37383 Richard Acayan      2022-11-10    97  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10    98  			next-level-cache = <&L2_200>;
07c8ded6e37383 Richard Acayan      2022-11-10    99  			L2_200: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   100  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   101  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   102  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   103  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   104  			};
07c8ded6e37383 Richard Acayan      2022-11-10   105  		};
07c8ded6e37383 Richard Acayan      2022-11-10   106  
07c8ded6e37383 Richard Acayan      2022-11-10   107  		CPU3: cpu@300 {
07c8ded6e37383 Richard Acayan      2022-11-10   108  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10   109  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10   110  			reg = <0x0 0x300>;
07c8ded6e37383 Richard Acayan      2022-11-10   111  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01   112  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01   113  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01   114  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01   115  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01   116  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01   117  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10   118  			power-domains = <&CPU_PD3>;
07c8ded6e37383 Richard Acayan      2022-11-10   119  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   120  			next-level-cache = <&L2_300>;
07c8ded6e37383 Richard Acayan      2022-11-10   121  			L2_300: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   122  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   123  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   124  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   125  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   126  			};
07c8ded6e37383 Richard Acayan      2022-11-10   127  		};
07c8ded6e37383 Richard Acayan      2022-11-10   128  
07c8ded6e37383 Richard Acayan      2022-11-10   129  		CPU4: cpu@400 {
07c8ded6e37383 Richard Acayan      2022-11-10   130  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10   131  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10   132  			reg = <0x0 0x400>;
07c8ded6e37383 Richard Acayan      2022-11-10   133  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01   134  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01   135  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01   136  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01   137  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01   138  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01   139  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10   140  			power-domains = <&CPU_PD4>;
07c8ded6e37383 Richard Acayan      2022-11-10   141  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   142  			next-level-cache = <&L2_400>;
07c8ded6e37383 Richard Acayan      2022-11-10   143  			L2_400: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   144  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   145  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   146  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   147  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   148  			};
07c8ded6e37383 Richard Acayan      2022-11-10   149  		};
07c8ded6e37383 Richard Acayan      2022-11-10   150  
07c8ded6e37383 Richard Acayan      2022-11-10   151  		CPU5: cpu@500 {
07c8ded6e37383 Richard Acayan      2022-11-10   152  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10   153  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10   154  			reg = <0x0 0x500>;
07c8ded6e37383 Richard Acayan      2022-11-10   155  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01   156  			capacity-dmips-mhz = <610>;
605a981e53dc22 Richard Acayan      2023-08-01   157  			dynamic-power-coefficient = <203>;
0c665213d12641 Richard Acayan      2023-08-01   158  			qcom,freq-domain = <&cpufreq_hw 0>;
0c665213d12641 Richard Acayan      2023-08-01   159  			operating-points-v2 = <&cpu0_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01   160  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01   161  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10   162  			power-domains = <&CPU_PD5>;
07c8ded6e37383 Richard Acayan      2022-11-10   163  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   164  			next-level-cache = <&L2_500>;
07c8ded6e37383 Richard Acayan      2022-11-10   165  			L2_500: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   166  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   167  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   168  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   169  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   170  			};
07c8ded6e37383 Richard Acayan      2022-11-10   171  		};
07c8ded6e37383 Richard Acayan      2022-11-10   172  
07c8ded6e37383 Richard Acayan      2022-11-10   173  		CPU6: cpu@600 {
07c8ded6e37383 Richard Acayan      2022-11-10   174  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10   175  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10   176  			reg = <0x0 0x600>;
07c8ded6e37383 Richard Acayan      2022-11-10   177  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01   178  			capacity-dmips-mhz = <1024>;
605a981e53dc22 Richard Acayan      2023-08-01   179  			dynamic-power-coefficient = <393>;
0c665213d12641 Richard Acayan      2023-08-01   180  			qcom,freq-domain = <&cpufreq_hw 1>;
0c665213d12641 Richard Acayan      2023-08-01   181  			operating-points-v2 = <&cpu6_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01   182  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01   183  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10   184  			power-domains = <&CPU_PD6>;
07c8ded6e37383 Richard Acayan      2022-11-10   185  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   186  			next-level-cache = <&L2_600>;
07c8ded6e37383 Richard Acayan      2022-11-10   187  			L2_600: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   188  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   189  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   190  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   191  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   192  			};
07c8ded6e37383 Richard Acayan      2022-11-10   193  		};
07c8ded6e37383 Richard Acayan      2022-11-10   194  
07c8ded6e37383 Richard Acayan      2022-11-10   195  		CPU7: cpu@700 {
07c8ded6e37383 Richard Acayan      2022-11-10   196  			device_type = "cpu";
07c8ded6e37383 Richard Acayan      2022-11-10   197  			compatible = "qcom,kryo360";
07c8ded6e37383 Richard Acayan      2022-11-10   198  			reg = <0x0 0x700>;
07c8ded6e37383 Richard Acayan      2022-11-10   199  			enable-method = "psci";
605a981e53dc22 Richard Acayan      2023-08-01   200  			capacity-dmips-mhz = <1024>;
605a981e53dc22 Richard Acayan      2023-08-01   201  			dynamic-power-coefficient = <393>;
0c665213d12641 Richard Acayan      2023-08-01   202  			qcom,freq-domain = <&cpufreq_hw 1>;
0c665213d12641 Richard Acayan      2023-08-01   203  			operating-points-v2 = <&cpu6_opp_table>;
0c665213d12641 Richard Acayan      2023-08-01   204  			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
0c665213d12641 Richard Acayan      2023-08-01   205  					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
07c8ded6e37383 Richard Acayan      2022-11-10   206  			power-domains = <&CPU_PD7>;
07c8ded6e37383 Richard Acayan      2022-11-10   207  			power-domain-names = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   208  			next-level-cache = <&L2_700>;
07c8ded6e37383 Richard Acayan      2022-11-10   209  			L2_700: l2-cache {
07c8ded6e37383 Richard Acayan      2022-11-10   210  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   211  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   212  				cache-unified;
07c8ded6e37383 Richard Acayan      2022-11-10   213  				next-level-cache = <&L3_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   214  			};
07c8ded6e37383 Richard Acayan      2022-11-10   215  		};
07c8ded6e37383 Richard Acayan      2022-11-10   216  
07c8ded6e37383 Richard Acayan      2022-11-10   217  		cpu-map {
07c8ded6e37383 Richard Acayan      2022-11-10   218  			cluster0 {
07c8ded6e37383 Richard Acayan      2022-11-10   219  				core0 {
07c8ded6e37383 Richard Acayan      2022-11-10   220  					cpu = <&CPU0>;
07c8ded6e37383 Richard Acayan      2022-11-10   221  				};
07c8ded6e37383 Richard Acayan      2022-11-10   222  
07c8ded6e37383 Richard Acayan      2022-11-10   223  				core1 {
07c8ded6e37383 Richard Acayan      2022-11-10   224  					cpu = <&CPU1>;
07c8ded6e37383 Richard Acayan      2022-11-10   225  				};
07c8ded6e37383 Richard Acayan      2022-11-10   226  
07c8ded6e37383 Richard Acayan      2022-11-10   227  				core2 {
07c8ded6e37383 Richard Acayan      2022-11-10   228  					cpu = <&CPU2>;
07c8ded6e37383 Richard Acayan      2022-11-10   229  				};
07c8ded6e37383 Richard Acayan      2022-11-10   230  
07c8ded6e37383 Richard Acayan      2022-11-10   231  				core3 {
07c8ded6e37383 Richard Acayan      2022-11-10   232  					cpu = <&CPU3>;
07c8ded6e37383 Richard Acayan      2022-11-10   233  				};
07c8ded6e37383 Richard Acayan      2022-11-10   234  
07c8ded6e37383 Richard Acayan      2022-11-10   235  				core4 {
07c8ded6e37383 Richard Acayan      2022-11-10   236  					cpu = <&CPU4>;
07c8ded6e37383 Richard Acayan      2022-11-10   237  				};
07c8ded6e37383 Richard Acayan      2022-11-10   238  
07c8ded6e37383 Richard Acayan      2022-11-10   239  				core5 {
07c8ded6e37383 Richard Acayan      2022-11-10   240  					cpu = <&CPU5>;
07c8ded6e37383 Richard Acayan      2022-11-10   241  				};
07c8ded6e37383 Richard Acayan      2022-11-10   242  
07c8ded6e37383 Richard Acayan      2022-11-10   243  				core6 {
07c8ded6e37383 Richard Acayan      2022-11-10   244  					cpu = <&CPU6>;
07c8ded6e37383 Richard Acayan      2022-11-10   245  				};
07c8ded6e37383 Richard Acayan      2022-11-10   246  
07c8ded6e37383 Richard Acayan      2022-11-10   247  				core7 {
07c8ded6e37383 Richard Acayan      2022-11-10   248  					cpu = <&CPU7>;
07c8ded6e37383 Richard Acayan      2022-11-10   249  				};
07c8ded6e37383 Richard Acayan      2022-11-10   250  			};
07c8ded6e37383 Richard Acayan      2022-11-10   251  		};
07c8ded6e37383 Richard Acayan      2022-11-10   252  
07c8ded6e37383 Richard Acayan      2022-11-10   253  		idle-states {
07c8ded6e37383 Richard Acayan      2022-11-10   254  			entry-method = "psci";
07c8ded6e37383 Richard Acayan      2022-11-10   255  
07c8ded6e37383 Richard Acayan      2022-11-10   256  			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
07c8ded6e37383 Richard Acayan      2022-11-10   257  				compatible = "arm,idle-state";
07c8ded6e37383 Richard Acayan      2022-11-10   258  				idle-state-name = "little-rail-power-collapse";
07c8ded6e37383 Richard Acayan      2022-11-10   259  				arm,psci-suspend-param = <0x40000004>;
07c8ded6e37383 Richard Acayan      2022-11-10   260  				entry-latency-us = <702>;
07c8ded6e37383 Richard Acayan      2022-11-10   261  				exit-latency-us = <915>;
07c8ded6e37383 Richard Acayan      2022-11-10   262  				min-residency-us = <1617>;
07c8ded6e37383 Richard Acayan      2022-11-10   263  				local-timer-stop;
07c8ded6e37383 Richard Acayan      2022-11-10   264  			};
07c8ded6e37383 Richard Acayan      2022-11-10   265  
07c8ded6e37383 Richard Acayan      2022-11-10   266  			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
07c8ded6e37383 Richard Acayan      2022-11-10   267  				compatible = "arm,idle-state";
07c8ded6e37383 Richard Acayan      2022-11-10   268  				idle-state-name = "big-rail-power-collapse";
07c8ded6e37383 Richard Acayan      2022-11-10   269  				arm,psci-suspend-param = <0x40000004>;
07c8ded6e37383 Richard Acayan      2022-11-10   270  				entry-latency-us = <526>;
07c8ded6e37383 Richard Acayan      2022-11-10   271  				exit-latency-us = <1854>;
07c8ded6e37383 Richard Acayan      2022-11-10   272  				min-residency-us = <2380>;
07c8ded6e37383 Richard Acayan      2022-11-10   273  				local-timer-stop;
07c8ded6e37383 Richard Acayan      2022-11-10   274  			};
07c8ded6e37383 Richard Acayan      2022-11-10   275  		};
07c8ded6e37383 Richard Acayan      2022-11-10   276  
07c8ded6e37383 Richard Acayan      2022-11-10   277  		domain-idle-states {
07c8ded6e37383 Richard Acayan      2022-11-10   278  			CLUSTER_SLEEP_0: cluster-sleep-0 {
07c8ded6e37383 Richard Acayan      2022-11-10   279  				compatible = "domain-idle-state";
07c8ded6e37383 Richard Acayan      2022-11-10   280  				arm,psci-suspend-param = <0x4100c244>;
07c8ded6e37383 Richard Acayan      2022-11-10   281  				entry-latency-us = <3263>;
07c8ded6e37383 Richard Acayan      2022-11-10   282  				exit-latency-us = <6562>;
07c8ded6e37383 Richard Acayan      2022-11-10   283  				min-residency-us = <9825>;
07c8ded6e37383 Richard Acayan      2022-11-10   284  			};
07c8ded6e37383 Richard Acayan      2022-11-10   285  		};
07c8ded6e37383 Richard Acayan      2022-11-10   286  	};
07c8ded6e37383 Richard Acayan      2022-11-10   287  
07c8ded6e37383 Richard Acayan      2022-11-10   288  	firmware {
07c8ded6e37383 Richard Acayan      2022-11-10   289  		scm {
07c8ded6e37383 Richard Acayan      2022-11-10   290  			compatible = "qcom,scm-sdm670", "qcom,scm";
07c8ded6e37383 Richard Acayan      2022-11-10   291  		};
07c8ded6e37383 Richard Acayan      2022-11-10   292  	};
07c8ded6e37383 Richard Acayan      2022-11-10   293  
07c8ded6e37383 Richard Acayan      2022-11-10   294  	memory@80000000 {
07c8ded6e37383 Richard Acayan      2022-11-10   295  		device_type = "memory";
07c8ded6e37383 Richard Acayan      2022-11-10   296  		/* We expect the bootloader to fill in the size */
07c8ded6e37383 Richard Acayan      2022-11-10   297  		reg = <0x0 0x80000000 0x0 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10   298  	};
07c8ded6e37383 Richard Acayan      2022-11-10   299  
0c665213d12641 Richard Acayan      2023-08-01   300  	cpu0_opp_table: opp-table-cpu0 {
0c665213d12641 Richard Acayan      2023-08-01   301  		compatible = "operating-points-v2";
0c665213d12641 Richard Acayan      2023-08-01   302  		opp-shared;
0c665213d12641 Richard Acayan      2023-08-01   303  
0c665213d12641 Richard Acayan      2023-08-01   304  		cpu0_opp1: opp-300000000 {
0c665213d12641 Richard Acayan      2023-08-01   305  			opp-hz = /bits/ 64 <300000000>;
0c665213d12641 Richard Acayan      2023-08-01   306  			opp-peak-kBps = <400000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   307  		};
0c665213d12641 Richard Acayan      2023-08-01   308  
0c665213d12641 Richard Acayan      2023-08-01   309  		cpu0_opp2: opp-576000000 {
0c665213d12641 Richard Acayan      2023-08-01   310  			opp-hz = /bits/ 64 <576000000>;
0c665213d12641 Richard Acayan      2023-08-01   311  			opp-peak-kBps = <400000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   312  		};
0c665213d12641 Richard Acayan      2023-08-01   313  
0c665213d12641 Richard Acayan      2023-08-01   314  		cpu0_opp3: opp-748800000 {
0c665213d12641 Richard Acayan      2023-08-01   315  			opp-hz = /bits/ 64 <748800000>;
0c665213d12641 Richard Acayan      2023-08-01   316  			opp-peak-kBps = <1200000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   317  		};
0c665213d12641 Richard Acayan      2023-08-01   318  
0c665213d12641 Richard Acayan      2023-08-01   319  		cpu0_opp4: opp-998400000 {
0c665213d12641 Richard Acayan      2023-08-01   320  			opp-hz = /bits/ 64 <998400000>;
0c665213d12641 Richard Acayan      2023-08-01   321  			opp-peak-kBps = <1804000 8908800>;
0c665213d12641 Richard Acayan      2023-08-01   322  		};
0c665213d12641 Richard Acayan      2023-08-01   323  
0c665213d12641 Richard Acayan      2023-08-01   324  		cpu0_opp5: opp-1209600000 {
0c665213d12641 Richard Acayan      2023-08-01   325  			opp-hz = /bits/ 64 <1209600000>;
0c665213d12641 Richard Acayan      2023-08-01   326  			opp-peak-kBps = <2188000 8908800>;
0c665213d12641 Richard Acayan      2023-08-01   327  		};
0c665213d12641 Richard Acayan      2023-08-01   328  
0c665213d12641 Richard Acayan      2023-08-01   329  		cpu0_opp6: opp-1324800000 {
0c665213d12641 Richard Acayan      2023-08-01   330  			opp-hz = /bits/ 64 <1324800000>;
0c665213d12641 Richard Acayan      2023-08-01   331  			opp-peak-kBps = <2188000 13516800>;
0c665213d12641 Richard Acayan      2023-08-01   332  		};
0c665213d12641 Richard Acayan      2023-08-01   333  
0c665213d12641 Richard Acayan      2023-08-01   334  		cpu0_opp7: opp-1516800000 {
0c665213d12641 Richard Acayan      2023-08-01   335  			opp-hz = /bits/ 64 <1516800000>;
0c665213d12641 Richard Acayan      2023-08-01   336  			opp-peak-kBps = <3072000 15052800>;
0c665213d12641 Richard Acayan      2023-08-01   337  		};
0c665213d12641 Richard Acayan      2023-08-01   338  
0c665213d12641 Richard Acayan      2023-08-01   339  		cpu0_opp8: opp-1612800000 {
0c665213d12641 Richard Acayan      2023-08-01   340  			opp-hz = /bits/ 64 <1612800000>;
0c665213d12641 Richard Acayan      2023-08-01   341  			opp-peak-kBps = <3072000 22118400>;
0c665213d12641 Richard Acayan      2023-08-01   342  		};
0c665213d12641 Richard Acayan      2023-08-01   343  
0c665213d12641 Richard Acayan      2023-08-01   344  		cpu0_opp9: opp-1708800000 {
0c665213d12641 Richard Acayan      2023-08-01   345  			opp-hz = /bits/ 64 <1708800000>;
0c665213d12641 Richard Acayan      2023-08-01   346  			opp-peak-kBps = <4068000 23040000>;
0c665213d12641 Richard Acayan      2023-08-01   347  		};
0c665213d12641 Richard Acayan      2023-08-01   348  	};
0c665213d12641 Richard Acayan      2023-08-01   349  
0c665213d12641 Richard Acayan      2023-08-01   350  	cpu6_opp_table: opp-table-cpu6 {
0c665213d12641 Richard Acayan      2023-08-01   351  		compatible = "operating-points-v2";
0c665213d12641 Richard Acayan      2023-08-01   352  		opp-shared;
0c665213d12641 Richard Acayan      2023-08-01   353  
0c665213d12641 Richard Acayan      2023-08-01   354  		cpu6_opp1: opp-300000000 {
0c665213d12641 Richard Acayan      2023-08-01   355  			opp-hz = /bits/ 64 <300000000>;
0c665213d12641 Richard Acayan      2023-08-01   356  			opp-peak-kBps = <400000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   357  		};
0c665213d12641 Richard Acayan      2023-08-01   358  
0c665213d12641 Richard Acayan      2023-08-01   359  		cpu6_opp2: opp-652800000 {
0c665213d12641 Richard Acayan      2023-08-01   360  			opp-hz = /bits/ 64 <652800000>;
0c665213d12641 Richard Acayan      2023-08-01   361  			opp-peak-kBps = <400000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   362  		};
0c665213d12641 Richard Acayan      2023-08-01   363  
0c665213d12641 Richard Acayan      2023-08-01   364  		cpu6_opp3: opp-825600000 {
0c665213d12641 Richard Acayan      2023-08-01   365  			opp-hz = /bits/ 64 <825600000>;
0c665213d12641 Richard Acayan      2023-08-01   366  			opp-peak-kBps = <1200000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   367  		};
0c665213d12641 Richard Acayan      2023-08-01   368  
0c665213d12641 Richard Acayan      2023-08-01   369  		cpu6_opp4: opp-979200000 {
0c665213d12641 Richard Acayan      2023-08-01   370  			opp-hz = /bits/ 64 <979200000>;
0c665213d12641 Richard Acayan      2023-08-01   371  			opp-peak-kBps = <1200000 4800000>;
0c665213d12641 Richard Acayan      2023-08-01   372  		};
0c665213d12641 Richard Acayan      2023-08-01   373  
0c665213d12641 Richard Acayan      2023-08-01   374  		cpu6_opp5: opp-1132800000 {
0c665213d12641 Richard Acayan      2023-08-01   375  			opp-hz = /bits/ 64 <1132800000>;
0c665213d12641 Richard Acayan      2023-08-01   376  			opp-peak-kBps = <2188000 8908800>;
0c665213d12641 Richard Acayan      2023-08-01   377  		};
0c665213d12641 Richard Acayan      2023-08-01   378  
0c665213d12641 Richard Acayan      2023-08-01   379  		cpu6_opp6: opp-1363200000 {
0c665213d12641 Richard Acayan      2023-08-01   380  			opp-hz = /bits/ 64 <1363200000>;
0c665213d12641 Richard Acayan      2023-08-01   381  			opp-peak-kBps = <4068000 12902400>;
0c665213d12641 Richard Acayan      2023-08-01   382  		};
0c665213d12641 Richard Acayan      2023-08-01   383  
0c665213d12641 Richard Acayan      2023-08-01   384  		cpu6_opp7: opp-1536000000 {
0c665213d12641 Richard Acayan      2023-08-01   385  			opp-hz = /bits/ 64 <1536000000>;
0c665213d12641 Richard Acayan      2023-08-01   386  			opp-peak-kBps = <4068000 12902400>;
0c665213d12641 Richard Acayan      2023-08-01   387  		};
0c665213d12641 Richard Acayan      2023-08-01   388  
0c665213d12641 Richard Acayan      2023-08-01   389  		cpu6_opp8: opp-1747200000 {
0c665213d12641 Richard Acayan      2023-08-01   390  			opp-hz = /bits/ 64 <1747200000>;
0c665213d12641 Richard Acayan      2023-08-01   391  			opp-peak-kBps = <4068000 15052800>;
0c665213d12641 Richard Acayan      2023-08-01   392  		};
0c665213d12641 Richard Acayan      2023-08-01   393  
0c665213d12641 Richard Acayan      2023-08-01   394  		cpu6_opp9: opp-1843200000 {
0c665213d12641 Richard Acayan      2023-08-01   395  			opp-hz = /bits/ 64 <1843200000>;
0c665213d12641 Richard Acayan      2023-08-01   396  			opp-peak-kBps = <4068000 15052800>;
0c665213d12641 Richard Acayan      2023-08-01   397  		};
0c665213d12641 Richard Acayan      2023-08-01   398  
0c665213d12641 Richard Acayan      2023-08-01   399  		cpu6_opp10: opp-1996800000 {
0c665213d12641 Richard Acayan      2023-08-01   400  			opp-hz = /bits/ 64 <1996800000>;
0c665213d12641 Richard Acayan      2023-08-01   401  			opp-peak-kBps = <6220000 19046400>;
0c665213d12641 Richard Acayan      2023-08-01   402  		};
0c665213d12641 Richard Acayan      2023-08-01   403  	};
0c665213d12641 Richard Acayan      2023-08-01   404  
5f8ba4f28ddb43 Richard Acayan      2023-10-16   405  	dsi_opp_table: opp-table-dsi {
5f8ba4f28ddb43 Richard Acayan      2023-10-16   406  		compatible = "operating-points-v2";
5f8ba4f28ddb43 Richard Acayan      2023-10-16   407  
5f8ba4f28ddb43 Richard Acayan      2023-10-16   408  		opp-19200000 {
5f8ba4f28ddb43 Richard Acayan      2023-10-16   409  			opp-hz = /bits/ 64 <19200000>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   410  			required-opps = <&rpmhpd_opp_min_svs>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   411  		};
5f8ba4f28ddb43 Richard Acayan      2023-10-16   412  
5f8ba4f28ddb43 Richard Acayan      2023-10-16   413  		opp-180000000 {
5f8ba4f28ddb43 Richard Acayan      2023-10-16   414  			opp-hz = /bits/ 64 <180000000>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   415  			required-opps = <&rpmhpd_opp_low_svs>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   416  		};
5f8ba4f28ddb43 Richard Acayan      2023-10-16   417  
5f8ba4f28ddb43 Richard Acayan      2023-10-16   418  		opp-275000000 {
5f8ba4f28ddb43 Richard Acayan      2023-10-16   419  			opp-hz = /bits/ 64 <275000000>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   420  			required-opps = <&rpmhpd_opp_svs>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   421  		};
5f8ba4f28ddb43 Richard Acayan      2023-10-16   422  
5f8ba4f28ddb43 Richard Acayan      2023-10-16   423  		opp-358000000 {
5f8ba4f28ddb43 Richard Acayan      2023-10-16   424  			opp-hz = /bits/ 64 <358000000>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   425  			required-opps = <&rpmhpd_opp_svs_l1>;
5f8ba4f28ddb43 Richard Acayan      2023-10-16   426  		};
5f8ba4f28ddb43 Richard Acayan      2023-10-16   427  	};
5f8ba4f28ddb43 Richard Acayan      2023-10-16   428  
07c8ded6e37383 Richard Acayan      2022-11-10   429  	psci {
07c8ded6e37383 Richard Acayan      2022-11-10   430  		compatible = "arm,psci-1.0";
07c8ded6e37383 Richard Acayan      2022-11-10   431  		method = "smc";
07c8ded6e37383 Richard Acayan      2022-11-10   432  
07c8ded6e37383 Richard Acayan      2022-11-10   433  		CPU_PD0: power-domain-cpu0 {
07c8ded6e37383 Richard Acayan      2022-11-10   434  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   435  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   436  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   437  		};
07c8ded6e37383 Richard Acayan      2022-11-10   438  
07c8ded6e37383 Richard Acayan      2022-11-10   439  		CPU_PD1: power-domain-cpu1 {
07c8ded6e37383 Richard Acayan      2022-11-10   440  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   441  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   442  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   443  		};
07c8ded6e37383 Richard Acayan      2022-11-10   444  
07c8ded6e37383 Richard Acayan      2022-11-10   445  		CPU_PD2: power-domain-cpu2 {
07c8ded6e37383 Richard Acayan      2022-11-10   446  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   447  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   448  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   449  		};
07c8ded6e37383 Richard Acayan      2022-11-10   450  
07c8ded6e37383 Richard Acayan      2022-11-10   451  		CPU_PD3: power-domain-cpu3 {
07c8ded6e37383 Richard Acayan      2022-11-10   452  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   453  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   454  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   455  		};
07c8ded6e37383 Richard Acayan      2022-11-10   456  
07c8ded6e37383 Richard Acayan      2022-11-10   457  		CPU_PD4: power-domain-cpu4 {
07c8ded6e37383 Richard Acayan      2022-11-10   458  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   459  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   460  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   461  		};
07c8ded6e37383 Richard Acayan      2022-11-10   462  
07c8ded6e37383 Richard Acayan      2022-11-10   463  		CPU_PD5: power-domain-cpu5 {
07c8ded6e37383 Richard Acayan      2022-11-10   464  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   465  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   466  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   467  		};
07c8ded6e37383 Richard Acayan      2022-11-10   468  
07c8ded6e37383 Richard Acayan      2022-11-10   469  		CPU_PD6: power-domain-cpu6 {
07c8ded6e37383 Richard Acayan      2022-11-10   470  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   471  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   472  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   473  		};
07c8ded6e37383 Richard Acayan      2022-11-10   474  
07c8ded6e37383 Richard Acayan      2022-11-10   475  		CPU_PD7: power-domain-cpu7 {
07c8ded6e37383 Richard Acayan      2022-11-10   476  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   477  			power-domains = <&CLUSTER_PD>;
07c8ded6e37383 Richard Acayan      2022-11-10   478  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   479  		};
07c8ded6e37383 Richard Acayan      2022-11-10   480  
07c8ded6e37383 Richard Acayan      2022-11-10   481  		CLUSTER_PD: power-domain-cluster {
07c8ded6e37383 Richard Acayan      2022-11-10   482  			#power-domain-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   483  			domain-idle-states = <&CLUSTER_SLEEP_0>;
07c8ded6e37383 Richard Acayan      2022-11-10   484  		};
07c8ded6e37383 Richard Acayan      2022-11-10   485  	};
07c8ded6e37383 Richard Acayan      2022-11-10   486  
07c8ded6e37383 Richard Acayan      2022-11-10   487  	reserved-memory {
07c8ded6e37383 Richard Acayan      2022-11-10   488  		#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   489  		#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   490  		ranges;
07c8ded6e37383 Richard Acayan      2022-11-10   491  
07c8ded6e37383 Richard Acayan      2022-11-10   492  		hyp_mem: hyp-mem@85700000 {
07c8ded6e37383 Richard Acayan      2022-11-10   493  			reg = <0 0x85700000 0 0x600000>;
07c8ded6e37383 Richard Acayan      2022-11-10   494  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   495  		};
07c8ded6e37383 Richard Acayan      2022-11-10   496  
07c8ded6e37383 Richard Acayan      2022-11-10   497  		xbl_mem: xbl-mem@85e00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   498  			reg = <0 0x85e00000 0 0x100000>;
07c8ded6e37383 Richard Acayan      2022-11-10   499  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   500  		};
07c8ded6e37383 Richard Acayan      2022-11-10   501  
07c8ded6e37383 Richard Acayan      2022-11-10   502  		aop_mem: aop-mem@85fc0000 {
07c8ded6e37383 Richard Acayan      2022-11-10   503  			reg = <0 0x85fc0000 0 0x20000>;
07c8ded6e37383 Richard Acayan      2022-11-10   504  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   505  		};
07c8ded6e37383 Richard Acayan      2022-11-10   506  
07c8ded6e37383 Richard Acayan      2022-11-10   507  		aop_cmd_db_mem: aop-cmd-db-mem@85fe0000 {
07c8ded6e37383 Richard Acayan      2022-11-10   508  			compatible = "qcom,cmd-db";
07c8ded6e37383 Richard Acayan      2022-11-10   509  			reg = <0 0x85fe0000 0 0x20000>;
07c8ded6e37383 Richard Acayan      2022-11-10   510  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   511  		};
07c8ded6e37383 Richard Acayan      2022-11-10   512  
265d9989df5012 Richard Acayan      2024-05-23   513  		smem@86000000 {
265d9989df5012 Richard Acayan      2024-05-23   514  			compatible = "qcom,smem";
265d9989df5012 Richard Acayan      2024-05-23   515  			reg = <0 0x86000000 0 0x200000>;
265d9989df5012 Richard Acayan      2024-05-23   516  			no-map;
265d9989df5012 Richard Acayan      2024-05-23   517  			hwlocks = <&tcsr_mutex 3>;
265d9989df5012 Richard Acayan      2024-05-23   518  		};
265d9989df5012 Richard Acayan      2024-05-23   519  
265d9989df5012 Richard Acayan      2024-05-23   520  		tz_mem: tz@86200000 {
265d9989df5012 Richard Acayan      2024-05-23   521  			reg = <0 0x86200000 0 0x2d00000>;
265d9989df5012 Richard Acayan      2024-05-23   522  			no-map;
265d9989df5012 Richard Acayan      2024-05-23   523  		};
265d9989df5012 Richard Acayan      2024-05-23   524  
07c8ded6e37383 Richard Acayan      2022-11-10   525  		camera_mem: camera-mem@8ab00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   526  			reg = <0 0x8ab00000 0 0x500000>;
07c8ded6e37383 Richard Acayan      2022-11-10   527  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   528  		};
07c8ded6e37383 Richard Acayan      2022-11-10   529  
07c8ded6e37383 Richard Acayan      2022-11-10   530  		mpss_region: mpss@8b000000 {
07c8ded6e37383 Richard Acayan      2022-11-10   531  			reg = <0 0x8b000000 0 0x7e00000>;
07c8ded6e37383 Richard Acayan      2022-11-10   532  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   533  		};
07c8ded6e37383 Richard Acayan      2022-11-10   534  
07c8ded6e37383 Richard Acayan      2022-11-10   535  		venus_mem: venus@92e00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   536  			reg = <0 0x92e00000 0 0x500000>;
07c8ded6e37383 Richard Acayan      2022-11-10   537  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   538  		};
07c8ded6e37383 Richard Acayan      2022-11-10   539  
07c8ded6e37383 Richard Acayan      2022-11-10   540  		wlan_msa_mem: wlan-msa@93300000 {
07c8ded6e37383 Richard Acayan      2022-11-10   541  			reg = <0 0x93300000 0 0x100000>;
07c8ded6e37383 Richard Acayan      2022-11-10   542  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   543  		};
07c8ded6e37383 Richard Acayan      2022-11-10   544  
07c8ded6e37383 Richard Acayan      2022-11-10   545  		cdsp_mem: cdsp@93400000 {
07c8ded6e37383 Richard Acayan      2022-11-10   546  			reg = <0 0x93400000 0 0x800000>;
07c8ded6e37383 Richard Acayan      2022-11-10   547  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   548  		};
07c8ded6e37383 Richard Acayan      2022-11-10   549  
07c8ded6e37383 Richard Acayan      2022-11-10   550  		mba_region: mba@93c00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   551  			reg = <0 0x93c00000 0 0x200000>;
07c8ded6e37383 Richard Acayan      2022-11-10   552  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   553  		};
07c8ded6e37383 Richard Acayan      2022-11-10   554  
07c8ded6e37383 Richard Acayan      2022-11-10   555  		adsp_mem: adsp@93e00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   556  			reg = <0 0x93e00000 0 0x1e00000>;
07c8ded6e37383 Richard Acayan      2022-11-10   557  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   558  		};
07c8ded6e37383 Richard Acayan      2022-11-10   559  
07c8ded6e37383 Richard Acayan      2022-11-10   560  		ipa_fw_mem: ipa-fw@95c00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   561  			reg = <0 0x95c00000 0 0x10000>;
07c8ded6e37383 Richard Acayan      2022-11-10   562  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   563  		};
07c8ded6e37383 Richard Acayan      2022-11-10   564  
07c8ded6e37383 Richard Acayan      2022-11-10   565  		ipa_gsi_mem: ipa-gsi@95c10000 {
07c8ded6e37383 Richard Acayan      2022-11-10   566  			reg = <0 0x95c10000 0 0x5000>;
07c8ded6e37383 Richard Acayan      2022-11-10   567  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   568  		};
07c8ded6e37383 Richard Acayan      2022-11-10   569  
07c8ded6e37383 Richard Acayan      2022-11-10   570  		gpu_mem: gpu@95c15000 {
07c8ded6e37383 Richard Acayan      2022-11-10   571  			reg = <0 0x95c15000 0 0x2000>;
07c8ded6e37383 Richard Acayan      2022-11-10   572  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   573  		};
07c8ded6e37383 Richard Acayan      2022-11-10   574  
07c8ded6e37383 Richard Acayan      2022-11-10   575  		spss_mem: spss@97b00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   576  			reg = <0 0x97b00000 0 0x100000>;
07c8ded6e37383 Richard Acayan      2022-11-10   577  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   578  		};
07c8ded6e37383 Richard Acayan      2022-11-10   579  
07c8ded6e37383 Richard Acayan      2022-11-10   580  		qseecom_mem: qseecom@9e400000 {
07c8ded6e37383 Richard Acayan      2022-11-10   581  			reg = <0 0x9e400000 0 0x1400000>;
07c8ded6e37383 Richard Acayan      2022-11-10   582  			no-map;
07c8ded6e37383 Richard Acayan      2022-11-10   583  		};
07c8ded6e37383 Richard Acayan      2022-11-10   584  	};
07c8ded6e37383 Richard Acayan      2022-11-10   585  
07c8ded6e37383 Richard Acayan      2022-11-10   586  	timer {
07c8ded6e37383 Richard Acayan      2022-11-10   587  		compatible = "arm,armv8-timer";
07c8ded6e37383 Richard Acayan      2022-11-10   588  		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
07c8ded6e37383 Richard Acayan      2022-11-10   589  			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
07c8ded6e37383 Richard Acayan      2022-11-10   590  			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
07c8ded6e37383 Richard Acayan      2022-11-10   591  			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
07c8ded6e37383 Richard Acayan      2022-11-10   592  	};
07c8ded6e37383 Richard Acayan      2022-11-10   593  
07c8ded6e37383 Richard Acayan      2022-11-10   594  	soc: soc@0 {
07c8ded6e37383 Richard Acayan      2022-11-10   595  		#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   596  		#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   597  		ranges = <0 0 0 0 0x10 0>;
07c8ded6e37383 Richard Acayan      2022-11-10   598  		dma-ranges = <0 0 0 0 0x10 0>;
07c8ded6e37383 Richard Acayan      2022-11-10   599  		compatible = "simple-bus";
07c8ded6e37383 Richard Acayan      2022-11-10   600  
07c8ded6e37383 Richard Acayan      2022-11-10   601  		gcc: clock-controller@100000 {
07c8ded6e37383 Richard Acayan      2022-11-10   602  			compatible = "qcom,gcc-sdm670";
07c8ded6e37383 Richard Acayan      2022-11-10   603  			reg = <0 0x00100000 0 0x1f0000>;
07c8ded6e37383 Richard Acayan      2022-11-10   604  			clocks = <&rpmhcc RPMH_CXO_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   605  				 <&rpmhcc RPMH_CXO_CLK_A>,
07c8ded6e37383 Richard Acayan      2022-11-10   606  				 <&sleep_clk>;
07c8ded6e37383 Richard Acayan      2022-11-10   607  			clock-names = "bi_tcxo",
07c8ded6e37383 Richard Acayan      2022-11-10   608  				      "bi_tcxo_ao",
07c8ded6e37383 Richard Acayan      2022-11-10   609  				      "sleep_clk";
07c8ded6e37383 Richard Acayan      2022-11-10   610  			#clock-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   611  			#reset-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   612  			#power-domain-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   613  		};
07c8ded6e37383 Richard Acayan      2022-11-10   614  
7bff6f4351bf82 Richard Acayan      2022-12-06   615  		qfprom: qfprom@784000 {
7bff6f4351bf82 Richard Acayan      2022-12-06   616  			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
7bff6f4351bf82 Richard Acayan      2022-12-06   617  			reg = <0 0x00784000 0 0x1000>;
7bff6f4351bf82 Richard Acayan      2022-12-06   618  			#address-cells = <1>;
7bff6f4351bf82 Richard Acayan      2022-12-06   619  			#size-cells = <1>;
cb98187a6883c4 Richard Acayan      2022-12-06   620  
cb98187a6883c4 Richard Acayan      2022-12-06   621  			qusb2_hstx_trim: hstx-trim@1eb {
cb98187a6883c4 Richard Acayan      2022-12-06   622  				reg = <0x1eb 0x1>;
cb98187a6883c4 Richard Acayan      2022-12-06   623  				bits = <1 4>;
cb98187a6883c4 Richard Acayan      2022-12-06   624  			};
7bff6f4351bf82 Richard Acayan      2022-12-06   625  		};
7bff6f4351bf82 Richard Acayan      2022-12-06   626  
07c8ded6e37383 Richard Acayan      2022-11-10   627  		sdhc_1: mmc@7c4000 {
07c8ded6e37383 Richard Acayan      2022-11-10   628  			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
07c8ded6e37383 Richard Acayan      2022-11-10   629  			reg = <0 0x007c4000 0 0x1000>,
07c8ded6e37383 Richard Acayan      2022-11-10   630  			      <0 0x007c5000 0 0x1000>,
07c8ded6e37383 Richard Acayan      2022-11-10   631  			      <0 0x007c8000 0 0x8000>;
07c8ded6e37383 Richard Acayan      2022-11-10   632  			reg-names = "hc", "cqhci", "ice";
07c8ded6e37383 Richard Acayan      2022-11-10   633  
07c8ded6e37383 Richard Acayan      2022-11-10   634  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   635  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   636  			interrupt-names = "hc_irq", "pwr_irq";
07c8ded6e37383 Richard Acayan      2022-11-10   637  
07c8ded6e37383 Richard Acayan      2022-11-10   638  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   639  				 <&gcc GCC_SDCC1_APPS_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   640  				 <&rpmhcc RPMH_CXO_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   641  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   642  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   643  			clock-names = "iface", "core", "xo", "ice", "bus";
17289c0165bdb6 Richard Acayan      2023-01-31   644  			interconnects = <&aggre1_noc MASTER_EMMC 0 &aggre1_noc SLAVE_A1NOC_SNOC 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   645  					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_EMMC_CFG 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   646  			interconnect-names = "sdhc-ddr", "cpu-sdhc";
17289c0165bdb6 Richard Acayan      2023-01-31   647  			operating-points-v2 = <&sdhc1_opp_table>;
07c8ded6e37383 Richard Acayan      2022-11-10   648  
07c8ded6e37383 Richard Acayan      2022-11-10   649  			iommus = <&apps_smmu 0x140 0xf>;
07c8ded6e37383 Richard Acayan      2022-11-10   650  
07c8ded6e37383 Richard Acayan      2022-11-10   651  			pinctrl-names = "default", "sleep";
07c8ded6e37383 Richard Acayan      2022-11-10   652  			pinctrl-0 = <&sdc1_state_on>;
07c8ded6e37383 Richard Acayan      2022-11-10   653  			pinctrl-1 = <&sdc1_state_off>;
07c8ded6e37383 Richard Acayan      2022-11-10   654  			power-domains = <&rpmhpd SDM670_CX>;
07c8ded6e37383 Richard Acayan      2022-11-10   655  
07c8ded6e37383 Richard Acayan      2022-11-10   656  			bus-width = <8>;
07c8ded6e37383 Richard Acayan      2022-11-10   657  			non-removable;
07c8ded6e37383 Richard Acayan      2022-11-10   658  
07c8ded6e37383 Richard Acayan      2022-11-10   659  			status = "disabled";
17289c0165bdb6 Richard Acayan      2023-01-31   660  
17289c0165bdb6 Richard Acayan      2023-01-31   661  			sdhc1_opp_table: opp-table {
17289c0165bdb6 Richard Acayan      2023-01-31   662  				compatible = "operating-points-v2";
17289c0165bdb6 Richard Acayan      2023-01-31   663  
17289c0165bdb6 Richard Acayan      2023-01-31   664  				opp-20000000 {
17289c0165bdb6 Richard Acayan      2023-01-31   665  					opp-hz = /bits/ 64 <20000000>;
17289c0165bdb6 Richard Acayan      2023-01-31   666  					required-opps = <&rpmhpd_opp_min_svs>;
17289c0165bdb6 Richard Acayan      2023-01-31   667  					opp-peak-kBps = <80000 80000>;
17289c0165bdb6 Richard Acayan      2023-01-31   668  					opp-avg-kBps = <52286 80000>;
17289c0165bdb6 Richard Acayan      2023-01-31   669  				};
17289c0165bdb6 Richard Acayan      2023-01-31   670  
17289c0165bdb6 Richard Acayan      2023-01-31   671  				opp-50000000 {
17289c0165bdb6 Richard Acayan      2023-01-31   672  					opp-hz = /bits/ 64 <50000000>;
17289c0165bdb6 Richard Acayan      2023-01-31   673  					required-opps = <&rpmhpd_opp_low_svs>;
17289c0165bdb6 Richard Acayan      2023-01-31   674  					opp-peak-kBps = <200000 100000>;
17289c0165bdb6 Richard Acayan      2023-01-31   675  					opp-avg-kBps = <130718 100000>;
17289c0165bdb6 Richard Acayan      2023-01-31   676  				};
17289c0165bdb6 Richard Acayan      2023-01-31   677  
17289c0165bdb6 Richard Acayan      2023-01-31   678  				opp-100000000 {
17289c0165bdb6 Richard Acayan      2023-01-31   679  					opp-hz = /bits/ 64 <100000000>;
17289c0165bdb6 Richard Acayan      2023-01-31   680  					required-opps = <&rpmhpd_opp_svs>;
17289c0165bdb6 Richard Acayan      2023-01-31   681  					opp-peak-kBps = <200000 130000>;
17289c0165bdb6 Richard Acayan      2023-01-31   682  					opp-avg-kBps = <130718 130000>;
17289c0165bdb6 Richard Acayan      2023-01-31   683  				};
17289c0165bdb6 Richard Acayan      2023-01-31   684  
17289c0165bdb6 Richard Acayan      2023-01-31   685  				opp-384000000 {
17289c0165bdb6 Richard Acayan      2023-01-31   686  					opp-hz = /bits/ 64 <384000000>;
17289c0165bdb6 Richard Acayan      2023-01-31   687  					required-opps = <&rpmhpd_opp_nom>;
17289c0165bdb6 Richard Acayan      2023-01-31   688  					opp-peak-kBps = <4096000 4096000>;
17289c0165bdb6 Richard Acayan      2023-01-31   689  					opp-avg-kBps = <1338562 1338562>;
17289c0165bdb6 Richard Acayan      2023-01-31   690  				};
17289c0165bdb6 Richard Acayan      2023-01-31   691  			};
07c8ded6e37383 Richard Acayan      2022-11-10   692  		};
07c8ded6e37383 Richard Acayan      2022-11-10   693  
07c8ded6e37383 Richard Acayan      2022-11-10   694  		gpi_dma0: dma-controller@800000 {
07c8ded6e37383 Richard Acayan      2022-11-10   695  			#dma-cells = <3>;
07c8ded6e37383 Richard Acayan      2022-11-10   696  			compatible = "qcom,sdm670-gpi-dma", "qcom,sdm845-gpi-dma";
07c8ded6e37383 Richard Acayan      2022-11-10   697  			reg = <0 0x00800000 0 0x60000>;
07c8ded6e37383 Richard Acayan      2022-11-10   698  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   699  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   700  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   701  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   702  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   703  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   704  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   705  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   706  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   707  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   708  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   709  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   710  				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   711  			dma-channels = <13>;
07c8ded6e37383 Richard Acayan      2022-11-10   712  			dma-channel-mask = <0xfa>;
07c8ded6e37383 Richard Acayan      2022-11-10   713  			iommus = <&apps_smmu 0x16 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10   714  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   715  		};
07c8ded6e37383 Richard Acayan      2022-11-10   716  
07c8ded6e37383 Richard Acayan      2022-11-10   717  		qupv3_id_0: geniqup@8c0000 {
07c8ded6e37383 Richard Acayan      2022-11-10   718  			compatible = "qcom,geni-se-qup";
07c8ded6e37383 Richard Acayan      2022-11-10   719  			reg = <0 0x008c0000 0 0x6000>;
07c8ded6e37383 Richard Acayan      2022-11-10   720  			clock-names = "m-ahb", "s-ahb";
07c8ded6e37383 Richard Acayan      2022-11-10   721  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   722  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   723  			iommus = <&apps_smmu 0x3 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10   724  			#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   725  			#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   726  			ranges;
17289c0165bdb6 Richard Acayan      2023-01-31   727  			interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   728  			interconnect-names = "qup-core";
07c8ded6e37383 Richard Acayan      2022-11-10   729  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   730  
07c8ded6e37383 Richard Acayan      2022-11-10   731  			i2c0: i2c@880000 {
07c8ded6e37383 Richard Acayan      2022-11-10   732  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   733  				reg = <0 0x00880000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   734  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   735  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   736  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   737  				pinctrl-0 = <&qup_i2c0_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   738  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   739  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   740  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   741  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   742  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   743  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   744  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   745  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   746  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   747  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   748  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   749  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   750  			};
07c8ded6e37383 Richard Acayan      2022-11-10   751  
07c8ded6e37383 Richard Acayan      2022-11-10   752  			i2c1: i2c@884000 {
07c8ded6e37383 Richard Acayan      2022-11-10   753  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   754  				reg = <0 0x00884000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   755  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   756  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   757  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   758  				pinctrl-0 = <&qup_i2c1_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   759  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   760  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   761  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   762  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   763  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   764  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   765  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   766  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   767  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   768  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   769  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   770  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   771  			};
07c8ded6e37383 Richard Acayan      2022-11-10   772  
07c8ded6e37383 Richard Acayan      2022-11-10   773  			i2c2: i2c@888000 {
07c8ded6e37383 Richard Acayan      2022-11-10   774  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   775  				reg = <0 0x00888000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   776  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   777  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   778  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   779  				pinctrl-0 = <&qup_i2c2_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   780  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   781  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   782  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   783  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   784  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   785  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   786  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   787  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   788  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   789  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   790  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   791  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   792  			};
07c8ded6e37383 Richard Acayan      2022-11-10   793  
07c8ded6e37383 Richard Acayan      2022-11-10   794  			i2c3: i2c@88c000 {
07c8ded6e37383 Richard Acayan      2022-11-10   795  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   796  				reg = <0 0x0088c000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   797  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   798  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   799  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   800  				pinctrl-0 = <&qup_i2c3_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   801  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   802  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   803  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   804  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   805  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   806  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   807  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   808  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   809  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   810  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   811  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   812  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   813  			};
07c8ded6e37383 Richard Acayan      2022-11-10   814  
07c8ded6e37383 Richard Acayan      2022-11-10   815  			i2c4: i2c@890000 {
07c8ded6e37383 Richard Acayan      2022-11-10   816  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   817  				reg = <0 0x00890000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   818  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   819  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   820  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   821  				pinctrl-0 = <&qup_i2c4_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   822  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   823  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   824  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   825  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   826  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   827  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   828  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   829  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   830  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   831  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   832  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   833  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   834  			};
07c8ded6e37383 Richard Acayan      2022-11-10   835  
07c8ded6e37383 Richard Acayan      2022-11-10   836  			i2c5: i2c@894000 {
07c8ded6e37383 Richard Acayan      2022-11-10   837  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   838  				reg = <0 0x00894000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   839  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   840  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   841  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   842  				pinctrl-0 = <&qup_i2c5_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   843  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   844  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   845  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   846  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   847  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   848  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   849  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   850  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   851  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   852  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   853  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   854  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   855  			};
07c8ded6e37383 Richard Acayan      2022-11-10   856  
07c8ded6e37383 Richard Acayan      2022-11-10   857  			i2c6: i2c@898000 {
07c8ded6e37383 Richard Acayan      2022-11-10   858  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   859  				reg = <0 0x00898000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   860  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   861  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   862  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   863  				pinctrl-0 = <&qup_i2c6_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   864  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   865  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   866  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   867  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   868  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   869  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   870  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   871  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   872  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   873  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   874  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   875  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   876  			};
07c8ded6e37383 Richard Acayan      2022-11-10   877  
07c8ded6e37383 Richard Acayan      2022-11-10   878  			i2c7: i2c@89c000 {
07c8ded6e37383 Richard Acayan      2022-11-10   879  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   880  				reg = <0 0x0089c000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   881  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   882  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   883  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   884  				pinctrl-0 = <&qup_i2c7_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   885  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   886  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   887  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   888  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   889  				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   890  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   891  						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   892  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   893  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   894  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   895  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   896  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   897  			};
07c8ded6e37383 Richard Acayan      2022-11-10   898  		};
07c8ded6e37383 Richard Acayan      2022-11-10   899  
07c8ded6e37383 Richard Acayan      2022-11-10   900  		gpi_dma1: dma-controller@a00000 {
07c8ded6e37383 Richard Acayan      2022-11-10   901  			#dma-cells = <3>;
07c8ded6e37383 Richard Acayan      2022-11-10   902  			compatible = "qcom,sdm670-gpi-dma", "qcom,sdm845-gpi-dma";
07c8ded6e37383 Richard Acayan      2022-11-10   903  			reg = <0 0x00a00000 0 0x60000>;
07c8ded6e37383 Richard Acayan      2022-11-10   904  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   905  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   906  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   907  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   908  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   909  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   910  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   911  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   912  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   913  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   914  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   915  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
07c8ded6e37383 Richard Acayan      2022-11-10   916  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   917  			dma-channels = <13>;
07c8ded6e37383 Richard Acayan      2022-11-10   918  			dma-channel-mask = <0xfa>;
07c8ded6e37383 Richard Acayan      2022-11-10   919  			iommus = <&apps_smmu 0x6d6 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10   920  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   921  		};
07c8ded6e37383 Richard Acayan      2022-11-10   922  
07c8ded6e37383 Richard Acayan      2022-11-10   923  		qupv3_id_1: geniqup@ac0000 {
07c8ded6e37383 Richard Acayan      2022-11-10   924  			compatible = "qcom,geni-se-qup";
07c8ded6e37383 Richard Acayan      2022-11-10   925  			reg = <0 0x00ac0000 0 0x6000>;
07c8ded6e37383 Richard Acayan      2022-11-10   926  			clock-names = "m-ahb", "s-ahb";
07c8ded6e37383 Richard Acayan      2022-11-10   927  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10   928  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   929  			iommus = <&apps_smmu 0x6c3 0x0>;
07c8ded6e37383 Richard Acayan      2022-11-10   930  			#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   931  			#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10   932  			ranges;
17289c0165bdb6 Richard Acayan      2023-01-31   933  			interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   934  			interconnect-names = "qup-core";
07c8ded6e37383 Richard Acayan      2022-11-10   935  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   936  
07c8ded6e37383 Richard Acayan      2022-11-10   937  			i2c8: i2c@a80000 {
07c8ded6e37383 Richard Acayan      2022-11-10   938  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   939  				reg = <0 0x00a80000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   940  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   941  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   942  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   943  				pinctrl-0 = <&qup_i2c8_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   944  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   945  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   946  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   947  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   948  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   949  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   950  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   951  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   952  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   953  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   954  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   955  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   956  			};
07c8ded6e37383 Richard Acayan      2022-11-10   957  
07c8ded6e37383 Richard Acayan      2022-11-10   958  			i2c9: i2c@a84000 {
07c8ded6e37383 Richard Acayan      2022-11-10   959  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   960  				reg = <0 0x00a84000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   961  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   962  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   963  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   964  				pinctrl-0 = <&qup_i2c9_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   965  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   966  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   967  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   968  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   969  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   970  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   971  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   972  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   973  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   974  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   975  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   976  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   977  			};
07c8ded6e37383 Richard Acayan      2022-11-10   978  
07c8ded6e37383 Richard Acayan      2022-11-10   979  			i2c10: i2c@a88000 {
07c8ded6e37383 Richard Acayan      2022-11-10   980  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10   981  				reg = <0 0x00a88000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10   982  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10   983  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10   984  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10   985  				pinctrl-0 = <&qup_i2c10_default>;
07c8ded6e37383 Richard Acayan      2022-11-10   986  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10   987  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10   988  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10   989  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31   990  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   991  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31   992  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31   993  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10   994  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10   995  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10   996  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10   997  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10   998  			};
07c8ded6e37383 Richard Acayan      2022-11-10   999  
07c8ded6e37383 Richard Acayan      2022-11-10  1000  			i2c11: i2c@a8c000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1001  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10  1002  				reg = <0 0x00a8c000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1003  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10  1004  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1005  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10  1006  				pinctrl-0 = <&qup_i2c11_default>;
07c8ded6e37383 Richard Acayan      2022-11-10  1007  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1008  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10  1009  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1010  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31  1011  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1012  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1013  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1014  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10  1015  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10  1016  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10  1017  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10  1018  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1019  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1020  
07c8ded6e37383 Richard Acayan      2022-11-10  1021  			i2c12: i2c@a90000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1022  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10  1023  				reg = <0 0x00a90000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1024  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10  1025  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1026  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10  1027  				pinctrl-0 = <&qup_i2c12_default>;
07c8ded6e37383 Richard Acayan      2022-11-10  1028  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1029  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10  1030  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1031  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31  1032  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1033  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1034  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1035  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10  1036  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10  1037  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10  1038  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10  1039  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1040  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1041  
07c8ded6e37383 Richard Acayan      2022-11-10  1042  			i2c13: i2c@a94000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1043  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10  1044  				reg = <0 0x00a94000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1045  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10  1046  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1047  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10  1048  				pinctrl-0 = <&qup_i2c13_default>;
07c8ded6e37383 Richard Acayan      2022-11-10  1049  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1050  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10  1051  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1052  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31  1053  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1054  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1055  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1056  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10  1057  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10  1058  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10  1059  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10  1060  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1061  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1062  
07c8ded6e37383 Richard Acayan      2022-11-10  1063  			i2c14: i2c@a98000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1064  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10  1065  				reg = <0 0x00a98000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1066  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10  1067  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1068  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10  1069  				pinctrl-0 = <&qup_i2c14_default>;
07c8ded6e37383 Richard Acayan      2022-11-10  1070  				interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1071  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10  1072  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1073  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31  1074  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1075  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1076  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1077  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10  1078  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10  1079  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10  1080  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10  1081  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1082  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1083  
07c8ded6e37383 Richard Acayan      2022-11-10  1084  			i2c15: i2c@a9c000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1085  				compatible = "qcom,geni-i2c";
07c8ded6e37383 Richard Acayan      2022-11-10  1086  				reg = <0 0x00a9c000 0 0x4000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1087  				clock-names = "se";
07c8ded6e37383 Richard Acayan      2022-11-10  1088  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1089  				pinctrl-names = "default";
07c8ded6e37383 Richard Acayan      2022-11-10  1090  				pinctrl-0 = <&qup_i2c15_default>;
07c8ded6e37383 Richard Acayan      2022-11-10  1091  				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1092  				#address-cells = <1>;
07c8ded6e37383 Richard Acayan      2022-11-10  1093  				#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1094  				power-domains = <&rpmhpd SDM670_CX>;
17289c0165bdb6 Richard Acayan      2023-01-31  1095  				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1096  						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1097  						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1098  				interconnect-names = "qup-core", "qup-config", "qup-memory";
07c8ded6e37383 Richard Acayan      2022-11-10  1099  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
07c8ded6e37383 Richard Acayan      2022-11-10  1100  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
07c8ded6e37383 Richard Acayan      2022-11-10  1101  				dma-names = "tx", "rx";
07c8ded6e37383 Richard Acayan      2022-11-10  1102  				status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1103  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1104  		};
07c8ded6e37383 Richard Acayan      2022-11-10  1105  
0daef104e4b1d9 Richard Acayan      2023-01-31  1106  		mem_noc: interconnect@1380000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1107  			compatible = "qcom,sdm670-mem-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1108  			reg = <0 0x01380000 0 0x27200>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1109  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1110  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1111  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1112  
0daef104e4b1d9 Richard Acayan      2023-01-31  1113  		dc_noc: interconnect@14e0000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1114  			compatible = "qcom,sdm670-dc-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1115  			reg = <0 0x014e0000 0 0x400>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1116  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1117  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1118  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1119  
0daef104e4b1d9 Richard Acayan      2023-01-31  1120  		config_noc: interconnect@1500000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1121  			compatible = "qcom,sdm670-config-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1122  			reg = <0 0x01500000 0 0x5080>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1123  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1124  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1125  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1126  
0daef104e4b1d9 Richard Acayan      2023-01-31  1127  		system_noc: interconnect@1620000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1128  			compatible = "qcom,sdm670-system-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1129  			reg = <0 0x01620000 0 0x18080>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1130  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1131  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1132  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1133  
0daef104e4b1d9 Richard Acayan      2023-01-31  1134  		aggre1_noc: interconnect@16e0000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1135  			compatible = "qcom,sdm670-aggre1-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1136  			reg = <0 0x016e0000 0 0x15080>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1137  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1138  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1139  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1140  
0daef104e4b1d9 Richard Acayan      2023-01-31  1141  		aggre2_noc: interconnect@1700000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1142  			compatible = "qcom,sdm670-aggre2-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1143  			reg = <0 0x01700000 0 0x1f300>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1144  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1145  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1146  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1147  
0daef104e4b1d9 Richard Acayan      2023-01-31  1148  		mmss_noc: interconnect@1740000 {
0daef104e4b1d9 Richard Acayan      2023-01-31  1149  			compatible = "qcom,sdm670-mmss-noc";
0daef104e4b1d9 Richard Acayan      2023-01-31  1150  			reg = <0 0x01740000 0 0x1c100>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1151  			#interconnect-cells = <2>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1152  			qcom,bcm-voters = <&apps_bcm_voter>;
0daef104e4b1d9 Richard Acayan      2023-01-31  1153  		};
0daef104e4b1d9 Richard Acayan      2023-01-31  1154  
265d9989df5012 Richard Acayan      2024-05-23  1155  		tcsr_mutex: hwlock@1f40000 {
265d9989df5012 Richard Acayan      2024-05-23  1156  			compatible = "qcom,tcsr-mutex";
265d9989df5012 Richard Acayan      2024-05-23  1157  			reg = <0 0x01f40000 0 0x20000>;
265d9989df5012 Richard Acayan      2024-05-23  1158  			#hwlock-cells = <1>;
265d9989df5012 Richard Acayan      2024-05-23  1159  		};
265d9989df5012 Richard Acayan      2024-05-23  1160  
07c8ded6e37383 Richard Acayan      2022-11-10  1161  		tlmm: pinctrl@3400000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1162  			compatible = "qcom,sdm670-tlmm";
07c8ded6e37383 Richard Acayan      2022-11-10  1163  			reg = <0 0x03400000 0 0xc00000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1164  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1165  			gpio-controller;
07c8ded6e37383 Richard Acayan      2022-11-10  1166  			#gpio-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1167  			interrupt-controller;
07c8ded6e37383 Richard Acayan      2022-11-10  1168  			#interrupt-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1169  			gpio-ranges = <&tlmm 0 0 151>;
71f080633d1ee1 Konrad Dybcio       2023-08-11  1170  			wakeup-parent = <&pdc>;
07c8ded6e37383 Richard Acayan      2022-11-10  1171  
54a77fc29e746e Richard Acayan      2024-10-10  1172  			cci0_default: cci0-default-state {
54a77fc29e746e Richard Acayan      2024-10-10  1173  				pins = "gpio17", "gpio18";
54a77fc29e746e Richard Acayan      2024-10-10  1174  				function = "cci_i2c";
54a77fc29e746e Richard Acayan      2024-10-10  1175  				drive-strength = <2>;
54a77fc29e746e Richard Acayan      2024-10-10  1176  				bias-pull-up;
54a77fc29e746e Richard Acayan      2024-10-10  1177  			};
54a77fc29e746e Richard Acayan      2024-10-10  1178  
54a77fc29e746e Richard Acayan      2024-10-10  1179  			cci0_sleep: cci0-sleep-state {
54a77fc29e746e Richard Acayan      2024-10-10  1180  				pins = "gpio17", "gpio18";
54a77fc29e746e Richard Acayan      2024-10-10  1181  				function = "cci_i2c";
54a77fc29e746e Richard Acayan      2024-10-10  1182  				drive-strength = <2>;
54a77fc29e746e Richard Acayan      2024-10-10  1183  				bias-pull-down;
54a77fc29e746e Richard Acayan      2024-10-10  1184  			};
54a77fc29e746e Richard Acayan      2024-10-10  1185  
54a77fc29e746e Richard Acayan      2024-10-10  1186  			cci1_default: cci1-default-state {
54a77fc29e746e Richard Acayan      2024-10-10  1187  				pins = "gpio19", "gpio20";
54a77fc29e746e Richard Acayan      2024-10-10  1188  				function = "cci_i2c";
54a77fc29e746e Richard Acayan      2024-10-10  1189  				drive-strength = <2>;
54a77fc29e746e Richard Acayan      2024-10-10  1190  				bias-pull-up;
54a77fc29e746e Richard Acayan      2024-10-10  1191  			};
54a77fc29e746e Richard Acayan      2024-10-10  1192  
54a77fc29e746e Richard Acayan      2024-10-10  1193  			cci1_sleep: cci1-sleep-state {
54a77fc29e746e Richard Acayan      2024-10-10  1194  				pins = "gpio19", "gpio20";
54a77fc29e746e Richard Acayan      2024-10-10  1195  				function = "cci_i2c";
54a77fc29e746e Richard Acayan      2024-10-10  1196  				drive-strength = <2>;
54a77fc29e746e Richard Acayan      2024-10-10  1197  				bias-pull-down;
54a77fc29e746e Richard Acayan      2024-10-10  1198  			};
54a77fc29e746e Richard Acayan      2024-10-10  1199  
07c8ded6e37383 Richard Acayan      2022-11-10  1200  			qup_i2c0_default: qup-i2c0-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1201  				pins = "gpio0", "gpio1";
07c8ded6e37383 Richard Acayan      2022-11-10  1202  				function = "qup0";
07c8ded6e37383 Richard Acayan      2022-11-10  1203  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1204  
07c8ded6e37383 Richard Acayan      2022-11-10  1205  			qup_i2c1_default: qup-i2c1-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1206  				pins = "gpio17", "gpio18";
07c8ded6e37383 Richard Acayan      2022-11-10  1207  				function = "qup1";
07c8ded6e37383 Richard Acayan      2022-11-10  1208  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1209  
07c8ded6e37383 Richard Acayan      2022-11-10  1210  			qup_i2c2_default: qup-i2c2-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1211  				pins = "gpio27", "gpio28";
07c8ded6e37383 Richard Acayan      2022-11-10  1212  				function = "qup2";
07c8ded6e37383 Richard Acayan      2022-11-10  1213  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1214  
07c8ded6e37383 Richard Acayan      2022-11-10  1215  			qup_i2c3_default: qup-i2c3-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1216  				pins = "gpio41", "gpio42";
07c8ded6e37383 Richard Acayan      2022-11-10  1217  				function = "qup3";
07c8ded6e37383 Richard Acayan      2022-11-10  1218  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1219  
07c8ded6e37383 Richard Acayan      2022-11-10  1220  			qup_i2c4_default: qup-i2c4-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1221  				pins = "gpio89", "gpio90";
07c8ded6e37383 Richard Acayan      2022-11-10  1222  				function = "qup4";
07c8ded6e37383 Richard Acayan      2022-11-10  1223  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1224  
07c8ded6e37383 Richard Acayan      2022-11-10  1225  			qup_i2c5_default: qup-i2c5-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1226  				pins = "gpio85", "gpio86";
07c8ded6e37383 Richard Acayan      2022-11-10  1227  				function = "qup5";
07c8ded6e37383 Richard Acayan      2022-11-10  1228  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1229  
07c8ded6e37383 Richard Acayan      2022-11-10  1230  			qup_i2c6_default: qup-i2c6-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1231  				pins = "gpio45", "gpio46";
07c8ded6e37383 Richard Acayan      2022-11-10  1232  				function = "qup6";
07c8ded6e37383 Richard Acayan      2022-11-10  1233  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1234  
07c8ded6e37383 Richard Acayan      2022-11-10  1235  			qup_i2c7_default: qup-i2c7-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1236  				pins = "gpio93", "gpio94";
07c8ded6e37383 Richard Acayan      2022-11-10  1237  				function = "qup7";
07c8ded6e37383 Richard Acayan      2022-11-10  1238  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1239  
07c8ded6e37383 Richard Acayan      2022-11-10  1240  			qup_i2c8_default: qup-i2c8-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1241  				pins = "gpio65", "gpio66";
07c8ded6e37383 Richard Acayan      2022-11-10  1242  				function = "qup8";
07c8ded6e37383 Richard Acayan      2022-11-10  1243  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1244  
07c8ded6e37383 Richard Acayan      2022-11-10  1245  			qup_i2c9_default: qup-i2c9-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1246  				pins = "gpio6", "gpio7";
07c8ded6e37383 Richard Acayan      2022-11-10  1247  				function = "qup9";
07c8ded6e37383 Richard Acayan      2022-11-10  1248  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1249  
07c8ded6e37383 Richard Acayan      2022-11-10  1250  			qup_i2c10_default: qup-i2c10-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1251  				pins = "gpio55", "gpio56";
07c8ded6e37383 Richard Acayan      2022-11-10  1252  				function = "qup10";
07c8ded6e37383 Richard Acayan      2022-11-10  1253  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1254  
07c8ded6e37383 Richard Acayan      2022-11-10  1255  			qup_i2c11_default: qup-i2c11-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1256  				pins = "gpio31", "gpio32";
07c8ded6e37383 Richard Acayan      2022-11-10  1257  				function = "qup11";
07c8ded6e37383 Richard Acayan      2022-11-10  1258  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1259  
07c8ded6e37383 Richard Acayan      2022-11-10  1260  			qup_i2c12_default: qup-i2c12-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1261  				pins = "gpio49", "gpio50";
07c8ded6e37383 Richard Acayan      2022-11-10  1262  				function = "qup12";
07c8ded6e37383 Richard Acayan      2022-11-10  1263  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1264  
07c8ded6e37383 Richard Acayan      2022-11-10  1265  			qup_i2c13_default: qup-i2c13-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1266  				pins = "gpio105", "gpio106";
07c8ded6e37383 Richard Acayan      2022-11-10  1267  				function = "qup13";
07c8ded6e37383 Richard Acayan      2022-11-10  1268  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1269  
07c8ded6e37383 Richard Acayan      2022-11-10  1270  			qup_i2c14_default: qup-i2c14-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1271  				pins = "gpio33", "gpio34";
07c8ded6e37383 Richard Acayan      2022-11-10  1272  				function = "qup14";
07c8ded6e37383 Richard Acayan      2022-11-10  1273  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1274  
07c8ded6e37383 Richard Acayan      2022-11-10  1275  			qup_i2c15_default: qup-i2c15-default-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1276  				pins = "gpio81", "gpio82";
07c8ded6e37383 Richard Acayan      2022-11-10  1277  				function = "qup15";
07c8ded6e37383 Richard Acayan      2022-11-10  1278  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1279  
07c8ded6e37383 Richard Acayan      2022-11-10  1280  			sdc1_state_on: sdc1-on-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1281  				clk-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1282  					pins = "sdc1_clk";
07c8ded6e37383 Richard Acayan      2022-11-10  1283  					bias-disable;
07c8ded6e37383 Richard Acayan      2022-11-10  1284  					drive-strength = <16>;
07c8ded6e37383 Richard Acayan      2022-11-10  1285  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1286  
07c8ded6e37383 Richard Acayan      2022-11-10  1287  				cmd-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1288  					pins = "sdc1_cmd";
07c8ded6e37383 Richard Acayan      2022-11-10  1289  					bias-pull-up;
07c8ded6e37383 Richard Acayan      2022-11-10  1290  					drive-strength = <10>;
07c8ded6e37383 Richard Acayan      2022-11-10  1291  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1292  
07c8ded6e37383 Richard Acayan      2022-11-10  1293  				data-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1294  					pins = "sdc1_data";
07c8ded6e37383 Richard Acayan      2022-11-10  1295  					bias-pull-up;
07c8ded6e37383 Richard Acayan      2022-11-10  1296  					drive-strength = <10>;
07c8ded6e37383 Richard Acayan      2022-11-10  1297  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1298  
07c8ded6e37383 Richard Acayan      2022-11-10  1299  				rclk-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1300  					pins = "sdc1_rclk";
07c8ded6e37383 Richard Acayan      2022-11-10  1301  					bias-pull-down;
07c8ded6e37383 Richard Acayan      2022-11-10  1302  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1303  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1304  
07c8ded6e37383 Richard Acayan      2022-11-10  1305  			sdc1_state_off: sdc1-off-state {
07c8ded6e37383 Richard Acayan      2022-11-10  1306  				clk-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1307  					pins = "sdc1_clk";
07c8ded6e37383 Richard Acayan      2022-11-10  1308  					bias-disable;
07c8ded6e37383 Richard Acayan      2022-11-10  1309  					drive-strength = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1310  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1311  
07c8ded6e37383 Richard Acayan      2022-11-10  1312  				cmd-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1313  					pins = "sdc1_cmd";
07c8ded6e37383 Richard Acayan      2022-11-10  1314  					bias-pull-up;
07c8ded6e37383 Richard Acayan      2022-11-10  1315  					drive-strength = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1316  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1317  
07c8ded6e37383 Richard Acayan      2022-11-10  1318  				data-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1319  					pins = "sdc1_data";
07c8ded6e37383 Richard Acayan      2022-11-10  1320  					bias-pull-up;
07c8ded6e37383 Richard Acayan      2022-11-10  1321  					drive-strength = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1322  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1323  
07c8ded6e37383 Richard Acayan      2022-11-10  1324  				rclk-pins {
07c8ded6e37383 Richard Acayan      2022-11-10  1325  					pins = "sdc1_rclk";
07c8ded6e37383 Richard Acayan      2022-11-10  1326  					bias-pull-down;
07c8ded6e37383 Richard Acayan      2022-11-10  1327  				};
07c8ded6e37383 Richard Acayan      2022-11-10  1328  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1329  		};
07c8ded6e37383 Richard Acayan      2022-11-10  1330  
07c8ded6e37383 Richard Acayan      2022-11-10  1331  		usb_1_hsphy: phy@88e2000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1332  			compatible = "qcom,sdm670-qusb2-phy", "qcom,qusb2-v2-phy";
07c8ded6e37383 Richard Acayan      2022-11-10  1333  			reg = <0 0x088e2000 0 0x400>;
07c8ded6e37383 Richard Acayan      2022-11-10  1334  			#phy-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1335  
07c8ded6e37383 Richard Acayan      2022-11-10  1336  			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1337  				 <&rpmhcc RPMH_CXO_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1338  			clock-names = "cfg_ahb", "ref";
07c8ded6e37383 Richard Acayan      2022-11-10  1339  
07c8ded6e37383 Richard Acayan      2022-11-10  1340  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
07c8ded6e37383 Richard Acayan      2022-11-10  1341  
cb98187a6883c4 Richard Acayan      2022-12-06  1342  			nvmem-cells = <&qusb2_hstx_trim>;
cb98187a6883c4 Richard Acayan      2022-12-06  1343  
07c8ded6e37383 Richard Acayan      2022-11-10  1344  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1345  		};
07c8ded6e37383 Richard Acayan      2022-11-10  1346  
07c8ded6e37383 Richard Acayan      2022-11-10  1347  		usb_1: usb@a6f8800 {
07c8ded6e37383 Richard Acayan      2022-11-10  1348  			compatible = "qcom,sdm670-dwc3", "qcom,dwc3";
07c8ded6e37383 Richard Acayan      2022-11-10  1349  			reg = <0 0x0a6f8800 0 0x400>;
07c8ded6e37383 Richard Acayan      2022-11-10  1350  			#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1351  			#size-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1352  			ranges;
07c8ded6e37383 Richard Acayan      2022-11-10  1353  			dma-ranges;
07c8ded6e37383 Richard Acayan      2022-11-10  1354  
07c8ded6e37383 Richard Acayan      2022-11-10  1355  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1356  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1357  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1358  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1359  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1360  			clock-names = "cfg_noc",
07c8ded6e37383 Richard Acayan      2022-11-10  1361  				      "core",
07c8ded6e37383 Richard Acayan      2022-11-10  1362  				      "iface",
07c8ded6e37383 Richard Acayan      2022-11-10  1363  				      "sleep",
07c8ded6e37383 Richard Acayan      2022-11-10  1364  				      "mock_utmi";
07c8ded6e37383 Richard Acayan      2022-11-10  1365  
07c8ded6e37383 Richard Acayan      2022-11-10  1366  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
07c8ded6e37383 Richard Acayan      2022-11-10  1367  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
07c8ded6e37383 Richard Acayan      2022-11-10  1368  			assigned-clock-rates = <19200000>, <150000000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1369  
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1370  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1371  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1372  					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
c42d12ea105f67 Johan Hovold        2023-12-14  1373  					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1374  					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1375  			interrupt-names = "pwr_event",
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1376  					  "hs_phy_irq",
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1377  					  "dp_hs_phy_irq",
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1378  					  "dm_hs_phy_irq",
7c9afa1fd84ba1 Krishna Kurapati    2024-01-26  1379  					  "ss_phy_irq";
07c8ded6e37383 Richard Acayan      2022-11-10  1380  
07c8ded6e37383 Richard Acayan      2022-11-10  1381  			power-domains = <&gcc USB30_PRIM_GDSC>;
07c8ded6e37383 Richard Acayan      2022-11-10  1382  
07c8ded6e37383 Richard Acayan      2022-11-10  1383  			resets = <&gcc GCC_USB30_PRIM_BCR>;
07c8ded6e37383 Richard Acayan      2022-11-10  1384  
17289c0165bdb6 Richard Acayan      2023-01-31  1385  			interconnects = <&aggre2_noc MASTER_USB3 0 &mem_noc SLAVE_EBI_CH0 0>,
17289c0165bdb6 Richard Acayan      2023-01-31  1386  					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
17289c0165bdb6 Richard Acayan      2023-01-31  1387  			interconnect-names = "usb-ddr", "apps-usb";
17289c0165bdb6 Richard Acayan      2023-01-31  1388  
07c8ded6e37383 Richard Acayan      2022-11-10  1389  			status = "disabled";
07c8ded6e37383 Richard Acayan      2022-11-10  1390  
07c8ded6e37383 Richard Acayan      2022-11-10  1391  			usb_1_dwc3: usb@a600000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1392  				compatible = "snps,dwc3";
07c8ded6e37383 Richard Acayan      2022-11-10  1393  				reg = <0 0x0a600000 0 0xcd00>;
07c8ded6e37383 Richard Acayan      2022-11-10  1394  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1395  				iommus = <&apps_smmu 0x740 0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1396  				snps,dis_u2_susphy_quirk;
07c8ded6e37383 Richard Acayan      2022-11-10  1397  				snps,dis_enblslpm_quirk;
07c8ded6e37383 Richard Acayan      2022-11-10  1398  				phys = <&usb_1_hsphy>;
07c8ded6e37383 Richard Acayan      2022-11-10  1399  				phy-names = "usb2-phy";
07c8ded6e37383 Richard Acayan      2022-11-10  1400  			};
07c8ded6e37383 Richard Acayan      2022-11-10  1401  		};
07c8ded6e37383 Richard Acayan      2022-11-10  1402  
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1403  		pdc: interrupt-controller@b220000 {
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1404  			compatible = "qcom,sdm670-pdc", "qcom,pdc";
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1405  			reg = <0 0x0b220000 0 0x30000>;
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1406  			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
ad75cda991f7b3 Konrad Dybcio       2023-08-18  1407  					  <54 534 24>, <79 559 15>, <94 609 15>,
ad75cda991f7b3 Konrad Dybcio       2023-08-18  1408  					  <115 630 7>;
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1409  			#interrupt-cells = <2>;
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1410  			interrupt-parent = <&intc>;
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1411  			interrupt-controller;
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1412  		};
b51ee205dc4f21 Konrad Dybcio       2023-08-11  1413  
07c8ded6e37383 Richard Acayan      2022-11-10  1414  		spmi_bus: spmi@c440000 {
07c8ded6e37383 Richard Acayan      2022-11-10  1415  			compatible = "qcom,spmi-pmic-arb";
07c8ded6e37383 Richard Acayan      2022-11-10  1416  			reg = <0 0x0c440000 0 0x1100>,
07c8ded6e37383 Richard Acayan      2022-11-10  1417  			      <0 0x0c600000 0 0x2000000>,
07c8ded6e37383 Richard Acayan      2022-11-10  1418  			      <0 0x0e600000 0 0x100000>,
07c8ded6e37383 Richard Acayan      2022-11-10  1419  			      <0 0x0e700000 0 0xa0000>,
07c8ded6e37383 Richard Acayan      2022-11-10  1420  			      <0 0x0c40a000 0 0x26000>;
07c8ded6e37383 Richard Acayan      2022-11-10  1421  			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
07c8ded6e37383 Richard Acayan      2022-11-10  1422  			interrupt-names = "periph_irq";
07c8ded6e37383 Richard Acayan      2022-11-10  1423  			interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
07c8ded6e37383 Richard Acayan      2022-11-10  1424  			qcom,ee = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1425  			qcom,channel = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1426  			#address-cells = <2>;
07c8ded6e37383 Richard Acayan      2022-11-10  1427  			#size-cells = <0>;
07c8ded6e37383 Richard Acayan      2022-11-10  1428  			interrupt-controller;
07c8ded6e37383 Richard Acayan      2022-11-10  1429  			#interrupt-cells = <4>;
07c8ded6e37383 Richard Acayan      2022-11-10  1430  		};
07c8ded6e37383 Richard Acayan      2022-11-10  1431  
54a77fc29e746e Richard Acayan      2024-10-10  1432  		cci: cci@ac4a000 {
54a77fc29e746e Richard Acayan      2024-10-10  1433  			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
54a77fc29e746e Richard Acayan      2024-10-10  1434  			#address-cells = <1>;
54a77fc29e746e Richard Acayan      2024-10-10  1435  			#size-cells = <0>;
54a77fc29e746e Richard Acayan      2024-10-10  1436  
54a77fc29e746e Richard Acayan      2024-10-10  1437  			reg = <0 0x0ac4a000 0 0x4000>;
54a77fc29e746e Richard Acayan      2024-10-10  1438  			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
54a77fc29e746e Richard Acayan      2024-10-10  1439  			power-domains = <&camcc TITAN_TOP_GDSC>;
54a77fc29e746e Richard Acayan      2024-10-10  1440  
54a77fc29e746e Richard Acayan      2024-10-10  1441  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
54a77fc29e746e Richard Acayan      2024-10-10  1442  				 <&camcc CAM_CC_SOC_AHB_CLK>,
54a77fc29e746e Richard Acayan      2024-10-10  1443  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
54a77fc29e746e Richard Acayan      2024-10-10  1444  				 <&camcc CAM_CC_CCI_CLK>;
54a77fc29e746e Richard Acayan      2024-10-10  1445  			clock-names = "camnoc_axi",
54a77fc29e746e Richard Acayan      2024-10-10  1446  				      "soc_ahb",
54a77fc29e746e Richard Acayan      2024-10-10  1447  				      "cpas_ahb",
54a77fc29e746e Richard Acayan      2024-10-10  1448  				      "cci";
54a77fc29e746e Richard Acayan      2024-10-10  1449  
54a77fc29e746e Richard Acayan      2024-10-10  1450  			pinctrl-names = "default", "sleep";
54a77fc29e746e Richard Acayan      2024-10-10  1451  			pinctrl-0 = <&cci0_default &cci1_default>;
54a77fc29e746e Richard Acayan      2024-10-10  1452  			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
54a77fc29e746e Richard Acayan      2024-10-10  1453  
54a77fc29e746e Richard Acayan      2024-10-10  1454  			status = "disabled";
54a77fc29e746e Richard Acayan      2024-10-10  1455  
54a77fc29e746e Richard Acayan      2024-10-10  1456  			cci_i2c0: i2c-bus@0 {
54a77fc29e746e Richard Acayan      2024-10-10  1457  				reg = <0>;
54a77fc29e746e Richard Acayan      2024-10-10  1458  				clock-frequency = <1000000>;
54a77fc29e746e Richard Acayan      2024-10-10  1459  				#address-cells = <1>;
54a77fc29e746e Richard Acayan      2024-10-10  1460  				#size-cells = <0>;
54a77fc29e746e Richard Acayan      2024-10-10  1461  			};
54a77fc29e746e Richard Acayan      2024-10-10  1462  
54a77fc29e746e Richard Acayan      2024-10-10  1463  			cci_i2c1: i2c-bus@1 {
54a77fc29e746e Richard Acayan      2024-10-10  1464  				reg = <1>;
54a77fc29e746e Richard Acayan      2024-10-10  1465  				clock-frequency = <1000000>;
54a77fc29e746e Richard Acayan      2024-10-10  1466  				#address-cells = <1>;
54a77fc29e746e Richard Acayan      2024-10-10  1467  				#size-cells = <0>;
54a77fc29e746e Richard Acayan      2024-10-10  1468  			};
54a77fc29e746e Richard Acayan      2024-10-10  1469  		};
54a77fc29e746e Richard Acayan      2024-10-10  1470  
54a77fc29e746e Richard Acayan      2024-10-10 @1471  		camss: camera-controller@ac65000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
