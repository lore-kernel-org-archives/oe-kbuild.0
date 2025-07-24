Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C3A1362
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 04:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753331710; cv=none; b=KjYf5cPQCaVipp+T+guoocvZubthLZXXZhgkLSsiGZKlrQAizm6H16v2SXpPsM2flETE9JWcLjT8Lt5nff5U9SnhY/cu+T6TmRO0vk/81hmiqDwOaYodgVPjV5jby3ICBhUpV5xAjDKyXiwacNOLB5PBhvW46ewlZ6/GahWqgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753331710; c=relaxed/simple;
	bh=HiBc27pK0mXp7ypLDFHlc1X4BOlX/96bP/EakpL47ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oqej1QSPBToK1JL+VSfXIBrKDgZoLxKe5O3X1LEsvvQCz9+ufygFZYX/WfZyQmvQelWV+izqMwJwUi9sjybEsMD6NtqwMwb9aqLXi2HEQNb2mugNLOuju9FpLLJGJ4bQAUKQ/Gq6C05OLBy78giObKDieU6bKBAES52T/TLUzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLN2oOAL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLN2oOAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753331693; x=1784867693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HiBc27pK0mXp7ypLDFHlc1X4BOlX/96bP/EakpL47ZM=;
  b=fLN2oOALsF9xm4oe0SYManjKYKWV3jY60OQ7jAQUNyOdatbGZPkagNw9
   oia2jqm4KikbJmerQHHbHUy4wIpP3m6Tb8DGNWQnOTYqgGrRQ/kIOuGFz
   CI/RWQ3TmLwmKQaLiGKa1cUusNlRtHsTqIQdVaIM1lQR7eKmvOZJyf1tc
   960hUeHIJqXs01X4L40RN+EfBaIlYA1wGorRQQ4+sh9VTuHxJJnhXOd7c
   vvdf4Pb7XTlKXSwr7tlW7d9V7utwKg8Pp4KtkineepFOnNdG+n+UmdkMr
   RJ5n/1H/ydlz/bCTZBkjhUEw7ynWKAL8C2qs4Go8AHfhVeJk/ju6rogjn
   A==;
X-CSE-ConnectionGUID: oPGqyn0PTgilLz90su6Ysg==
X-CSE-MsgGUID: FqxFuwrcTzGnpRE+H/DnDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73085794"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="73085794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 21:34:31 -0700
X-CSE-ConnectionGUID: 6WJdXN/eQZChn7X7PMI1oA==
X-CSE-MsgGUID: ZNr2LPQ0RxOvKh5AVuLpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159235582"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jul 2025 21:34:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uenf0-000K51-0O;
	Thu, 24 Jul 2025 04:34:26 +0000
Date: Thu, 24 Jul 2025 12:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <202507241211.tYUfTRZa-lkp@intel.com>
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
In-Reply-To: <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
TO: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Richard Cochran <richardcochran@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

Hi Wasim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05adbee3ad528100ab0285c15c91100e19e10138]

url:    https://github.com/intel-lab-lkp/linux/commits/Wasim-Nazir/arm64-dts-qcom-Rename-sa8775p-SoC-to-lemans/20250722-225646
base:   05adbee3ad528100ab0285c15c91100e19e10138
patch link:    https://lore.kernel.org/r/20250722144926.995064-2-wasim.nazir%40oss.qualcomm.com
patch subject: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250724/202507241211.tYUfTRZa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241211.tYUfTRZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507241211.tYUfTRZa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/lemans.dtsi:4485.28-4546.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/lemans.dtsi:4567.28-4619.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +4485 arch/arm64/boot/dts/qcom/lemans.dtsi

603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    23  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    24  / {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    25  	interrupt-parent = <&intc>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    26  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    27  	#address-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    28  	#size-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    29  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    30  	clocks {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    31  		xo_board_clk: xo-board-clk {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    32  			compatible = "fixed-clock";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    33  			#clock-cells = <0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    34  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    35  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    36  		sleep_clk: sleep-clk {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    37  			compatible = "fixed-clock";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    38  			#clock-cells = <0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    39  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    40  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    41  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    42  	cpus {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    43  		#address-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    44  		#size-cells = <0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    45  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    46  		cpu0: cpu@0 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    47  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    48  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    49  			reg = <0x0 0x0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    50  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12    51  			power-domains = <&cpu_pd0>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12    52  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21    53  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    54  			next-level-cache = <&l2_0>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31    55  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31    56  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    57  			operating-points-v2 = <&cpu0_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    58  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    59  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    60  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    61  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    62  			l2_0: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    63  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    64  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    65  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    66  				next-level-cache = <&l3_0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    67  				l3_0: l3-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    68  					compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    69  					cache-level = <3>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    70  					cache-unified;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    71  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    72  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    73  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    74  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    75  		cpu1: cpu@100 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    76  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    77  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    78  			reg = <0x0 0x100>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    79  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12    80  			power-domains = <&cpu_pd1>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12    81  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21    82  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    83  			next-level-cache = <&l2_1>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31    84  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31    85  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    86  			operating-points-v2 = <&cpu0_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    87  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    88  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    89  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15    90  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    91  			l2_1: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    92  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    93  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16    94  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    95  				next-level-cache = <&l3_0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    96  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    97  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14    98  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22    99  		cpu2: cpu@200 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   100  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   101  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   102  			reg = <0x0 0x200>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   103  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   104  			power-domains = <&cpu_pd2>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   105  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   106  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   107  			next-level-cache = <&l2_2>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   108  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   109  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   110  			operating-points-v2 = <&cpu0_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   111  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   112  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   113  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   114  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   115  			l2_2: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   116  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   117  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   118  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   119  				next-level-cache = <&l3_0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   120  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   121  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   122  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   123  		cpu3: cpu@300 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   124  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   125  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   126  			reg = <0x0 0x300>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   127  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   128  			power-domains = <&cpu_pd3>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   129  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   130  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   131  			next-level-cache = <&l2_3>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   132  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   133  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   134  			operating-points-v2 = <&cpu0_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   135  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   136  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   137  					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   138  					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   139  			l2_3: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   140  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   141  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   142  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   143  				next-level-cache = <&l3_0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   144  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   145  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   146  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   147  		cpu4: cpu@10000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   148  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   149  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   150  			reg = <0x0 0x10000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   151  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   152  			power-domains = <&cpu_pd4>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   153  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   154  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   155  			next-level-cache = <&l2_4>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   156  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   157  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   158  			operating-points-v2 = <&cpu4_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   159  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   160  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   161  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   162  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   163  			l2_4: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   164  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   165  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   166  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   167  				next-level-cache = <&l3_1>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   168  				l3_1: l3-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   169  					compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   170  					cache-level = <3>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   171  					cache-unified;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   172  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   173  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   174  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   175  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   176  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   177  		cpu5: cpu@10100 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   178  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   179  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   180  			reg = <0x0 0x10100>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   181  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   182  			power-domains = <&cpu_pd5>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   183  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   184  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   185  			next-level-cache = <&l2_5>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   186  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   187  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   188  			operating-points-v2 = <&cpu4_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   189  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   190  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   191  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   192  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   193  			l2_5: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   194  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   195  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   196  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   197  				next-level-cache = <&l3_1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   198  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   199  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   200  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   201  		cpu6: cpu@10200 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   202  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   203  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   204  			reg = <0x0 0x10200>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   205  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   206  			power-domains = <&cpu_pd6>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   207  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   208  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   209  			next-level-cache = <&l2_6>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   210  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   211  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   212  			operating-points-v2 = <&cpu4_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   213  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   214  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   215  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   216  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   217  			l2_6: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   218  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   219  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   220  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   221  				next-level-cache = <&l3_1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   222  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   223  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   224  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   225  		cpu7: cpu@10300 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   226  			device_type = "cpu";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   227  			compatible = "qcom,kryo";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   228  			reg = <0x0 0x10300>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   229  			enable-method = "psci";
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   230  			power-domains = <&cpu_pd7>;
736f50489e08ba arch/arm64/boot/dts/qcom/sa8775p.dtsi Maulik Shah           2024-11-12   231  			power-domain-names = "psci";
5d793ff40692c9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-21   232  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   233  			next-level-cache = <&l2_7>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   234  			capacity-dmips-mhz = <1024>;
717ca334afd7ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Ankit Sharma          2024-07-31   235  			dynamic-power-coefficient = <100>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   236  			operating-points-v2 = <&cpu4_opp_table>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   237  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   238  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   239  					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   240  					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   241  			l2_7: l2-cache {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   242  				compatible = "cache";
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   243  				cache-level = <2>;
9c6e72fb2058dc arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2023-04-16   244  				cache-unified;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   245  				next-level-cache = <&l3_1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   246  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   247  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   248  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   249  		cpu-map {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   250  			cluster0 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   251  				core0 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   252  					cpu = <&cpu0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   253  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   254  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   255  				core1 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   256  					cpu = <&cpu1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   257  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   258  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   259  				core2 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   260  					cpu = <&cpu2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   261  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   262  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   263  				core3 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   264  					cpu = <&cpu3>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   265  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   266  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   267  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   268  			cluster1 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   269  				core0 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   270  					cpu = <&cpu4>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   271  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   272  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   273  				core1 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   274  					cpu = <&cpu5>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   275  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   276  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   277  				core2 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   278  					cpu = <&cpu6>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   279  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   280  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   281  				core3 {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   282  					cpu = <&cpu7>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   283  				};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   284  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   285  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   286  
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   287  		idle-states {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   288  			entry-method = "psci";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   289  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   290  			gold_cpu_sleep_0: cpu-sleep-0 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   291  				compatible = "arm,idle-state";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   292  				idle-state-name = "gold-power-collapse";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   293  				arm,psci-suspend-param = <0x40000003>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   294  				entry-latency-us = <549>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   295  				exit-latency-us = <901>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   296  				min-residency-us = <1774>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   297  				local-timer-stop;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   298  			};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   299  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   300  			gold_rail_cpu_sleep_0: cpu-sleep-1 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   301  				compatible = "arm,idle-state";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   302  				idle-state-name = "gold-rail-power-collapse";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   303  				arm,psci-suspend-param = <0x40000004>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   304  				entry-latency-us = <702>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   305  				exit-latency-us = <1061>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   306  				min-residency-us = <4488>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   307  				local-timer-stop;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   308  			};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   309  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   310  
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   311  		domain-idle-states {
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   312  			cluster_sleep_gold: cluster-sleep-0 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   313  				compatible = "domain-idle-state";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   314  				arm,psci-suspend-param = <0x41000044>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   315  				entry-latency-us = <2752>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   316  				exit-latency-us = <3048>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   317  				min-residency-us = <6118>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   318  			};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   319  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   320  			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   321  				compatible = "domain-idle-state";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   322  				arm,psci-suspend-param = <0x42000144>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   323  				entry-latency-us = <3263>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   324  				exit-latency-us = <6562>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   325  				min-residency-us = <9987>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   326  			};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   327  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   328  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   329  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   330  	cpu0_opp_table: opp-table-cpu0 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   331  		compatible = "operating-points-v2";
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   332  		opp-shared;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   333  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   334  		opp-1267200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   335  			opp-hz = /bits/ 64 <1267200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   336  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   337  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   338  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   339  		opp-1363200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   340  			opp-hz = /bits/ 64 <1363200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   341  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   342  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   343  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   344  		opp-1459200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   345  			opp-hz = /bits/ 64 <1459200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   346  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   347  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   348  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   349  		opp-1536000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   350  			opp-hz = /bits/ 64 <1536000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   351  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   352  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   353  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   354  		opp-1632000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   355  			opp-hz = /bits/ 64 <1632000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   356  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   357  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   358  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   359  		opp-1708800000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   360  			opp-hz = /bits/ 64 <1708800000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   361  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   362  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   363  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   364  		opp-1785600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   365  			opp-hz = /bits/ 64 <1785600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   366  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   367  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   368  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   369  		opp-1862400000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   370  			opp-hz = /bits/ 64 <1862400000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   371  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   372  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   373  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   374  		opp-1939200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   375  			opp-hz = /bits/ 64 <1939200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   376  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   377  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   378  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   379  		opp-2016000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   380  			opp-hz = /bits/ 64 <2016000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   381  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   382  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   383  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   384  		opp-2112000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   385  			opp-hz = /bits/ 64 <2112000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   386  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   387  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   388  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   389  		opp-2188800000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   390  			opp-hz = /bits/ 64 <2188800000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   391  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   392  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   393  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   394  		opp-2265600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   395  			opp-hz = /bits/ 64 <2265600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   396  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   397  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   398  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   399  		opp-2361600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   400  			opp-hz = /bits/ 64 <2361600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   401  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   402  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   403  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   404  		opp-2457600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   405  			opp-hz = /bits/ 64 <2457600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   406  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   407  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   408  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   409  		opp-2553600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   410  			opp-hz = /bits/ 64 <2553600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   411  			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   412  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   413  	};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   414  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   415  	cpu4_opp_table: opp-table-cpu4 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   416  		compatible = "operating-points-v2";
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   417  		opp-shared;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   418  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   419  		opp-1267200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   420  			opp-hz = /bits/ 64 <1267200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   421  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   422  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   423  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   424  		opp-1363200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   425  			opp-hz = /bits/ 64 <1363200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   426  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   427  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   428  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   429  		opp-1459200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   430  			opp-hz = /bits/ 64 <1459200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   431  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   432  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   433  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   434  		opp-1536000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   435  			opp-hz = /bits/ 64 <1536000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   436  			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   437  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   438  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   439  		opp-1632000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   440  			opp-hz = /bits/ 64 <1632000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   441  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   442  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   443  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   444  		opp-1708800000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   445  			opp-hz = /bits/ 64 <1708800000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   446  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   447  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   448  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   449  		opp-1785600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   450  			opp-hz = /bits/ 64 <1785600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   451  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   452  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   453  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   454  		opp-1862400000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   455  			opp-hz = /bits/ 64 <1862400000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   456  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   457  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   458  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   459  		opp-1939200000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   460  			opp-hz = /bits/ 64 <1939200000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   461  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   462  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   463  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   464  		opp-2016000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   465  			opp-hz = /bits/ 64 <2016000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   466  			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   467  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   468  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   469  		opp-2112000000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   470  			opp-hz = /bits/ 64 <2112000000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   471  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   472  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   473  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   474  		opp-2188800000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   475  			opp-hz = /bits/ 64 <2188800000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   476  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   477  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   478  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   479  		opp-2265600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   480  			opp-hz = /bits/ 64 <2265600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   481  			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   482  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   483  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   484  		opp-2361600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   485  			opp-hz = /bits/ 64 <2361600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   486  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   487  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   488  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   489  		opp-2457600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   490  			opp-hz = /bits/ 64 <2457600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   491  			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   492  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   493  
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   494  		opp-2553600000 {
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   495  			opp-hz = /bits/ 64 <2553600000>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   496  			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   497  		};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   498  	};
985237d49c4cf0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jagadeesh Kona        2025-04-15   499  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   500  	dummy-sink {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   501  		compatible = "arm,coresight-dummy-sink";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   502  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   503  		in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   504  			port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   505  				eud_in: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   506  					remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   507  					<&swao_rep_out1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   508  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   509  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   510  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   511  	};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21   512  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   513  	firmware {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   514  		scm {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   515  			compatible = "qcom,scm-sa8775p", "qcom,scm";
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30   516  			qcom,dload-mode = <&tcsr 0x13000>;
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   517  			memory-region = <&tz_ffi_mem>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   518  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   519  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   520  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   521  	aggre1_noc: interconnect-aggre1-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   522  		compatible = "qcom,sa8775p-aggre1-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   523  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   524  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   525  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   526  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   527  	aggre2_noc: interconnect-aggre2-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   528  		compatible = "qcom,sa8775p-aggre2-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   529  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   530  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   531  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   532  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   533  	clk_virt: interconnect-clk-virt {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   534  		compatible = "qcom,sa8775p-clk-virt";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   535  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   536  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   537  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   538  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   539  	config_noc: interconnect-config-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   540  		compatible = "qcom,sa8775p-config-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   541  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   542  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   543  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   544  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   545  	dc_noc: interconnect-dc-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   546  		compatible = "qcom,sa8775p-dc-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   547  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   548  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   549  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   550  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   551  	gem_noc: interconnect-gem-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   552  		compatible = "qcom,sa8775p-gem-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   553  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   554  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   555  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   556  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   557  	gpdsp_anoc: interconnect-gpdsp-anoc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   558  		compatible = "qcom,sa8775p-gpdsp-anoc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   559  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   560  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   561  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   562  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   563  	lpass_ag_noc: interconnect-lpass-ag-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   564  		compatible = "qcom,sa8775p-lpass-ag-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   565  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   566  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   567  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   568  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   569  	mc_virt: interconnect-mc-virt {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   570  		compatible = "qcom,sa8775p-mc-virt";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   571  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   572  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   573  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   574  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   575  	mmss_noc: interconnect-mmss-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   576  		compatible = "qcom,sa8775p-mmss-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   577  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   578  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   579  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   580  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   581  	nspa_noc: interconnect-nspa-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   582  		compatible = "qcom,sa8775p-nspa-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   583  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   584  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   585  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   586  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   587  	nspb_noc: interconnect-nspb-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   588  		compatible = "qcom,sa8775p-nspb-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   589  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   590  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   591  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   592  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   593  	pcie_anoc: interconnect-pcie-anoc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   594  		compatible = "qcom,sa8775p-pcie-anoc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   595  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   596  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   597  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   598  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   599  	system_noc: interconnect-system-noc {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   600  		compatible = "qcom,sa8775p-system-noc";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   601  		#interconnect-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   602  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   603  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   604  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   605  	/* Will be updated by the bootloader. */
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   606  	memory@80000000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   607  		device_type = "memory";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   608  		reg = <0x0 0x80000000 0x0 0x0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   609  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   610  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   611  	qup_opp_table_100mhz: opp-table-qup100mhz {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   612  		compatible = "operating-points-v2";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   613  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   614  		opp-100000000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   615  			opp-hz = /bits/ 64 <100000000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   616  			required-opps = <&rpmhpd_opp_svs_l1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   617  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   618  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   619  
86c96823d4b5f0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-14   620  	pmu {
86c96823d4b5f0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-14   621  		compatible = "arm,armv8-pmuv3";
86c96823d4b5f0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-14   622  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
86c96823d4b5f0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-14   623  	};
86c96823d4b5f0 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-14   624  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   625  	psci {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   626  		compatible = "arm,psci-1.0";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   627  		method = "smc";
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   628  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   629  		cpu_pd0: power-domain-cpu0 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   630  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   631  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   632  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   633  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   634  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   635  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   636  		cpu_pd1: power-domain-cpu1 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   637  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   638  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   639  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   640  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   641  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   642  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   643  		cpu_pd2: power-domain-cpu2 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   644  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   645  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   646  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   647  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   648  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   649  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   650  		cpu_pd3: power-domain-cpu3 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   651  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   652  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   653  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   654  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   655  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   656  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   657  		cpu_pd4: power-domain-cpu4 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   658  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   659  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   660  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   661  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   662  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   663  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   664  		cpu_pd5: power-domain-cpu5 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   665  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   666  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   667  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   668  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   669  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   670  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   671  		cpu_pd6: power-domain-cpu6 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   672  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   673  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   674  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   675  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   676  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   677  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   678  		cpu_pd7: power-domain-cpu7 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   679  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   680  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   681  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   682  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   683  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   684  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   685  		cluster_0_pd: power-domain-cluster0 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   686  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   687  			domain-idle-states = <&cluster_sleep_gold>;
f275447923600b arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2025-03-27   688  			power-domains = <&system_pd>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   689  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   690  
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   691  		cluster_1_pd: power-domain-cluster1 {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   692  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   693  			domain-idle-states = <&cluster_sleep_gold>;
f275447923600b arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2025-03-27   694  			power-domains = <&system_pd>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   695  		};
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   696  
f275447923600b arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2025-03-27   697  		system_pd: power-domain-system {
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   698  			#power-domain-cells = <0>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22   699  			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
4f79d0deae37c2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-08-07   700  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   701  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   702  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   703  	reserved-memory {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   704  		#address-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   705  		#size-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   706  		ranges;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   707  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   708  		sail_ss_mem: sail-ss@80000000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   709  			reg = <0x0 0x80000000 0x0 0x10000000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   710  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   711  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   712  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   713  		hyp_mem: hyp@90000000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   714  			reg = <0x0 0x90000000 0x0 0x600000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   715  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   716  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   717  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   718  		xbl_boot_mem: xbl-boot@90600000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   719  			reg = <0x0 0x90600000 0x0 0x200000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   720  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   721  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   722  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   723  		aop_image_mem: aop-image@90800000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   724  			reg = <0x0 0x90800000 0x0 0x60000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   725  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   726  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   727  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   728  		aop_cmd_db_mem: aop-cmd-db@90860000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   729  			compatible = "qcom,cmd-db";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   730  			reg = <0x0 0x90860000 0x0 0x20000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   731  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   732  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   733  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   734  		uefi_log: uefi-log@908b0000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   735  			reg = <0x0 0x908b0000 0x0 0x10000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   736  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   737  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   738  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   739  		ddr_training_checksum: ddr-training-checksum@908c0000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   740  			reg = <0x0 0x908c0000 0x0 0x1000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   741  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   742  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   743  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   744  		reserved_mem: reserved@908f0000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   745  			reg = <0x0 0x908f0000 0x0 0xe000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   746  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   747  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   748  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   749  		secdata_apss_mem: secdata-apss@908fe000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   750  			reg = <0x0 0x908fe000 0x0 0x2000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   751  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   752  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   753  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   754  		smem_mem: smem@90900000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   755  			compatible = "qcom,smem";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   756  			reg = <0x0 0x90900000 0x0 0x200000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   757  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   758  			hwlocks = <&tcsr_mutex 3>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   759  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   760  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   761  		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   762  			reg = <0x0 0x90c00000 0x0 0x100000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   763  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   764  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   765  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   766  		sail_mailbox_mem: sail-ss@90d00000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   767  			reg = <0x0 0x90d00000 0x0 0x100000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   768  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   769  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   770  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   771  		sail_ota_mem: sail-ss@90e00000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   772  			reg = <0x0 0x90e00000 0x0 0x300000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   773  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   774  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   775  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   776  		aoss_backup_mem: aoss-backup@91b00000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   777  			reg = <0x0 0x91b00000 0x0 0x40000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   778  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   779  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   780  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   781  		cpucp_backup_mem: cpucp-backup@91b40000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   782  			reg = <0x0 0x91b40000 0x0 0x40000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   783  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   784  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   785  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   786  		tz_config_backup_mem: tz-config-backup@91b80000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   787  			reg = <0x0 0x91b80000 0x0 0x10000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   788  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   789  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   790  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   791  		ddr_training_data_mem: ddr-training-data@91b90000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   792  			reg = <0x0 0x91b90000 0x0 0x10000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   793  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   794  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   795  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   796  		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   797  			reg = <0x0 0x91ba0000 0x0 0x1000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   798  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   799  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   800  
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   801  		tz_ffi_mem: tz-ffi@91c00000 {
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   802  			compatible = "shared-dma-pool";
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   803  			reg = <0x0 0x91c00000 0x0 0x1400000>;
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   804  			no-map;
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   805  		};
d7aeff30093888 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-05-27   806  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   807  		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   808  			reg = <0x0 0x93b00000 0x0 0xf00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   809  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   810  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   811  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   812  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   813  			reg = <0x0 0x94a00000 0x0 0x800000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   814  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   815  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   816  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   817  		pil_camera_mem: pil-camera@95200000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   818  			reg = <0x0 0x95200000 0x0 0x500000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   819  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   820  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   821  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   822  		pil_adsp_mem: pil-adsp@95c00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   823  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   824  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   825  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   826  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   827  		pil_gdsp0_mem: pil-gdsp0@97b00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   828  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   829  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   830  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   831  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   832  		pil_gdsp1_mem: pil-gdsp1@99900000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   833  			reg = <0x0 0x99900000 0x0 0x1e00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   834  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   835  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   836  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   837  		pil_cdsp0_mem: pil-cdsp0@9b800000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   838  			reg = <0x0 0x9b800000 0x0 0x1e00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   839  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   840  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   841  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   842  		pil_gpu_mem: pil-gpu@9d600000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   843  			reg = <0x0 0x9d600000 0x0 0x2000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   844  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   845  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   846  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   847  		pil_cdsp1_mem: pil-cdsp1@9d700000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   848  			reg = <0x0 0x9d700000 0x0 0x1e00000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   849  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   850  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   851  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   852  		pil_cvp_mem: pil-cvp@9f500000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   853  			reg = <0x0 0x9f500000 0x0 0x700000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   854  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   855  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   856  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   857  		pil_video_mem: pil-video@9fc00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   858  			reg = <0x0 0x9fc00000 0x0 0x700000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   859  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   860  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   861  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   862  		audio_mdf_mem: audio-mdf-region@ae000000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   863  			reg = <0x0 0xae000000 0x0 0x1000000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   864  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   865  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   866  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   867  		firmware_mem: firmware-region@b0000000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   868  			reg = <0x0 0xb0000000 0x0 0x800000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   869  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   870  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   871  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   872  		hyptz_reserved_mem: hyptz-reserved@beb00000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   873  			reg = <0x0 0xbeb00000 0x0 0x11500000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   874  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   875  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   876  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   877  		scmi_mem: scmi-region@d0000000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   878  			reg = <0x0 0xd0000000 0x0 0x40000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   879  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   880  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   881  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   882  		firmware_logs_mem: firmware-logs@d0040000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   883  			reg = <0x0 0xd0040000 0x0 0x10000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   884  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   885  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   886  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   887  		firmware_audio_mem: firmware-audio@d0050000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   888  			reg = <0x0 0xd0050000 0x0 0x4000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   889  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   890  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   891  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   892  		firmware_reserved_mem: firmware-reserved@d0054000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   893  			reg = <0x0 0xd0054000 0x0 0x9c000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   894  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   895  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   896  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   897  		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   898  			reg = <0x0 0xd00f0000 0x0 0x10000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   899  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   900  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   901  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   902  		tags_mem: tags@d0100000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   903  			reg = <0x0 0xd0100000 0x0 0x1200000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   904  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   905  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   906  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   907  		qtee_mem: qtee@d1300000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   908  			reg = <0x0 0xd1300000 0x0 0x500000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   909  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   910  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   911  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   912  		deepsleep_backup_mem: deepsleep-backup@d1800000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   913  			reg = <0x0 0xd1800000 0x0 0x100000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   914  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   915  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   916  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   917  		trusted_apps_mem: trusted-apps@d1900000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   918  			reg = <0x0 0xd1900000 0x0 0x3800000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   919  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   920  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   921  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   922  		tz_stat_mem: tz-stat@db100000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   923  			reg = <0x0 0xdb100000 0x0 0x100000>;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   924  			no-map;
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   925  		};
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   926  
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   927  		cpucp_fw_mem: cpucp-fw@db200000 {
f9491ad2318d5c arch/arm64/boot/dts/qcom/sa8775p.dtsi Ninad Naik            2024-01-25   928  			reg = <0x0 0xdb200000 0x0 0x100000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   929  			no-map;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   930  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   931  	};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14   932  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   933  	smp2p-adsp {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   934  		compatible = "qcom,smp2p";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   935  		qcom,smem = <443>, <429>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   936  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   937  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   938  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   939  		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   940  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   941  		qcom,local-pid = <0>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   942  		qcom,remote-pid = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   943  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   944  		smp2p_adsp_out: master-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   945  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   946  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   947  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   948  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   949  		smp2p_adsp_in: slave-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   950  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   951  			interrupt-controller;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   952  			#interrupt-cells = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   953  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   954  	};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   955  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   956  	smp2p-cdsp0 {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   957  		compatible = "qcom,smp2p";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   958  		qcom,smem = <94>, <432>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   959  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   960  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   961  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   962  		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   963  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   964  		qcom,local-pid = <0>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   965  		qcom,remote-pid = <5>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   966  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   967  		smp2p_cdsp0_out: master-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   968  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   969  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   970  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   971  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   972  		smp2p_cdsp0_in: slave-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   973  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   974  			interrupt-controller;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   975  			#interrupt-cells = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   976  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   977  	};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   978  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   979  	smp2p-cdsp1 {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   980  		compatible = "qcom,smp2p";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   981  		qcom,smem = <617>, <616>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   982  		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   983  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   984  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   985  		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   986  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   987  		qcom,local-pid = <0>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   988  		qcom,remote-pid = <12>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   989  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   990  		smp2p_cdsp1_out: master-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   991  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   992  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   993  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   994  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   995  		smp2p_cdsp1_in: slave-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   996  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   997  			interrupt-controller;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   998  			#interrupt-cells = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05   999  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1000  	};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1001  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1002  	smp2p-gpdsp0 {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1003  		compatible = "qcom,smp2p";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1004  		qcom,smem = <617>, <616>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1005  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1006  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1007  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1008  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1009  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1010  		qcom,local-pid = <0>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1011  		qcom,remote-pid = <17>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1012  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1013  		smp2p_gpdsp0_out: master-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1014  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1015  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1016  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1017  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1018  		smp2p_gpdsp0_in: slave-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1019  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1020  			interrupt-controller;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1021  			#interrupt-cells = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1022  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1023  	};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1024  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1025  	smp2p-gpdsp1 {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1026  		compatible = "qcom,smp2p";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1027  		qcom,smem = <617>, <616>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1028  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1029  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1030  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1031  		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1032  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1033  		qcom,local-pid = <0>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1034  		qcom,remote-pid = <18>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1035  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1036  		smp2p_gpdsp1_out: master-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1037  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1038  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1039  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1040  
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1041  		smp2p_gpdsp1_in: slave-kernel {
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1042  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1043  			interrupt-controller;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1044  			#interrupt-cells = <2>;
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1045  		};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1046  	};
df54dcb34ff2ea arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-08-05  1047  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1048  	soc: soc@0 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1049  		compatible = "simple-bus";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1050  		#address-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1051  		#size-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1052  		ranges = <0 0 0 0 0x10 0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1053  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1054  		gcc: clock-controller@100000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1055  			compatible = "qcom,sa8775p-gcc";
3fd7e2eec8f4fe arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  1056  			reg = <0x0 0x00100000 0x0 0xc7018>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1057  			#clock-cells = <1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1058  			#reset-cells = <1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1059  			#power-domain-cells = <1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1060  			clocks = <&rpmhcc RPMH_CXO_CLK>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1061  				 <&sleep_clk>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1062  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1063  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1064  				 <0>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  1065  				 <&usb_0_qmpphy>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  1066  				 <&usb_1_qmpphy>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1067  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1068  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1069  				 <0>,
489f14be0e0a19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mrinmay Sarkar        2023-07-21  1070  				 <&pcie0_phy>,
489f14be0e0a19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mrinmay Sarkar        2023-07-21  1071  				 <&pcie1_phy>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1072  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1073  				 <0>,
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1074  				 <0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1075  			power-domains = <&rpmhpd SA8775P_CX>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1076  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1077  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1078  		ipcc: mailbox@408000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1079  			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
3fd7e2eec8f4fe arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  1080  			reg = <0x0 0x00408000 0x0 0x1000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1081  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1082  			interrupt-controller;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1083  			#interrupt-cells = <3>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1084  			#mbox-cells = <2>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1085  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  1086  
86348c7587f556 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-07  1087  		gpi_dma2: dma-controller@800000  {
a8d18df5a5a114 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-08  1088  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1089  			reg = <0x0 0x00800000 0x0 0x60000>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1090  			#dma-cells = <3>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1091  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1092  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1093  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1094  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1095  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1096  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1097  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1098  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1099  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1100  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1101  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1102  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1103  			dma-channels = <12>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1104  			dma-channel-mask = <0xfff>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1105  			iommus = <&apps_smmu 0x5b6 0x0>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1106  			status = "disabled";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1107  		};
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1108  
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1109  		qupv3_id_2: geniqup@8c0000 {
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1110  			compatible = "qcom,geni-se-qup";
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1111  			reg = <0x0 0x008c0000 0x0 0x6000>;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1112  			ranges;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1113  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1114  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1115  			clock-names = "m-ahb", "s-ahb";
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1116  			iommus = <&apps_smmu 0x5a3 0x0>;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1117  			#address-cells = <2>;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1118  			#size-cells = <2>;
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1119  			status = "disabled";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1120  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1121  			i2c14: i2c@880000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1122  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1123  				reg = <0x0 0x880000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1124  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1125  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1126  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1127  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1128  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1129  				pinctrl-0 = <&qup_i2c14_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1130  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1131  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1132  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1133  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1134  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1135  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1136  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1137  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1138  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1139  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1140  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1141  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1142  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1143  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1144  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1145  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1146  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1147  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1148  			spi14: spi@880000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1149  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1150  				reg = <0x0 0x880000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1151  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1152  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1153  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1154  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1155  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1156  				pinctrl-0 = <&qup_spi14_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1157  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1158  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1159  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1160  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1161  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1162  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1163  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1164  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1165  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1166  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1167  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1168  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1169  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1170  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1171  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1172  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1173  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1174  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1175  			uart14: serial@880000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1176  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1177  				reg = <0x0 0x00880000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1178  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1179  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1180  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1181  				pinctrl-0 = <&qup_uart14_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1182  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1183  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1184  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1185  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1186  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1187  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1188  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1189  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1190  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1191  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1192  			i2c15: i2c@884000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1193  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1194  				reg = <0x0 0x884000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1195  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1196  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1197  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1198  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1199  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1200  				pinctrl-0 = <&qup_i2c15_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1201  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1202  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1203  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1204  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1205  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1206  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1207  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1208  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1209  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1210  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1211  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1212  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1213  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1214  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1215  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1216  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1217  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1218  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1219  			spi15: spi@884000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1220  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1221  				reg = <0x0 0x884000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1222  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1223  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1224  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1225  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1226  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1227  				pinctrl-0 = <&qup_spi15_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1228  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1229  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1230  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1231  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1232  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1233  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1234  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1235  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1236  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1237  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1238  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1239  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1240  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1241  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1242  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1243  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1244  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1245  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1246  			uart15: serial@884000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1247  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1248  				reg = <0x0 0x00884000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1249  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1250  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1251  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1252  				pinctrl-0 = <&qup_uart15_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1253  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1254  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1255  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1256  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1257  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1258  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1259  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1260  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1261  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1262  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1263  			i2c16: i2c@888000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1264  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1265  				reg = <0x0 0x888000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1266  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1267  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1268  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1269  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1270  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1271  				pinctrl-0 = <&qup_i2c16_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1272  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1273  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1274  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1275  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1276  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1277  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1278  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1279  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1280  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1281  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1282  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1283  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1284  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1285  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1286  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1287  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1288  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1289  
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1290  			spi16: spi@888000 {
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1291  				compatible = "qcom,geni-spi";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1292  				reg = <0x0 0x00888000 0x0 0x4000>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1293  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1294  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1295  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1296  				pinctrl-0 = <&qup_spi16_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1297  				pinctrl-names = "default";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1298  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1299  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1300  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1301  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1302  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1303  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1304  				interconnect-names = "qup-core",
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1305  						     "qup-config",
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1306  						     "qup-memory";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1307  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1308  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1309  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1310  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1311  					    "rx";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1312  				#address-cells = <1>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1313  				#size-cells = <0>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1314  				status = "disabled";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1315  			};
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1316  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1317  			uart16: serial@888000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1318  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1319  				reg = <0x0 0x00888000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1320  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1321  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1322  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1323  				pinctrl-0 = <&qup_uart16_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1324  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1325  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1326  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1327  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1328  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1329  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1330  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1331  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1332  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1333  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1334  			i2c17: i2c@88c000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1335  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1336  				reg = <0x0 0x88c000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1337  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1338  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1339  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1340  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1341  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1342  				pinctrl-0 = <&qup_i2c17_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1343  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1344  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1345  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1346  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1347  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1348  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1349  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1350  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1351  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1352  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1353  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1354  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1355  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1356  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1357  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1358  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1359  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1360  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1361  			spi17: spi@88c000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1362  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1363  				reg = <0x0 0x88c000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1364  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1365  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1366  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1367  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1368  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1369  				pinctrl-0 = <&qup_spi17_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1370  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1371  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1372  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1373  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1374  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1375  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1376  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1377  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1378  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1379  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1380  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1381  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1382  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1383  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1384  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1385  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1386  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1387  
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1388  			uart17: serial@88c000 {
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1389  				compatible = "qcom,geni-uart";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1390  				reg = <0x0 0x0088c000 0x0 0x4000>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1391  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1392  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1393  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1394  				pinctrl-0 = <&qup_uart17_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1395  				pinctrl-names = "default";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1396  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1397  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1398  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1399  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1400  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1401  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1402  				status = "disabled";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1403  			};
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1404  
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1405  			i2c18: i2c@890000 {
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1406  				compatible = "qcom,geni-i2c";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1407  				reg = <0x0 0x00890000 0x0 0x4000>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1408  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1409  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1410  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1411  				pinctrl-0 = <&qup_i2c18_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1412  				pinctrl-names = "default";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1413  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1414  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1415  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1416  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1417  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1418  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1419  				interconnect-names = "qup-core",
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1420  						     "qup-config",
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1421  						     "qup-memory";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1422  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1423  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1424  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1425  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1426  					    "rx";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1427  				#address-cells = <1>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1428  				#size-cells = <0>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1429  				status = "disabled";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1430  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1431  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1432  			spi18: spi@890000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1433  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1434  				reg = <0x0 0x890000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1435  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1436  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1437  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1438  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1439  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1440  				pinctrl-0 = <&qup_spi18_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1441  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1442  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1443  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1444  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1445  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1446  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1447  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1448  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1449  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1450  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1451  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1452  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1453  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1454  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1455  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1456  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1457  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1458  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1459  			uart18: serial@890000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1460  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1461  				reg = <0x0 0x00890000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1462  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1463  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1464  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1465  				pinctrl-0 = <&qup_uart18_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1466  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1467  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1468  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1469  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1470  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1471  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1472  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1473  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1474  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1475  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1476  			i2c19: i2c@894000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1477  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1478  				reg = <0x0 0x894000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1479  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1480  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1481  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1482  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1483  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1484  				pinctrl-0 = <&qup_i2c19_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1485  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1486  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1487  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1488  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1489  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1490  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1491  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1492  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1493  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1494  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1495  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1496  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1497  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1498  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1499  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1500  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1501  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1502  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1503  			spi19: spi@894000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1504  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1505  				reg = <0x0 0x894000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1506  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1507  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1508  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1509  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1510  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1511  				pinctrl-0 = <&qup_spi19_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1512  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1513  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1514  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1515  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1516  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1517  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1518  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1519  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1520  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1521  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1522  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1523  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1524  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1525  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1526  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1527  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1528  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1529  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1530  			uart19: serial@894000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1531  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1532  				reg = <0x0 0x00894000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1533  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1534  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1535  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1536  				pinctrl-0 = <&qup_uart19_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1537  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1538  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1539  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1540  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1541  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1542  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1543  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1544  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1545  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1546  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1547  			i2c20: i2c@898000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1548  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1549  				reg = <0x0 0x898000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1550  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1551  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1552  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1553  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1554  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1555  				pinctrl-0 = <&qup_i2c20_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1556  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1557  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1558  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1559  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1560  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1561  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1562  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1563  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1564  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1565  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1566  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1567  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1568  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1569  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1570  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1571  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1572  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1573  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1574  			spi20: spi@898000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1575  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1576  				reg = <0x0 0x898000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1577  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1578  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1579  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1580  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1581  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1582  				pinctrl-0 = <&qup_spi20_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1583  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1584  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1585  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1586  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1587  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1588  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1589  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1590  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1591  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1592  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1593  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1594  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1595  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1596  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1597  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1598  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1599  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1600  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1601  			uart20: serial@898000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1602  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1603  				reg = <0x0 0x00898000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1604  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1605  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1606  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1607  				pinctrl-0 = <&qup_uart20_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1608  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1609  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1610  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1611  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1612  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1613  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1614  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1615  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1616  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1617  
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1618  		};
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  1619  
86348c7587f556 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-07  1620  		gpi_dma0: dma-controller@900000  {
a8d18df5a5a114 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-08  1621  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1622  			reg = <0x0 0x00900000 0x0 0x60000>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1623  			#dma-cells = <3>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1624  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1625  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1626  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1627  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1628  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1629  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1630  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1631  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1632  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1633  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1634  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1635  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1636  			dma-channels = <12>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1637  			dma-channel-mask = <0xfff>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1638  			iommus = <&apps_smmu 0x416 0x0>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1639  			status = "disabled";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1640  		};
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1641  
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1642  		qupv3_id_0: geniqup@9c0000 {
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1643  			compatible = "qcom,geni-se-qup";
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1644  			reg = <0x0 0x9c0000 0x0 0x6000>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1645  			#address-cells = <2>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1646  			#size-cells = <2>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1647  			ranges;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1648  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1649  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1650  				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1651  			iommus = <&apps_smmu 0x403 0x0>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1652  			status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1653  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1654  			i2c0: i2c@980000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1655  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1656  				reg = <0x0 0x980000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1657  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1658  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1659  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1660  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1661  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1662  				pinctrl-0 = <&qup_i2c0_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1663  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1664  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1665  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1666  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1667  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1668  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1669  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1670  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1671  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1672  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1673  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1674  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1675  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1676  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1677  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1678  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1679  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1680  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1681  			spi0: spi@980000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1682  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1683  				reg = <0x0 0x980000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1684  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1685  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1686  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1687  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1688  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1689  				pinctrl-0 = <&qup_spi0_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1690  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1691  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1692  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1693  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1694  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1695  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1696  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1697  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1698  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1699  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1700  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1701  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1702  				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1703  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1704  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1705  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1706  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1707  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1708  			uart0: serial@980000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1709  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1710  				reg = <0x0 0x980000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1711  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1712  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1713  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1714  				pinctrl-0 = <&qup_uart0_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1715  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1716  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1717  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1718  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1719  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1720  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1721  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1722  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1723  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1724  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1725  			i2c1: i2c@984000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1726  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1727  				reg = <0x0 0x984000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1728  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1729  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1730  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1731  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1732  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1733  				pinctrl-0 = <&qup_i2c1_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1734  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1735  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1736  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1737  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1738  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1739  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1740  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1741  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1742  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1743  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1744  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1745  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1746  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1747  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1748  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1749  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1750  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1751  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1752  			spi1: spi@984000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1753  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1754  				reg = <0x0 0x984000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1755  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1756  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1757  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1758  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1759  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1760  				pinctrl-0 = <&qup_spi1_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1761  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1762  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1763  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1764  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1765  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1766  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1767  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1768  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1769  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1770  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1771  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1772  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1773  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1774  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1775  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1776  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1777  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1778  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1779  			uart1: serial@984000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1780  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1781  				reg = <0x0 0x984000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1782  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1783  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1784  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1785  				pinctrl-0 = <&qup_uart1_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1786  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1787  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1788  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1789  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1790  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1791  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1792  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1793  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1794  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1795  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1796  			i2c2: i2c@988000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1797  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1798  				reg = <0x0 0x988000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1799  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1800  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1801  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1802  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1803  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1804  				pinctrl-0 = <&qup_i2c2_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1805  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1806  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1807  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1808  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1809  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1810  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1811  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1812  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1813  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1814  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1815  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1816  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1817  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1818  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1819  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1820  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1821  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1822  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1823  			spi2: spi@988000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1824  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1825  				reg = <0x0 0x988000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1826  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1827  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1828  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1829  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1830  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1831  				pinctrl-0 = <&qup_spi2_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1832  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1833  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1834  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1835  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1836  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1837  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1838  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1839  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1840  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1841  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1842  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1843  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1844  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1845  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1846  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1847  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1848  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1849  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1850  			uart2: serial@988000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1851  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1852  				reg = <0x0 0x988000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1853  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1854  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1855  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1856  				pinctrl-0 = <&qup_uart2_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1857  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1858  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1859  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1860  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1861  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1862  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1863  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1864  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1865  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1866  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1867  			i2c3: i2c@98c000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1868  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1869  				reg = <0x0 0x98c000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1870  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1871  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1872  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1873  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1874  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1875  				pinctrl-0 = <&qup_i2c3_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1876  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1877  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1878  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1879  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1880  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1881  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1882  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1883  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1884  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1885  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1886  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1887  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1888  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1889  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1890  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1891  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1892  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1893  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1894  			spi3: spi@98c000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1895  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1896  				reg = <0x0 0x98c000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1897  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1898  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1899  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1900  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1901  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1902  				pinctrl-0 = <&qup_spi3_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1903  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1904  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1905  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1906  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1907  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1908  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1909  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1910  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1911  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1912  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1913  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1914  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1915  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1916  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1917  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1918  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1919  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1920  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1921  			uart3: serial@98c000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1922  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1923  				reg = <0x0 0x98c000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1924  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1925  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1926  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1927  				pinctrl-0 = <&qup_uart3_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1928  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1929  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1930  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1931  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1932  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1933  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1934  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1935  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1936  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1937  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1938  			i2c4: i2c@990000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1939  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1940  				reg = <0x0 0x990000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1941  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1942  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1943  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1944  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1945  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1946  				pinctrl-0 = <&qup_i2c4_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1947  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1948  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1949  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1950  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1951  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1952  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1953  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1954  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1955  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1956  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1957  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1958  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1959  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1960  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1961  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1962  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1963  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1964  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1965  			spi4: spi@990000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1966  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1967  				reg = <0x0 0x990000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1968  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1969  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1970  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1971  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1972  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1973  				pinctrl-0 = <&qup_spi4_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1974  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1975  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1976  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1977  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1978  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1979  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1980  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1981  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1982  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1983  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1984  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1985  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1986  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1987  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  1988  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1989  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1990  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  1991  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1992  			uart4: serial@990000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1993  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1994  				reg = <0x0 0x990000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1995  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1996  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  1997  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1998  				pinctrl-0 = <&qup_uart4_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  1999  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2000  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2001  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2002  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2003  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2004  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2005  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2006  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2007  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2008  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2009  			i2c5: i2c@994000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2010  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2011  				reg = <0x0 0x994000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2012  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2013  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2014  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2015  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2016  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2017  				pinctrl-0 = <&qup_i2c5_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2018  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2019  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2020  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2021  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2022  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2023  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2024  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2025  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2026  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2027  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2028  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2029  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2030  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2031  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2032  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2033  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2034  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2035  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2036  			spi5: spi@994000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2037  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2038  				reg = <0x0 0x994000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2039  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2040  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2041  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2042  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2043  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2044  				pinctrl-0 = <&qup_spi5_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2045  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2046  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2047  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2048  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2049  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2050  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2051  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2052  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2053  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2054  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2055  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2056  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2057  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2058  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2059  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2060  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2061  			};
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2062  
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2063  			uart5: serial@994000 {
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2064  				compatible = "qcom,geni-uart";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2065  				reg = <0x0 0x994000 0x0 0x4000>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2066  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2067  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2068  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2069  				pinctrl-0 = <&qup_uart5_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2070  				pinctrl-names = "default";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2071  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2072  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2073  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2074  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2075  				interconnect-names = "qup-core", "qup-config";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2076  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2077  				status = "disabled";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2078  			};
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2079  		};
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2080  
86348c7587f556 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-07  2081  		gpi_dma1: dma-controller@a00000  {
a8d18df5a5a114 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-08  2082  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2083  			reg = <0x0 0x00a00000 0x0 0x60000>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2084  			#dma-cells = <3>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2085  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2086  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2087  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2088  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2089  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2090  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2091  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2092  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2093  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2094  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2095  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2096  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2097  			iommus = <&apps_smmu 0x456 0x0>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2098  			dma-channels = <12>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2099  			dma-channel-mask = <0xfff>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2100  			status = "disabled";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2101  		};
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2102  
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2103  		qupv3_id_1: geniqup@ac0000 {
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2104  			compatible = "qcom,geni-se-qup";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2105  			reg = <0x0 0x00ac0000 0x0 0x6000>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2106  			#address-cells = <2>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2107  			#size-cells = <2>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2108  			ranges;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2109  			clock-names = "m-ahb", "s-ahb";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2110  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2111  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2112  			iommus = <&apps_smmu 0x443 0x0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2113  			status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2114  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2115  			i2c7: i2c@a80000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2116  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2117  				reg = <0x0 0xa80000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2118  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2119  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2120  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2121  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2122  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2123  				pinctrl-0 = <&qup_i2c7_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2124  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2125  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2126  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2127  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2128  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2129  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2130  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2131  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2132  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2133  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2134  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2135  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2136  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2137  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2138  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2139  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2140  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2141  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2142  			spi7: spi@a80000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2143  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2144  				reg = <0x0 0xa80000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2145  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2146  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2147  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2148  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2149  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2150  				pinctrl-0 = <&qup_spi7_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2151  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2152  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2153  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2154  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2155  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2156  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2157  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2158  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2159  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2160  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2161  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2162  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2163  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2164  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2165  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2166  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2167  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2168  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2169  			uart7: serial@a80000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2170  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2171  				reg = <0x0 0x00a80000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2172  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2173  				clock-names = "se";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2174  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2175  				pinctrl-0 = <&qup_uart7_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2176  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2177  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2178  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2179  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2180  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2181  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2182  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2183  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2184  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2185  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2186  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2187  			i2c8: i2c@a84000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2188  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2189  				reg = <0x0 0xa84000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2190  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2191  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2192  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2193  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2194  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2195  				pinctrl-0 = <&qup_i2c8_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2196  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2197  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2198  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2199  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2200  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2201  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2202  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2203  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2204  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2205  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2206  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2207  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2208  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2209  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2210  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2211  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2212  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2213  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2214  			spi8: spi@a84000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2215  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2216  				reg = <0x0 0xa84000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2217  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2218  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2219  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2220  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2221  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2222  				pinctrl-0 = <&qup_spi8_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2223  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2224  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2225  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2226  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2227  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2228  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2229  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2230  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2231  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2232  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2233  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2234  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2235  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2236  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2237  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2238  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2239  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2240  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2241  			uart8: serial@a84000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2242  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2243  				reg = <0x0 0x00a84000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2244  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2245  				clock-names = "se";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2246  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2247  				pinctrl-0 = <&qup_uart8_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2248  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2249  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2250  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2251  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2252  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2253  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2254  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2255  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2256  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2257  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2258  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2259  			i2c9: i2c@a88000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2260  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2261  				reg = <0x0 0xa88000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2262  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2263  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2264  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2265  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2266  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2267  				pinctrl-0 = <&qup_i2c9_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2268  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2269  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2270  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2271  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2272  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2273  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2274  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2275  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2276  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2277  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2278  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2279  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2280  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2281  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2282  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2283  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2284  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2285  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2286  			spi9: spi@a88000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2287  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2288  				reg = <0x0 0xa88000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2289  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2290  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2291  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2292  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2293  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2294  				pinctrl-0 = <&qup_spi9_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2295  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2296  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2297  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2298  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2299  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2300  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2301  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2302  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2303  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2304  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2305  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2306  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2307  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2308  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2309  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2310  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2311  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2312  
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2313  			uart9: serial@a88000 {
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2314  				compatible = "qcom,geni-uart";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2315  				reg = <0x0 0xa88000 0x0 0x4000>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2316  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2317  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2318  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2319  				pinctrl-0 = <&qup_uart9_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2320  				pinctrl-names = "default";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2321  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2322  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2323  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2324  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2325  				interconnect-names = "qup-core", "qup-config";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2326  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2327  				status = "disabled";
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2328  			};
445a523d462432 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2329  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2330  			i2c10: i2c@a8c000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2331  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2332  				reg = <0x0 0xa8c000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2333  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2334  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2335  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2336  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2337  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2338  				pinctrl-0 = <&qup_i2c10_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2339  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2340  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2341  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2342  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2343  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2344  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2345  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2346  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2347  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2348  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2349  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2350  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2351  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2352  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2353  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2354  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2355  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2356  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2357  			spi10: spi@a8c000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2358  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2359  				reg = <0x0 0xa8c000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2360  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2361  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2362  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2363  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2364  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2365  				pinctrl-0 = <&qup_spi10_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2366  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2367  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2368  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2369  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2370  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2371  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2372  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2373  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2374  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2375  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2376  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2377  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2378  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2379  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2380  					    "rx";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2381  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2382  			};
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2383  
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2384  			uart10: serial@a8c000 {
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2385  				compatible = "qcom,geni-uart";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2386  				reg = <0x0 0x00a8c000 0x0 0x4000>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2387  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2388  				clock-names = "se";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2389  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2390  				pinctrl-0 = <&qup_uart10_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2391  				pinctrl-names = "default";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2392  				interconnect-names = "qup-core", "qup-config";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2393  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2394  						 &clk_virt SLAVE_QUP_CORE_1 0>,
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2395  						<&gem_noc MASTER_APPSS_PROC 0
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2396  						 &config_noc SLAVE_QUP_1 0>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2397  				power-domains = <&rpmhpd SA8775P_CX>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2398  				operating-points-v2 = <&qup_opp_table_100mhz>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2399  				status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2400  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2401  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2402  			i2c11: i2c@a90000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2403  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2404  				reg = <0x0 0xa90000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2405  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2406  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2407  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2408  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2409  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2410  				pinctrl-0 = <&qup_i2c11_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2411  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2412  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2413  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2414  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2415  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2416  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2417  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2418  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2419  						     "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2420  						     "qup-memory";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2421  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2422  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2423  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2424  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2425  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2426  				status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2427  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2428  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2429  			spi11: spi@a90000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2430  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2431  				reg = <0x0 0xa90000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2432  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2433  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2434  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2435  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2436  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2437  				pinctrl-0 = <&qup_spi11_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2438  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2439  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2440  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2441  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2442  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2443  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2444  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2445  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2446  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2447  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2448  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2449  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2450  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2451  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2452  					    "rx";
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2453  				status = "disabled";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2454  			};
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2455  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2456  			uart11: serial@a90000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2457  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2458  				reg = <0x0 0x00a90000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2459  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2460  				clock-names = "se";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2461  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2462  				pinctrl-0 = <&qup_uart11_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2463  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2464  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2465  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2466  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2467  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2468  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2469  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2470  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2471  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2472  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2473  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2474  			i2c12: i2c@a94000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2475  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2476  				reg = <0x0 0xa94000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2477  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2478  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2479  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2480  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2481  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2482  				pinctrl-0 = <&qup_i2c12_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2483  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2484  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2485  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2486  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2487  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2488  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2489  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2490  				interconnect-names = "qup-core",
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2491  						     "qup-config",
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2492  						     "qup-memory";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2493  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2494  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2495  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2496  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2497  					    "rx";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2498  				status = "disabled";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2499  			};
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2500  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2501  			spi12: spi@a94000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2502  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2503  				reg = <0x0 0xa94000 0x0 0x4000>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2504  				#address-cells = <1>;
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2505  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2506  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2507  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2508  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2509  				pinctrl-0 = <&qup_spi12_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2510  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2511  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2512  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2513  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2514  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2515  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2516  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2517  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2518  						     "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2519  						     "qup-memory";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2520  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2521  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2522  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2523  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2524  					    "rx";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2525  				status = "disabled";
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2526  			};
cfd975f588400e arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2527  
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2528  			uart12: serial@a94000 {
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2529  				compatible = "qcom,geni-uart";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2530  				reg = <0x0 0x00a94000 0x0 0x4000>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2531  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2532  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2533  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2534  				pinctrl-0 = <&qup_uart12_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2535  				pinctrl-names = "default";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2536  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2537  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2538  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2539  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2540  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2541  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2542  				status = "disabled";
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2543  			};
41ae5ca448c21a arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2544  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2545  			i2c13: i2c@a98000 {
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2546  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2547  				reg = <0x0 0xa98000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2548  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2549  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2550  				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2551  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2552  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2553  				pinctrl-0 = <&qup_i2c13_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2554  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2555  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2556  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2557  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2558  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2559  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2560  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2561  				interconnect-names = "qup-core",
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2562  						     "qup-config",
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2563  						     "qup-memory";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2564  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2565  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2566  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2567  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2568  					    "rx";
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2569  				status = "disabled";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2570  
a23d122572a4ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2571  			};
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2572  		};
dc3ad22112de7f arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-09  2573  
86348c7587f556 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-07  2574  		gpi_dma3: dma-controller@b00000  {
a8d18df5a5a114 arch/arm64/boot/dts/qcom/sa8775p.dtsi Konrad Dybcio         2024-11-08  2575  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2576  			reg = <0x0 0x00b00000 0x0 0x58000>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2577  			#dma-cells = <3>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2578  			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2579  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2580  				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2581  				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2582  			iommus = <&apps_smmu 0x056 0x0>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2583  			dma-channels = <4>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2584  			dma-channel-mask = <0xf>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2585  			status = "disabled";
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2586  		};
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2587  
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2588  		qupv3_id_3: geniqup@bc0000 {
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2589  			compatible = "qcom,geni-se-qup";
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2590  			reg = <0x0 0xbc0000 0x0 0x6000>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2591  			#address-cells = <2>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2592  			#size-cells = <2>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2593  			ranges;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2594  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2595  			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2596  				<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
07e3e17205794c arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2597  			iommus = <&apps_smmu 0x43 0x0>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2598  			status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2599  
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2600  			i2c21: i2c@b80000 {
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2601  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2602  				reg = <0x0 0xb80000 0x0 0x4000>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2603  				#address-cells = <1>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2604  				#size-cells = <0>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2605  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2606  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2607  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2608  				pinctrl-0 = <&qup_i2c21_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2609  				pinctrl-names = "default";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2610  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2611  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2612  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2613  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2614  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2615  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2616  				interconnect-names = "qup-core",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2617  							 "qup-config",
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2618  							 "qup-memory";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2619  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2620  				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2621  				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2622  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2623  					    "rx";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2624  				status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2625  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2626  
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2627  			spi21: spi@b80000 {
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2628  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2629  				reg = <0x0 0xb80000 0x0 0x4000>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2630  				#address-cells = <1>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2631  				#size-cells = <0>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2632  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2633  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2634  				clock-names = "se";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2635  				pinctrl-0 = <&qup_spi21_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2636  				pinctrl-names = "default";
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2637  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2638  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2639  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2640  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2641  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2642  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2643  				interconnect-names = "qup-core",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2644  							 "qup-config",
ee2f5f906d69d9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-05-26  2645  							 "qup-memory";
f95f988cf7b609 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  2646  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2647  				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2648  				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2649  				dma-names = "tx",
34d17ccb5db804 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-21  2650  					    "rx";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2651  				status = "disabled";
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2652  			};
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2653  
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2654  			uart21: serial@b80000 {
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2655  				compatible = "qcom,geni-uart";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2656  				reg = <0x0 0x00b80000 0x0 0x4000>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2657  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2658  				clock-names = "se";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2659  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2660  				interconnect-names = "qup-core", "qup-config";
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2661  				pinctrl-0 = <&qup_uart21_default>;
b0334269743599 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2025-05-09  2662  				pinctrl-names = "default";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2663  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2664  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2665  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2666  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2667  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2668  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2669  				status = "disabled";
34a407316b7d37 arch/arm64/boot/dts/qcom/sa8775p.dtsi Viken Dadhaniya       2024-10-07  2670  			};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2671  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  2672  
2d04f31103921b arch/arm64/boot/dts/qcom/sa8775p.dtsi Om Prakash Singh      2023-10-16  2673  		rng: rng@10d2000 {
2d04f31103921b arch/arm64/boot/dts/qcom/sa8775p.dtsi Om Prakash Singh      2023-10-16  2674  			compatible = "qcom,sa8775p-trng", "qcom,trng";
2d04f31103921b arch/arm64/boot/dts/qcom/sa8775p.dtsi Om Prakash Singh      2023-10-16  2675  			reg = <0 0x010d2000 0 0x1000>;
2d04f31103921b arch/arm64/boot/dts/qcom/sa8775p.dtsi Om Prakash Singh      2023-10-16  2676  		};
2d04f31103921b arch/arm64/boot/dts/qcom/sa8775p.dtsi Om Prakash Singh      2023-10-16  2677  
15288649e4c037 arch/arm64/boot/dts/qcom/sa8775p.dtsi Manivannan Sadhasivam 2024-05-14  2678  		ufs_mem_hc: ufshc@1d84000 {
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2679  			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2680  			reg = <0x0 0x01d84000 0x0 0x3000>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2681  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2682  			phys = <&ufs_mem_phy>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2683  			phy-names = "ufsphy";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2684  			lanes-per-direction = <2>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2685  			#reset-cells = <1>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2686  			resets = <&gcc GCC_UFS_PHY_BCR>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2687  			reset-names = "rst";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2688  			power-domains = <&gcc UFS_PHY_GDSC>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2689  			required-opps = <&rpmhpd_opp_nom>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2690  			iommus = <&apps_smmu 0x100 0x0>;
2b967894f80aac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-05-15  2691  			dma-coherent;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2692  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2693  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2694  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2695  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2696  				 <&rpmhcc RPMH_CXO_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2697  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2698  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2699  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2700  			clock-names = "core_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2701  				      "bus_aggr_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2702  				      "iface_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2703  				      "core_clk_unipro",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2704  				      "ref_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2705  				      "tx_lane0_sync_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2706  				      "rx_lane0_sync_clk",
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2707  				      "rx_lane1_sync_clk";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2708  			freq-table-hz = <75000000 300000000>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2709  					<0 0>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2710  					<0 0>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2711  					<75000000 300000000>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2712  					<0 0>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2713  					<0 0>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2714  					<0 0>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2715  					<0 0>;
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2716  			qcom,ice = <&ice>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2717  			status = "disabled";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2718  		};
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2719  
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2720  		ufs_mem_phy: phy@1d87000 {
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2721  			compatible = "qcom,sa8775p-qmp-ufs-phy";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2722  			reg = <0x0 0x01d87000 0x0 0xe10>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2723  			/*
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2724  			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2725  			 * enables the CXO clock to eDP *and* UFS PHY.
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2726  			 */
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2727  			clocks = <&rpmhcc RPMH_CXO_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2728  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2729  				 <&gcc GCC_EDP_REF_CLKREF_EN>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2730  			clock-names = "ref", "ref_aux", "qref";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2731  			power-domains = <&gcc UFS_PHY_GDSC>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2732  			resets = <&ufs_mem_hc 0>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2733  			reset-names = "ufsphy";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2734  			#phy-cells = <0>;
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2735  			status = "disabled";
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2736  		};
be543efeee17b9 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-11  2737  
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2738  		ice: crypto@1d88000 {
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2739  			compatible = "qcom,sa8775p-inline-crypto-engine",
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2740  				     "qcom,inline-crypto-engine";
dcf8ef1c8d3046 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2024-10-07  2741  			reg = <0x0 0x01d88000 0x0 0x18000>;
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2742  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2743  		};
96272ba7103d45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-09-13  2744  
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2745  		cryptobam: dma-controller@1dc4000 {
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2746  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2747  			reg = <0x0 0x01dc4000 0x0 0x28000>;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2748  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2749  			#dma-cells = <1>;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2750  			qcom,ee = <0>;
a2517331f11bd2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Stephan Gerhold       2025-02-12  2751  			qcom,num-ees = <4>;
a2517331f11bd2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Stephan Gerhold       2025-02-12  2752  			num-channels = <20>;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2753  			qcom,controlled-remotely;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2754  			iommus = <&apps_smmu 0x480 0x00>,
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2755  				 <&apps_smmu 0x481 0x00>;
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2756  		};
7ff3da43ef4453 arch/arm64/boot/dts/qcom/sa8775p.dtsi Yuvaraj Ranganathan   2024-10-17  2757  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2758  		ctcu@4001000 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2759  			compatible = "qcom,sa8775p-ctcu";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2760  			reg = <0x0 0x04001000 0x0 0x1000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2761  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2762  			clocks = <&aoss_qmp>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2763  			clock-names = "apb";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2764  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2765  			in-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2766  				#address-cells = <1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2767  				#size-cells = <0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2768  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2769  				port@0 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2770  					reg = <0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2771  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2772  					ctcu_in0: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2773  						remote-endpoint = <&etr0_out>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2774  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2775  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2776  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2777  				port@1 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2778  					reg = <1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2779  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2780  					ctcu_in1: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2781  						remote-endpoint = <&etr1_out>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2782  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2783  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2784  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2785  		};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2786  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2787  		stm: stm@4002000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2788  			compatible = "arm,coresight-stm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2789  			reg = <0x0 0x4002000 0x0 0x1000>,
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2790  				  <0x0 0x16280000 0x0 0x180000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2791  			reg-names = "stm-base", "stm-stimulus-base";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2792  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2793  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2794  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2795  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2796  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2797  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2798  					stm_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2799  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2800  						<&funnel0_in7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2801  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2802  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2803  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2804  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2805  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2806  		tpdm@4003000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2807  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2808  			reg = <0x0 0x4003000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2809  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2810  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2811  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2812  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2813  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2814  			qcom,cmb-msrs-num = <32>;
8a6442ec343708 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-12-19  2815  			status = "disabled";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2816  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2817  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2818  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2819  					qdss_tpdm0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2820  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2821  						<&qdss_tpda_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2822  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2823  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2824  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2825  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2826  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2827  		tpda@4004000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2828  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2829  			reg = <0x0 0x4004000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2830  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2831  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2832  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2833  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2834  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2835  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2836  					qdss_tpda_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2837  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2838  						<&funnel0_in6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2839  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2840  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2841  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2842  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2843  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2844  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2845  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2846  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2847  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2848  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2849  					qdss_tpda_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2850  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2851  						<&qdss_tpdm0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2852  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2853  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2854  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2855  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2856  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2857  					qdss_tpda_in1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2858  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2859  						<&qdss_tpdm1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2860  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2861  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2862  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2863  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2864  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2865  		tpdm@400f000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2866  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2867  			reg = <0x0 0x400f000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2868  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2869  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2870  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2871  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2872  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2873  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2874  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2875  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2876  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2877  					qdss_tpdm1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2878  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2879  						<&qdss_tpda_in1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2880  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2881  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2882  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2883  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2884  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2885  		funnel@4041000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2886  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2887  			reg = <0x0 0x4041000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2888  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2889  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2890  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2891  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2892  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2893  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2894  					funnel0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2895  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2896  						<&qdss_funnel_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2897  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2898  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2899  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2900  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2901  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2902  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2903  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2904  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2905  				port@6 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2906  					reg = <6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2907  					funnel0_in6: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2908  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2909  						<&qdss_tpda_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2910  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2911  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2912  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2913  				port@7 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2914  					reg = <7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2915  					funnel0_in7: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2916  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2917  						<&stm_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2918  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2919  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2920  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2921  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2922  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2923  		funnel@4042000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2924  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2925  			reg = <0x0 0x4042000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2926  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2927  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2928  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2929  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2930  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2931  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2932  					funnel1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2933  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2934  						<&qdss_funnel_in1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2935  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2936  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2937  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2938  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2939  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2940  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2941  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2942  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2943  				port@4 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2944  					reg = <4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2945  					funnel1_in4: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2946  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2947  						<&apss_funnel1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2948  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2949  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2950  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2951  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2952  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2953  		funnel@4045000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2954  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2955  			reg = <0x0 0x4045000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2956  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2957  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2958  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2959  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2960  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2961  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2962  					qdss_funnel_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2963  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2964  						<&aoss_funnel_in7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2965  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2966  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2967  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2968  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2969  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2970  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2971  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2972  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2973  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2974  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2975  					qdss_funnel_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2976  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2977  						<&funnel0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2978  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2979  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2980  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2981  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2982  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2983  					qdss_funnel_in1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2984  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2985  						<&funnel1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2986  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2987  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2988  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2989  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  2990  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2991  		replicator@4046000 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2992  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2993  			reg = <0x0 0x04046000 0x0 0x1000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2994  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2995  			clocks = <&aoss_qmp>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2996  			clock-names = "apb_pclk";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2997  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2998  			in-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  2999  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3000  					qdss_rep_in: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3001  						remote-endpoint = <&swao_rep_out0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3002  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3003  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3004  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3005  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3006  			out-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3007  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3008  					qdss_rep_out0: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3009  						remote-endpoint = <&etr_rep_in>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3010  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3011  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3012  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3013  		};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3014  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3015  		tmc_etr: tmc@4048000 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3016  			compatible = "arm,coresight-tmc", "arm,primecell";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3017  			reg = <0x0 0x04048000 0x0 0x1000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3018  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3019  			clocks = <&aoss_qmp>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3020  			clock-names = "apb_pclk";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3021  			iommus = <&apps_smmu 0x04c0 0x00>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3022  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3023  			arm,scatter-gather;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3024  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3025  			in-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3026  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3027  					etr0_in: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3028  						remote-endpoint = <&etr_rep_out0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3029  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3030  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3031  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3032  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3033  			out-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3034  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3035  					etr0_out: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3036  						remote-endpoint = <&ctcu_in0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3037  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3038  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3039  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3040  		};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3041  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3042  		replicator@404e000 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3043  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3044  			reg = <0x0 0x0404e000 0x0 0x1000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3045  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3046  			clocks = <&aoss_qmp>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3047  			clock-names = "apb_pclk";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3048  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3049  			in-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3050  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3051  					etr_rep_in: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3052  						remote-endpoint = <&qdss_rep_out0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3053  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3054  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3055  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3056  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3057  			out-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3058  				#address-cells = <1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3059  				#size-cells = <0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3060  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3061  				port@0 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3062  					reg = <0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3063  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3064  					etr_rep_out0: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3065  						remote-endpoint = <&etr0_in>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3066  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3067  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3068  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3069  				port@1 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3070  					reg = <1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3071  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3072  					etr_rep_out1: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3073  						remote-endpoint = <&etr1_in>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3074  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3075  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3076  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3077  		};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3078  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3079  		tmc_etr1: tmc@404f000 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3080  			compatible = "arm,coresight-tmc", "arm,primecell";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3081  			reg = <0x0 0x0404f000 0x0 0x1000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3082  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3083  			clocks = <&aoss_qmp>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3084  			clock-names = "apb_pclk";
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3085  			iommus = <&apps_smmu 0x04a0 0x40>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3086  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3087  			arm,scatter-gather;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3088  			arm,buffer-size = <0x400000>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3089  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3090  			in-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3091  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3092  					etr1_in: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3093  						remote-endpoint = <&etr_rep_out1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3094  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3095  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3096  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3097  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3098  			out-ports {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3099  				port {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3100  					etr1_out: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3101  						remote-endpoint = <&ctcu_in1>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3102  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3103  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3104  			};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3105  		};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3106  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3107  		funnel@4b04000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3108  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3109  			reg = <0x0 0x4b04000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3110  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3111  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3112  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3113  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3114  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3115  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3116  					aoss_funnel_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3117  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3118  						<&etf0_in>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3119  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3120  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3121  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3122  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3123  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3124  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3125  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3126  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3127  				port@6 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3128  					reg = <6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3129  					aoss_funnel_in6: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3130  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3131  						<&aoss_tpda_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3132  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3133  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3134  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3135  				port@7 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3136  					reg = <7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3137  					aoss_funnel_in7: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3138  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3139  						<&qdss_funnel_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3140  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3141  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3142  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3143  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3144  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3145  		tmc_etf: tmc@4b05000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3146  			compatible = "arm,coresight-tmc", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3147  			reg = <0x0 0x4b05000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3148  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3149  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3150  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3151  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3152  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3153  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3154  					etf0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3155  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3156  						<&swao_rep_in>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3157  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3158  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3159  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3160  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3161  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3162  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3163  					etf0_in: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3164  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3165  						<&aoss_funnel_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3166  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3167  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3168  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3169  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3170  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3171  		replicator@4b06000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3172  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3173  			reg = <0x0 0x4b06000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3174  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3175  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3176  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3177  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3178  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3179  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3180  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3181  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3182  				port@0 {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3183  					reg = <0>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3184  
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3185  					swao_rep_out0: endpoint {
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3186  						remote-endpoint = <&qdss_rep_in>;
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3187  					};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3188  				};
05ed68070d7a06 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2025-03-03  3189  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3190  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3191  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3192  					swao_rep_out1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3193  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3194  						<&eud_in>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3195  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3196  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3197  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3198  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3199  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3200  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3201  					swao_rep_in: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3202  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3203  						<&etf0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3204  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3205  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3206  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3207  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3208  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3209  		tpda@4b08000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3210  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3211  			reg = <0x0 0x4b08000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3212  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3213  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3214  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3215  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3216  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3217  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3218  					aoss_tpda_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3219  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3220  						<&aoss_funnel_in6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3221  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3222  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3223  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3224  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3225  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3226  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3227  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3228  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3229  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3230  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3231  					aoss_tpda_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3232  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3233  						<&aoss_tpdm0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3234  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3235  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3236  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3237  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3238  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3239  					aoss_tpda_in1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3240  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3241  						<&aoss_tpdm1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3242  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3243  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3244  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3245  				port@2 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3246  					reg = <2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3247  					aoss_tpda_in2: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3248  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3249  						<&aoss_tpdm2_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3250  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3251  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3252  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3253  				port@3 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3254  					reg = <3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3255  					aoss_tpda_in3: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3256  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3257  						<&aoss_tpdm3_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3258  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3259  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3260  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3261  				port@4 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3262  					reg = <4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3263  					aoss_tpda_in4: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3264  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3265  						<&aoss_tpdm4_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3266  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3267  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3268  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3269  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3270  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3271  		tpdm@4b09000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3272  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3273  			reg = <0x0 0x4b09000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3274  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3275  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3276  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3277  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3278  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3279  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3280  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3281  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3282  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3283  					aoss_tpdm0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3284  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3285  						<&aoss_tpda_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3286  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3287  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3288  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3289  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3290  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3291  		tpdm@4b0a000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3292  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3293  			reg = <0x0 0x4b0a000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3294  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3295  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3296  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3297  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3298  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3299  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3300  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3301  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3302  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3303  					aoss_tpdm1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3304  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3305  						<&aoss_tpda_in1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3306  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3307  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3308  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3309  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3310  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3311  		tpdm@4b0b000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3312  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3313  			reg = <0x0 0x4b0b000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3314  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3315  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3316  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3317  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3318  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3319  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3320  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3321  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3322  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3323  					aoss_tpdm2_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3324  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3325  						<&aoss_tpda_in2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3326  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3327  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3328  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3329  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3330  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3331  		tpdm@4b0c000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3332  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3333  			reg = <0x0 0x4b0c000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3334  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3335  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3336  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3337  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3338  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3339  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3340  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3341  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3342  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3343  					aoss_tpdm3_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3344  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3345  						<&aoss_tpda_in3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3346  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3347  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3348  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3349  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3350  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3351  		tpdm@4b0d000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3352  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3353  			reg = <0x0 0x4b0d000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3354  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3355  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3356  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3357  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3358  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3359  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3360  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3361  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3362  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3363  					aoss_tpdm4_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3364  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3365  						<&aoss_tpda_in4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3366  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3367  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3368  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3369  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3370  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3371  		aoss_cti: cti@4b13000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3372  			compatible = "arm,coresight-cti", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3373  			reg = <0x0 0x4b13000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3374  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3375  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3376  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3377  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3378  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3379  		etm@6040000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3380  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3381  			reg = <0x0 0x6040000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3382  			cpu = <&cpu0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3383  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3384  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3385  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3386  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3387  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3388  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3389  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3390  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3391  					etm0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3392  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3393  						<&apss_funnel0_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3394  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3395  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3396  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3397  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3398  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3399  		etm@6140000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3400  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3401  			reg = <0x0 0x6140000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3402  			cpu = <&cpu1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3403  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3404  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3405  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3406  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3407  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3408  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3409  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3410  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3411  					etm1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3412  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3413  						<&apss_funnel0_in1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3414  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3415  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3416  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3417  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3418  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3419  		etm@6240000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3420  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3421  			reg = <0x0 0x6240000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3422  			cpu = <&cpu2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3423  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3424  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3425  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3426  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3427  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3428  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3429  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3430  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3431  					etm2_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3432  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3433  						<&apss_funnel0_in2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3434  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3435  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3436  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3437  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3438  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3439  		etm@6340000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3440  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3441  			reg = <0x0 0x6340000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3442  			cpu = <&cpu3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3443  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3444  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3445  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3446  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3447  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3448  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3449  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3450  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3451  					etm3_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3452  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3453  						<&apss_funnel0_in3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3454  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3455  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3456  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3457  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3458  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3459  		etm@6440000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3460  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3461  			reg = <0x0 0x6440000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3462  			cpu = <&cpu4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3463  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3464  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3465  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3466  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3467  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3468  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3469  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3470  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3471  					etm4_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3472  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3473  						<&apss_funnel0_in4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3474  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3475  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3476  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3477  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3478  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3479  		etm@6540000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3480  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3481  			reg = <0x0 0x6540000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3482  			cpu = <&cpu5>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3483  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3484  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3485  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3486  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3487  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3488  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3489  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3490  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3491  					etm5_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3492  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3493  						<&apss_funnel0_in5>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3494  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3495  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3496  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3497  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3498  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3499  		etm@6640000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3500  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3501  			reg = <0x0 0x6640000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3502  			cpu = <&cpu6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3503  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3504  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3505  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3506  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3507  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3508  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3509  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3510  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3511  					etm6_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3512  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3513  						<&apss_funnel0_in6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3514  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3515  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3516  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3517  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3518  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3519  		etm@6740000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3520  			compatible = "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3521  			reg = <0x0 0x6740000 0x0 0x1000>;
6a3649903ccd95 arch/arm64/boot/dts/qcom/sa8775p.dtsi Krzysztof Kozlowski   2024-10-22  3522  			cpu = <&cpu7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3523  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3524  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3525  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3526  			arm,coresight-loses-context-with-cpu;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3527  			qcom,skip-power-up;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3528  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3529  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3530  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3531  					etm7_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3532  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3533  						<&apss_funnel0_in7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3534  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3535  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3536  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3537  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3538  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3539  		funnel@6800000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3540  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3541  			reg = <0x0 0x6800000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3542  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3543  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3544  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3545  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3546  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3547  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3548  					apss_funnel0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3549  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3550  						<&apss_funnel1_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3551  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3552  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3553  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3554  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3555  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3556  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3557  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3558  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3559  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3560  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3561  					apss_funnel0_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3562  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3563  						<&etm0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3564  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3565  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3566  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3567  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3568  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3569  					apss_funnel0_in1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3570  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3571  						<&etm1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3572  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3573  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3574  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3575  				port@2 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3576  					reg = <2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3577  					apss_funnel0_in2: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3578  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3579  						<&etm2_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3580  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3581  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3582  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3583  				port@3 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3584  					reg = <3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3585  					apss_funnel0_in3: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3586  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3587  						<&etm3_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3588  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3589  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3590  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3591  				port@4 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3592  					reg = <4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3593  					apss_funnel0_in4: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3594  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3595  						<&etm4_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3596  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3597  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3598  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3599  				port@5 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3600  					reg = <5>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3601  					apss_funnel0_in5: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3602  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3603  						<&etm5_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3604  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3605  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3606  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3607  				port@6 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3608  					reg = <6>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3609  					apss_funnel0_in6: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3610  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3611  						<&etm6_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3612  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3613  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3614  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3615  				port@7 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3616  					reg = <7>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3617  					apss_funnel0_in7: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3618  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3619  						<&etm7_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3620  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3621  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3622  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3623  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3624  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3625  		funnel@6810000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3626  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3627  			reg = <0x0 0x6810000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3628  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3629  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3630  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3631  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3632  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3633  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3634  					apss_funnel1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3635  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3636  						<&funnel1_in4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3637  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3638  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3639  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3640  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3641  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3642  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3643  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3644  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3645  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3646  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3647  					apss_funnel1_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3648  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3649  						<&apss_funnel0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3650  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3651  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3652  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3653  				port@3 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3654  					reg = <3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3655  					apss_funnel1_in3: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3656  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3657  						<&apss_tpda_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3658  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3659  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3660  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3661  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3662  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3663  		tpdm@6860000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3664  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3665  			reg = <0x0 0x6860000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3666  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3667  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3668  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3669  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3670  			qcom,cmb-element-bits = <64>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3671  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3672  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3673  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3674  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3675  					apss_tpdm3_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3676  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3677  						<&apss_tpda_in3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3678  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3679  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3680  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3681  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3682  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3683  		tpdm@6861000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3684  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3685  			reg = <0x0 0x6861000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3686  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3687  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3688  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3689  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3690  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3691  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3692  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3693  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3694  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3695  					apss_tpdm4_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3696  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3697  						<&apss_tpda_in4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3698  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3699  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3700  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3701  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3702  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3703  		tpda@6863000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3704  			compatible = "qcom,coresight-tpda", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3705  			reg = <0x0 0x6863000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3706  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3707  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3708  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3709  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3710  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3711  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3712  					apss_tpda_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3713  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3714  						<&apss_funnel1_in3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3715  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3716  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3717  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3718  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3719  			in-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3720  				#address-cells = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3721  				#size-cells = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3722  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3723  				port@0 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3724  					reg = <0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3725  					apss_tpda_in0: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3726  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3727  						<&apss_tpdm0_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3728  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3729  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3730  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3731  				port@1 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3732  					reg = <1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3733  					apss_tpda_in1: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3734  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3735  						<&apss_tpdm1_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3736  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3737  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3738  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3739  				port@2 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3740  					reg = <2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3741  					apss_tpda_in2: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3742  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3743  						<&apss_tpdm2_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3744  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3745  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3746  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3747  				port@3 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3748  					reg = <3>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3749  					apss_tpda_in3: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3750  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3751  						<&apss_tpdm3_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3752  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3753  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3754  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3755  				port@4 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3756  					reg = <4>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3757  					apss_tpda_in4: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3758  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3759  						<&apss_tpdm4_out>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3760  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3761  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3762  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3763  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3764  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3765  		tpdm@68a0000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3766  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3767  			reg = <0x0 0x68a0000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3768  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3769  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3770  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3771  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3772  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3773  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3774  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3775  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3776  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3777  					apss_tpdm0_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3778  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3779  						<&apss_tpda_in0>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3780  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3781  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3782  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3783  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3784  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3785  		tpdm@68b0000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3786  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3787  			reg = <0x0 0x68b0000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3788  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3789  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3790  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3791  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3792  			qcom,cmb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3793  			qcom,cmb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3794  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3795  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3796  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3797  					apss_tpdm1_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3798  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3799  						<&apss_tpda_in1>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3800  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3801  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3802  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3803  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3804  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3805  		tpdm@68c0000 {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3806  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3807  			reg = <0x0 0x68c0000 0x0 0x1000>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3808  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3809  			clocks = <&aoss_qmp>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3810  			clock-names = "apb_pclk";
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3811  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3812  			qcom,dsb-element-bits = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3813  			qcom,dsb-msrs-num = <32>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3814  
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3815  			out-ports {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3816  				port {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3817  					apss_tpdm2_out: endpoint {
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3818  						remote-endpoint =
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3819  						<&apss_tpda_in2>;
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3820  					};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3821  				};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3822  			};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3823  		};
6596118ccdcdb3 arch/arm64/boot/dts/qcom/sa8775p.dtsi Jie Gan               2024-05-21  3824  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3825  		usb_0_hsphy: phy@88e4000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3826  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3827  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3828  			reg = <0 0x088e4000 0 0x120>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3829  			clocks = <&rpmhcc RPMH_CXO_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3830  			clock-names = "ref";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3831  			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3832  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3833  			#phy-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3834  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3835  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3836  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3837  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3838  		usb_0_qmpphy: phy@88e8000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3839  			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3840  			reg = <0 0x088e8000 0 0x2000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3841  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3842  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3843  				 <&gcc GCC_USB_CLKREF_EN>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3844  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3845  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3846  			clock-names = "aux", "ref", "com_aux", "pipe";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3847  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3848  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3849  				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3850  			reset-names = "phy", "phy_phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3851  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3852  			power-domains = <&gcc USB30_PRIM_GDSC>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3853  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3854  			#clock-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3855  			clock-output-names = "usb3_prim_phy_pipe_clk_src";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3856  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3857  			#phy-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3858  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3859  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3860  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3861  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3862  		usb_0: usb@a6f8800 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3863  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3864  			reg = <0 0x0a6f8800 0 0x400>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3865  			#address-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3866  			#size-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3867  			ranges;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3868  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3869  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3870  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3871  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3872  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3873  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3874  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3875  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3876  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3877  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3878  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3879  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3880  			interrupts-extended = <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  3881  					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  3882  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  3883  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3884  					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3885  			interrupt-names = "pwr_event",
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  3886  					  "hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3887  					  "dp_hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3888  					  "dm_hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3889  					  "ss_phy_irq";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3890  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3891  			power-domains = <&gcc USB30_PRIM_GDSC>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3892  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3893  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3894  			resets = <&gcc GCC_USB30_PRIM_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3895  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3896  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3897  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3898  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3899  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3900  			wakeup-source;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3901  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3902  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3903  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3904  			usb_0_dwc3: usb@a600000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3905  				compatible = "snps,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3906  				reg = <0 0x0a600000 0 0xe000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3907  				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3908  				iommus = <&apps_smmu 0x080 0x0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3909  				phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3910  				phy-names = "usb2-phy", "usb3-phy";
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  3911  				snps,dis-u1-entry-quirk;
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  3912  				snps,dis-u2-entry-quirk;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3913  			};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3914  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3915  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3916  		usb_1_hsphy: phy@88e6000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3917  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3918  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3919  			reg = <0 0x088e6000 0 0x120>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3920  			clocks = <&gcc GCC_USB_CLKREF_EN>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3921  			clock-names = "ref";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3922  			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3923  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3924  			#phy-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3925  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3926  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3927  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3928  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3929  		usb_1_qmpphy: phy@88ea000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3930  			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3931  			reg = <0 0x088ea000 0 0x2000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3932  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3933  			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3934  				 <&gcc GCC_USB_CLKREF_EN>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3935  				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3936  				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3937  			clock-names = "aux", "ref", "com_aux", "pipe";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3938  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3939  			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3940  				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3941  			reset-names = "phy", "phy_phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3942  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3943  			power-domains = <&gcc USB30_SEC_GDSC>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3944  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3945  			#clock-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3946  			clock-output-names = "usb3_sec_phy_pipe_clk_src";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3947  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3948  			#phy-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3949  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3950  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3951  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3952  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3953  		usb_1: usb@a8f8800 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3954  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3955  			reg = <0 0x0a8f8800 0 0x400>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3956  			#address-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3957  			#size-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3958  			ranges;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3959  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3960  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3961  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3962  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3963  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3964  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3965  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3966  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3967  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3968  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3969  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3970  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3971  			interrupts-extended = <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  3972  					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  3973  					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  3974  					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3975  					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3976  			interrupt-names = "pwr_event",
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  3977  					  "hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3978  					  "dp_hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3979  					  "dm_hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3980  					  "ss_phy_irq";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3981  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3982  			power-domains = <&gcc USB30_SEC_GDSC>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3983  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3984  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3985  			resets = <&gcc GCC_USB30_SEC_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3986  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3987  			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3988  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3989  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3990  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3991  			wakeup-source;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3992  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3993  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3994  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3995  			usb_1_dwc3: usb@a800000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3996  				compatible = "snps,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3997  				reg = <0 0x0a800000 0 0xe000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3998  				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  3999  				iommus = <&apps_smmu 0x0a0 0x0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4000  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4001  				phy-names = "usb2-phy", "usb3-phy";
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  4002  				snps,dis-u1-entry-quirk;
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  4003  				snps,dis-u2-entry-quirk;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4004  			};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4005  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4006  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4007  		usb_2_hsphy: phy@88e7000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4008  			compatible = "qcom,sa8775p-usb-hs-phy",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4009  				     "qcom,usb-snps-hs-5nm-phy";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4010  			reg = <0 0x088e7000 0 0x120>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4011  			clocks = <&gcc GCC_USB_CLKREF_EN>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4012  			clock-names = "ref";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4013  			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4014  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4015  			#phy-cells = <0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4016  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4017  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4018  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4019  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4020  		usb_2: usb@a4f8800 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4021  			compatible = "qcom,sa8775p-dwc3", "qcom,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4022  			reg = <0 0x0a4f8800 0 0x400>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4023  			#address-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4024  			#size-cells = <2>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4025  			ranges;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4026  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4027  			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4028  				 <&gcc GCC_USB20_MASTER_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4029  				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4030  				 <&gcc GCC_USB20_SLEEP_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4031  				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4032  			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4033  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4034  			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4035  					  <&gcc GCC_USB20_MASTER_CLK>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4036  			assigned-clock-rates = <19200000>, <200000000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4037  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4038  			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  4039  					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  4040  					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
0984bc0165f7c5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Johan Hovold          2023-11-20  4041  					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4042  			interrupt-names = "pwr_event",
6bf150aef236fb arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-01-26  4043  					  "hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4044  					  "dp_hs_phy_irq",
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4045  					  "dm_hs_phy_irq";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4046  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4047  			power-domains = <&gcc USB20_PRIM_GDSC>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4048  			required-opps = <&rpmhpd_opp_nom>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4049  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4050  			resets = <&gcc GCC_USB20_PRIM_BCR>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4051  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4052  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4053  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4054  			interconnect-names = "usb-ddr", "apps-usb";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4055  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4056  			wakeup-source;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4057  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4058  			status = "disabled";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4059  
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4060  			usb_2_dwc3: usb@a400000 {
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4061  				compatible = "snps,dwc3";
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4062  				reg = <0 0x0a400000 0 0xe000>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4063  				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4064  				iommus = <&apps_smmu 0x020 0x0>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4065  				phys = <&usb_2_hsphy>;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4066  				phy-names = "usb2-phy";
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  4067  				snps,dis-u1-entry-quirk;
1052c4c63639ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Krishna Kurapati      2024-12-31  4068  				snps,dis-u2-entry-quirk;
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4069  			};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4070  		};
de1001525c1aa2 arch/arm64/boot/dts/qcom/sa8775p.dtsi Shazad Hussain        2023-04-28  4071  
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  4072  		tcsr_mutex: hwlock@1f40000 {
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  4073  			compatible = "qcom,tcsr-mutex";
3fd7e2eec8f4fe arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-03-27  4074  			reg = <0x0 0x01f40000 0x0 0x20000>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  4075  			#hwlock-cells = <1>;
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  4076  		};
603f96d4c9d0cb arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-02-14  4077  
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30  4078  		tcsr: syscon@1fc0000 {
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30  4079  			compatible = "qcom,sa8775p-tcsr", "syscon";
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30  4080  			reg = <0x0 0x1fc0000 0x0 0x30000>;
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30  4081  		};
1a82fbfc87fd76 arch/arm64/boot/dts/qcom/sa8775p.dtsi Mukesh Ojha           2024-08-30  4082  
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4083  		gpucc: clock-controller@3d90000 {
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4084  			compatible = "qcom,sa8775p-gpucc";
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4085  			reg = <0x0 0x03d90000 0x0 0xa000>;
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4086  			clocks = <&rpmhcc RPMH_CXO_CLK>,
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4087  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4088  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4089  			clock-names = "bi_tcxo",
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4090  				      "gcc_gpu_gpll0_clk_src",
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4091  				      "gcc_gpu_gpll0_div_clk_src";
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4092  			#clock-cells = <1>;
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4093  			#reset-cells = <1>;
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4094  			#power-domain-cells = <1>;
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4095  		};
597cfc178829ac arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4096  
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4097  		adreno_smmu: iommu@3da0000 {
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4098  			compatible = "qcom,sa8775p-smmu-500", "qcom,adreno-smmu",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4099  				     "qcom,smmu-500", "arm,mmu-500";
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4100  			reg = <0x0 0x03da0000 0x0 0x20000>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4101  			#iommu-cells = <2>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4102  			#global-interrupts = <2>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4103  			dma-coherent;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4104  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4105  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4106  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4107  				 <&gpucc GPU_CC_AHB_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4108  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4109  				 <&gpucc GPU_CC_CX_GMU_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4110  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4111  				 <&gpucc GPU_CC_HUB_AON_CLK>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4112  			clock-names = "gcc_gpu_memnoc_gfx_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4113  				      "gcc_gpu_snoc_dvm_gfx_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4114  				      "gpu_cc_ahb_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4115  				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4116  				      "gpu_cc_cx_gmu_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4117  				      "gpu_cc_hub_cx_int_clk",
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4118  				      "gpu_cc_hub_aon_clk";
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4119  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4120  				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4121  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4122  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4123  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4124  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4125  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4126  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4127  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4128  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4129  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4130  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4131  		};
1a1ff00c1626c8 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-04-17  4132  
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4133  		serdes0: phy@8901000 {
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4134  			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4135  			reg = <0x0 0x08901000 0x0 0xe10>;
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4136  			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4137  			clock-names = "sgmi_ref";
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4138  			#phy-cells = <0>;
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4139  			status = "disabled";
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4140  		};
683ef77158cbb5 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-06-22  4141  
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4142  		serdes1: phy@8902000 {
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4143  			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4144  			reg = <0x0 0x08902000 0x0 0xe10>;
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4145  			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4146  			clock-names = "sgmi_ref";
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4147  			#phy-cells = <0>;
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4148  			status = "disabled";
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4149  		};
31cd8caf0cbe19 arch/arm64/boot/dts/qcom/sa8775p.dtsi Bartosz Golaszewski   2023-08-10  4150  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4151  		pmu@9091000 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4152  			compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4153  			reg = <0x0 0x9091000 0x0 0x1000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4154  			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4155  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4156  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4157  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4158  			operating-points-v2 = <&llcc_bwmon_opp_table>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4159  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4160  			llcc_bwmon_opp_table: opp-table {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4161  				compatible = "operating-points-v2";
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4162  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4163  				opp-0 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4164  					opp-peak-kBps = <762000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4165  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4166  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4167  				opp-1 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4168  					opp-peak-kBps = <1720000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4169  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4170  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4171  				opp-2 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4172  					opp-peak-kBps = <2086000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4173  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4174  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4175  				opp-3 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4176  					opp-peak-kBps = <2601000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4177  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4178  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4179  				opp-4 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4180  					opp-peak-kBps = <2929000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4181  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4182  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4183  				opp-5 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4184  					opp-peak-kBps = <5931000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4185  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4186  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4187  				opp-6 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4188  					opp-peak-kBps = <6515000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4189  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4190  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4191  				opp-7 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4192  					opp-peak-kBps = <7984000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4193  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4194  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4195  				opp-8 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4196  					opp-peak-kBps = <10437000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4197  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4198  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4199  				opp-9 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4200  					opp-peak-kBps = <12195000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4201  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4202  			};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4203  		};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4204  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4205  		pmu@90b5400 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4206  			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4207  			reg = <0x0 0x90b5400 0x0 0x600>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4208  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4209  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4210  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4211  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4212  			operating-points-v2 = <&cpu_bwmon_opp_table>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4213  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4214  			cpu_bwmon_opp_table: opp-table {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4215  				compatible = "operating-points-v2";
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4216  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4217  				opp-0 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4218  					opp-peak-kBps = <9155000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4219  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4220  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4221  				opp-1 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4222  					opp-peak-kBps = <12298000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4223  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4224  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4225  				opp-2 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4226  					opp-peak-kBps = <14236000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4227  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4228  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4229  				opp-3 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4230  					opp-peak-kBps = <16265000>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4231  				};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4232  			};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4233  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4234  		};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4235  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4236  		pmu@90b6400 {
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4237  			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4238  			reg = <0x0 0x90b6400 0x0 0x600>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4239  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4240  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4241  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4242  
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4243  			operating-points-v2 = <&cpu_bwmon_opp_table>;
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4244  		};
1dd1a6d2b1851f arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-07-30  4245  
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4246  		llcc: system-cache-controller@9200000 {
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4247  			compatible = "qcom,sa8775p-llcc";
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4248  			reg = <0x0 0x09200000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4249  			      <0x0 0x09300000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4250  			      <0x0 0x09400000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4251  			      <0x0 0x09500000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4252  			      <0x0 0x09600000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4253  			      <0x0 0x09700000 0x0 0x80000>,
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4254  			      <0x0 0x09a00000 0x0 0x80000>;
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4255  			reg-names = "llcc0_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4256  				    "llcc1_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4257  				    "llcc2_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4258  				    "llcc3_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4259  				    "llcc4_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4260  				    "llcc5_base",
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4261  				    "llcc_broadcast_base";
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4262  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4263  		};
809c20b1ffc802 arch/arm64/boot/dts/qcom/sa8775p.dtsi Tengfei Fan           2024-05-29  4264  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4265  		iris: video-codec@aa00000 {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4266  			compatible = "qcom,sa8775p-iris", "qcom,sm8550-iris";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4267  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4268  			reg = <0x0 0x0aa00000 0x0 0xf0000>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4269  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4270  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4271  			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4272  					<&videocc VIDEO_CC_MVS0_GDSC>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4273  					<&rpmhpd SA8775P_MX>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4274  					<&rpmhpd SA8775P_MMCX>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4275  			power-domain-names = "venus",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4276  					     "vcodec0",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4277  					     "mxc",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4278  					     "mmcx";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4279  			operating-points-v2 = <&iris_opp_table>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4280  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4281  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4282  				 <&videocc VIDEO_CC_MVS0C_CLK>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4283  				 <&videocc VIDEO_CC_MVS0_CLK>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4284  			clock-names = "iface",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4285  				      "core",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4286  				      "vcodec0_core";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4287  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4288  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4289  					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4290  					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4291  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4292  			interconnect-names = "cpu-cfg",
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4293  					     "video-mem";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4294  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4295  			memory-region = <&pil_video_mem>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4296  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4297  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4298  			reset-names = "bus";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4299  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4300  			iommus = <&apps_smmu 0x0880 0x0400>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4301  				 <&apps_smmu 0x0887 0x0400>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4302  			dma-coherent;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4303  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4304  			status = "disabled";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4305  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4306  			iris_opp_table: opp-table {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4307  				compatible = "operating-points-v2";
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4308  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4309  				opp-366000000 {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4310  					opp-hz = /bits/ 64 <366000000>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4311  					required-opps = <&rpmhpd_opp_svs_l1>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4312  							<&rpmhpd_opp_svs_l1>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4313  				};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4314  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4315  				opp-444000000 {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4316  					opp-hz = /bits/ 64 <444000000>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4317  					required-opps = <&rpmhpd_opp_nom>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4318  							<&rpmhpd_opp_nom>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4319  				};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4320  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4321  				opp-533000000 {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4322  					opp-hz = /bits/ 64 <533000000>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4323  					required-opps = <&rpmhpd_opp_turbo>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4324  							<&rpmhpd_opp_turbo>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4325  				};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4326  
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4327  				opp-560000000 {
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4328  					opp-hz = /bits/ 64 <560000000>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4329  					required-opps = <&rpmhpd_opp_turbo_l1>,
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4330  							<&rpmhpd_opp_turbo_l1>;
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4331  				};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4332  			};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4333  		};
7bc95052c64f45 arch/arm64/boot/dts/qcom/sa8775p.dtsi Vikash Garodia        2025-04-21  4334  
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4335  		videocc: clock-controller@abf0000 {
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4336  			compatible = "qcom,sa8775p-videocc";
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4337  			reg = <0x0 0x0abf0000 0x0 0x10000>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4338  			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4339  				 <&rpmhcc RPMH_CXO_CLK>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4340  				 <&rpmhcc RPMH_CXO_CLK_A>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4341  				 <&sleep_clk>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4342  			power-domains = <&rpmhpd SA8775P_MMCX>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4343  			#clock-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4344  			#reset-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4345  			#power-domain-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4346  		};
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4347  
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4348  		camcc: clock-controller@ade0000 {
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4349  			compatible = "qcom,sa8775p-camcc";
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4350  			reg = <0x0 0x0ade0000 0x0 0x20000>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4351  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4352  				 <&rpmhcc RPMH_CXO_CLK>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4353  				 <&rpmhcc RPMH_CXO_CLK_A>,
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4354  				 <&sleep_clk>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4355  			power-domains = <&rpmhpd SA8775P_MMCX>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4356  			#clock-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4357  			#reset-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4358  			#power-domain-cells = <1>;
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4359  		};
727dc481e50a4d arch/arm64/boot/dts/qcom/sa8775p.dtsi Taniya Das            2024-10-25  4360  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4361  		mdss0: display-subsystem@ae00000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4362  			compatible = "qcom,sa8775p-mdss";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4363  			reg = <0x0 0x0ae00000 0x0 0x1000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4364  			reg-names = "mdss";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4365  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4366  			/* same path used twice */
8725fb400542a6 arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-04-15  4367  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
8725fb400542a6 arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-04-15  4368  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8725fb400542a6 arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-04-15  4369  					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
8725fb400542a6 arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-04-15  4370  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4371  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4372  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4373  			interconnect-names = "mdp0-mem",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4374  					     "mdp1-mem",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4375  					     "cpu-cfg";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4376  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4377  			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4378  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4379  			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4380  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4381  			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4382  				 <&gcc GCC_DISP_HF_AXI_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4383  				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4384  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4385  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4386  			interrupt-controller;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4387  			#interrupt-cells = <1>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4388  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4389  			iommus = <&apps_smmu 0x1000 0x402>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4390  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4391  			#address-cells = <2>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4392  			#size-cells = <2>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4393  			ranges;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4394  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4395  			status = "disabled";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4396  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4397  			mdss0_mdp: display-controller@ae01000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4398  				compatible = "qcom,sa8775p-dpu";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4399  				reg = <0x0 0x0ae01000 0x0 0x8f000>,
180f990ed061ce arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-04-15  4400  				      <0x0 0x0aeb0000 0x0 0x3000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4401  				reg-names = "mdp", "vbif";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4402  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4403  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4404  					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4405  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4406  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4407  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
21124b02b3cba4 arch/arm64/boot/dts/qcom/sa8775p.dtsi Dmitry Baryshkov      2025-06-02  4408  				clock-names = "nrt_bus",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4409  					      "iface",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4410  					      "lut",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4411  					      "core",
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4412  					      "vsync";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4413  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4414  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4415  				assigned-clock-rates = <19200000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4416  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4417  				operating-points-v2 = <&mdss0_mdp_opp_table>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4418  				power-domains = <&rpmhpd SA8775P_MMCX>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4419  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4420  				interrupt-parent = <&mdss0>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4421  				interrupts = <0>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4422  
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4423  				ports {
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4424  					#address-cells = <1>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4425  					#size-cells = <0>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4426  
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4427  					port@0 {
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4428  						reg = <0>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4429  
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4430  						dpu_intf0_out: endpoint {
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4431  							remote-endpoint = <&mdss0_dp0_in>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4432  						};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4433  					};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4434  
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4435  					port@1 {
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4436  						reg = <1>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4437  
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4438  						dpu_intf4_out: endpoint {
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4439  							remote-endpoint = <&mdss0_dp1_in>;
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4440  						};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4441  					};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4442  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4443  					port@2 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4444  						reg = <2>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4445  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4446  						dpu_intf1_out: endpoint {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4447  							remote-endpoint = <&mdss0_dsi0_in>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4448  						};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4449  					};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4450  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4451  					port@3 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4452  						reg = <3>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4453  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4454  						dpu_intf2_out: endpoint {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4455  							remote-endpoint = <&mdss0_dsi1_in>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4456  						};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4457  					};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4458  				};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4459  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4460  				mdss0_mdp_opp_table: opp-table {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4461  					compatible = "operating-points-v2";
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4462  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4463  					opp-375000000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4464  						opp-hz = /bits/ 64 <375000000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4465  						required-opps = <&rpmhpd_opp_svs_l1>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4466  					};
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4467  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4468  					opp-500000000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4469  						opp-hz = /bits/ 64 <500000000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4470  						required-opps = <&rpmhpd_opp_nom>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4471  					};
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4472  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4473  					opp-575000000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4474  						opp-hz = /bits/ 64 <575000000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4475  						required-opps = <&rpmhpd_opp_turbo>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4476  					};
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4477  
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4478  					opp-650000000 {
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4479  						opp-hz = /bits/ 64 <650000000>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4480  						required-opps = <&rpmhpd_opp_turbo_l1>;
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4481  					};
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4482  				};
2f39d2d46c73ad arch/arm64/boot/dts/qcom/sa8775p.dtsi Mahadevan             2024-10-19  4483  			};
e1e3e5673f8d77 arch/arm64/boot/dts/qcom/sa8775p.dtsi Soutrik Mukhopadhyay  2024-11-25  4484  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04 @4485  			mdss0_dsi0: dsi@ae94000 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4486  				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4487  				reg = <0x0 0x0ae94000 0x0 0x400>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4488  				reg-names = "dsi_ctrl";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4489  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4490  				interrupt-parent = <&mdss0>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4491  				interrupts = <4>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4492  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4493  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4494  					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4495  					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4496  					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4497  					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4498  					 <&gcc GCC_DISP_HF_AXI_CLK>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4499  				clock-names = "byte",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4500  					      "byte_intf",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4501  					      "pixel",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4502  					      "core",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4503  					      "iface",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4504  					      "bus";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4505  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4506  						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4507  				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4508  							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4509  				phys = <&mdss0_dsi0_phy>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4510  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4511  				operating-points-v2 = <&mdss_dsi_opp_table>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4512  				power-domains = <&rpmhpd SA8775P_MMCX>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4513  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4514  				#address-cells = <1>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4515  				#size-cells = <0>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4516  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4517  				status = "disabled";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4518  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4519  				ports {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4520  					#address-cells = <1>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4521  					#size-cells = <0>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4522  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4523  					port@0 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4524  						reg = <0>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4525  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4526  						mdss0_dsi0_in: endpoint {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4527  							remote-endpoint = <&dpu_intf1_out>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4528  						};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4529  					};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4530  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4531  					port@1 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4532  						reg = <1>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4533  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4534  						mdss0_dsi0_out: endpoint{ };
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4535  					};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4536  				};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4537  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4538  				mdss_dsi_opp_table: opp-table {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4539  					compatible = "operating-points-v2";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4540  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4541  					opp-358000000 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4542  						opp-hz = /bits/ 64 <358000000>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4543  						required-opps = <&rpmhpd_opp_svs_l1>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4544  					};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4545  				};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4546  			};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4547  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4548  			mdss0_dsi0_phy: phy@ae94400 {
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4549  				compatible = "qcom,sa8775p-dsi-phy-5nm";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4550  				reg = <0x0 0x0ae94400 0x0 0x200>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4551  				      <0x0 0x0ae94600 0x0 0x280>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4552  				      <0x0 0x0ae94900 0x0 0x27c>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4553  				reg-names = "dsi_phy",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4554  					    "dsi_phy_lane",
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4555  					    "dsi_pll";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4556  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4557  				#clock-cells = <1>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4558  				#phy-cells = <0>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4559  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4560  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4561  					 <&rpmhcc RPMH_CXO_CLK>;
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4562  				clock-names = "iface", "ref";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4563  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4564  				status = "disabled";
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4565  			};
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04  4566  
73db32b01c9f89 arch/arm64/boot/dts/qcom/sa8775p.dtsi Ayushi Makhija        2025-06-04 @4567  			mdss0_dsi1: dsi@ae96000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
