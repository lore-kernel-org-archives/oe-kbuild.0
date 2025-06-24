Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4C2C15A6
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772312; cv=none; b=pdUv8veUorDJmZzJ+wpRy6vwktzAF34lT7t7pnVqIocNW6n56TnE7hofaDu4QeGxvYOtoQOkWEpsC5f6hmhmd9NWxwY53Td8hv+sFnPC4p0kOWAGr/dfk/091GWaTZ7qSEMXsEDKfTivtNatF8FkT6HjAnFNtY7yJF3JQc8zFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772312; c=relaxed/simple;
	bh=Gv6FPOLCQbReAt3U7MdYax5fihLOJYTAVJV2w682qXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhDtJa5JQ3zL0DplCp20hnD0bJXwG2kYdMPOaHCrPWRQ0vykix5FFUmbwmrtT6hdrtrckJxrKsgiw9HuDRSLJ7gs7V2lTICvqcYysbmmMzk+ulkCSyDOTD/Xa4FEWtev5Mw81xJxiDYBBMk0xDy526Ab3AyLqrcgdirYmMmY00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgVIGB6Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgVIGB6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750772305; x=1782308305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gv6FPOLCQbReAt3U7MdYax5fihLOJYTAVJV2w682qXg=;
  b=cgVIGB6Z496WaysfDLByTJBLwheiPYqwg5Rj1yHBRWxwyecC8F9gtuvB
   kDuY8/ju1IYLHHYnixgrFOCLad6QHSmLhtZyID8+z5SPREzUi4sV2lSZn
   tEqm3tzRPOp/Fmu59zTuUqnSohJ7IQCRK5KE7UjAiTOdZqTqg5JA5EVK2
   XcCIrIwATT0WMbvI6YTn+KA9M6n/Im1KIlF0h6Ipllxy6nUHbKluSWAz5
   UNs74HLkLj3cCJBtJ6C5ANNfi3c7brb/d9G3JUZdr7m8Rc9ySiaGvEgp5
   p4XBIOl/KlHkuFcSA+HSrZKKCExS3QngUROz8PObpTykrwwgw70I1Y5Wf
   g==;
X-CSE-ConnectionGUID: lJvuON28Rn6UthGTwwojjA==
X-CSE-MsgGUID: I4yFXv2NR3OLKYch+GqEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70579998"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="70579998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:38:24 -0700
X-CSE-ConnectionGUID: XDE7u1g2Svygzgs7piRbdA==
X-CSE-MsgGUID: DucDjB//Q0qIWnmEqhGpdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152446672"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jun 2025 06:38:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU3qu-000SAs-0u;
	Tue, 24 Jun 2025 13:38:20 +0000
Date: Tue, 24 Jun 2025 21:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/8] arm64: dts: rockchip: Add the vdpu383 Video Decoder
 on rk3576
Message-ID: <202506242120.jm9IpQ7J-lkp@intel.com>
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
In-Reply-To: <20250623160722.55938-5-detlev.casanova@collabora.com>
References: <20250623160722.55938-5-detlev.casanova@collabora.com>
TO: Detlev Casanova <detlev.casanova@collabora.com>
TO: linux-kernel@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Alexey Charkov <alchark@gmail.com>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Jianfeng Liu <liujianfeng1994@gmail.com>
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: Kever Yang <kever.yang@rock-chips.com>
CC: Detlev Casanova <detlev.casanova@collabora.com>
CC: Andy Yan <andy.yan@rock-chips.com>
CC: Frank Wang <frank.wang@rock-chips.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Ricardo Ribalda <ribalda@chromium.org>
CC: Hans de Goede <hansg@kernel.org>
CC: Yunke Cao <yunkec@google.com>
CC: kernel@collabora.com

Hi Detlev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-dt-bindings-rockchip-Document-RK3588-Video-Decoder-bindings/20250624-001505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250623160722.55938-5-detlev.casanova%40collabora.com
patch subject: [PATCH 4/8] arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250624/202506242120.jm9IpQ7J-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242120.jm9IpQ7J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506242120.jm9IpQ7J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576.dtsi:1142.30-1164.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

vim +/27b00100 +1142 arch/arm64/boot/dts/rockchip/rk3576.dtsi

57b1ce9039665c Detlev Casanova    2024-09-03    14  
57b1ce9039665c Detlev Casanova    2024-09-03    15  / {
57b1ce9039665c Detlev Casanova    2024-09-03    16  	compatible = "rockchip,rk3576";
57b1ce9039665c Detlev Casanova    2024-09-03    17  
57b1ce9039665c Detlev Casanova    2024-09-03    18  	interrupt-parent = <&gic>;
57b1ce9039665c Detlev Casanova    2024-09-03    19  	#address-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03    20  	#size-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03    21  
57b1ce9039665c Detlev Casanova    2024-09-03    22  	aliases {
57b1ce9039665c Detlev Casanova    2024-09-03    23  		i2c0 = &i2c0;
57b1ce9039665c Detlev Casanova    2024-09-03    24  		i2c1 = &i2c1;
57b1ce9039665c Detlev Casanova    2024-09-03    25  		i2c2 = &i2c2;
57b1ce9039665c Detlev Casanova    2024-09-03    26  		i2c3 = &i2c3;
57b1ce9039665c Detlev Casanova    2024-09-03    27  		i2c4 = &i2c4;
57b1ce9039665c Detlev Casanova    2024-09-03    28  		i2c5 = &i2c5;
57b1ce9039665c Detlev Casanova    2024-09-03    29  		i2c6 = &i2c6;
57b1ce9039665c Detlev Casanova    2024-09-03    30  		i2c7 = &i2c7;
57b1ce9039665c Detlev Casanova    2024-09-03    31  		i2c8 = &i2c8;
57b1ce9039665c Detlev Casanova    2024-09-03    32  		i2c9 = &i2c9;
57b1ce9039665c Detlev Casanova    2024-09-03    33  		serial0 = &uart0;
57b1ce9039665c Detlev Casanova    2024-09-03    34  		serial1 = &uart1;
57b1ce9039665c Detlev Casanova    2024-09-03    35  		serial2 = &uart2;
57b1ce9039665c Detlev Casanova    2024-09-03    36  		serial3 = &uart3;
57b1ce9039665c Detlev Casanova    2024-09-03    37  		serial4 = &uart4;
57b1ce9039665c Detlev Casanova    2024-09-03    38  		serial5 = &uart5;
57b1ce9039665c Detlev Casanova    2024-09-03    39  		serial6 = &uart6;
57b1ce9039665c Detlev Casanova    2024-09-03    40  		serial7 = &uart7;
57b1ce9039665c Detlev Casanova    2024-09-03    41  		serial8 = &uart8;
57b1ce9039665c Detlev Casanova    2024-09-03    42  		serial9 = &uart9;
57b1ce9039665c Detlev Casanova    2024-09-03    43  		serial10 = &uart10;
57b1ce9039665c Detlev Casanova    2024-09-03    44  		serial11 = &uart11;
57b1ce9039665c Detlev Casanova    2024-09-03    45  		spi0 = &spi0;
57b1ce9039665c Detlev Casanova    2024-09-03    46  		spi1 = &spi1;
57b1ce9039665c Detlev Casanova    2024-09-03    47  		spi2 = &spi2;
57b1ce9039665c Detlev Casanova    2024-09-03    48  		spi3 = &spi3;
57b1ce9039665c Detlev Casanova    2024-09-03    49  		spi4 = &spi4;
57b1ce9039665c Detlev Casanova    2024-09-03    50  	};
57b1ce9039665c Detlev Casanova    2024-09-03    51  
57b1ce9039665c Detlev Casanova    2024-09-03    52  	xin32k: clock-xin32k {
57b1ce9039665c Detlev Casanova    2024-09-03    53  		compatible = "fixed-clock";
57b1ce9039665c Detlev Casanova    2024-09-03    54  		clock-frequency = <32768>;
57b1ce9039665c Detlev Casanova    2024-09-03    55  		clock-output-names = "xin32k";
57b1ce9039665c Detlev Casanova    2024-09-03    56  		#clock-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03    57  	};
57b1ce9039665c Detlev Casanova    2024-09-03    58  
57b1ce9039665c Detlev Casanova    2024-09-03    59  	xin24m: clock-xin24m {
57b1ce9039665c Detlev Casanova    2024-09-03    60  		compatible = "fixed-clock";
57b1ce9039665c Detlev Casanova    2024-09-03    61  		#clock-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03    62  		clock-frequency = <24000000>;
57b1ce9039665c Detlev Casanova    2024-09-03    63  		clock-output-names = "xin24m";
57b1ce9039665c Detlev Casanova    2024-09-03    64  	};
57b1ce9039665c Detlev Casanova    2024-09-03    65  
57b1ce9039665c Detlev Casanova    2024-09-03    66  	spll: clock-spll {
57b1ce9039665c Detlev Casanova    2024-09-03    67  		compatible = "fixed-clock";
57b1ce9039665c Detlev Casanova    2024-09-03    68  		#clock-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03    69  		clock-frequency = <702000000>;
57b1ce9039665c Detlev Casanova    2024-09-03    70  		clock-output-names = "spll";
57b1ce9039665c Detlev Casanova    2024-09-03    71  	};
57b1ce9039665c Detlev Casanova    2024-09-03    72  
57b1ce9039665c Detlev Casanova    2024-09-03    73  	cpus {
57b1ce9039665c Detlev Casanova    2024-09-03    74  		#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03    75  		#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03    76  
57b1ce9039665c Detlev Casanova    2024-09-03    77  		cpu-map {
57b1ce9039665c Detlev Casanova    2024-09-03    78  			cluster0 {
57b1ce9039665c Detlev Casanova    2024-09-03    79  				core0 {
57b1ce9039665c Detlev Casanova    2024-09-03    80  					cpu = <&cpu_l0>;
57b1ce9039665c Detlev Casanova    2024-09-03    81  				};
57b1ce9039665c Detlev Casanova    2024-09-03    82  				core1 {
57b1ce9039665c Detlev Casanova    2024-09-03    83  					cpu = <&cpu_l1>;
57b1ce9039665c Detlev Casanova    2024-09-03    84  				};
57b1ce9039665c Detlev Casanova    2024-09-03    85  				core2 {
57b1ce9039665c Detlev Casanova    2024-09-03    86  					cpu = <&cpu_l2>;
57b1ce9039665c Detlev Casanova    2024-09-03    87  				};
57b1ce9039665c Detlev Casanova    2024-09-03    88  				core3 {
57b1ce9039665c Detlev Casanova    2024-09-03    89  					cpu = <&cpu_l3>;
57b1ce9039665c Detlev Casanova    2024-09-03    90  				};
57b1ce9039665c Detlev Casanova    2024-09-03    91  			};
57b1ce9039665c Detlev Casanova    2024-09-03    92  			cluster1 {
57b1ce9039665c Detlev Casanova    2024-09-03    93  				core0 {
57b1ce9039665c Detlev Casanova    2024-09-03    94  					cpu = <&cpu_b0>;
57b1ce9039665c Detlev Casanova    2024-09-03    95  				};
57b1ce9039665c Detlev Casanova    2024-09-03    96  				core1 {
57b1ce9039665c Detlev Casanova    2024-09-03    97  					cpu = <&cpu_b1>;
57b1ce9039665c Detlev Casanova    2024-09-03    98  				};
57b1ce9039665c Detlev Casanova    2024-09-03    99  				core2 {
57b1ce9039665c Detlev Casanova    2024-09-03   100  					cpu = <&cpu_b2>;
57b1ce9039665c Detlev Casanova    2024-09-03   101  				};
57b1ce9039665c Detlev Casanova    2024-09-03   102  				core3 {
57b1ce9039665c Detlev Casanova    2024-09-03   103  					cpu = <&cpu_b3>;
57b1ce9039665c Detlev Casanova    2024-09-03   104  				};
57b1ce9039665c Detlev Casanova    2024-09-03   105  			};
57b1ce9039665c Detlev Casanova    2024-09-03   106  		};
57b1ce9039665c Detlev Casanova    2024-09-03   107  
57b1ce9039665c Detlev Casanova    2024-09-03   108  		cpu_l0: cpu@0 {
57b1ce9039665c Detlev Casanova    2024-09-03   109  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   110  			compatible = "arm,cortex-a53";
57b1ce9039665c Detlev Casanova    2024-09-03   111  			reg = <0x0>;
57b1ce9039665c Detlev Casanova    2024-09-03   112  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   113  			capacity-dmips-mhz = <485>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   114  			clocks = <&scmi_clk SCMI_ARMCLK_L>;
57b1ce9039665c Detlev Casanova    2024-09-03   115  			operating-points-v2 = <&cluster0_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   116  			#cooling-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03   117  			dynamic-power-coefficient = <120>;
57b1ce9039665c Detlev Casanova    2024-09-03   118  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   119  		};
57b1ce9039665c Detlev Casanova    2024-09-03   120  
57b1ce9039665c Detlev Casanova    2024-09-03   121  		cpu_l1: cpu@1 {
57b1ce9039665c Detlev Casanova    2024-09-03   122  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   123  			compatible = "arm,cortex-a53";
57b1ce9039665c Detlev Casanova    2024-09-03   124  			reg = <0x1>;
57b1ce9039665c Detlev Casanova    2024-09-03   125  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   126  			capacity-dmips-mhz = <485>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   127  			clocks = <&scmi_clk SCMI_ARMCLK_L>;
57b1ce9039665c Detlev Casanova    2024-09-03   128  			operating-points-v2 = <&cluster0_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   129  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   130  		};
57b1ce9039665c Detlev Casanova    2024-09-03   131  
57b1ce9039665c Detlev Casanova    2024-09-03   132  		cpu_l2: cpu@2 {
57b1ce9039665c Detlev Casanova    2024-09-03   133  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   134  			compatible = "arm,cortex-a53";
57b1ce9039665c Detlev Casanova    2024-09-03   135  			reg = <0x2>;
57b1ce9039665c Detlev Casanova    2024-09-03   136  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   137  			capacity-dmips-mhz = <485>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   138  			clocks = <&scmi_clk SCMI_ARMCLK_L>;
57b1ce9039665c Detlev Casanova    2024-09-03   139  			operating-points-v2 = <&cluster0_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   140  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   141  		};
57b1ce9039665c Detlev Casanova    2024-09-03   142  
57b1ce9039665c Detlev Casanova    2024-09-03   143  		cpu_l3: cpu@3 {
57b1ce9039665c Detlev Casanova    2024-09-03   144  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   145  			compatible = "arm,cortex-a53";
57b1ce9039665c Detlev Casanova    2024-09-03   146  			reg = <0x3>;
57b1ce9039665c Detlev Casanova    2024-09-03   147  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   148  			capacity-dmips-mhz = <485>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   149  			clocks = <&scmi_clk SCMI_ARMCLK_L>;
57b1ce9039665c Detlev Casanova    2024-09-03   150  			operating-points-v2 = <&cluster0_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   151  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   152  		};
57b1ce9039665c Detlev Casanova    2024-09-03   153  
57b1ce9039665c Detlev Casanova    2024-09-03   154  		cpu_b0: cpu@100 {
57b1ce9039665c Detlev Casanova    2024-09-03   155  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   156  			compatible = "arm,cortex-a72";
57b1ce9039665c Detlev Casanova    2024-09-03   157  			reg = <0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03   158  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   159  			capacity-dmips-mhz = <1024>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   160  			clocks = <&scmi_clk SCMI_ARMCLK_B>;
57b1ce9039665c Detlev Casanova    2024-09-03   161  			operating-points-v2 = <&cluster1_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   162  			#cooling-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03   163  			dynamic-power-coefficient = <320>;
57b1ce9039665c Detlev Casanova    2024-09-03   164  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   165  		};
57b1ce9039665c Detlev Casanova    2024-09-03   166  
57b1ce9039665c Detlev Casanova    2024-09-03   167  		cpu_b1: cpu@101 {
57b1ce9039665c Detlev Casanova    2024-09-03   168  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   169  			compatible = "arm,cortex-a72";
57b1ce9039665c Detlev Casanova    2024-09-03   170  			reg = <0x101>;
57b1ce9039665c Detlev Casanova    2024-09-03   171  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   172  			capacity-dmips-mhz = <1024>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   173  			clocks = <&scmi_clk SCMI_ARMCLK_B>;
57b1ce9039665c Detlev Casanova    2024-09-03   174  			operating-points-v2 = <&cluster1_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   175  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   176  		};
57b1ce9039665c Detlev Casanova    2024-09-03   177  
57b1ce9039665c Detlev Casanova    2024-09-03   178  		cpu_b2: cpu@102 {
57b1ce9039665c Detlev Casanova    2024-09-03   179  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   180  			compatible = "arm,cortex-a72";
57b1ce9039665c Detlev Casanova    2024-09-03   181  			reg = <0x102>;
57b1ce9039665c Detlev Casanova    2024-09-03   182  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   183  			capacity-dmips-mhz = <1024>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   184  			clocks = <&scmi_clk SCMI_ARMCLK_B>;
57b1ce9039665c Detlev Casanova    2024-09-03   185  			operating-points-v2 = <&cluster1_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   186  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   187  		};
57b1ce9039665c Detlev Casanova    2024-09-03   188  
57b1ce9039665c Detlev Casanova    2024-09-03   189  		cpu_b3: cpu@103 {
57b1ce9039665c Detlev Casanova    2024-09-03   190  			device_type = "cpu";
57b1ce9039665c Detlev Casanova    2024-09-03   191  			compatible = "arm,cortex-a72";
57b1ce9039665c Detlev Casanova    2024-09-03   192  			reg = <0x103>;
57b1ce9039665c Detlev Casanova    2024-09-03   193  			enable-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   194  			capacity-dmips-mhz = <1024>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10   195  			clocks = <&scmi_clk SCMI_ARMCLK_B>;
57b1ce9039665c Detlev Casanova    2024-09-03   196  			operating-points-v2 = <&cluster1_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03   197  			cpu-idle-states = <&CPU_SLEEP>;
57b1ce9039665c Detlev Casanova    2024-09-03   198  		};
57b1ce9039665c Detlev Casanova    2024-09-03   199  
57b1ce9039665c Detlev Casanova    2024-09-03   200  		idle-states {
57b1ce9039665c Detlev Casanova    2024-09-03   201  			entry-method = "psci";
57b1ce9039665c Detlev Casanova    2024-09-03   202  
57b1ce9039665c Detlev Casanova    2024-09-03   203  			CPU_SLEEP: cpu-sleep {
57b1ce9039665c Detlev Casanova    2024-09-03   204  				compatible = "arm,idle-state";
57b1ce9039665c Detlev Casanova    2024-09-03   205  				arm,psci-suspend-param = <0x0010000>;
57b1ce9039665c Detlev Casanova    2024-09-03   206  				entry-latency-us = <120>;
57b1ce9039665c Detlev Casanova    2024-09-03   207  				exit-latency-us = <250>;
57b1ce9039665c Detlev Casanova    2024-09-03   208  				min-residency-us = <900>;
57b1ce9039665c Detlev Casanova    2024-09-03   209  				local-timer-stop;
57b1ce9039665c Detlev Casanova    2024-09-03   210  			};
57b1ce9039665c Detlev Casanova    2024-09-03   211  		};
57b1ce9039665c Detlev Casanova    2024-09-03   212  	};
57b1ce9039665c Detlev Casanova    2024-09-03   213  
57b1ce9039665c Detlev Casanova    2024-09-03   214  	cluster0_opp_table: opp-table-cluster0 {
57b1ce9039665c Detlev Casanova    2024-09-03   215  		compatible = "operating-points-v2";
57b1ce9039665c Detlev Casanova    2024-09-03   216  		opp-shared;
57b1ce9039665c Detlev Casanova    2024-09-03   217  
57b1ce9039665c Detlev Casanova    2024-09-03   218  		opp-408000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   219  			opp-hz = /bits/ 64 <408000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   220  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   221  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   222  		};
57b1ce9039665c Detlev Casanova    2024-09-03   223  
57b1ce9039665c Detlev Casanova    2024-09-03   224  		opp-600000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   225  			opp-hz = /bits/ 64 <600000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   226  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   227  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   228  		};
57b1ce9039665c Detlev Casanova    2024-09-03   229  
57b1ce9039665c Detlev Casanova    2024-09-03   230  		opp-816000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   231  			opp-hz = /bits/ 64 <816000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   232  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   233  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   234  		};
57b1ce9039665c Detlev Casanova    2024-09-03   235  
57b1ce9039665c Detlev Casanova    2024-09-03   236  		opp-1008000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   237  			opp-hz = /bits/ 64 <1008000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   238  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   239  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   240  		};
57b1ce9039665c Detlev Casanova    2024-09-03   241  
57b1ce9039665c Detlev Casanova    2024-09-03   242  		opp-1200000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   243  			opp-hz = /bits/ 64 <1200000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   244  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   245  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   246  		};
57b1ce9039665c Detlev Casanova    2024-09-03   247  
57b1ce9039665c Detlev Casanova    2024-09-03   248  		opp-1416000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   249  			opp-hz = /bits/ 64 <1416000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   250  			opp-microvolt = <725000 725000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   251  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   252  		};
57b1ce9039665c Detlev Casanova    2024-09-03   253  
57b1ce9039665c Detlev Casanova    2024-09-03   254  		opp-1608000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   255  			opp-hz = /bits/ 64 <1608000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   256  			opp-microvolt = <750000 750000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   257  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   258  		};
57b1ce9039665c Detlev Casanova    2024-09-03   259  
57b1ce9039665c Detlev Casanova    2024-09-03   260  		opp-1800000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   261  			opp-hz = /bits/ 64 <1800000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   262  			opp-microvolt = <825000 825000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   263  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   264  			opp-suspend;
57b1ce9039665c Detlev Casanova    2024-09-03   265  		};
57b1ce9039665c Detlev Casanova    2024-09-03   266  
57b1ce9039665c Detlev Casanova    2024-09-03   267  		opp-2016000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   268  			opp-hz = /bits/ 64 <2016000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   269  			opp-microvolt = <900000 900000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   270  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   271  		};
57b1ce9039665c Detlev Casanova    2024-09-03   272  
57b1ce9039665c Detlev Casanova    2024-09-03   273  		opp-2208000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   274  			opp-hz = /bits/ 64 <2208000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   275  			opp-microvolt = <950000 950000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   276  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   277  		};
57b1ce9039665c Detlev Casanova    2024-09-03   278  	};
57b1ce9039665c Detlev Casanova    2024-09-03   279  
57b1ce9039665c Detlev Casanova    2024-09-03   280  	cluster1_opp_table: opp-table-cluster1 {
57b1ce9039665c Detlev Casanova    2024-09-03   281  		compatible = "operating-points-v2";
57b1ce9039665c Detlev Casanova    2024-09-03   282  		opp-shared;
57b1ce9039665c Detlev Casanova    2024-09-03   283  
57b1ce9039665c Detlev Casanova    2024-09-03   284  		opp-408000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   285  			opp-hz = /bits/ 64 <408000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   286  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   287  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   288  			opp-suspend;
57b1ce9039665c Detlev Casanova    2024-09-03   289  		};
57b1ce9039665c Detlev Casanova    2024-09-03   290  
57b1ce9039665c Detlev Casanova    2024-09-03   291  		opp-600000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   292  			opp-hz = /bits/ 64 <600000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   293  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   294  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   295  		};
57b1ce9039665c Detlev Casanova    2024-09-03   296  
57b1ce9039665c Detlev Casanova    2024-09-03   297  		opp-816000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   298  			opp-hz = /bits/ 64 <816000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   299  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   300  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   301  		};
57b1ce9039665c Detlev Casanova    2024-09-03   302  
57b1ce9039665c Detlev Casanova    2024-09-03   303  		opp-1008000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   304  			opp-hz = /bits/ 64 <1008000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   305  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   306  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   307  		};
57b1ce9039665c Detlev Casanova    2024-09-03   308  
57b1ce9039665c Detlev Casanova    2024-09-03   309  		opp-1200000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   310  			opp-hz = /bits/ 64 <1200000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   311  			opp-microvolt = <700000 700000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   312  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   313  		};
57b1ce9039665c Detlev Casanova    2024-09-03   314  
57b1ce9039665c Detlev Casanova    2024-09-03   315  		opp-1416000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   316  			opp-hz = /bits/ 64 <1416000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   317  			opp-microvolt = <712500 712500 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   318  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   319  		};
57b1ce9039665c Detlev Casanova    2024-09-03   320  
57b1ce9039665c Detlev Casanova    2024-09-03   321  		opp-1608000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   322  			opp-hz = /bits/ 64 <1608000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   323  			opp-microvolt = <737500 737500 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   324  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   325  		};
57b1ce9039665c Detlev Casanova    2024-09-03   326  
57b1ce9039665c Detlev Casanova    2024-09-03   327  		opp-1800000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   328  			opp-hz = /bits/ 64 <1800000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   329  			opp-microvolt = <800000 800000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   330  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   331  		};
57b1ce9039665c Detlev Casanova    2024-09-03   332  
57b1ce9039665c Detlev Casanova    2024-09-03   333  		opp-2016000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   334  			opp-hz = /bits/ 64 <2016000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   335  			opp-microvolt = <862500 862500 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   336  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   337  		};
57b1ce9039665c Detlev Casanova    2024-09-03   338  
57b1ce9039665c Detlev Casanova    2024-09-03   339  		opp-2208000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   340  			opp-hz = /bits/ 64 <2208000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   341  			opp-microvolt = <925000 925000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   342  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   343  		};
57b1ce9039665c Detlev Casanova    2024-09-03   344  
57b1ce9039665c Detlev Casanova    2024-09-03   345  		opp-2304000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   346  			opp-hz = /bits/ 64 <2304000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   347  			opp-microvolt = <950000 950000 950000>;
57b1ce9039665c Detlev Casanova    2024-09-03   348  			clock-latency-ns = <40000>;
57b1ce9039665c Detlev Casanova    2024-09-03   349  		};
57b1ce9039665c Detlev Casanova    2024-09-03   350  	};
57b1ce9039665c Detlev Casanova    2024-09-03   351  
57b1ce9039665c Detlev Casanova    2024-09-03   352  	gpu_opp_table: opp-table-gpu {
57b1ce9039665c Detlev Casanova    2024-09-03   353  		compatible = "operating-points-v2";
57b1ce9039665c Detlev Casanova    2024-09-03   354  
57b1ce9039665c Detlev Casanova    2024-09-03   355  		opp-300000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   356  			opp-hz = /bits/ 64 <300000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   357  			opp-microvolt = <700000 700000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   358  		};
57b1ce9039665c Detlev Casanova    2024-09-03   359  
57b1ce9039665c Detlev Casanova    2024-09-03   360  		opp-400000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   361  			opp-hz = /bits/ 64 <400000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   362  			opp-microvolt = <700000 700000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   363  		};
57b1ce9039665c Detlev Casanova    2024-09-03   364  
57b1ce9039665c Detlev Casanova    2024-09-03   365  		opp-500000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   366  			opp-hz = /bits/ 64 <500000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   367  			opp-microvolt = <700000 700000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   368  		};
57b1ce9039665c Detlev Casanova    2024-09-03   369  
57b1ce9039665c Detlev Casanova    2024-09-03   370  		opp-600000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   371  			opp-hz = /bits/ 64 <600000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   372  			opp-microvolt = <700000 700000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   373  		};
57b1ce9039665c Detlev Casanova    2024-09-03   374  
57b1ce9039665c Detlev Casanova    2024-09-03   375  		opp-700000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   376  			opp-hz = /bits/ 64 <700000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   377  			opp-microvolt = <725000 725000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   378  		};
57b1ce9039665c Detlev Casanova    2024-09-03   379  
57b1ce9039665c Detlev Casanova    2024-09-03   380  		opp-800000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   381  			opp-hz = /bits/ 64 <800000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   382  			opp-microvolt = <775000 775000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   383  		};
57b1ce9039665c Detlev Casanova    2024-09-03   384  
57b1ce9039665c Detlev Casanova    2024-09-03   385  		opp-900000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   386  			opp-hz = /bits/ 64 <900000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   387  			opp-microvolt = <825000 825000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   388  		};
57b1ce9039665c Detlev Casanova    2024-09-03   389  
57b1ce9039665c Detlev Casanova    2024-09-03   390  		opp-950000000 {
57b1ce9039665c Detlev Casanova    2024-09-03   391  			opp-hz = /bits/ 64 <950000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   392  			opp-microvolt = <850000 850000 850000>;
57b1ce9039665c Detlev Casanova    2024-09-03   393  		};
57b1ce9039665c Detlev Casanova    2024-09-03   394  	};
57b1ce9039665c Detlev Casanova    2024-09-03   395  
d74b842cab0860 Andy Yan           2024-12-31   396  	display_subsystem: display-subsystem {
d74b842cab0860 Andy Yan           2024-12-31   397  		compatible = "rockchip,display-subsystem";
d74b842cab0860 Andy Yan           2024-12-31   398  		ports = <&vop_out>;
d74b842cab0860 Andy Yan           2024-12-31   399  	};
d74b842cab0860 Andy Yan           2024-12-31   400  
57b1ce9039665c Detlev Casanova    2024-09-03   401  	firmware {
57b1ce9039665c Detlev Casanova    2024-09-03   402  		scmi: scmi {
57b1ce9039665c Detlev Casanova    2024-09-03   403  			compatible = "arm,scmi-smc";
57b1ce9039665c Detlev Casanova    2024-09-03   404  			arm,smc-id = <0x82000010>;
57b1ce9039665c Detlev Casanova    2024-09-03   405  			shmem = <&scmi_shmem>;
57b1ce9039665c Detlev Casanova    2024-09-03   406  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   407  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   408  
57b1ce9039665c Detlev Casanova    2024-09-03   409  			scmi_clk: protocol@14 {
57b1ce9039665c Detlev Casanova    2024-09-03   410  				reg = <0x14>;
57b1ce9039665c Detlev Casanova    2024-09-03   411  				#clock-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   412  			};
57b1ce9039665c Detlev Casanova    2024-09-03   413  		};
57b1ce9039665c Detlev Casanova    2024-09-03   414  	};
57b1ce9039665c Detlev Casanova    2024-09-03   415  
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   416  	hdmi_sound: hdmi-sound {
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   417  		compatible = "simple-audio-card";
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   418  		simple-audio-card,name = "HDMI";
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   419  		simple-audio-card,format = "i2s";
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   420  		simple-audio-card,mclk-fs = <256>;
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   421  		status = "disabled";
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   422  
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   423  		simple-audio-card,codec {
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   424  			sound-dai = <&hdmi>;
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   425  		};
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   426  
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   427  		simple-audio-card,cpu {
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   428  			sound-dai = <&sai6>;
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   429  		};
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   430  	};
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06   431  
8ff721f60257d5 Heiko Stuebner     2025-05-19   432  	pinctrl: pinctrl {
8ff721f60257d5 Heiko Stuebner     2025-05-19   433  		compatible = "rockchip,rk3576-pinctrl";
8ff721f60257d5 Heiko Stuebner     2025-05-19   434  		rockchip,grf = <&ioc_grf>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   435  		#address-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   436  		#size-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   437  		ranges;
8ff721f60257d5 Heiko Stuebner     2025-05-19   438  
8ff721f60257d5 Heiko Stuebner     2025-05-19   439  		gpio0: gpio@27320000 {
8ff721f60257d5 Heiko Stuebner     2025-05-19   440  			compatible = "rockchip,gpio-bank";
8ff721f60257d5 Heiko Stuebner     2025-05-19   441  			reg = <0x0 0x27320000 0x0 0x200>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   442  			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   443  			gpio-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   444  			gpio-ranges = <&pinctrl 0 0 32>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   445  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   446  			interrupt-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   447  			#gpio-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   448  			#interrupt-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   449  		};
8ff721f60257d5 Heiko Stuebner     2025-05-19   450  
8ff721f60257d5 Heiko Stuebner     2025-05-19   451  		gpio1: gpio@2ae10000 {
8ff721f60257d5 Heiko Stuebner     2025-05-19   452  			compatible = "rockchip,gpio-bank";
8ff721f60257d5 Heiko Stuebner     2025-05-19   453  			reg = <0x0 0x2ae10000 0x0 0x200>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   454  			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   455  			gpio-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   456  			gpio-ranges = <&pinctrl 0 32 32>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   457  			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   458  			interrupt-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   459  			#gpio-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   460  			#interrupt-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   461  		};
8ff721f60257d5 Heiko Stuebner     2025-05-19   462  
8ff721f60257d5 Heiko Stuebner     2025-05-19   463  		gpio2: gpio@2ae20000 {
8ff721f60257d5 Heiko Stuebner     2025-05-19   464  			compatible = "rockchip,gpio-bank";
8ff721f60257d5 Heiko Stuebner     2025-05-19   465  			reg = <0x0 0x2ae20000 0x0 0x200>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   466  			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   467  			gpio-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   468  			gpio-ranges = <&pinctrl 0 64 32>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   469  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   470  			interrupt-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   471  			#gpio-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   472  			#interrupt-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   473  		};
8ff721f60257d5 Heiko Stuebner     2025-05-19   474  
8ff721f60257d5 Heiko Stuebner     2025-05-19   475  		gpio3: gpio@2ae30000 {
8ff721f60257d5 Heiko Stuebner     2025-05-19   476  			compatible = "rockchip,gpio-bank";
8ff721f60257d5 Heiko Stuebner     2025-05-19   477  			reg = <0x0 0x2ae30000 0x0 0x200>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   478  			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   479  			gpio-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   480  			gpio-ranges = <&pinctrl 0 96 32>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   481  			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   482  			interrupt-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   483  			#gpio-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   484  			#interrupt-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   485  		};
8ff721f60257d5 Heiko Stuebner     2025-05-19   486  
8ff721f60257d5 Heiko Stuebner     2025-05-19   487  		gpio4: gpio@2ae40000 {
8ff721f60257d5 Heiko Stuebner     2025-05-19   488  			compatible = "rockchip,gpio-bank";
8ff721f60257d5 Heiko Stuebner     2025-05-19   489  			reg = <0x0 0x2ae40000 0x0 0x200>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   490  			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   491  			gpio-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   492  			gpio-ranges = <&pinctrl 0 128 32>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   493  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   494  			interrupt-controller;
8ff721f60257d5 Heiko Stuebner     2025-05-19   495  			#gpio-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   496  			#interrupt-cells = <2>;
8ff721f60257d5 Heiko Stuebner     2025-05-19   497  		};
8ff721f60257d5 Heiko Stuebner     2025-05-19   498  	};
8ff721f60257d5 Heiko Stuebner     2025-05-19   499  
57b1ce9039665c Detlev Casanova    2024-09-03   500  	pmu_a53: pmu-a53 {
57b1ce9039665c Detlev Casanova    2024-09-03   501  		compatible = "arm,cortex-a53-pmu";
57b1ce9039665c Detlev Casanova    2024-09-03   502  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   503  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   504  			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   505  			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03   506  		interrupt-affinity = <&cpu_l0>, <&cpu_l1>, <&cpu_l2>, <&cpu_l3>;
57b1ce9039665c Detlev Casanova    2024-09-03   507  	};
57b1ce9039665c Detlev Casanova    2024-09-03   508  
57b1ce9039665c Detlev Casanova    2024-09-03   509  	pmu_a72: pmu-a72 {
57b1ce9039665c Detlev Casanova    2024-09-03   510  		compatible = "arm,cortex-a72-pmu";
57b1ce9039665c Detlev Casanova    2024-09-03   511  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   512  			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   513  			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03   514  			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03   515  		interrupt-affinity = <&cpu_b0>, <&cpu_b1>, <&cpu_b2>, <&cpu_b3>;
57b1ce9039665c Detlev Casanova    2024-09-03   516  	};
57b1ce9039665c Detlev Casanova    2024-09-03   517  
57b1ce9039665c Detlev Casanova    2024-09-03   518  	psci {
57b1ce9039665c Detlev Casanova    2024-09-03   519  		compatible = "arm,psci-1.0";
57b1ce9039665c Detlev Casanova    2024-09-03   520  		method = "smc";
57b1ce9039665c Detlev Casanova    2024-09-03   521  	};
57b1ce9039665c Detlev Casanova    2024-09-03   522  
57b1ce9039665c Detlev Casanova    2024-09-03   523  	timer {
57b1ce9039665c Detlev Casanova    2024-09-03   524  		compatible = "arm,armv8-timer";
57b1ce9039665c Detlev Casanova    2024-09-03   525  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
57b1ce9039665c Detlev Casanova    2024-09-03   526  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
57b1ce9039665c Detlev Casanova    2024-09-03   527  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
57b1ce9039665c Detlev Casanova    2024-09-03   528  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
57b1ce9039665c Detlev Casanova    2024-09-03   529  	};
57b1ce9039665c Detlev Casanova    2024-09-03   530  
57b1ce9039665c Detlev Casanova    2024-09-03   531  	soc {
57b1ce9039665c Detlev Casanova    2024-09-03   532  		compatible = "simple-bus";
57b1ce9039665c Detlev Casanova    2024-09-03   533  		#address-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03   534  		#size-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03   535  		ranges;
57b1ce9039665c Detlev Casanova    2024-09-03   536  
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   537  		pcie0: pcie@22000000 {
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   538  			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   539  			reg = <0x0 0x22000000 0x0 0x00400000>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   540  			      <0x0 0x2a200000 0x0 0x00010000>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   541  			      <0x0 0x20000000 0x0 0x00100000>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   542  			reg-names = "dbi", "apb", "config";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   543  			bus-range = <0x0 0xf>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   544  			clocks = <&cru ACLK_PCIE0_MST>, <&cru ACLK_PCIE0_SLV>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   545  				 <&cru ACLK_PCIE0_DBI>, <&cru PCLK_PCIE0>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   546  				 <&cru CLK_PCIE0_AUX>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   547  			clock-names = "aclk_mst", "aclk_slv",
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   548  				      "aclk_dbi", "pclk",
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   549  				      "aux";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   550  			device_type = "pci";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   551  			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   552  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   553  				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   554  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   555  				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   556  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   557  			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   558  			#interrupt-cells = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   559  			interrupt-map-mask = <0 0 0 7>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   560  			interrupt-map = <0 0 0 1 &pcie0_intc 0>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   561  					<0 0 0 2 &pcie0_intc 1>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   562  					<0 0 0 3 &pcie0_intc 2>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   563  					<0 0 0 4 &pcie0_intc 3>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   564  			linux,pci-domain = <0>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   565  			max-link-speed = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   566  			num-ib-windows = <8>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   567  			num-viewport = <8>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   568  			num-ob-windows = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   569  			num-lanes = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   570  			phys = <&combphy0_ps PHY_TYPE_PCIE>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   571  			phy-names = "pcie-phy";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   572  			power-domains = <&power RK3576_PD_PHP>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   573  			ranges = <0x01000000 0x0 0x20100000 0x0 0x20100000 0x0 0x00100000
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   574  				  0x02000000 0x0 0x20200000 0x0 0x20200000 0x0 0x00e00000
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   575  				  0x03000000 0x9 0x00000000 0x9 0x00000000 0x0 0x80000000>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   576  			resets = <&cru SRST_PCIE0_POWER_UP>, <&cru SRST_P_PCIE0>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   577  			reset-names = "pwr", "pipe";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   578  			#address-cells = <3>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   579  			#size-cells = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   580  			status = "disabled";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   581  
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   582  			pcie0_intc: legacy-interrupt-controller {
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   583  				interrupt-controller;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   584  				#address-cells = <0>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   585  				#interrupt-cells = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   586  				interrupt-parent = <&gic>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   587  				interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   588  			};
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   589  		};
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   590  
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   591  		pcie1: pcie@22400000 {
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   592  			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   593  			reg = <0x0 0x22400000 0x0 0x00400000>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   594  			      <0x0 0x2a210000 0x0 0x00010000>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   595  			      <0x0 0x21000000 0x0 0x00100000>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   596  			reg-names = "dbi", "apb", "config";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   597  			bus-range = <0x20 0x2f>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   598  			clocks = <&cru ACLK_PCIE1_MST>, <&cru ACLK_PCIE1_SLV>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   599  				 <&cru ACLK_PCIE1_DBI>, <&cru PCLK_PCIE1>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   600  				 <&cru CLK_PCIE1_AUX>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   601  			clock-names = "aclk_mst", "aclk_slv",
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   602  				      "aclk_dbi", "pclk",
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   603  				      "aux";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   604  			device_type = "pci";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   605  			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   606  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   607  				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   608  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   609  				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   610  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   611  			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   612  			#interrupt-cells = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   613  			interrupt-map-mask = <0 0 0 7>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   614  			interrupt-map = <0 0 0 1 &pcie1_intc 0>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   615  					<0 0 0 2 &pcie1_intc 1>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   616  					<0 0 0 3 &pcie1_intc 2>,
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   617  					<0 0 0 4 &pcie1_intc 3>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   618  			linux,pci-domain = <0>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   619  			max-link-speed = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   620  			num-ib-windows = <8>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   621  			num-viewport = <8>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   622  			num-ob-windows = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   623  			num-lanes = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   624  			phys = <&combphy1_psu PHY_TYPE_PCIE>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   625  			phy-names = "pcie-phy";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   626  			power-domains = <&power RK3576_PD_SUBPHP>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   627  			ranges = <0x01000000 0x0 0x21100000 0x0 0x21100000 0x0 0x00100000
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   628  				  0x02000000 0x0 0x21200000 0x0 0x21200000 0x0 0x00e00000
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   629  				  0x03000000 0x9 0x80000000 0x9 0x80000000 0x0 0x80000000>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   630  			resets = <&cru SRST_PCIE1_POWER_UP>, <&cru SRST_P_PCIE1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   631  			reset-names = "pwr", "pipe";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   632  			#address-cells = <3>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   633  			#size-cells = <2>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   634  			status = "disabled";
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   635  
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   636  			pcie1_intc: legacy-interrupt-controller {
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   637  				interrupt-controller;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   638  				#address-cells = <0>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   639  				#interrupt-cells = <1>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   640  				interrupt-parent = <&gic>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   641  				interrupts = <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   642  			};
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   643  		};
4d2587e0e1ce71 Heiko Stuebner     2025-05-19   644  
23ec57a32da448 Frank Wang         2025-01-07   645  		usb_drd0_dwc3: usb@23000000 {
23ec57a32da448 Frank Wang         2025-01-07   646  			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
23ec57a32da448 Frank Wang         2025-01-07   647  			reg = <0x0 0x23000000 0x0 0x400000>;
23ec57a32da448 Frank Wang         2025-01-07   648  			clocks = <&cru CLK_REF_USB3OTG0>,
23ec57a32da448 Frank Wang         2025-01-07   649  				 <&cru CLK_SUSPEND_USB3OTG0>,
23ec57a32da448 Frank Wang         2025-01-07   650  				 <&cru ACLK_USB3OTG0>;
23ec57a32da448 Frank Wang         2025-01-07   651  			clock-names = "ref_clk", "suspend_clk", "bus_clk";
23ec57a32da448 Frank Wang         2025-01-07   652  			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
23ec57a32da448 Frank Wang         2025-01-07   653  			power-domains = <&power RK3576_PD_USB>;
23ec57a32da448 Frank Wang         2025-01-07   654  			resets = <&cru SRST_A_USB3OTG0>;
23ec57a32da448 Frank Wang         2025-01-07   655  			dr_mode = "otg";
23ec57a32da448 Frank Wang         2025-01-07   656  			phys = <&u2phy0_otg>, <&usbdp_phy PHY_TYPE_USB3>;
23ec57a32da448 Frank Wang         2025-01-07   657  			phy-names = "usb2-phy", "usb3-phy";
23ec57a32da448 Frank Wang         2025-01-07   658  			phy_type = "utmi_wide";
23ec57a32da448 Frank Wang         2025-01-07   659  			snps,dis_enblslpm_quirk;
23ec57a32da448 Frank Wang         2025-01-07   660  			snps,dis-u1-entry-quirk;
23ec57a32da448 Frank Wang         2025-01-07   661  			snps,dis-u2-entry-quirk;
23ec57a32da448 Frank Wang         2025-01-07   662  			snps,dis-u2-freeclk-exists-quirk;
23ec57a32da448 Frank Wang         2025-01-07   663  			snps,dis-del-phy-power-chg-quirk;
23ec57a32da448 Frank Wang         2025-01-07   664  			snps,dis-tx-ipgap-linecheck-quirk;
23ec57a32da448 Frank Wang         2025-01-07   665  			snps,parkmode-disable-hs-quirk;
23ec57a32da448 Frank Wang         2025-01-07   666  			snps,parkmode-disable-ss-quirk;
23ec57a32da448 Frank Wang         2025-01-07   667  			status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   668  		};
23ec57a32da448 Frank Wang         2025-01-07   669  
23ec57a32da448 Frank Wang         2025-01-07   670  		usb_drd1_dwc3: usb@23400000 {
23ec57a32da448 Frank Wang         2025-01-07   671  			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
23ec57a32da448 Frank Wang         2025-01-07   672  			reg = <0x0 0x23400000 0x0 0x400000>;
23ec57a32da448 Frank Wang         2025-01-07   673  			clocks = <&cru CLK_REF_USB3OTG1>,
23ec57a32da448 Frank Wang         2025-01-07   674  				 <&cru CLK_SUSPEND_USB3OTG1>,
23ec57a32da448 Frank Wang         2025-01-07   675  				 <&cru ACLK_USB3OTG1>;
23ec57a32da448 Frank Wang         2025-01-07   676  			clock-names = "ref_clk", "suspend_clk", "bus_clk";
23ec57a32da448 Frank Wang         2025-01-07   677  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
23ec57a32da448 Frank Wang         2025-01-07   678  			power-domains = <&power RK3576_PD_PHP>;
23ec57a32da448 Frank Wang         2025-01-07   679  			resets = <&cru SRST_A_USB3OTG1>;
23ec57a32da448 Frank Wang         2025-01-07   680  			dr_mode = "otg";
23ec57a32da448 Frank Wang         2025-01-07   681  			phys = <&u2phy1_otg>, <&combphy1_psu PHY_TYPE_USB3>;
23ec57a32da448 Frank Wang         2025-01-07   682  			phy-names = "usb2-phy", "usb3-phy";
23ec57a32da448 Frank Wang         2025-01-07   683  			phy_type = "utmi_wide";
23ec57a32da448 Frank Wang         2025-01-07   684  			snps,dis_enblslpm_quirk;
23ec57a32da448 Frank Wang         2025-01-07   685  			snps,dis-u1-entry-quirk;
23ec57a32da448 Frank Wang         2025-01-07   686  			snps,dis-u2-entry-quirk;
23ec57a32da448 Frank Wang         2025-01-07   687  			snps,dis-u2-freeclk-exists-quirk;
23ec57a32da448 Frank Wang         2025-01-07   688  			snps,dis-del-phy-power-chg-quirk;
23ec57a32da448 Frank Wang         2025-01-07   689  			snps,dis-tx-ipgap-linecheck-quirk;
23ec57a32da448 Frank Wang         2025-01-07   690  			snps,dis_rxdet_inp3_quirk;
23ec57a32da448 Frank Wang         2025-01-07   691  			snps,parkmode-disable-hs-quirk;
23ec57a32da448 Frank Wang         2025-01-07   692  			snps,parkmode-disable-ss-quirk;
23ec57a32da448 Frank Wang         2025-01-07   693  			dma-coherent;
23ec57a32da448 Frank Wang         2025-01-07   694  			status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   695  		};
23ec57a32da448 Frank Wang         2025-01-07   696  
57b1ce9039665c Detlev Casanova    2024-09-03   697  		sys_grf: syscon@2600a000 {
57b1ce9039665c Detlev Casanova    2024-09-03   698  			compatible = "rockchip,rk3576-sys-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   699  			reg = <0x0 0x2600a000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   700  		};
57b1ce9039665c Detlev Casanova    2024-09-03   701  
57b1ce9039665c Detlev Casanova    2024-09-03   702  		bigcore_grf: syscon@2600c000 {
57b1ce9039665c Detlev Casanova    2024-09-03   703  			compatible = "rockchip,rk3576-bigcore-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   704  			reg = <0x0 0x2600c000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   705  		};
57b1ce9039665c Detlev Casanova    2024-09-03   706  
57b1ce9039665c Detlev Casanova    2024-09-03   707  		litcore_grf: syscon@2600e000 {
57b1ce9039665c Detlev Casanova    2024-09-03   708  			compatible = "rockchip,rk3576-litcore-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   709  			reg = <0x0 0x2600e000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   710  		};
57b1ce9039665c Detlev Casanova    2024-09-03   711  
57b1ce9039665c Detlev Casanova    2024-09-03   712  		cci_grf: syscon@26010000 {
57b1ce9039665c Detlev Casanova    2024-09-03   713  			compatible = "rockchip,rk3576-cci-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   714  			reg = <0x0 0x26010000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   715  		};
57b1ce9039665c Detlev Casanova    2024-09-03   716  
57b1ce9039665c Detlev Casanova    2024-09-03   717  		gpu_grf: syscon@26016000 {
57b1ce9039665c Detlev Casanova    2024-09-03   718  			compatible = "rockchip,rk3576-gpu-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   719  			reg = <0x0 0x26016000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   720  		};
57b1ce9039665c Detlev Casanova    2024-09-03   721  
57b1ce9039665c Detlev Casanova    2024-09-03   722  		npu_grf: syscon@26018000 {
57b1ce9039665c Detlev Casanova    2024-09-03   723  			compatible = "rockchip,rk3576-npu-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   724  			reg = <0x0 0x26018000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   725  		};
57b1ce9039665c Detlev Casanova    2024-09-03   726  
57b1ce9039665c Detlev Casanova    2024-09-03   727  		vo0_grf: syscon@2601a000 {
57b1ce9039665c Detlev Casanova    2024-09-03   728  			compatible = "rockchip,rk3576-vo0-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   729  			reg = <0x0 0x2601a000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   730  		};
57b1ce9039665c Detlev Casanova    2024-09-03   731  
57b1ce9039665c Detlev Casanova    2024-09-03   732  		usb_grf: syscon@2601e000 {
57b1ce9039665c Detlev Casanova    2024-09-03   733  			compatible = "rockchip,rk3576-usb-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   734  			reg = <0x0 0x2601e000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03   735  		};
57b1ce9039665c Detlev Casanova    2024-09-03   736  
57b1ce9039665c Detlev Casanova    2024-09-03   737  		php_grf: syscon@26020000 {
57b1ce9039665c Detlev Casanova    2024-09-03   738  			compatible = "rockchip,rk3576-php-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   739  			reg = <0x0 0x26020000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   740  		};
57b1ce9039665c Detlev Casanova    2024-09-03   741  
57b1ce9039665c Detlev Casanova    2024-09-03   742  		pmu0_grf: syscon@26024000 {
57b1ce9039665c Detlev Casanova    2024-09-03   743  			compatible = "rockchip,rk3576-pmu0-grf", "syscon", "simple-mfd";
57b1ce9039665c Detlev Casanova    2024-09-03   744  			reg = <0x0 0x26024000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03   745  		};
57b1ce9039665c Detlev Casanova    2024-09-03   746  
57b1ce9039665c Detlev Casanova    2024-09-03   747  		pmu1_grf: syscon@26026000 {
57b1ce9039665c Detlev Casanova    2024-09-03   748  			compatible = "rockchip,rk3576-pmu1-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   749  			reg = <0x0 0x26026000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03   750  		};
57b1ce9039665c Detlev Casanova    2024-09-03   751  
57b1ce9039665c Detlev Casanova    2024-09-03   752  		pipe_phy0_grf: syscon@26028000 {
57b1ce9039665c Detlev Casanova    2024-09-03   753  			compatible = "rockchip,rk3576-pipe-phy-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   754  			reg = <0x0 0x26028000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   755  		};
57b1ce9039665c Detlev Casanova    2024-09-03   756  
57b1ce9039665c Detlev Casanova    2024-09-03   757  		pipe_phy1_grf: syscon@2602a000 {
57b1ce9039665c Detlev Casanova    2024-09-03   758  			compatible = "rockchip,rk3576-pipe-phy-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   759  			reg = <0x0 0x2602a000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   760  		};
57b1ce9039665c Detlev Casanova    2024-09-03   761  
57b1ce9039665c Detlev Casanova    2024-09-03   762  		usbdpphy_grf: syscon@2602c000 {
57b1ce9039665c Detlev Casanova    2024-09-03   763  			compatible = "rockchip,rk3576-usbdpphy-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   764  			reg = <0x0 0x2602c000 0x0 0x2000>;
57b1ce9039665c Detlev Casanova    2024-09-03   765  		};
57b1ce9039665c Detlev Casanova    2024-09-03   766  
23ec57a32da448 Frank Wang         2025-01-07   767  		usb2phy_grf: syscon@2602e000 {
23ec57a32da448 Frank Wang         2025-01-07   768  			compatible = "rockchip,rk3576-usb2phy-grf", "syscon", "simple-mfd";
23ec57a32da448 Frank Wang         2025-01-07   769  			reg = <0x0 0x2602e000 0x0 0x4000>;
23ec57a32da448 Frank Wang         2025-01-07   770  			#address-cells = <1>;
23ec57a32da448 Frank Wang         2025-01-07   771  			#size-cells = <1>;
23ec57a32da448 Frank Wang         2025-01-07   772  
23ec57a32da448 Frank Wang         2025-01-07   773  			u2phy0: usb2-phy@0 {
23ec57a32da448 Frank Wang         2025-01-07   774  				compatible = "rockchip,rk3576-usb2phy";
23ec57a32da448 Frank Wang         2025-01-07   775  				reg = <0x0 0x10>;
23ec57a32da448 Frank Wang         2025-01-07   776  				resets = <&cru SRST_OTGPHY_0>, <&cru SRST_P_USBPHY_GRF_0>;
23ec57a32da448 Frank Wang         2025-01-07   777  				reset-names = "phy", "apb";
23ec57a32da448 Frank Wang         2025-01-07   778  				clocks = <&cru CLK_PHY_REF_SRC>,
23ec57a32da448 Frank Wang         2025-01-07   779  					 <&cru ACLK_MMU2>,
23ec57a32da448 Frank Wang         2025-01-07   780  					 <&cru ACLK_SLV_MMU2>;
23ec57a32da448 Frank Wang         2025-01-07   781  				clock-names = "phyclk", "aclk", "aclk_slv";
23ec57a32da448 Frank Wang         2025-01-07   782  				clock-output-names = "usb480m_phy0";
23ec57a32da448 Frank Wang         2025-01-07   783  				#clock-cells = <0>;
23ec57a32da448 Frank Wang         2025-01-07   784  				status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   785  
23ec57a32da448 Frank Wang         2025-01-07   786  				u2phy0_otg: otg-port {
23ec57a32da448 Frank Wang         2025-01-07   787  					#phy-cells = <0>;
23ec57a32da448 Frank Wang         2025-01-07   788  					interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
23ec57a32da448 Frank Wang         2025-01-07   789  						     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
23ec57a32da448 Frank Wang         2025-01-07   790  						     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
23ec57a32da448 Frank Wang         2025-01-07   791  					interrupt-names = "otg-bvalid", "otg-id", "linestate";
23ec57a32da448 Frank Wang         2025-01-07   792  					status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   793  				};
23ec57a32da448 Frank Wang         2025-01-07   794  			};
23ec57a32da448 Frank Wang         2025-01-07   795  
23ec57a32da448 Frank Wang         2025-01-07   796  			u2phy1: usb2-phy@2000 {
23ec57a32da448 Frank Wang         2025-01-07   797  				compatible = "rockchip,rk3576-usb2phy";
23ec57a32da448 Frank Wang         2025-01-07   798  				reg = <0x2000 0x10>;
23ec57a32da448 Frank Wang         2025-01-07   799  				resets = <&cru SRST_OTGPHY_1>, <&cru SRST_P_USBPHY_GRF_1>;
23ec57a32da448 Frank Wang         2025-01-07   800  				reset-names = "phy", "apb";
23ec57a32da448 Frank Wang         2025-01-07   801  				clocks = <&cru CLK_PHY_REF_SRC>,
23ec57a32da448 Frank Wang         2025-01-07   802  					 <&cru ACLK_MMU1>,
23ec57a32da448 Frank Wang         2025-01-07   803  					 <&cru ACLK_SLV_MMU1>;
23ec57a32da448 Frank Wang         2025-01-07   804  				clock-names = "phyclk", "aclk", "aclk_slv";
23ec57a32da448 Frank Wang         2025-01-07   805  				clock-output-names = "usb480m_phy1";
23ec57a32da448 Frank Wang         2025-01-07   806  				#clock-cells = <0>;
23ec57a32da448 Frank Wang         2025-01-07   807  				status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   808  
23ec57a32da448 Frank Wang         2025-01-07   809  				u2phy1_otg: otg-port {
23ec57a32da448 Frank Wang         2025-01-07   810  					#phy-cells = <0>;
23ec57a32da448 Frank Wang         2025-01-07   811  					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
23ec57a32da448 Frank Wang         2025-01-07   812  						     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
23ec57a32da448 Frank Wang         2025-01-07   813  						     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
23ec57a32da448 Frank Wang         2025-01-07   814  					interrupt-names = "otg-bvalid", "otg-id", "linestate";
23ec57a32da448 Frank Wang         2025-01-07   815  					status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07   816  				};
23ec57a32da448 Frank Wang         2025-01-07   817  			};
23ec57a32da448 Frank Wang         2025-01-07   818  		};
23ec57a32da448 Frank Wang         2025-01-07   819  
ad0ea230ab2a35 Andy Yan           2024-12-31   820  		hdptxphy_grf: syscon@26032000 {
ad0ea230ab2a35 Andy Yan           2024-12-31   821  			compatible = "rockchip,rk3576-hdptxphy-grf", "syscon";
ad0ea230ab2a35 Andy Yan           2024-12-31   822  			reg = <0x0 0x26032000 0x0 0x100>;
ad0ea230ab2a35 Andy Yan           2024-12-31   823  		};
ad0ea230ab2a35 Andy Yan           2024-12-31   824  
23ec57a32da448 Frank Wang         2025-01-07   825  		vo1_grf: syscon@26036000 {
23ec57a32da448 Frank Wang         2025-01-07   826  			compatible = "rockchip,rk3576-vo1-grf", "syscon";
23ec57a32da448 Frank Wang         2025-01-07   827  			reg = <0x0 0x26036000 0x0 0x100>;
23ec57a32da448 Frank Wang         2025-01-07   828  			clocks = <&cru PCLK_VO1_ROOT>;
23ec57a32da448 Frank Wang         2025-01-07   829  		};
23ec57a32da448 Frank Wang         2025-01-07   830  
57b1ce9039665c Detlev Casanova    2024-09-03   831  		sdgmac_grf: syscon@26038000 {
57b1ce9039665c Detlev Casanova    2024-09-03   832  			compatible = "rockchip,rk3576-sdgmac-grf", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03   833  			reg = <0x0 0x26038000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03   834  		};
57b1ce9039665c Detlev Casanova    2024-09-03   835  
57b1ce9039665c Detlev Casanova    2024-09-03   836  		ioc_grf: syscon@26040000 {
57b1ce9039665c Detlev Casanova    2024-09-03   837  			compatible = "rockchip,rk3576-ioc-grf", "syscon", "simple-mfd";
57b1ce9039665c Detlev Casanova    2024-09-03   838  			reg = <0x0 0x26040000 0x0 0xc000>;
57b1ce9039665c Detlev Casanova    2024-09-03   839  		};
57b1ce9039665c Detlev Casanova    2024-09-03   840  
57b1ce9039665c Detlev Casanova    2024-09-03   841  		cru: clock-controller@27200000 {
57b1ce9039665c Detlev Casanova    2024-09-03   842  			compatible = "rockchip,rk3576-cru";
57b1ce9039665c Detlev Casanova    2024-09-03   843  			reg = <0x0 0x27200000 0x0 0x50000>;
57b1ce9039665c Detlev Casanova    2024-09-03   844  			#clock-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   845  			#reset-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   846  
57b1ce9039665c Detlev Casanova    2024-09-03   847  			assigned-clocks =
57b1ce9039665c Detlev Casanova    2024-09-03   848  				<&cru CLK_AUDIO_FRAC_1_SRC>,
57b1ce9039665c Detlev Casanova    2024-09-03   849  				<&cru PLL_GPLL>, <&cru PLL_CPLL>,
57b1ce9039665c Detlev Casanova    2024-09-03   850  				<&cru PLL_AUPLL>, <&cru CLK_UART_FRAC_0>,
57b1ce9039665c Detlev Casanova    2024-09-03   851  				<&cru CLK_UART_FRAC_1>, <&cru CLK_UART_FRAC_2>,
57b1ce9039665c Detlev Casanova    2024-09-03   852  				<&cru CLK_AUDIO_FRAC_0>, <&cru CLK_AUDIO_FRAC_1>,
57b1ce9039665c Detlev Casanova    2024-09-03   853  				<&cru CLK_CPLL_DIV2>, <&cru CLK_CPLL_DIV4>,
57b1ce9039665c Detlev Casanova    2024-09-03   854  				<&cru CLK_CPLL_DIV10>, <&cru FCLK_DDR_CM0_CORE>,
57b1ce9039665c Detlev Casanova    2024-09-03   855  				<&cru ACLK_PHP_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03   856  			assigned-clock-parents = <&cru PLL_AUPLL>;
57b1ce9039665c Detlev Casanova    2024-09-03   857  			assigned-clock-rates =
57b1ce9039665c Detlev Casanova    2024-09-03   858  				<0>,
57b1ce9039665c Detlev Casanova    2024-09-03   859  				<1188000000>, <1000000000>,
57b1ce9039665c Detlev Casanova    2024-09-03   860  				<786432000>, <18432000>,
57b1ce9039665c Detlev Casanova    2024-09-03   861  				<96000000>, <128000000>,
57b1ce9039665c Detlev Casanova    2024-09-03   862  				<45158400>, <49152000>,
57b1ce9039665c Detlev Casanova    2024-09-03   863  				<500000000>, <250000000>,
57b1ce9039665c Detlev Casanova    2024-09-03   864  				<100000000>, <500000000>,
57b1ce9039665c Detlev Casanova    2024-09-03   865  				<250000000>;
57b1ce9039665c Detlev Casanova    2024-09-03   866  		};
57b1ce9039665c Detlev Casanova    2024-09-03   867  
57b1ce9039665c Detlev Casanova    2024-09-03   868  		i2c0: i2c@27300000 {
57b1ce9039665c Detlev Casanova    2024-09-03   869  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03   870  			reg = <0x0 0x27300000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03   871  			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
57b1ce9039665c Detlev Casanova    2024-09-03   872  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03   873  			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03   874  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03   875  			pinctrl-0 = <&i2c0m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03   876  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   877  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   878  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03   879  		};
57b1ce9039665c Detlev Casanova    2024-09-03   880  
57b1ce9039665c Detlev Casanova    2024-09-03   881  		uart1: serial@27310000 {
57b1ce9039665c Detlev Casanova    2024-09-03   882  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03   883  			reg = <0x0 0x27310000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03   884  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03   885  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03   886  			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
57b1ce9039665c Detlev Casanova    2024-09-03   887  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03   888  			dmas = <&dmac0 8>, <&dmac0 9>;
57b1ce9039665c Detlev Casanova    2024-09-03   889  			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03   890  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03   891  			pinctrl-0 = <&uart1m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03   892  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03   893  		};
57b1ce9039665c Detlev Casanova    2024-09-03   894  
57b1ce9039665c Detlev Casanova    2024-09-03   895  		pmu: power-management@27380000 {
57b1ce9039665c Detlev Casanova    2024-09-03   896  			compatible = "rockchip,rk3576-pmu", "syscon", "simple-mfd";
57b1ce9039665c Detlev Casanova    2024-09-03   897  			reg = <0x0 0x27380000 0x0 0x800>;
57b1ce9039665c Detlev Casanova    2024-09-03   898  
57b1ce9039665c Detlev Casanova    2024-09-03   899  			power: power-controller {
57b1ce9039665c Detlev Casanova    2024-09-03   900  				compatible = "rockchip,rk3576-power-controller";
57b1ce9039665c Detlev Casanova    2024-09-03   901  				#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   902  				#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   903  				#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   904  
57b1ce9039665c Detlev Casanova    2024-09-03   905  				power-domain@RK3576_PD_NPU {
57b1ce9039665c Detlev Casanova    2024-09-03   906  					reg = <RK3576_PD_NPU>;
57b1ce9039665c Detlev Casanova    2024-09-03   907  					#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   908  					#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   909  					#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   910  
57b1ce9039665c Detlev Casanova    2024-09-03   911  					power-domain@RK3576_PD_NPUTOP {
57b1ce9039665c Detlev Casanova    2024-09-03   912  						reg = <RK3576_PD_NPUTOP>;
57b1ce9039665c Detlev Casanova    2024-09-03   913  						clocks = <&cru ACLK_RKNN0>,
57b1ce9039665c Detlev Casanova    2024-09-03   914  							 <&cru ACLK_RKNN1>,
57b1ce9039665c Detlev Casanova    2024-09-03   915  							 <&cru ACLK_RKNN_CBUF>,
57b1ce9039665c Detlev Casanova    2024-09-03   916  							 <&cru CLK_RKNN_DSU0>,
57b1ce9039665c Detlev Casanova    2024-09-03   917  							 <&cru HCLK_RKNN_CBUF>,
57b1ce9039665c Detlev Casanova    2024-09-03   918  							 <&cru HCLK_RKNN_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   919  							 <&cru HCLK_NPU_CM0_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   920  							 <&cru PCLK_NPUTOP_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03   921  						pm_qos = <&qos_npu_mcu>,
57b1ce9039665c Detlev Casanova    2024-09-03   922  							 <&qos_npu_nsp0>,
57b1ce9039665c Detlev Casanova    2024-09-03   923  							 <&qos_npu_nsp1>,
57b1ce9039665c Detlev Casanova    2024-09-03   924  							 <&qos_npu_m0ro>,
57b1ce9039665c Detlev Casanova    2024-09-03   925  							 <&qos_npu_m1ro>;
57b1ce9039665c Detlev Casanova    2024-09-03   926  						#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   927  						#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   928  						#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   929  
57b1ce9039665c Detlev Casanova    2024-09-03   930  						power-domain@RK3576_PD_NPU0 {
57b1ce9039665c Detlev Casanova    2024-09-03   931  							reg = <RK3576_PD_NPU0>;
57b1ce9039665c Detlev Casanova    2024-09-03   932  							clocks = <&cru HCLK_RKNN_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   933  								 <&cru ACLK_RKNN0>;
57b1ce9039665c Detlev Casanova    2024-09-03   934  							pm_qos = <&qos_npu_m0>;
57b1ce9039665c Detlev Casanova    2024-09-03   935  							#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   936  						};
57b1ce9039665c Detlev Casanova    2024-09-03   937  						power-domain@RK3576_PD_NPU1 {
57b1ce9039665c Detlev Casanova    2024-09-03   938  							reg = <RK3576_PD_NPU1>;
57b1ce9039665c Detlev Casanova    2024-09-03   939  							clocks = <&cru HCLK_RKNN_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   940  								 <&cru ACLK_RKNN1>;
57b1ce9039665c Detlev Casanova    2024-09-03   941  							pm_qos = <&qos_npu_m1>;
57b1ce9039665c Detlev Casanova    2024-09-03   942  							#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   943  						};
57b1ce9039665c Detlev Casanova    2024-09-03   944  					};
57b1ce9039665c Detlev Casanova    2024-09-03   945  				};
57b1ce9039665c Detlev Casanova    2024-09-03   946  
57b1ce9039665c Detlev Casanova    2024-09-03   947  				power-domain@RK3576_PD_GPU {
57b1ce9039665c Detlev Casanova    2024-09-03   948  					reg = <RK3576_PD_GPU>;
57b1ce9039665c Detlev Casanova    2024-09-03   949  					clocks = <&cru CLK_GPU>, <&cru PCLK_GPU_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03   950  					pm_qos = <&qos_gpu>;
57b1ce9039665c Detlev Casanova    2024-09-03   951  					#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   952  				};
57b1ce9039665c Detlev Casanova    2024-09-03   953  
57b1ce9039665c Detlev Casanova    2024-09-03   954  				power-domain@RK3576_PD_NVM {
57b1ce9039665c Detlev Casanova    2024-09-03   955  					reg = <RK3576_PD_NVM>;
57b1ce9039665c Detlev Casanova    2024-09-03   956  					clocks = <&cru ACLK_EMMC>, <&cru HCLK_EMMC>;
57b1ce9039665c Detlev Casanova    2024-09-03   957  					pm_qos = <&qos_emmc>,
57b1ce9039665c Detlev Casanova    2024-09-03   958  						 <&qos_fspi0>;
57b1ce9039665c Detlev Casanova    2024-09-03   959  					#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   960  					#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   961  					#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   962  
57b1ce9039665c Detlev Casanova    2024-09-03   963  					power-domain@RK3576_PD_SDGMAC {
57b1ce9039665c Detlev Casanova    2024-09-03   964  						reg = <RK3576_PD_SDGMAC>;
57b1ce9039665c Detlev Casanova    2024-09-03   965  						clocks = <&cru ACLK_HSGPIO>,
57b1ce9039665c Detlev Casanova    2024-09-03   966  							 <&cru ACLK_GMAC0>,
57b1ce9039665c Detlev Casanova    2024-09-03   967  							 <&cru ACLK_GMAC1>,
57b1ce9039665c Detlev Casanova    2024-09-03   968  							 <&cru CCLK_SRC_SDIO>,
57b1ce9039665c Detlev Casanova    2024-09-03   969  							 <&cru CCLK_SRC_SDMMC0>,
57b1ce9039665c Detlev Casanova    2024-09-03   970  							 <&cru HCLK_HSGPIO>,
57b1ce9039665c Detlev Casanova    2024-09-03   971  							 <&cru HCLK_SDIO>,
57b1ce9039665c Detlev Casanova    2024-09-03   972  							 <&cru HCLK_SDMMC0>,
57b1ce9039665c Detlev Casanova    2024-09-03   973  							 <&cru PCLK_SDGMAC_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03   974  						pm_qos = <&qos_fspi1>,
57b1ce9039665c Detlev Casanova    2024-09-03   975  							 <&qos_gmac0>,
57b1ce9039665c Detlev Casanova    2024-09-03   976  							 <&qos_gmac1>,
57b1ce9039665c Detlev Casanova    2024-09-03   977  							 <&qos_sdio>,
57b1ce9039665c Detlev Casanova    2024-09-03   978  							 <&qos_sdmmc>,
57b1ce9039665c Detlev Casanova    2024-09-03   979  							 <&qos_flexbus>;
57b1ce9039665c Detlev Casanova    2024-09-03   980  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   981  					};
57b1ce9039665c Detlev Casanova    2024-09-03   982  				};
57b1ce9039665c Detlev Casanova    2024-09-03   983  
57b1ce9039665c Detlev Casanova    2024-09-03   984  				power-domain@RK3576_PD_PHP {
57b1ce9039665c Detlev Casanova    2024-09-03   985  					reg = <RK3576_PD_PHP>;
57b1ce9039665c Detlev Casanova    2024-09-03   986  					clocks = <&cru ACLK_PHP_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   987  						 <&cru PCLK_PHP_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03   988  						 <&cru ACLK_MMU0>,
57b1ce9039665c Detlev Casanova    2024-09-03   989  						 <&cru ACLK_MMU1>;
57b1ce9039665c Detlev Casanova    2024-09-03   990  					pm_qos = <&qos_mmu0>,
57b1ce9039665c Detlev Casanova    2024-09-03   991  						 <&qos_mmu1>;
57b1ce9039665c Detlev Casanova    2024-09-03   992  					#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   993  					#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03   994  					#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   995  
57b1ce9039665c Detlev Casanova    2024-09-03   996  					power-domain@RK3576_PD_SUBPHP {
57b1ce9039665c Detlev Casanova    2024-09-03   997  						reg = <RK3576_PD_SUBPHP>;
57b1ce9039665c Detlev Casanova    2024-09-03   998  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03   999  					};
57b1ce9039665c Detlev Casanova    2024-09-03  1000  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1001  
57b1ce9039665c Detlev Casanova    2024-09-03  1002  				power-domain@RK3576_PD_AUDIO {
57b1ce9039665c Detlev Casanova    2024-09-03  1003  					reg = <RK3576_PD_AUDIO>;
57b1ce9039665c Detlev Casanova    2024-09-03  1004  					#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1005  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1006  
57b1ce9039665c Detlev Casanova    2024-09-03  1007  				power-domain@RK3576_PD_VEPU1 {
57b1ce9039665c Detlev Casanova    2024-09-03  1008  					reg = <RK3576_PD_VEPU1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1009  					clocks = <&cru ACLK_VEPU1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1010  						 <&cru HCLK_VEPU1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1011  					pm_qos = <&qos_vepu1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1012  					#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1013  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1014  
57b1ce9039665c Detlev Casanova    2024-09-03  1015  				power-domain@RK3576_PD_VPU {
57b1ce9039665c Detlev Casanova    2024-09-03  1016  					reg = <RK3576_PD_VPU>;
57b1ce9039665c Detlev Casanova    2024-09-03  1017  					clocks = <&cru ACLK_EBC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1018  						 <&cru HCLK_EBC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1019  						 <&cru ACLK_JPEG>,
57b1ce9039665c Detlev Casanova    2024-09-03  1020  						 <&cru HCLK_JPEG>,
57b1ce9039665c Detlev Casanova    2024-09-03  1021  						 <&cru ACLK_RGA2E_0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1022  						 <&cru HCLK_RGA2E_0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1023  						 <&cru ACLK_RGA2E_1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1024  						 <&cru HCLK_RGA2E_1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1025  						 <&cru ACLK_VDPP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1026  						 <&cru HCLK_VDPP>;
57b1ce9039665c Detlev Casanova    2024-09-03  1027  					pm_qos = <&qos_ebc>,
57b1ce9039665c Detlev Casanova    2024-09-03  1028  						 <&qos_jpeg>,
57b1ce9039665c Detlev Casanova    2024-09-03  1029  						 <&qos_rga0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1030  						 <&qos_rga1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1031  						 <&qos_vdpp>;
57b1ce9039665c Detlev Casanova    2024-09-03  1032  					#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1033  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1034  
57b1ce9039665c Detlev Casanova    2024-09-03  1035  				power-domain@RK3576_PD_VDEC {
57b1ce9039665c Detlev Casanova    2024-09-03  1036  					reg = <RK3576_PD_VDEC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1037  					clocks = <&cru ACLK_RKVDEC_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1038  						 <&cru HCLK_RKVDEC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1039  					pm_qos = <&qos_rkvdec>;
57b1ce9039665c Detlev Casanova    2024-09-03  1040  					#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1041  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1042  
57b1ce9039665c Detlev Casanova    2024-09-03  1043  				power-domain@RK3576_PD_VI {
57b1ce9039665c Detlev Casanova    2024-09-03  1044  					reg = <RK3576_PD_VI>;
57b1ce9039665c Detlev Casanova    2024-09-03  1045  					clocks = <&cru ACLK_VICAP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1046  						 <&cru HCLK_VICAP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1047  						 <&cru DCLK_VICAP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1048  						 <&cru ACLK_VI_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1049  						 <&cru HCLK_VI_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1050  						 <&cru PCLK_VI_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1051  						 <&cru CLK_ISP_CORE>,
57b1ce9039665c Detlev Casanova    2024-09-03  1052  						 <&cru ACLK_ISP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1053  						 <&cru HCLK_ISP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1054  						 <&cru CLK_CORE_VPSS>,
57b1ce9039665c Detlev Casanova    2024-09-03  1055  						 <&cru ACLK_VPSS>,
57b1ce9039665c Detlev Casanova    2024-09-03  1056  						 <&cru HCLK_VPSS>;
57b1ce9039665c Detlev Casanova    2024-09-03  1057  					pm_qos = <&qos_isp_mro>,
57b1ce9039665c Detlev Casanova    2024-09-03  1058  						 <&qos_isp_mwo>,
57b1ce9039665c Detlev Casanova    2024-09-03  1059  						 <&qos_vicap_m0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1060  						 <&qos_vpss_mro>,
57b1ce9039665c Detlev Casanova    2024-09-03  1061  						 <&qos_vpss_mwo>;
57b1ce9039665c Detlev Casanova    2024-09-03  1062  					#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1063  					#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1064  					#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1065  
57b1ce9039665c Detlev Casanova    2024-09-03  1066  					power-domain@RK3576_PD_VEPU0 {
57b1ce9039665c Detlev Casanova    2024-09-03  1067  						reg = <RK3576_PD_VEPU0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1068  						clocks = <&cru ACLK_VEPU0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1069  							 <&cru HCLK_VEPU0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1070  						pm_qos = <&qos_vepu0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1071  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1072  					};
57b1ce9039665c Detlev Casanova    2024-09-03  1073  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1074  
57b1ce9039665c Detlev Casanova    2024-09-03  1075  				power-domain@RK3576_PD_VOP {
57b1ce9039665c Detlev Casanova    2024-09-03  1076  					reg = <RK3576_PD_VOP>;
57b1ce9039665c Detlev Casanova    2024-09-03  1077  					clocks = <&cru ACLK_VOP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1078  						 <&cru HCLK_VOP>,
57b1ce9039665c Detlev Casanova    2024-09-03  1079  						 <&cru HCLK_VOP_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1080  						 <&cru PCLK_VOP_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03  1081  					pm_qos = <&qos_vop_m0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1082  						 <&qos_vop_m1ro>;
57b1ce9039665c Detlev Casanova    2024-09-03  1083  					#power-domain-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1084  					#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1085  					#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1086  
57b1ce9039665c Detlev Casanova    2024-09-03  1087  					power-domain@RK3576_PD_USB {
57b1ce9039665c Detlev Casanova    2024-09-03  1088  						reg = <RK3576_PD_USB>;
57b1ce9039665c Detlev Casanova    2024-09-03  1089  						clocks = <&cru PCLK_PHP_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1090  							 <&cru ACLK_USB_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1091  							 <&cru ACLK_MMU2>,
57b1ce9039665c Detlev Casanova    2024-09-03  1092  							 <&cru ACLK_SLV_MMU2>,
57b1ce9039665c Detlev Casanova    2024-09-03  1093  							 <&cru ACLK_UFS_SYS>;
57b1ce9039665c Detlev Casanova    2024-09-03  1094  						pm_qos = <&qos_mmu2>,
57b1ce9039665c Detlev Casanova    2024-09-03  1095  							 <&qos_ufshc>;
57b1ce9039665c Detlev Casanova    2024-09-03  1096  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1097  					};
57b1ce9039665c Detlev Casanova    2024-09-03  1098  
57b1ce9039665c Detlev Casanova    2024-09-03  1099  					power-domain@RK3576_PD_VO0 {
57b1ce9039665c Detlev Casanova    2024-09-03  1100  						reg = <RK3576_PD_VO0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1101  						clocks = <&cru ACLK_HDCP0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1102  							 <&cru HCLK_HDCP0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1103  							 <&cru ACLK_VO0_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1104  							 <&cru PCLK_VO0_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1105  							 <&cru HCLK_VOP_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03  1106  						pm_qos = <&qos_hdcp0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1107  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1108  					};
57b1ce9039665c Detlev Casanova    2024-09-03  1109  
57b1ce9039665c Detlev Casanova    2024-09-03  1110  					power-domain@RK3576_PD_VO1 {
57b1ce9039665c Detlev Casanova    2024-09-03  1111  						reg = <RK3576_PD_VO1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1112  						clocks = <&cru ACLK_HDCP1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1113  							 <&cru HCLK_HDCP1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1114  							 <&cru ACLK_VO1_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1115  							 <&cru PCLK_VO1_ROOT>,
57b1ce9039665c Detlev Casanova    2024-09-03  1116  							 <&cru HCLK_VOP_ROOT>;
57b1ce9039665c Detlev Casanova    2024-09-03  1117  						pm_qos = <&qos_hdcp1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1118  						#power-domain-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1119  					};
57b1ce9039665c Detlev Casanova    2024-09-03  1120  				};
57b1ce9039665c Detlev Casanova    2024-09-03  1121  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1122  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1123  
57b1ce9039665c Detlev Casanova    2024-09-03  1124  		gpu: gpu@27800000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1125  			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
57b1ce9039665c Detlev Casanova    2024-09-03  1126  			reg = <0x0 0x27800000 0x0 0x200000>;
b5cb721adbe8b6 Nicolas Frattaroli 2025-03-10  1127  			assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
57b1ce9039665c Detlev Casanova    2024-09-03  1128  			assigned-clock-rates = <198000000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1129  			clocks = <&cru CLK_GPU>;
57b1ce9039665c Detlev Casanova    2024-09-03  1130  			clock-names = "core";
57b1ce9039665c Detlev Casanova    2024-09-03  1131  			dynamic-power-coefficient = <1625>;
57b1ce9039665c Detlev Casanova    2024-09-03  1132  			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1133  				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1134  				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1135  			interrupt-names = "job", "mmu", "gpu";
57b1ce9039665c Detlev Casanova    2024-09-03  1136  			operating-points-v2 = <&gpu_opp_table>;
57b1ce9039665c Detlev Casanova    2024-09-03  1137  			power-domains = <&power RK3576_PD_GPU>;
57b1ce9039665c Detlev Casanova    2024-09-03  1138  			#cooling-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  1139  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1140  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1141  
f1ff4c4ad78a40 Detlev Casanova    2025-06-23 @1142  		vdec: video-codec@27b00000 {
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1143  			compatible = "rockchip,rk3576-vdec";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1144  			reg = <0x0 0x27b00100 0x0 0x500>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1145  			      <0x0 0x27b00000 0x0 0x100>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1146  			      <0x0 0x27b00600 0x0 0x100>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1147  			reg-names = "function", "link", "cache";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1148  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1149  			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1150  				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1151  				 <&cru CLK_RKVDEC_HEVC_CA>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1152  			clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1153  			assigned-clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru CLK_RKVDEC_CORE>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1154  					  <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_HEVC_CA>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1155  			assigned-clock-rates = <600000000>, <600000000>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1156  					       <500000000>, <1000000000>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1157  			iommus = <&vdec_mmu>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1158  			power-domains = <&power RK3576_PD_VDEC>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1159  			resets = <&cru SRST_A_RKVDEC_BIU>, <&cru SRST_H_RKVDEC_BIU>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1160  				 <&cru SRST_H_RKVDEC>, <&cru SRST_RKVDEC_CORE>,
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1161  				 <&cru SRST_RKVDEC_HEVC_CA>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1162  			reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1163  			sram = <&rkvdec_sram>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1164  		};
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1165  
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1166  		vdec_mmu: iommu@27b00800 {
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1167  			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1168  			reg = <0x0 0x27b00800 0x0 0x40>, <0x0 0x27b00900 0x0 0x40>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1169  			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1170  			clocks = <&cru CLK_RKVDEC_CORE>, <&cru HCLK_RKVDEC>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1171  			clock-names = "aclk", "iface";
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1172  			power-domains = <&power RK3576_PD_VDEC>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1173  			rockchip,disable-mmu-reset;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1174  			#iommu-cells = <0>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1175  		};
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  1176  
d74b842cab0860 Andy Yan           2024-12-31  1177  		vop: vop@27d00000 {
d74b842cab0860 Andy Yan           2024-12-31  1178  			compatible = "rockchip,rk3576-vop";
d74b842cab0860 Andy Yan           2024-12-31  1179  			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
d74b842cab0860 Andy Yan           2024-12-31  1180  			reg-names = "vop", "gamma-lut";
d74b842cab0860 Andy Yan           2024-12-31  1181  			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
d74b842cab0860 Andy Yan           2024-12-31  1182  				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
d74b842cab0860 Andy Yan           2024-12-31  1183  				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
d74b842cab0860 Andy Yan           2024-12-31  1184  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
d74b842cab0860 Andy Yan           2024-12-31  1185  			interrupt-names = "sys",
d74b842cab0860 Andy Yan           2024-12-31  1186  					  "vp0",
d74b842cab0860 Andy Yan           2024-12-31  1187  					  "vp1",
d74b842cab0860 Andy Yan           2024-12-31  1188  					  "vp2";
d74b842cab0860 Andy Yan           2024-12-31  1189  			clocks = <&cru ACLK_VOP>,
d74b842cab0860 Andy Yan           2024-12-31  1190  				 <&cru HCLK_VOP>,
d74b842cab0860 Andy Yan           2024-12-31  1191  				 <&cru DCLK_VP0>,
d74b842cab0860 Andy Yan           2024-12-31  1192  				 <&cru DCLK_VP1>,
d74b842cab0860 Andy Yan           2024-12-31  1193  				 <&cru DCLK_VP2>;
d74b842cab0860 Andy Yan           2024-12-31  1194  			clock-names = "aclk",
d74b842cab0860 Andy Yan           2024-12-31  1195  				      "hclk",
d74b842cab0860 Andy Yan           2024-12-31  1196  				      "dclk_vp0",
d74b842cab0860 Andy Yan           2024-12-31  1197  				      "dclk_vp1",
d74b842cab0860 Andy Yan           2024-12-31  1198  				      "dclk_vp2";
d74b842cab0860 Andy Yan           2024-12-31  1199  			iommus = <&vop_mmu>;
d74b842cab0860 Andy Yan           2024-12-31  1200  			power-domains = <&power RK3576_PD_VOP>;
d74b842cab0860 Andy Yan           2024-12-31  1201  			rockchip,grf = <&sys_grf>;
d74b842cab0860 Andy Yan           2024-12-31  1202  			rockchip,pmu = <&pmu>;
d74b842cab0860 Andy Yan           2024-12-31  1203  			status = "disabled";
d74b842cab0860 Andy Yan           2024-12-31  1204  
d74b842cab0860 Andy Yan           2024-12-31  1205  			vop_out: ports {
d74b842cab0860 Andy Yan           2024-12-31  1206  				#address-cells = <1>;
d74b842cab0860 Andy Yan           2024-12-31  1207  				#size-cells = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1208  
d74b842cab0860 Andy Yan           2024-12-31  1209  				vp0: port@0 {
d74b842cab0860 Andy Yan           2024-12-31  1210  					#address-cells = <1>;
d74b842cab0860 Andy Yan           2024-12-31  1211  					#size-cells = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1212  					reg = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1213  				};
d74b842cab0860 Andy Yan           2024-12-31  1214  
d74b842cab0860 Andy Yan           2024-12-31  1215  				vp1: port@1 {
d74b842cab0860 Andy Yan           2024-12-31  1216  					#address-cells = <1>;
d74b842cab0860 Andy Yan           2024-12-31  1217  					#size-cells = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1218  					reg = <1>;
d74b842cab0860 Andy Yan           2024-12-31  1219  				};
d74b842cab0860 Andy Yan           2024-12-31  1220  
d74b842cab0860 Andy Yan           2024-12-31  1221  				vp2: port@2 {
d74b842cab0860 Andy Yan           2024-12-31  1222  					#address-cells = <1>;
d74b842cab0860 Andy Yan           2024-12-31  1223  					#size-cells = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1224  					reg = <2>;
d74b842cab0860 Andy Yan           2024-12-31  1225  				};
d74b842cab0860 Andy Yan           2024-12-31  1226  			};
d74b842cab0860 Andy Yan           2024-12-31  1227  		};
d74b842cab0860 Andy Yan           2024-12-31  1228  
d74b842cab0860 Andy Yan           2024-12-31  1229  		vop_mmu: iommu@27d07e00 {
d74b842cab0860 Andy Yan           2024-12-31  1230  			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
d74b842cab0860 Andy Yan           2024-12-31  1231  			reg = <0x0 0x27d07e00 0x0 0x100>, <0x0 0x27d07f00 0x0 0x100>;
d74b842cab0860 Andy Yan           2024-12-31  1232  			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
d74b842cab0860 Andy Yan           2024-12-31  1233  			clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
d74b842cab0860 Andy Yan           2024-12-31  1234  			clock-names = "aclk", "iface";
d74b842cab0860 Andy Yan           2024-12-31  1235  			#iommu-cells = <0>;
d74b842cab0860 Andy Yan           2024-12-31  1236  			power-domains = <&power RK3576_PD_VOP>;
d74b842cab0860 Andy Yan           2024-12-31  1237  			status = "disabled";
d74b842cab0860 Andy Yan           2024-12-31  1238  		};
d74b842cab0860 Andy Yan           2024-12-31  1239  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1240  		sai5: sai@27d40000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1241  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1242  			reg = <0x0 0x27d40000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1243  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1244  			clocks = <&cru MCLK_SAI5_8CH>, <&cru HCLK_SAI5_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1245  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1246  			dmas = <&dmac2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1247  			dma-names = "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1248  			power-domains = <&power RK3576_PD_VO0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1249  			resets = <&cru SRST_M_SAI5_8CH>, <&cru SRST_H_SAI5_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1250  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1251  			rockchip,sai-rx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1252  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1253  			sound-name-prefix = "SAI5";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1254  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1255  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1256  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1257  		sai6: sai@27d50000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1258  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1259  			reg = <0x0 0x27d50000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1260  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1261  			clocks = <&cru MCLK_SAI6_8CH>, <&cru HCLK_SAI6_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1262  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1263  			dmas = <&dmac2 4>, <&dmac2 5>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1264  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1265  			power-domains = <&power RK3576_PD_VO0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1266  			resets = <&cru SRST_M_SAI6_8CH>, <&cru SRST_H_SAI6_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1267  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1268  			rockchip,sai-rx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1269  			rockchip,sai-tx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1270  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1271  			sound-name-prefix = "SAI6";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1272  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1273  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1274  
ad0ea230ab2a35 Andy Yan           2024-12-31  1275  		hdmi: hdmi@27da0000 {
ad0ea230ab2a35 Andy Yan           2024-12-31  1276  			compatible = "rockchip,rk3576-dw-hdmi-qp";
ad0ea230ab2a35 Andy Yan           2024-12-31  1277  			reg = <0x0 0x27da0000 0x0 0x20000>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1278  			clocks = <&cru PCLK_HDMITX0>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1279  				 <&cru CLK_HDMITX0_EARC>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1280  				 <&cru CLK_HDMITX0_REF>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1281  				 <&cru MCLK_SAI6_8CH>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1282  				 <&cru CLK_HDMITXHDP>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1283  				 <&cru HCLK_VO0_ROOT>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1284  			clock-names = "pclk", "earc", "ref", "aud", "hdp", "hclk_vo1";
ad0ea230ab2a35 Andy Yan           2024-12-31  1285  			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1286  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1287  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1288  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
ad0ea230ab2a35 Andy Yan           2024-12-31  1289  				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1290  			interrupt-names = "avp", "cec", "earc", "main", "hpd";
ad0ea230ab2a35 Andy Yan           2024-12-31  1291  			phys = <&hdptxphy>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1292  			pinctrl-names = "default";
ad0ea230ab2a35 Andy Yan           2024-12-31  1293  			pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1294  			power-domains = <&power RK3576_PD_VO0>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1295  			resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMITXHDP>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1296  			reset-names = "ref", "hdp";
ad0ea230ab2a35 Andy Yan           2024-12-31  1297  			rockchip,grf = <&ioc_grf>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1298  			rockchip,vo-grf = <&vo0_grf>;
7f1561d82e3d35 Nicolas Frattaroli 2025-05-06  1299  			#sound-dai-cells = <0>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1300  			status = "disabled";
ad0ea230ab2a35 Andy Yan           2024-12-31  1301  
ad0ea230ab2a35 Andy Yan           2024-12-31  1302  			ports {
ad0ea230ab2a35 Andy Yan           2024-12-31  1303  				#address-cells = <1>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1304  				#size-cells = <0>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1305  
ad0ea230ab2a35 Andy Yan           2024-12-31  1306  				hdmi_in: port@0 {
ad0ea230ab2a35 Andy Yan           2024-12-31  1307  					reg = <0>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1308  				};
ad0ea230ab2a35 Andy Yan           2024-12-31  1309  
ad0ea230ab2a35 Andy Yan           2024-12-31  1310  				hdmi_out: port@1 {
ad0ea230ab2a35 Andy Yan           2024-12-31  1311  					reg = <1>;
ad0ea230ab2a35 Andy Yan           2024-12-31  1312  				};
ad0ea230ab2a35 Andy Yan           2024-12-31  1313  			};
ad0ea230ab2a35 Andy Yan           2024-12-31  1314  		};
ad0ea230ab2a35 Andy Yan           2024-12-31  1315  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1316  		sai7: sai@27ed0000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1317  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1318  			reg = <0x0 0x27ed0000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1319  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1320  			clocks = <&cru MCLK_SAI7_8CH>, <&cru HCLK_SAI7_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1321  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1322  			dmas = <&dmac2 19>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1323  			dma-names = "tx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1324  			power-domains = <&power RK3576_PD_VO1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1325  			resets = <&cru SRST_M_SAI7_8CH>, <&cru SRST_H_SAI7_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1326  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1327  			rockchip,sai-tx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1328  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1329  			sound-name-prefix = "SAI7";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1330  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1331  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1332  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1333  		sai8: sai@27ee0000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1334  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1335  			reg = <0x0 0x27ee0000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1336  			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1337  			clocks = <&cru MCLK_SAI8_8CH>, <&cru HCLK_SAI8_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1338  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1339  			dmas = <&dmac1 7>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1340  			dma-names = "tx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1341  			power-domains = <&power RK3576_PD_VO1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1342  			resets = <&cru SRST_M_SAI8_8CH>, <&cru SRST_H_SAI8_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1343  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1344  			rockchip,sai-tx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1345  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1346  			sound-name-prefix = "SAI8";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1347  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1348  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1349  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1350  		sai9: sai@27ef0000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1351  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1352  			reg = <0x0 0x27ef0000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1353  			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1354  			clocks = <&cru MCLK_SAI9_8CH>, <&cru HCLK_SAI9_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1355  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1356  			dmas = <&dmac0 26>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1357  			dma-names = "tx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1358  			power-domains = <&power RK3576_PD_VO1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1359  			resets = <&cru SRST_M_SAI9_8CH>, <&cru SRST_H_SAI9_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1360  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1361  			rockchip,sai-tx-route = <0 1 2 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1362  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1363  			sound-name-prefix = "SAI9";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1364  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1365  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1366  
57b1ce9039665c Detlev Casanova    2024-09-03  1367  		qos_hdcp1: qos@27f02000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1368  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1369  			reg = <0x0 0x27f02000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1370  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1371  
57b1ce9039665c Detlev Casanova    2024-09-03  1372  		qos_fspi1: qos@27f04000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1373  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1374  			reg = <0x0 0x27f04000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1375  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1376  
57b1ce9039665c Detlev Casanova    2024-09-03  1377  		qos_gmac0: qos@27f04080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1378  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1379  			reg = <0x0 0x27f04080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1380  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1381  
57b1ce9039665c Detlev Casanova    2024-09-03  1382  		qos_gmac1: qos@27f04100 {
57b1ce9039665c Detlev Casanova    2024-09-03  1383  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1384  			reg = <0x0 0x27f04100 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1385  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1386  
57b1ce9039665c Detlev Casanova    2024-09-03  1387  		qos_sdio: qos@27f04180 {
57b1ce9039665c Detlev Casanova    2024-09-03  1388  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1389  			reg = <0x0 0x27f04180 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1390  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1391  
57b1ce9039665c Detlev Casanova    2024-09-03  1392  		qos_sdmmc: qos@27f04200 {
57b1ce9039665c Detlev Casanova    2024-09-03  1393  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1394  			reg = <0x0 0x27f04200 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1395  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1396  
57b1ce9039665c Detlev Casanova    2024-09-03  1397  		qos_flexbus: qos@27f04280 {
57b1ce9039665c Detlev Casanova    2024-09-03  1398  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1399  			reg = <0x0 0x27f04280 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1400  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1401  
57b1ce9039665c Detlev Casanova    2024-09-03  1402  		qos_gpu: qos@27f05000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1403  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1404  			reg = <0x0 0x27f05000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1405  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1406  
57b1ce9039665c Detlev Casanova    2024-09-03  1407  		qos_vepu1: qos@27f06000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1408  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1409  			reg = <0x0 0x27f06000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1410  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1411  
57b1ce9039665c Detlev Casanova    2024-09-03  1412  		qos_npu_mcu: qos@27f08000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1413  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1414  			reg = <0x0 0x27f08000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1415  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1416  
57b1ce9039665c Detlev Casanova    2024-09-03  1417  		qos_npu_nsp0: qos@27f08080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1418  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1419  			reg = <0x0 0x27f08080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1420  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1421  
57b1ce9039665c Detlev Casanova    2024-09-03  1422  		qos_npu_nsp1: qos@27f08100 {
57b1ce9039665c Detlev Casanova    2024-09-03  1423  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1424  			reg = <0x0 0x27f08100 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1425  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1426  
57b1ce9039665c Detlev Casanova    2024-09-03  1427  		qos_emmc: qos@27f09000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1428  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1429  			reg = <0x0 0x27f09000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1430  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1431  
57b1ce9039665c Detlev Casanova    2024-09-03  1432  		qos_fspi0: qos@27f09080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1433  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1434  			reg = <0x0 0x27f09080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1435  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1436  
57b1ce9039665c Detlev Casanova    2024-09-03  1437  		qos_mmu0: qos@27f0a000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1438  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1439  			reg = <0x0 0x27f0a000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1440  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1441  
57b1ce9039665c Detlev Casanova    2024-09-03  1442  		qos_mmu1: qos@27f0a080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1443  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1444  			reg = <0x0 0x27f0a080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1445  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1446  
57b1ce9039665c Detlev Casanova    2024-09-03  1447  		qos_rkvdec: qos@27f0c000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1448  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1449  			reg = <0x0 0x27f0c000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1450  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1451  
57b1ce9039665c Detlev Casanova    2024-09-03  1452  		qos_crypto: qos@27f0d000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1453  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1454  			reg = <0x0 0x27f0d000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1455  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1456  
57b1ce9039665c Detlev Casanova    2024-09-03  1457  		qos_mmu2: qos@27f0e000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1458  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1459  			reg = <0x0 0x27f0e000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1460  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1461  
57b1ce9039665c Detlev Casanova    2024-09-03  1462  		qos_ufshc: qos@27f0e080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1463  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1464  			reg = <0x0 0x27f0e080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1465  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1466  
57b1ce9039665c Detlev Casanova    2024-09-03  1467  		qos_vepu0: qos@27f0f000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1468  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1469  			reg = <0x0 0x27f0f000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1470  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1471  
57b1ce9039665c Detlev Casanova    2024-09-03  1472  		qos_isp_mro: qos@27f10000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1473  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1474  			reg = <0x0 0x27f10000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1475  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1476  
57b1ce9039665c Detlev Casanova    2024-09-03  1477  		qos_isp_mwo: qos@27f10080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1478  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1479  			reg = <0x0 0x27f10080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1480  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1481  
57b1ce9039665c Detlev Casanova    2024-09-03  1482  		qos_vicap_m0: qos@27f10100 {
57b1ce9039665c Detlev Casanova    2024-09-03  1483  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1484  			reg = <0x0 0x27f10100 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1485  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1486  
57b1ce9039665c Detlev Casanova    2024-09-03  1487  		qos_vpss_mro: qos@27f10180 {
57b1ce9039665c Detlev Casanova    2024-09-03  1488  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1489  			reg = <0x0 0x27f10180 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1490  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1491  
57b1ce9039665c Detlev Casanova    2024-09-03  1492  		qos_vpss_mwo: qos@27f10200 {
57b1ce9039665c Detlev Casanova    2024-09-03  1493  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1494  			reg = <0x0 0x27f10200 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1495  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1496  
57b1ce9039665c Detlev Casanova    2024-09-03  1497  		qos_hdcp0: qos@27f11000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1498  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1499  			reg = <0x0 0x27f11000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1500  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1501  
57b1ce9039665c Detlev Casanova    2024-09-03  1502  		qos_vop_m0: qos@27f12800 {
57b1ce9039665c Detlev Casanova    2024-09-03  1503  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1504  			reg = <0x0 0x27f12800 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1505  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1506  
57b1ce9039665c Detlev Casanova    2024-09-03  1507  		qos_vop_m1ro: qos@27f12880 {
57b1ce9039665c Detlev Casanova    2024-09-03  1508  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1509  			reg = <0x0 0x27f12880 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1510  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1511  
57b1ce9039665c Detlev Casanova    2024-09-03  1512  		qos_ebc: qos@27f13000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1513  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1514  			reg = <0x0 0x27f13000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1515  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1516  
57b1ce9039665c Detlev Casanova    2024-09-03  1517  		qos_rga0: qos@27f13080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1518  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1519  			reg = <0x0 0x27f13080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1520  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1521  
57b1ce9039665c Detlev Casanova    2024-09-03  1522  		qos_rga1: qos@27f13100 {
57b1ce9039665c Detlev Casanova    2024-09-03  1523  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1524  			reg = <0x0 0x27f13100 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1525  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1526  
57b1ce9039665c Detlev Casanova    2024-09-03  1527  		qos_jpeg: qos@27f13180 {
57b1ce9039665c Detlev Casanova    2024-09-03  1528  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1529  			reg = <0x0 0x27f13180 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1530  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1531  
57b1ce9039665c Detlev Casanova    2024-09-03  1532  		qos_vdpp: qos@27f13200 {
57b1ce9039665c Detlev Casanova    2024-09-03  1533  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1534  			reg = <0x0 0x27f13200 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1535  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1536  
57b1ce9039665c Detlev Casanova    2024-09-03  1537  		qos_npu_m0: qos@27f20000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1538  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1539  			reg = <0x0 0x27f20000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1540  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1541  
57b1ce9039665c Detlev Casanova    2024-09-03  1542  		qos_npu_m1: qos@27f21000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1543  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1544  			reg = <0x0 0x27f21000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1545  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1546  
57b1ce9039665c Detlev Casanova    2024-09-03  1547  		qos_npu_m0ro: qos@27f22080 {
57b1ce9039665c Detlev Casanova    2024-09-03  1548  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1549  			reg = <0x0 0x27f22080 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1550  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1551  
57b1ce9039665c Detlev Casanova    2024-09-03  1552  		qos_npu_m1ro: qos@27f22100 {
57b1ce9039665c Detlev Casanova    2024-09-03  1553  			compatible = "rockchip,rk3576-qos", "syscon";
57b1ce9039665c Detlev Casanova    2024-09-03  1554  			reg = <0x0 0x27f22100 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  1555  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1556  
57b1ce9039665c Detlev Casanova    2024-09-03  1557  		gmac0: ethernet@2a220000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1558  			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
57b1ce9039665c Detlev Casanova    2024-09-03  1559  			reg = <0x0 0x2a220000 0x0 0x10000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1560  			clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
57b1ce9039665c Detlev Casanova    2024-09-03  1561  				 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
57b1ce9039665c Detlev Casanova    2024-09-03  1562  				 <&cru CLK_GMAC0_PTP_REF>;
57b1ce9039665c Detlev Casanova    2024-09-03  1563  			clock-names = "stmmaceth", "clk_mac_ref",
57b1ce9039665c Detlev Casanova    2024-09-03  1564  				      "pclk_mac", "aclk_mac",
57b1ce9039665c Detlev Casanova    2024-09-03  1565  				      "ptp_ref";
57b1ce9039665c Detlev Casanova    2024-09-03  1566  			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1567  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1568  			interrupt-names = "macirq", "eth_wake_irq";
57b1ce9039665c Detlev Casanova    2024-09-03  1569  			power-domains = <&power RK3576_PD_SDGMAC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1570  			resets = <&cru SRST_A_GMAC0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1571  			reset-names = "stmmaceth";
57b1ce9039665c Detlev Casanova    2024-09-03  1572  			rockchip,grf = <&sdgmac_grf>;
57b1ce9039665c Detlev Casanova    2024-09-03  1573  			rockchip,php-grf = <&ioc_grf>;
57b1ce9039665c Detlev Casanova    2024-09-03  1574  			snps,axi-config = <&gmac0_stmmac_axi_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1575  			snps,mixed-burst;
57b1ce9039665c Detlev Casanova    2024-09-03  1576  			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1577  			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1578  			snps,tso;
57b1ce9039665c Detlev Casanova    2024-09-03  1579  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1580  
57b1ce9039665c Detlev Casanova    2024-09-03  1581  			mdio0: mdio {
57b1ce9039665c Detlev Casanova    2024-09-03  1582  				compatible = "snps,dwmac-mdio";
57b1ce9039665c Detlev Casanova    2024-09-03  1583  				#address-cells = <0x1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1584  				#size-cells = <0x0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1585  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1586  
57b1ce9039665c Detlev Casanova    2024-09-03  1587  			gmac0_stmmac_axi_setup: stmmac-axi-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1588  				snps,blen = <0 0 0 0 16 8 4>;
57b1ce9039665c Detlev Casanova    2024-09-03  1589  				snps,rd_osr_lmt = <8>;
57b1ce9039665c Detlev Casanova    2024-09-03  1590  				snps,wr_osr_lmt = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  1591  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1592  
57b1ce9039665c Detlev Casanova    2024-09-03  1593  			gmac0_mtl_rx_setup: rx-queues-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1594  				snps,rx-queues-to-use = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1595  				queue0 {};
57b1ce9039665c Detlev Casanova    2024-09-03  1596  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1597  
57b1ce9039665c Detlev Casanova    2024-09-03  1598  			gmac0_mtl_tx_setup: tx-queues-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1599  				snps,tx-queues-to-use = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1600  				queue0 {};
57b1ce9039665c Detlev Casanova    2024-09-03  1601  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1602  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1603  
57b1ce9039665c Detlev Casanova    2024-09-03  1604  		gmac1: ethernet@2a230000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1605  			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
57b1ce9039665c Detlev Casanova    2024-09-03  1606  			reg = <0x0 0x2a230000 0x0 0x10000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1607  			clocks = <&cru CLK_GMAC1_125M_SRC>, <&cru CLK_GMAC1_RMII_CRU>,
57b1ce9039665c Detlev Casanova    2024-09-03  1608  				 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
57b1ce9039665c Detlev Casanova    2024-09-03  1609  				 <&cru CLK_GMAC1_PTP_REF>;
57b1ce9039665c Detlev Casanova    2024-09-03  1610  			clock-names = "stmmaceth", "clk_mac_ref",
57b1ce9039665c Detlev Casanova    2024-09-03  1611  				      "pclk_mac", "aclk_mac",
57b1ce9039665c Detlev Casanova    2024-09-03  1612  				      "ptp_ref";
57b1ce9039665c Detlev Casanova    2024-09-03  1613  			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1614  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1615  			interrupt-names = "macirq", "eth_wake_irq";
57b1ce9039665c Detlev Casanova    2024-09-03  1616  			power-domains = <&power RK3576_PD_SDGMAC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1617  			resets = <&cru SRST_A_GMAC1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1618  			reset-names = "stmmaceth";
57b1ce9039665c Detlev Casanova    2024-09-03  1619  			rockchip,grf = <&sdgmac_grf>;
57b1ce9039665c Detlev Casanova    2024-09-03  1620  			rockchip,php-grf = <&ioc_grf>;
57b1ce9039665c Detlev Casanova    2024-09-03  1621  			snps,axi-config = <&gmac1_stmmac_axi_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1622  			snps,mixed-burst;
57b1ce9039665c Detlev Casanova    2024-09-03  1623  			snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1624  			snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
57b1ce9039665c Detlev Casanova    2024-09-03  1625  			snps,tso;
57b1ce9039665c Detlev Casanova    2024-09-03  1626  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1627  
57b1ce9039665c Detlev Casanova    2024-09-03  1628  			mdio1: mdio {
57b1ce9039665c Detlev Casanova    2024-09-03  1629  				compatible = "snps,dwmac-mdio";
57b1ce9039665c Detlev Casanova    2024-09-03  1630  				#address-cells = <0x1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1631  				#size-cells = <0x0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1632  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1633  
57b1ce9039665c Detlev Casanova    2024-09-03  1634  			gmac1_stmmac_axi_setup: stmmac-axi-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1635  				snps,blen = <0 0 0 0 16 8 4>;
57b1ce9039665c Detlev Casanova    2024-09-03  1636  				snps,rd_osr_lmt = <8>;
57b1ce9039665c Detlev Casanova    2024-09-03  1637  				snps,wr_osr_lmt = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  1638  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1639  
57b1ce9039665c Detlev Casanova    2024-09-03  1640  			gmac1_mtl_rx_setup: rx-queues-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1641  				snps,rx-queues-to-use = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1642  				queue0 {};
57b1ce9039665c Detlev Casanova    2024-09-03  1643  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1644  
57b1ce9039665c Detlev Casanova    2024-09-03  1645  			gmac1_mtl_tx_setup: tx-queues-config {
57b1ce9039665c Detlev Casanova    2024-09-03  1646  				snps,tx-queues-to-use = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1647  				queue0 {};
57b1ce9039665c Detlev Casanova    2024-09-03  1648  			};
57b1ce9039665c Detlev Casanova    2024-09-03  1649  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1650  
24d8127d801560 Nicolas Frattaroli 2025-04-24  1651  		sata0: sata@2a240000 {
24d8127d801560 Nicolas Frattaroli 2025-04-24  1652  			compatible = "rockchip,rk3576-dwc-ahci", "snps,dwc-ahci";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1653  			reg = <0x0 0x2a240000 0x0 0x1000>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1654  			clocks = <&cru ACLK_SATA0>, <&cru CLK_PMALIVE0>,
24d8127d801560 Nicolas Frattaroli 2025-04-24  1655  				 <&cru CLK_RXOOB0>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1656  			clock-names = "sata", "pmalive", "rxoob";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1657  			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1658  			power-domains = <&power RK3576_PD_SUBPHP>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1659  			phys = <&combphy0_ps PHY_TYPE_SATA>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1660  			phy-names = "sata-phy";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1661  			ports-implemented = <0x1>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1662  			dma-coherent;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1663  			status = "disabled";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1664  		};
24d8127d801560 Nicolas Frattaroli 2025-04-24  1665  
24d8127d801560 Nicolas Frattaroli 2025-04-24  1666  		sata1: sata@2a250000 {
24d8127d801560 Nicolas Frattaroli 2025-04-24  1667  			compatible = "rockchip,rk3576-dwc-ahci", "snps,dwc-ahci";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1668  			reg = <0x0 0x2a250000 0x0 0x1000>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1669  			clocks = <&cru ACLK_SATA1>, <&cru CLK_PMALIVE1>,
24d8127d801560 Nicolas Frattaroli 2025-04-24  1670  				 <&cru CLK_RXOOB1>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1671  			clock-names = "sata", "pmalive", "rxoob";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1672  			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1673  			power-domains = <&power RK3576_PD_SUBPHP>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1674  			phys = <&combphy1_psu PHY_TYPE_SATA>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1675  			phy-names = "sata-phy";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1676  			ports-implemented = <0x1>;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1677  			dma-coherent;
24d8127d801560 Nicolas Frattaroli 2025-04-24  1678  			status = "disabled";
24d8127d801560 Nicolas Frattaroli 2025-04-24  1679  		};
24d8127d801560 Nicolas Frattaroli 2025-04-24  1680  
c75e5e010fef2a Shawn Lin          2025-02-05  1681  		ufshc: ufshc@2a2d0000 {
c75e5e010fef2a Shawn Lin          2025-02-05  1682  			compatible = "rockchip,rk3576-ufshc";
c75e5e010fef2a Shawn Lin          2025-02-05  1683  			reg = <0x0 0x2a2d0000 0x0 0x10000>,
c75e5e010fef2a Shawn Lin          2025-02-05  1684  			      <0x0 0x2b040000 0x0 0x10000>,
c75e5e010fef2a Shawn Lin          2025-02-05  1685  			      <0x0 0x2601f000 0x0 0x1000>,
c75e5e010fef2a Shawn Lin          2025-02-05  1686  			      <0x0 0x2603c000 0x0 0x1000>,
c75e5e010fef2a Shawn Lin          2025-02-05  1687  			      <0x0 0x2a2e0000 0x0 0x10000>;
c75e5e010fef2a Shawn Lin          2025-02-05  1688  			reg-names = "hci", "mphy", "hci_grf", "mphy_grf", "hci_apb";
c75e5e010fef2a Shawn Lin          2025-02-05  1689  			clocks = <&cru ACLK_UFS_SYS>, <&cru PCLK_USB_ROOT>, <&cru PCLK_MPHY>,
c75e5e010fef2a Shawn Lin          2025-02-05  1690  				 <&cru CLK_REF_UFS_CLKOUT>;
c75e5e010fef2a Shawn Lin          2025-02-05  1691  			clock-names = "core", "pclk", "pclk_mphy", "ref_out";
c75e5e010fef2a Shawn Lin          2025-02-05  1692  			assigned-clocks = <&cru CLK_REF_OSC_MPHY>;
c75e5e010fef2a Shawn Lin          2025-02-05  1693  			assigned-clock-parents = <&cru CLK_REF_MPHY_26M>;
c75e5e010fef2a Shawn Lin          2025-02-05  1694  			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
c75e5e010fef2a Shawn Lin          2025-02-05  1695  			power-domains = <&power RK3576_PD_USB>;
c75e5e010fef2a Shawn Lin          2025-02-05  1696  			pinctrl-0 = <&ufs_refclk>;
c75e5e010fef2a Shawn Lin          2025-02-05  1697  			pinctrl-names = "default";
c75e5e010fef2a Shawn Lin          2025-02-05  1698  			resets = <&cru SRST_A_UFS_BIU>, <&cru SRST_A_UFS_SYS>,
c75e5e010fef2a Shawn Lin          2025-02-05  1699  				 <&cru SRST_A_UFS>, <&cru SRST_P_UFS_GRF>;
c75e5e010fef2a Shawn Lin          2025-02-05  1700  			reset-names = "biu", "sys", "ufs", "grf";
c75e5e010fef2a Shawn Lin          2025-02-05  1701  			reset-gpios = <&gpio4 RK_PD0 GPIO_ACTIVE_LOW>;
c75e5e010fef2a Shawn Lin          2025-02-05  1702  			status = "disabled";
c75e5e010fef2a Shawn Lin          2025-02-05  1703  		};
c75e5e010fef2a Shawn Lin          2025-02-05  1704  
36299757129c89 Detlev Casanova    2025-02-28  1705  		sfc1: spi@2a300000 {
36299757129c89 Detlev Casanova    2025-02-28  1706  			compatible = "rockchip,sfc";
36299757129c89 Detlev Casanova    2025-02-28  1707  			reg = <0x0 0x2a300000 0x0 0x4000>;
36299757129c89 Detlev Casanova    2025-02-28  1708  			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
36299757129c89 Detlev Casanova    2025-02-28  1709  			clocks = <&cru SCLK_FSPI1_X2>, <&cru HCLK_FSPI1>;
36299757129c89 Detlev Casanova    2025-02-28  1710  			clock-names = "clk_sfc", "hclk_sfc";
ede1fa1384c230 Sebastian Reichel  2025-05-20  1711  			power-domains = <&power RK3576_PD_SDGMAC>;
36299757129c89 Detlev Casanova    2025-02-28  1712  			#address-cells = <1>;
36299757129c89 Detlev Casanova    2025-02-28  1713  			#size-cells = <0>;
36299757129c89 Detlev Casanova    2025-02-28  1714  			status = "disabled";
36299757129c89 Detlev Casanova    2025-02-28  1715  		};
36299757129c89 Detlev Casanova    2025-02-28  1716  
57b1ce9039665c Detlev Casanova    2024-09-03  1717  		sdmmc: mmc@2a310000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1718  			compatible = "rockchip,rk3576-dw-mshc";
57b1ce9039665c Detlev Casanova    2024-09-03  1719  			reg = <0x0 0x2a310000 0x0 0x4000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1720  			clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SRC_SDMMC0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1721  			clock-names = "biu", "ciu";
57b1ce9039665c Detlev Casanova    2024-09-03  1722  			fifo-depth = <0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  1723  			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1724  			max-frequency = <200000000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1725  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  1726  			pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4 &sdmmc0_pwren>;
57b1ce9039665c Detlev Casanova    2024-09-03  1727  			power-domains = <&power RK3576_PD_SDGMAC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1728  			resets = <&cru SRST_H_SDMMC0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1729  			reset-names = "reset";
57b1ce9039665c Detlev Casanova    2024-09-03  1730  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1731  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1732  
57b1ce9039665c Detlev Casanova    2024-09-03  1733  		sdhci: mmc@2a330000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1734  			compatible = "rockchip,rk3576-dwcmshc", "rockchip,rk3588-dwcmshc";
57b1ce9039665c Detlev Casanova    2024-09-03  1735  			reg = <0x0 0x2a330000 0x0 0x10000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1736  			assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>, <&cru CCLK_SRC_EMMC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1737  			assigned-clock-rates = <200000000>, <24000000>, <200000000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1738  			clocks = <&cru CCLK_SRC_EMMC>, <&cru HCLK_EMMC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1739  				 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1740  				 <&cru TCLK_EMMC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1741  			clock-names = "core", "bus", "axi", "block", "timer";
57b1ce9039665c Detlev Casanova    2024-09-03  1742  			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1743  			max-frequency = <200000000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1744  			pinctrl-0 = <&emmc_rstnout>, <&emmc_bus8>, <&emmc_clk>,
57b1ce9039665c Detlev Casanova    2024-09-03  1745  				    <&emmc_cmd>, <&emmc_strb>;
57b1ce9039665c Detlev Casanova    2024-09-03  1746  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  1747  			power-domains = <&power RK3576_PD_NVM>;
57b1ce9039665c Detlev Casanova    2024-09-03  1748  			resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1749  				 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
57b1ce9039665c Detlev Casanova    2024-09-03  1750  				 <&cru SRST_T_EMMC>;
57b1ce9039665c Detlev Casanova    2024-09-03  1751  			reset-names = "core", "bus", "axi", "block", "timer";
57b1ce9039665c Detlev Casanova    2024-09-03  1752  			supports-cqe;
57b1ce9039665c Detlev Casanova    2024-09-03  1753  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1754  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1755  
36299757129c89 Detlev Casanova    2025-02-28  1756  		sfc0: spi@2a340000 {
36299757129c89 Detlev Casanova    2025-02-28  1757  			compatible = "rockchip,sfc";
36299757129c89 Detlev Casanova    2025-02-28  1758  			reg = <0x0 0x2a340000 0x0 0x4000>;
36299757129c89 Detlev Casanova    2025-02-28  1759  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
36299757129c89 Detlev Casanova    2025-02-28  1760  			clocks = <&cru SCLK_FSPI_X2>, <&cru HCLK_FSPI>;
36299757129c89 Detlev Casanova    2025-02-28  1761  			clock-names = "clk_sfc", "hclk_sfc";
ede1fa1384c230 Sebastian Reichel  2025-05-20  1762  			power-domains = <&power RK3576_PD_NVM>;
36299757129c89 Detlev Casanova    2025-02-28  1763  			#address-cells = <1>;
36299757129c89 Detlev Casanova    2025-02-28  1764  			#size-cells = <0>;
36299757129c89 Detlev Casanova    2025-02-28  1765  			status = "disabled";
36299757129c89 Detlev Casanova    2025-02-28  1766  		};
36299757129c89 Detlev Casanova    2025-02-28  1767  
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1768  		rng: rng@2a410000 {
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1769  			compatible = "rockchip,rk3576-rng";
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1770  			reg = <0x0 0x2a410000 0x0 0x200>;
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1771  			clocks = <&cru HCLK_TRNG_NS>;
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1772  			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1773  			resets = <&cru SRST_H_TRNG_NS>;
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1774  		};
5268f3b5d29887 Nicolas Frattaroli 2025-04-30  1775  
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1776  		otp: otp@2a580000 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1777  			compatible = "rockchip,rk3576-otp";
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1778  			reg = <0x0 0x2a580000 0x0 0x400>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1779  			#address-cells = <1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1780  			#size-cells = <1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1781  			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1782  				 <&cru CLK_OTP_PHY_G>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1783  			clock-names = "otp", "apb_pclk", "phy";
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1784  			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1785  			reset-names = "otp", "apb";
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1786  
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1787  			/* Data cells */
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1788  			cpu_code: cpu-code@2 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1789  				reg = <0x02 0x2>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1790  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1791  			otp_cpu_version: cpu-version@5 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1792  				reg = <0x05 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1793  				bits = <3 3>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1794  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1795  			otp_id: id@a {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1796  				reg = <0x0a 0x10>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1797  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1798  			cpub_leakage: cpub-leakage@1e {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1799  				reg = <0x1e 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1800  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1801  			cpul_leakage: cpul-leakage@1f {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1802  				reg = <0x1f 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1803  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1804  			npu_leakage: npu-leakage@20 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1805  				reg = <0x20 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1806  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1807  			gpu_leakage: gpu-leakage@21 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1808  				reg = <0x21 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1809  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1810  			log_leakage: log-leakage@22 {
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1811  				reg = <0x22 0x1>;
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1812  			};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1813  		};
8715d2eeb062f6 Heiko Stuebner     2025-02-10  1814  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1815  		sai0: sai@2a600000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1816  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1817  			reg = <0x0 0x2a600000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1818  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1819  			clocks = <&cru MCLK_SAI0_8CH>, <&cru HCLK_SAI0_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1820  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1821  			dmas = <&dmac0 0>, <&dmac0 1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1822  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1823  			power-domains = <&power RK3576_PD_AUDIO>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1824  			resets = <&cru SRST_M_SAI0_8CH>, <&cru SRST_H_SAI0_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1825  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1826  			pinctrl-names = "default";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1827  			pinctrl-0 = <&sai0m0_lrck
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1828  				&sai0m0_sclk
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1829  				&sai0m0_sdi0
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1830  				&sai0m0_sdi1
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1831  				&sai0m0_sdi2
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1832  				&sai0m0_sdi3
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1833  				&sai0m0_sdo0
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1834  				&sai0m0_sdo1
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1835  				&sai0m0_sdo2
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1836  				&sai0m0_sdo3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1837  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1838  			sound-name-prefix = "SAI0";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1839  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1840  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1841  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1842  		sai1: sai@2a610000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1843  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1844  			reg = <0x0 0x2a610000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1845  			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1846  			clocks = <&cru MCLK_SAI1_8CH>, <&cru HCLK_SAI1_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1847  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1848  			dmas = <&dmac0 2>, <&dmac0 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1849  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1850  			power-domains = <&power RK3576_PD_AUDIO>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1851  			resets = <&cru SRST_M_SAI1_8CH>, <&cru SRST_H_SAI1_8CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1852  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1853  			pinctrl-names = "default";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1854  			pinctrl-0 = <&sai1m0_lrck
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1855  				&sai1m0_sclk
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1856  				&sai1m0_sdi0
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1857  				&sai1m0_sdo0
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1858  				&sai1m0_sdo1
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1859  				&sai1m0_sdo2
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1860  				&sai1m0_sdo3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1861  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1862  			sound-name-prefix = "SAI1";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1863  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1864  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1865  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1866  		sai2: sai@2a620000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1867  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1868  			reg = <0x0 0x2a620000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1869  			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1870  			clocks = <&cru MCLK_SAI2_2CH>, <&cru HCLK_SAI2_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1871  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1872  			dmas = <&dmac1 0>, <&dmac1 1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1873  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1874  			power-domains = <&power RK3576_PD_AUDIO>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1875  			resets = <&cru SRST_M_SAI2_2CH>, <&cru SRST_H_SAI2_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1876  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1877  			pinctrl-names = "default";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1878  			pinctrl-0 = <&sai2m0_lrck
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1879  				&sai2m0_sclk
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1880  				&sai2m0_sdi
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1881  				&sai2m0_sdo>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1882  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1883  			sound-name-prefix = "SAI2";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1884  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1885  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1886  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1887  		sai3: sai@2a630000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1888  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1889  			reg = <0x0 0x2a630000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1890  			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1891  			clocks = <&cru MCLK_SAI3_2CH>, <&cru HCLK_SAI3_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1892  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1893  			dmas = <&dmac1 2>, <&dmac1 3>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1894  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1895  			power-domains = <&power RK3576_PD_AUDIO>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1896  			resets = <&cru SRST_M_SAI3_2CH>, <&cru SRST_H_SAI3_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1897  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1898  			pinctrl-names = "default";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1899  			pinctrl-0 = <&sai3m0_lrck
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1900  				&sai3m0_sclk
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1901  				&sai3m0_sdi
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1902  				&sai3m0_sdo>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1903  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1904  			sound-name-prefix = "SAI3";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1905  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1906  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1907  
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1908  		sai4: sai@2a640000 {
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1909  			compatible = "rockchip,rk3576-sai";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1910  			reg = <0x0 0x2a640000 0x0 0x1000>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1911  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1912  			clocks = <&cru MCLK_SAI4_2CH>, <&cru HCLK_SAI4_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1913  			clock-names = "mclk", "hclk";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1914  			dmas = <&dmac2 0>, <&dmac2 1>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1915  			dma-names = "tx", "rx";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1916  			power-domains = <&power RK3576_PD_AUDIO>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1917  			resets = <&cru SRST_M_SAI4_2CH>, <&cru SRST_H_SAI4_2CH>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1918  			reset-names = "m", "h";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1919  			pinctrl-names = "default";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1920  			pinctrl-0 = <&sai4m0_lrck
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1921  				&sai4m0_sclk
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1922  				&sai4m0_sdi
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1923  				&sai4m0_sdo>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1924  			#sound-dai-cells = <0>;
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1925  			sound-name-prefix = "SAI4";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1926  			status = "disabled";
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1927  		};
3dfeccdd3cc887 Nicolas Frattaroli 2025-05-06  1928  
57b1ce9039665c Detlev Casanova    2024-09-03  1929  		gic: interrupt-controller@2a701000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1930  			compatible = "arm,gic-400";
57b1ce9039665c Detlev Casanova    2024-09-03  1931  			reg = <0x0 0x2a701000 0 0x10000>,
57b1ce9039665c Detlev Casanova    2024-09-03  1932  			      <0x0 0x2a702000 0 0x10000>,
57b1ce9039665c Detlev Casanova    2024-09-03  1933  			      <0x0 0x2a704000 0 0x10000>,
57b1ce9039665c Detlev Casanova    2024-09-03  1934  			      <0x0 0x2a706000 0 0x10000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1935  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
57b1ce9039665c Detlev Casanova    2024-09-03  1936  			interrupt-controller;
57b1ce9039665c Detlev Casanova    2024-09-03  1937  			#interrupt-cells = <3>;
57b1ce9039665c Detlev Casanova    2024-09-03  1938  			#address-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  1939  			#size-cells = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  1940  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1941  
57b1ce9039665c Detlev Casanova    2024-09-03  1942  		dmac0: dma-controller@2ab90000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1943  			compatible = "arm,pl330", "arm,primecell";
57b1ce9039665c Detlev Casanova    2024-09-03  1944  			reg = <0x0 0x2ab90000 0x0 0x4000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1945  			arm,pl330-periph-burst;
57b1ce9039665c Detlev Casanova    2024-09-03  1946  			clocks = <&cru ACLK_DMAC0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1947  			clock-names = "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  1948  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1949  				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1950  			#dma-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1951  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1952  
57b1ce9039665c Detlev Casanova    2024-09-03  1953  		dmac1: dma-controller@2abb0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1954  			compatible = "arm,pl330", "arm,primecell";
57b1ce9039665c Detlev Casanova    2024-09-03  1955  			reg = <0x0 0x2abb0000 0x0 0x4000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1956  			arm,pl330-periph-burst;
57b1ce9039665c Detlev Casanova    2024-09-03  1957  			clocks = <&cru ACLK_DMAC1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1958  			clock-names = "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  1959  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1960  				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1961  			#dma-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1962  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1963  
57b1ce9039665c Detlev Casanova    2024-09-03  1964  		dmac2: dma-controller@2abd0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1965  			compatible = "arm,pl330", "arm,primecell";
57b1ce9039665c Detlev Casanova    2024-09-03  1966  			reg = <0x0 0x2abd0000 0x0 0x4000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1967  			arm,pl330-periph-burst;
57b1ce9039665c Detlev Casanova    2024-09-03  1968  			clocks = <&cru ACLK_DMAC2>;
57b1ce9039665c Detlev Casanova    2024-09-03  1969  			clock-names = "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  1970  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
57b1ce9039665c Detlev Casanova    2024-09-03  1971  				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1972  			#dma-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1973  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1974  
57b1ce9039665c Detlev Casanova    2024-09-03  1975  		i2c1: i2c@2ac40000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1976  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  1977  			reg = <0x0 0x2ac40000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1978  			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1979  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  1980  			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1981  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  1982  			pinctrl-0 = <&i2c1m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  1983  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1984  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1985  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1986  		};
57b1ce9039665c Detlev Casanova    2024-09-03  1987  
57b1ce9039665c Detlev Casanova    2024-09-03  1988  		i2c2: i2c@2ac50000 {
57b1ce9039665c Detlev Casanova    2024-09-03  1989  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  1990  			reg = <0x0 0x2ac50000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  1991  			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
57b1ce9039665c Detlev Casanova    2024-09-03  1992  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  1993  			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  1994  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  1995  			pinctrl-0 = <&i2c2m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  1996  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  1997  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  1998  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  1999  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2000  
57b1ce9039665c Detlev Casanova    2024-09-03  2001  		i2c3: i2c@2ac60000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2002  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2003  			reg = <0x0 0x2ac60000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2004  			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
57b1ce9039665c Detlev Casanova    2024-09-03  2005  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2006  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2007  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2008  			pinctrl-0 = <&i2c3m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2009  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2010  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2011  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2012  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2013  
57b1ce9039665c Detlev Casanova    2024-09-03  2014  		i2c4: i2c@2ac70000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2015  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2016  			reg = <0x0 0x2ac70000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2017  			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2018  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2019  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2020  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2021  			pinctrl-0 = <&i2c4m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2022  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2023  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2024  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2025  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2026  
57b1ce9039665c Detlev Casanova    2024-09-03  2027  		i2c5: i2c@2ac80000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2028  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2029  			reg = <0x0 0x2ac80000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2030  			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
57b1ce9039665c Detlev Casanova    2024-09-03  2031  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2032  			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2033  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2034  			pinctrl-0 = <&i2c5m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2035  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2036  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2037  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2038  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2039  
57b1ce9039665c Detlev Casanova    2024-09-03  2040  		i2c6: i2c@2ac90000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2041  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2042  			reg = <0x0 0x2ac90000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2043  			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
57b1ce9039665c Detlev Casanova    2024-09-03  2044  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2045  			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2046  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2047  			pinctrl-0 = <&i2c6m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2048  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2049  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2050  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2051  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2052  
57b1ce9039665c Detlev Casanova    2024-09-03  2053  		i2c7: i2c@2aca0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2054  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2055  			reg = <0x0 0x2aca0000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2056  			clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
57b1ce9039665c Detlev Casanova    2024-09-03  2057  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2058  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2059  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2060  			pinctrl-0 = <&i2c7m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2061  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2062  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2063  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2064  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2065  
57b1ce9039665c Detlev Casanova    2024-09-03  2066  		i2c8: i2c@2acb0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2067  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2068  			reg = <0x0 0x2acb0000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2069  			clocks = <&cru CLK_I2C8>, <&cru PCLK_I2C8>;
57b1ce9039665c Detlev Casanova    2024-09-03  2070  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2071  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2072  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2073  			pinctrl-0 = <&i2c8m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2074  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2075  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2076  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2077  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2078  
57b1ce9039665c Detlev Casanova    2024-09-03  2079  		timer0: timer@2acc0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2080  			compatible = "rockchip,rk3576-timer", "rockchip,rk3288-timer";
57b1ce9039665c Detlev Casanova    2024-09-03  2081  			reg = <0x0 0x2acc0000 0x0 0x20>;
57b1ce9039665c Detlev Casanova    2024-09-03  2082  			clocks = <&cru PCLK_BUSTIMER0>, <&cru CLK_TIMER0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2083  			clock-names = "pclk", "timer";
57b1ce9039665c Detlev Casanova    2024-09-03  2084  			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2085  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2086  
57b1ce9039665c Detlev Casanova    2024-09-03  2087  		wdt: watchdog@2ace0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2088  			compatible = "rockchip,rk3576-wdt", "snps,dw-wdt";
57b1ce9039665c Detlev Casanova    2024-09-03  2089  			reg = <0x0 0x2ace0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2090  			clocks = <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2091  			clock-names = "tclk", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2092  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2093  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2094  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2095  
57b1ce9039665c Detlev Casanova    2024-09-03  2096  		spi0: spi@2acf0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2097  			compatible = "rockchip,rk3576-spi", "rockchip,rk3066-spi";
57b1ce9039665c Detlev Casanova    2024-09-03  2098  			reg = <0x0 0x2acf0000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2099  			clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2100  			clock-names = "spiclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2101  			dmas = <&dmac0 14>, <&dmac0 15>;
57b1ce9039665c Detlev Casanova    2024-09-03  2102  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2103  			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2104  			num-cs = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2105  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2106  			pinctrl-0 = <&spi0m0_csn0 &spi0m0_csn1 &spi0m0_pins>;
57b1ce9039665c Detlev Casanova    2024-09-03  2107  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2108  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2109  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2110  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2111  
57b1ce9039665c Detlev Casanova    2024-09-03  2112  		spi1: spi@2ad00000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2113  			compatible = "rockchip,rk3576-spi", "rockchip,rk3066-spi";
57b1ce9039665c Detlev Casanova    2024-09-03  2114  			reg = <0x0 0x2ad00000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2115  			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2116  			clock-names = "spiclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2117  			dmas = <&dmac0 16>, <&dmac0 17>;
57b1ce9039665c Detlev Casanova    2024-09-03  2118  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2119  			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2120  			num-cs = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2121  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2122  			pinctrl-0 = <&spi1m0_csn0 &spi1m0_csn1 &spi1m0_pins>;
57b1ce9039665c Detlev Casanova    2024-09-03  2123  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2124  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2125  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2126  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2127  
57b1ce9039665c Detlev Casanova    2024-09-03  2128  		spi2: spi@2ad10000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2129  			compatible = "rockchip,rk3576-spi", "rockchip,rk3066-spi";
57b1ce9039665c Detlev Casanova    2024-09-03  2130  			reg = <0x0 0x2ad10000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2131  			clocks = <&cru CLK_SPI2>, <&cru PCLK_SPI2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2132  			clock-names = "spiclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2133  			dmas = <&dmac1 15>, <&dmac1 16>;
57b1ce9039665c Detlev Casanova    2024-09-03  2134  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2135  			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2136  			num-cs = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2137  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2138  			pinctrl-0 = <&spi2m0_csn0 &spi2m0_csn1 &spi2m0_pins>;
57b1ce9039665c Detlev Casanova    2024-09-03  2139  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2140  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2141  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2142  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2143  
57b1ce9039665c Detlev Casanova    2024-09-03  2144  		spi3: spi@2ad20000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2145  			compatible = "rockchip,rk3576-spi", "rockchip,rk3066-spi";
57b1ce9039665c Detlev Casanova    2024-09-03  2146  			reg = <0x0 0x2ad20000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2147  			clocks = <&cru CLK_SPI3>, <&cru PCLK_SPI3>;
57b1ce9039665c Detlev Casanova    2024-09-03  2148  			clock-names = "spiclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2149  			dmas = <&dmac1 17>, <&dmac1 18>;
57b1ce9039665c Detlev Casanova    2024-09-03  2150  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2151  			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2152  			num-cs = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2153  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2154  			pinctrl-0 = <&spi3m0_csn0 &spi3m0_csn1 &spi3m0_pins>;
57b1ce9039665c Detlev Casanova    2024-09-03  2155  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2156  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2157  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2158  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2159  
57b1ce9039665c Detlev Casanova    2024-09-03  2160  		spi4: spi@2ad30000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2161  			compatible = "rockchip,rk3576-spi", "rockchip,rk3066-spi";
57b1ce9039665c Detlev Casanova    2024-09-03  2162  			reg = <0x0 0x2ad30000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2163  			clocks = <&cru CLK_SPI4>, <&cru PCLK_SPI4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2164  			clock-names = "spiclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2165  			dmas = <&dmac2 12>, <&dmac2 13>;
57b1ce9039665c Detlev Casanova    2024-09-03  2166  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2167  			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2168  			num-cs = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2169  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2170  			pinctrl-0 = <&spi4m0_csn0 &spi4m0_csn1 &spi4m0_pins>;
57b1ce9039665c Detlev Casanova    2024-09-03  2171  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2172  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2173  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2174  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2175  
57b1ce9039665c Detlev Casanova    2024-09-03  2176  		uart0: serial@2ad40000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2177  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2178  			reg = <0x0 0x2ad40000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2179  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2180  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2181  			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2182  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2183  			dmas = <&dmac0 6>, <&dmac0 7>;
57b1ce9039665c Detlev Casanova    2024-09-03  2184  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2185  			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2186  			pinctrl-0 = <&uart0m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2187  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2188  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2189  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2190  
57b1ce9039665c Detlev Casanova    2024-09-03  2191  		uart2: serial@2ad50000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2192  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2193  			reg = <0x0 0x2ad50000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2194  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2195  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2196  			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2197  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2198  			dmas = <&dmac0 10>, <&dmac0 11>;
57b1ce9039665c Detlev Casanova    2024-09-03  2199  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2200  			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2201  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2202  			pinctrl-0 = <&uart2m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2203  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2204  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2205  
57b1ce9039665c Detlev Casanova    2024-09-03  2206  		uart3: serial@2ad60000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2207  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2208  			reg = <0x0 0x2ad60000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2209  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2210  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2211  			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
57b1ce9039665c Detlev Casanova    2024-09-03  2212  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2213  			dmas = <&dmac0 12>, <&dmac0 13>;
57b1ce9039665c Detlev Casanova    2024-09-03  2214  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2215  			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2216  			pinctrl-0 = <&uart3m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2217  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2218  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2219  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2220  
57b1ce9039665c Detlev Casanova    2024-09-03  2221  		uart4: serial@2ad70000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2222  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2223  			reg = <0x0 0x2ad70000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2224  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2225  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2226  			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2227  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2228  			dmas = <&dmac1 9>, <&dmac1 10>;
57b1ce9039665c Detlev Casanova    2024-09-03  2229  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2230  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2231  			pinctrl-0 = <&uart4m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2232  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2233  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2234  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2235  
57b1ce9039665c Detlev Casanova    2024-09-03  2236  		uart5: serial@2ad80000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2237  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2238  			reg = <0x0 0x2ad80000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2239  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2240  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2241  			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
57b1ce9039665c Detlev Casanova    2024-09-03  2242  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2243  			dmas = <&dmac1 11>, <&dmac1 12>;
57b1ce9039665c Detlev Casanova    2024-09-03  2244  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2245  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2246  			pinctrl-0 = <&uart5m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2247  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2248  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2249  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2250  
57b1ce9039665c Detlev Casanova    2024-09-03  2251  		uart6: serial@2ad90000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2252  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2253  			reg = <0x0 0x2ad90000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2254  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2255  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2256  			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
57b1ce9039665c Detlev Casanova    2024-09-03  2257  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2258  			dmas = <&dmac1 13>, <&dmac1 14>;
57b1ce9039665c Detlev Casanova    2024-09-03  2259  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2260  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2261  			pinctrl-0 = <&uart6m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2262  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2263  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2264  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2265  
57b1ce9039665c Detlev Casanova    2024-09-03  2266  		uart7: serial@2ada0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2267  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2268  			reg = <0x0 0x2ada0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2269  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2270  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2271  			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
57b1ce9039665c Detlev Casanova    2024-09-03  2272  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2273  			dmas = <&dmac2 6>, <&dmac2 7>;
57b1ce9039665c Detlev Casanova    2024-09-03  2274  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2275  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2276  			pinctrl-0 = <&uart7m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2277  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2278  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2279  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2280  
57b1ce9039665c Detlev Casanova    2024-09-03  2281  		uart8: serial@2adb0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2282  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2283  			reg = <0x0 0x2adb0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2284  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2285  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2286  			clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
57b1ce9039665c Detlev Casanova    2024-09-03  2287  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2288  			dmas = <&dmac2 8>, <&dmac2 9>;
57b1ce9039665c Detlev Casanova    2024-09-03  2289  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2290  			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2291  			pinctrl-0 = <&uart8m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2292  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2293  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2294  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2295  
57b1ce9039665c Detlev Casanova    2024-09-03  2296  		uart9: serial@2adc0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2297  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2298  			reg = <0x0 0x2adc0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2299  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2300  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2301  			clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
57b1ce9039665c Detlev Casanova    2024-09-03  2302  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2303  			dmas = <&dmac2 10>, <&dmac2 11>;
57b1ce9039665c Detlev Casanova    2024-09-03  2304  			dma-names = "tx", "rx";
57b1ce9039665c Detlev Casanova    2024-09-03  2305  			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2306  			pinctrl-0 = <&uart9m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2307  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2308  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2309  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2310  
57b1ce9039665c Detlev Casanova    2024-09-03  2311  		saradc: adc@2ae00000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2312  			compatible = "rockchip,rk3576-saradc", "rockchip,rk3588-saradc";
57b1ce9039665c Detlev Casanova    2024-09-03  2313  			reg = <0x0 0x2ae00000 0x0 0x10000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2314  			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
57b1ce9039665c Detlev Casanova    2024-09-03  2315  			clock-names = "saradc", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2316  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2317  			resets = <&cru SRST_P_SARADC>;
57b1ce9039665c Detlev Casanova    2024-09-03  2318  			reset-names = "saradc-apb";
57b1ce9039665c Detlev Casanova    2024-09-03  2319  			#io-channel-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2320  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2321  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2322  
57b1ce9039665c Detlev Casanova    2024-09-03  2323  		i2c9: i2c@2ae80000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2324  			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
57b1ce9039665c Detlev Casanova    2024-09-03  2325  			reg = <0x0 0x2ae80000 0x0 0x1000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2326  			clocks = <&cru CLK_I2C9>, <&cru PCLK_I2C9>;
57b1ce9039665c Detlev Casanova    2024-09-03  2327  			clock-names = "i2c", "pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2328  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2329  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2330  			pinctrl-0 = <&i2c9m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2331  			resets = <&cru SRST_I2C9>, <&cru SRST_P_I2C9>;
57b1ce9039665c Detlev Casanova    2024-09-03  2332  			reset-names = "i2c", "apb";
57b1ce9039665c Detlev Casanova    2024-09-03  2333  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2334  			#size-cells = <0>;
57b1ce9039665c Detlev Casanova    2024-09-03  2335  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2336  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2337  
57b1ce9039665c Detlev Casanova    2024-09-03  2338  		uart10: serial@2afc0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2339  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2340  			reg = <0x0 0x2afc0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2341  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2342  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2343  			clocks = <&cru SCLK_UART10>, <&cru PCLK_UART10>;
57b1ce9039665c Detlev Casanova    2024-09-03  2344  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2345  			dmas = <&dmac2 21>, <&dmac2 22>;
57b1ce9039665c Detlev Casanova    2024-09-03  2346  			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2347  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2348  			pinctrl-0 = <&uart10m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2349  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2350  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2351  
57b1ce9039665c Detlev Casanova    2024-09-03  2352  		uart11: serial@2afd0000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2353  			compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
57b1ce9039665c Detlev Casanova    2024-09-03  2354  			reg = <0x0 0x2afd0000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2355  			reg-shift = <2>;
57b1ce9039665c Detlev Casanova    2024-09-03  2356  			reg-io-width = <4>;
57b1ce9039665c Detlev Casanova    2024-09-03  2357  			clocks = <&cru SCLK_UART11>, <&cru PCLK_UART11>;
57b1ce9039665c Detlev Casanova    2024-09-03  2358  			clock-names = "baudclk", "apb_pclk";
57b1ce9039665c Detlev Casanova    2024-09-03  2359  			dmas = <&dmac2 23>, <&dmac2 24>;
57b1ce9039665c Detlev Casanova    2024-09-03  2360  			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
57b1ce9039665c Detlev Casanova    2024-09-03  2361  			pinctrl-names = "default";
57b1ce9039665c Detlev Casanova    2024-09-03  2362  			pinctrl-0 = <&uart11m0_xfer>;
57b1ce9039665c Detlev Casanova    2024-09-03  2363  			status = "disabled";
57b1ce9039665c Detlev Casanova    2024-09-03  2364  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2365  
ddbf63b25866a4 Kever Yang         2025-01-07  2366  		combphy0_ps: phy@2b050000 {
ddbf63b25866a4 Kever Yang         2025-01-07  2367  			compatible = "rockchip,rk3576-naneng-combphy";
ddbf63b25866a4 Kever Yang         2025-01-07  2368  			reg = <0x0 0x2b050000 0x0 0x100>;
ddbf63b25866a4 Kever Yang         2025-01-07  2369  			#phy-cells = <1>;
ddbf63b25866a4 Kever Yang         2025-01-07  2370  			clocks = <&cru CLK_REF_PCIE0_PHY>,
ddbf63b25866a4 Kever Yang         2025-01-07  2371  				 <&cru PCLK_PCIE2_COMBOPHY0>,
ddbf63b25866a4 Kever Yang         2025-01-07  2372  				 <&cru PCLK_PCIE0>;
ddbf63b25866a4 Kever Yang         2025-01-07  2373  			clock-names = "ref", "apb", "pipe";
ddbf63b25866a4 Kever Yang         2025-01-07  2374  			assigned-clocks = <&cru CLK_REF_PCIE0_PHY>;
ddbf63b25866a4 Kever Yang         2025-01-07  2375  			assigned-clock-rates = <100000000>;
ddbf63b25866a4 Kever Yang         2025-01-07  2376  			resets = <&cru SRST_PCIE0_PIPE_PHY>,
ddbf63b25866a4 Kever Yang         2025-01-07  2377  				 <&cru SRST_P_PCIE2_COMBOPHY0>;
ddbf63b25866a4 Kever Yang         2025-01-07  2378  			reset-names = "phy", "apb";
ddbf63b25866a4 Kever Yang         2025-01-07  2379  			rockchip,pipe-grf = <&php_grf>;
ddbf63b25866a4 Kever Yang         2025-01-07  2380  			rockchip,pipe-phy-grf = <&pipe_phy0_grf>;
ddbf63b25866a4 Kever Yang         2025-01-07  2381  			status = "disabled";
ddbf63b25866a4 Kever Yang         2025-01-07  2382  		};
ddbf63b25866a4 Kever Yang         2025-01-07  2383  
ddbf63b25866a4 Kever Yang         2025-01-07  2384  		combphy1_psu: phy@2b060000 {
ddbf63b25866a4 Kever Yang         2025-01-07  2385  			compatible = "rockchip,rk3576-naneng-combphy";
ddbf63b25866a4 Kever Yang         2025-01-07  2386  			reg = <0x0 0x2b060000 0x0 0x100>;
ddbf63b25866a4 Kever Yang         2025-01-07  2387  			#phy-cells = <1>;
ddbf63b25866a4 Kever Yang         2025-01-07  2388  			clocks = <&cru CLK_REF_PCIE1_PHY>,
ddbf63b25866a4 Kever Yang         2025-01-07  2389  				 <&cru PCLK_PCIE2_COMBOPHY1>,
ddbf63b25866a4 Kever Yang         2025-01-07  2390  				 <&cru PCLK_PCIE1>;
ddbf63b25866a4 Kever Yang         2025-01-07  2391  			clock-names = "ref", "apb", "pipe";
ddbf63b25866a4 Kever Yang         2025-01-07  2392  			assigned-clocks = <&cru CLK_REF_PCIE1_PHY>;
ddbf63b25866a4 Kever Yang         2025-01-07  2393  			assigned-clock-rates = <100000000>;
ddbf63b25866a4 Kever Yang         2025-01-07  2394  			resets = <&cru SRST_PCIE1_PIPE_PHY>,
ddbf63b25866a4 Kever Yang         2025-01-07  2395  				 <&cru SRST_P_PCIE2_COMBOPHY1>;
ddbf63b25866a4 Kever Yang         2025-01-07  2396  			reset-names = "phy", "apb";
ddbf63b25866a4 Kever Yang         2025-01-07  2397  			rockchip,pipe-grf = <&php_grf>;
ddbf63b25866a4 Kever Yang         2025-01-07  2398  			rockchip,pipe-phy-grf = <&pipe_phy1_grf>;
ddbf63b25866a4 Kever Yang         2025-01-07  2399  			status = "disabled";
ddbf63b25866a4 Kever Yang         2025-01-07  2400  		};
ddbf63b25866a4 Kever Yang         2025-01-07  2401  
23ec57a32da448 Frank Wang         2025-01-07  2402  		usbdp_phy: phy@2b010000 {
23ec57a32da448 Frank Wang         2025-01-07  2403  			compatible = "rockchip,rk3576-usbdp-phy";
23ec57a32da448 Frank Wang         2025-01-07  2404  			reg = <0x0 0x2b010000 0x0 0x10000>;
23ec57a32da448 Frank Wang         2025-01-07  2405  			#phy-cells = <1>;
23ec57a32da448 Frank Wang         2025-01-07  2406  			clocks = <&cru CLK_PHY_REF_SRC >,
23ec57a32da448 Frank Wang         2025-01-07  2407  				 <&cru CLK_USBDP_COMBO_PHY_IMMORTAL>,
23ec57a32da448 Frank Wang         2025-01-07  2408  				 <&cru PCLK_USBDPPHY>,
23ec57a32da448 Frank Wang         2025-01-07  2409  				 <&u2phy0>;
23ec57a32da448 Frank Wang         2025-01-07  2410  			clock-names = "refclk", "immortal", "pclk", "utmi";
23ec57a32da448 Frank Wang         2025-01-07  2411  			resets = <&cru SRST_USBDP_COMBO_PHY_INIT>,
23ec57a32da448 Frank Wang         2025-01-07  2412  				 <&cru SRST_USBDP_COMBO_PHY_CMN>,
23ec57a32da448 Frank Wang         2025-01-07  2413  				 <&cru SRST_USBDP_COMBO_PHY_LANE>,
23ec57a32da448 Frank Wang         2025-01-07  2414  				 <&cru SRST_USBDP_COMBO_PHY_PCS>,
23ec57a32da448 Frank Wang         2025-01-07  2415  				 <&cru SRST_P_USBDPPHY>;
23ec57a32da448 Frank Wang         2025-01-07  2416  			reset-names = "init", "cmn", "lane", "pcs_apb", "pma_apb";
23ec57a32da448 Frank Wang         2025-01-07  2417  			rockchip,u2phy-grf = <&usb2phy_grf>;
23ec57a32da448 Frank Wang         2025-01-07  2418  			rockchip,usb-grf = <&usb_grf>;
23ec57a32da448 Frank Wang         2025-01-07  2419  			rockchip,usbdpphy-grf = <&usbdpphy_grf>;
23ec57a32da448 Frank Wang         2025-01-07  2420  			rockchip,vo-grf = <&vo1_grf>;
23ec57a32da448 Frank Wang         2025-01-07  2421  			status = "disabled";
23ec57a32da448 Frank Wang         2025-01-07  2422  		};
23ec57a32da448 Frank Wang         2025-01-07  2423  
ad0ea230ab2a35 Andy Yan           2024-12-31  2424  		hdptxphy: hdmiphy@2b000000 {
ad0ea230ab2a35 Andy Yan           2024-12-31  2425  			compatible = "rockchip,rk3576-hdptx-phy", "rockchip,rk3588-hdptx-phy";
ad0ea230ab2a35 Andy Yan           2024-12-31  2426  			reg = <0x0 0x2b000000 0x0 0x2000>;
ad0ea230ab2a35 Andy Yan           2024-12-31  2427  			clocks = <&cru CLK_PHY_REF_SRC>, <&cru PCLK_HDPTX_APB>;
ad0ea230ab2a35 Andy Yan           2024-12-31  2428  			clock-names = "ref", "apb";
ad0ea230ab2a35 Andy Yan           2024-12-31  2429  			resets = <&cru SRST_P_HDPTX_APB>, <&cru SRST_HDPTX_INIT>,
ad0ea230ab2a35 Andy Yan           2024-12-31  2430  				 <&cru SRST_HDPTX_CMN>, <&cru SRST_HDPTX_LANE>;
ad0ea230ab2a35 Andy Yan           2024-12-31  2431  			reset-names = "apb", "init", "cmn", "lane";
ad0ea230ab2a35 Andy Yan           2024-12-31  2432  			rockchip,grf = <&hdptxphy_grf>;
ad0ea230ab2a35 Andy Yan           2024-12-31  2433  			#phy-cells = <0>;
ad0ea230ab2a35 Andy Yan           2024-12-31  2434  			status = "disabled";
ad0ea230ab2a35 Andy Yan           2024-12-31  2435  		};
ad0ea230ab2a35 Andy Yan           2024-12-31  2436  
57b1ce9039665c Detlev Casanova    2024-09-03  2437  		sram: sram@3ff88000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2438  			compatible = "mmio-sram";
57b1ce9039665c Detlev Casanova    2024-09-03  2439  			reg = <0x0 0x3ff88000 0x0 0x78000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2440  			ranges = <0x0 0x0 0x3ff88000 0x78000>;
57b1ce9039665c Detlev Casanova    2024-09-03  2441  			#address-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2442  			#size-cells = <1>;
57b1ce9039665c Detlev Casanova    2024-09-03  2443  
57b1ce9039665c Detlev Casanova    2024-09-03  2444  			/* start address and size should be 4k align */
57b1ce9039665c Detlev Casanova    2024-09-03  2445  			rkvdec_sram: rkvdec-sram@0 {
57b1ce9039665c Detlev Casanova    2024-09-03  2446  				reg = <0x0 0x78000>;
f1ff4c4ad78a40 Detlev Casanova    2025-06-23  2447  				pool;
57b1ce9039665c Detlev Casanova    2024-09-03  2448  			};
57b1ce9039665c Detlev Casanova    2024-09-03  2449  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2450  
57b1ce9039665c Detlev Casanova    2024-09-03  2451  		scmi_shmem: scmi-shmem@4010f000 {
57b1ce9039665c Detlev Casanova    2024-09-03  2452  			compatible = "arm,scmi-shmem";
57b1ce9039665c Detlev Casanova    2024-09-03  2453  			reg = <0x0 0x4010f000 0x0 0x100>;
57b1ce9039665c Detlev Casanova    2024-09-03  2454  		};
57b1ce9039665c Detlev Casanova    2024-09-03  2455  	};
57b1ce9039665c Detlev Casanova    2024-09-03  2456  };
57b1ce9039665c Detlev Casanova    2024-09-03  2457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
