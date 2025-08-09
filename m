Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1B12E5B
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754765986; cv=none; b=i71MUJFHNTSAvB1KFmKEcMRGl7cB4H47Hj81MzuvBpq7Rt/ETr8ZQrtl7DVpKPqpzDi4PNKKkv/Jy5/lFU+mlxp5J1rtSokk7Tawoi65+yMfSOcaGuFahtbVpgelDU0Zp6AHqFHe41IGGRUehXX8JotF55vr9ymhJtKuRP8il5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754765986; c=relaxed/simple;
	bh=mYSExfEk/CwiRhLxJXF3TfbtMFndXLIJNWWYJ2XPTdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qA83aWpW5ccCVO5APL82Ym8Ga6fz3DnLM5F3uUO3f0+VeKgFSIPkfdsgRZo6mGK0ZwuAwbAJlZbsiBbeoJlxIxsKgIUAxmP/HTLRN3zZIPNcZarqp1pGkL9Wj3B8L72rs3KzNnoImOF8pRCR0gFjytaeYPDRO1wKtKuRIisYPA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUuGENoO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUuGENoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754765979; x=1786301979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYSExfEk/CwiRhLxJXF3TfbtMFndXLIJNWWYJ2XPTdM=;
  b=jUuGENoOhY3by37vid69kO28QH/pB3RErKUTApEmM3JndO+436QbIRjd
   J4DluXiKVaKXMDMOYEMX1m3doO6ND1eg6W8D+wROJf3ayH1Glih8H4d5c
   T5oQr+SiB38RDvUZNG5uhAo0SdSj2IO0Z1OR5avkdkbHyt7eSMfgcWI+s
   rfiaYUWYqm6SPQgJDyK9HIYVlKVz5Migmq3nrrkR7hpCr8+Jk7YuDktr5
   0nuJK2018KpESEeyVnUartiRgCNjIfw1cI9D0X56GqFWGPFYzndz4COq/
   ItzJQ1dDfutcg2NfEpMQO/puguw0aufWwYBySz1O86yDSOffI9LarnU1N
   A==;
X-CSE-ConnectionGUID: NxZyVbIGRt+zCKuFK1vrNg==
X-CSE-MsgGUID: lRxPLpswSz2RSLuVghyuKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="56113418"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56113418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 11:59:39 -0700
X-CSE-ConnectionGUID: 1h+gfJ7zQWOzUOVsPqggNA==
X-CSE-MsgGUID: QgS7JVJpTLGPVhc7gZtHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="202760599"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2025 11:59:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukomJ-000512-12;
	Sat, 09 Aug 2025 18:59:15 +0000
Date: Sun, 10 Aug 2025 02:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Message-ID: <202508100239.PLUXoj8f-lkp@intel.com>
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
In-Reply-To: <20250808142146.3181062-4-raghav.s@samsung.com>
References: <20250808142146.3181062-4-raghav.s@samsung.com>
TO: Raghav Sharma <raghav.s@samsung.com>
TO: krzk@kernel.org
TO: s.nawrocki@samsung.com
TO: cw00.choi@samsung.com
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: sunyeal.hong@samsung.com
TO: shin.son@samsung.com
TO: alim.akhtar@samsung.com
CC: linux-samsung-soc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: dev.tailor@samsung.com
CC: chandan.vn@samsung.com
CC: karthik.sun@samsung.com
CC: raghav.s@samsung.com

Hi Raghav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b7d4e259682caccb51a25283655f2c8f02e32d23]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghav-Sharma/dt-bindings-clock-exynosautov920-add-m2m-clock-definitions/20250808-230546
base:   b7d4e259682caccb51a25283655f2c8f02e32d23
patch link:    https://lore.kernel.org/r/20250808142146.3181062-4-raghav.s%40samsung.com
patch subject: [PATCH v1 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-051-20250809 (https://download.01.org/0day-ci/archive/20250810/202508100239.PLUXoj8f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100239.PLUXoj8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100239.PLUXoj8f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:1457.40-1468.5: Warning (simple_bus_reg): /soc@0/clock-controller@0x1a800000: simple-bus unit address format error, expected "1a800000"
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0 (simple-bus): clock-controller@0x1a800000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0 (simple-bus): 'clock-controller@0x1a800000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

vim +/1a800000 +1457 arch/arm64/boot/dts/exynos/exynosautov920.dtsi

c96dab1993d247 Jaewon Kim    2023-12-08    12  
c96dab1993d247 Jaewon Kim    2023-12-08    13  / {
c96dab1993d247 Jaewon Kim    2023-12-08    14  	compatible = "samsung,exynosautov920";
c96dab1993d247 Jaewon Kim    2023-12-08    15  	#address-cells = <2>;
c96dab1993d247 Jaewon Kim    2023-12-08    16  	#size-cells = <1>;
c96dab1993d247 Jaewon Kim    2023-12-08    17  
c96dab1993d247 Jaewon Kim    2023-12-08    18  	interrupt-parent = <&gic>;
c96dab1993d247 Jaewon Kim    2023-12-08    19  
c96dab1993d247 Jaewon Kim    2023-12-08    20  	aliases {
c96dab1993d247 Jaewon Kim    2023-12-08    21  		pinctrl0 = &pinctrl_alive;
c96dab1993d247 Jaewon Kim    2023-12-08    22  		pinctrl1 = &pinctrl_aud;
c96dab1993d247 Jaewon Kim    2023-12-08    23  		pinctrl2 = &pinctrl_hsi0;
c96dab1993d247 Jaewon Kim    2023-12-08    24  		pinctrl3 = &pinctrl_hsi1;
c96dab1993d247 Jaewon Kim    2023-12-08    25  		pinctrl4 = &pinctrl_hsi2;
c96dab1993d247 Jaewon Kim    2023-12-08    26  		pinctrl5 = &pinctrl_hsi2ufs;
c96dab1993d247 Jaewon Kim    2023-12-08    27  		pinctrl6 = &pinctrl_peric0;
c96dab1993d247 Jaewon Kim    2023-12-08    28  		pinctrl7 = &pinctrl_peric1;
c96dab1993d247 Jaewon Kim    2023-12-08    29  	};
c96dab1993d247 Jaewon Kim    2023-12-08    30  
c96dab1993d247 Jaewon Kim    2023-12-08    31  	arm-pmu {
c96dab1993d247 Jaewon Kim    2023-12-08    32  		compatible = "arm,cortex-a78-pmu";
c96dab1993d247 Jaewon Kim    2023-12-08    33  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c96dab1993d247 Jaewon Kim    2023-12-08    34  	};
c96dab1993d247 Jaewon Kim    2023-12-08    35  
c96dab1993d247 Jaewon Kim    2023-12-08    36  	xtcxo: clock {
c96dab1993d247 Jaewon Kim    2023-12-08    37  		compatible = "fixed-clock";
c96dab1993d247 Jaewon Kim    2023-12-08    38  		#clock-cells = <0>;
c96dab1993d247 Jaewon Kim    2023-12-08    39  		clock-output-names = "oscclk";
c96dab1993d247 Jaewon Kim    2023-12-08    40  	};
c96dab1993d247 Jaewon Kim    2023-12-08    41  
c96dab1993d247 Jaewon Kim    2023-12-08    42  	cpus: cpus {
c96dab1993d247 Jaewon Kim    2023-12-08    43  		#address-cells = <2>;
c96dab1993d247 Jaewon Kim    2023-12-08    44  		#size-cells = <0>;
c96dab1993d247 Jaewon Kim    2023-12-08    45  
c96dab1993d247 Jaewon Kim    2023-12-08    46  		cpu-map {
c96dab1993d247 Jaewon Kim    2023-12-08    47  			cluster0 {
c96dab1993d247 Jaewon Kim    2023-12-08    48  				core0 {
c96dab1993d247 Jaewon Kim    2023-12-08    49  					cpu = <&cpu0>;
c96dab1993d247 Jaewon Kim    2023-12-08    50  				};
c96dab1993d247 Jaewon Kim    2023-12-08    51  				core1 {
c96dab1993d247 Jaewon Kim    2023-12-08    52  					cpu = <&cpu1>;
c96dab1993d247 Jaewon Kim    2023-12-08    53  				};
c96dab1993d247 Jaewon Kim    2023-12-08    54  				core2 {
c96dab1993d247 Jaewon Kim    2023-12-08    55  					cpu = <&cpu2>;
c96dab1993d247 Jaewon Kim    2023-12-08    56  				};
c96dab1993d247 Jaewon Kim    2023-12-08    57  				core3 {
c96dab1993d247 Jaewon Kim    2023-12-08    58  					cpu = <&cpu3>;
c96dab1993d247 Jaewon Kim    2023-12-08    59  				};
c96dab1993d247 Jaewon Kim    2023-12-08    60  			};
c96dab1993d247 Jaewon Kim    2023-12-08    61  
c96dab1993d247 Jaewon Kim    2023-12-08    62  			cluster1 {
c96dab1993d247 Jaewon Kim    2023-12-08    63  				core0 {
c96dab1993d247 Jaewon Kim    2023-12-08    64  					cpu = <&cpu4>;
c96dab1993d247 Jaewon Kim    2023-12-08    65  				};
c96dab1993d247 Jaewon Kim    2023-12-08    66  				core1 {
c96dab1993d247 Jaewon Kim    2023-12-08    67  					cpu = <&cpu5>;
c96dab1993d247 Jaewon Kim    2023-12-08    68  				};
c96dab1993d247 Jaewon Kim    2023-12-08    69  				core2 {
c96dab1993d247 Jaewon Kim    2023-12-08    70  					cpu = <&cpu6>;
c96dab1993d247 Jaewon Kim    2023-12-08    71  				};
c96dab1993d247 Jaewon Kim    2023-12-08    72  				core3 {
c96dab1993d247 Jaewon Kim    2023-12-08    73  					cpu = <&cpu7>;
c96dab1993d247 Jaewon Kim    2023-12-08    74  				};
c96dab1993d247 Jaewon Kim    2023-12-08    75  			};
c96dab1993d247 Jaewon Kim    2023-12-08    76  
c96dab1993d247 Jaewon Kim    2023-12-08    77  			cluster2 {
c96dab1993d247 Jaewon Kim    2023-12-08    78  				core0 {
c96dab1993d247 Jaewon Kim    2023-12-08    79  					cpu = <&cpu8>;
c96dab1993d247 Jaewon Kim    2023-12-08    80  				};
c96dab1993d247 Jaewon Kim    2023-12-08    81  				core1 {
c96dab1993d247 Jaewon Kim    2023-12-08    82  					cpu = <&cpu9>;
c96dab1993d247 Jaewon Kim    2023-12-08    83  				};
c96dab1993d247 Jaewon Kim    2023-12-08    84  			};
c96dab1993d247 Jaewon Kim    2023-12-08    85  		};
c96dab1993d247 Jaewon Kim    2023-12-08    86  
c96dab1993d247 Jaewon Kim    2023-12-08    87  		cpu0: cpu@0 {
c96dab1993d247 Jaewon Kim    2023-12-08    88  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08    89  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08    90  			reg = <0x0 0x0>;
c96dab1993d247 Jaewon Kim    2023-12-08    91  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08    92  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    93  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    94  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    95  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    96  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    97  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08    98  			next-level-cache = <&l2_cache_cl0>;
c96dab1993d247 Jaewon Kim    2023-12-08    99  		};
c96dab1993d247 Jaewon Kim    2023-12-08   100  
c96dab1993d247 Jaewon Kim    2023-12-08   101  		cpu1: cpu@100 {
c96dab1993d247 Jaewon Kim    2023-12-08   102  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   103  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   104  			reg = <0x0 0x100>;
c96dab1993d247 Jaewon Kim    2023-12-08   105  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   106  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   107  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   108  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   109  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   110  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   111  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   112  			next-level-cache = <&l2_cache_cl0>;
c96dab1993d247 Jaewon Kim    2023-12-08   113  		};
c96dab1993d247 Jaewon Kim    2023-12-08   114  
c96dab1993d247 Jaewon Kim    2023-12-08   115  		cpu2: cpu@200 {
c96dab1993d247 Jaewon Kim    2023-12-08   116  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   117  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   118  			reg = <0x0 0x200>;
c96dab1993d247 Jaewon Kim    2023-12-08   119  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   120  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   121  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   122  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   123  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   124  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   125  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   126  			next-level-cache = <&l2_cache_cl0>;
c96dab1993d247 Jaewon Kim    2023-12-08   127  		};
c96dab1993d247 Jaewon Kim    2023-12-08   128  
c96dab1993d247 Jaewon Kim    2023-12-08   129  		cpu3: cpu@300 {
c96dab1993d247 Jaewon Kim    2023-12-08   130  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   131  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   132  			reg = <0x0 0x300>;
c96dab1993d247 Jaewon Kim    2023-12-08   133  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   134  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   135  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   136  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   137  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   138  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   139  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   140  			next-level-cache = <&l2_cache_cl0>;
c96dab1993d247 Jaewon Kim    2023-12-08   141  		};
c96dab1993d247 Jaewon Kim    2023-12-08   142  
c96dab1993d247 Jaewon Kim    2023-12-08   143  		cpu4: cpu@10000 {
c96dab1993d247 Jaewon Kim    2023-12-08   144  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   145  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   146  			reg = <0x0 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08   147  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   148  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   149  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   150  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   151  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   152  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   153  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   154  			next-level-cache = <&l2_cache_cl1>;
c96dab1993d247 Jaewon Kim    2023-12-08   155  		};
c96dab1993d247 Jaewon Kim    2023-12-08   156  
c96dab1993d247 Jaewon Kim    2023-12-08   157  		cpu5: cpu@10100 {
c96dab1993d247 Jaewon Kim    2023-12-08   158  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   159  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   160  			reg = <0x0 0x10100>;
c96dab1993d247 Jaewon Kim    2023-12-08   161  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   162  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   163  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   164  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   165  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   166  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   167  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   168  			next-level-cache = <&l2_cache_cl1>;
c96dab1993d247 Jaewon Kim    2023-12-08   169  		};
c96dab1993d247 Jaewon Kim    2023-12-08   170  
c96dab1993d247 Jaewon Kim    2023-12-08   171  		cpu6: cpu@10200 {
c96dab1993d247 Jaewon Kim    2023-12-08   172  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   173  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   174  			reg = <0x0 0x10200>;
c96dab1993d247 Jaewon Kim    2023-12-08   175  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   176  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   177  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   178  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   179  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   180  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   181  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   182  			next-level-cache = <&l2_cache_cl1>;
c96dab1993d247 Jaewon Kim    2023-12-08   183  		};
c96dab1993d247 Jaewon Kim    2023-12-08   184  
c96dab1993d247 Jaewon Kim    2023-12-08   185  		cpu7: cpu@10300 {
c96dab1993d247 Jaewon Kim    2023-12-08   186  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   187  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   188  			reg = <0x0 0x10300>;
c96dab1993d247 Jaewon Kim    2023-12-08   189  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   190  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   191  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   192  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   193  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   194  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   195  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   196  			next-level-cache = <&l2_cache_cl1>;
c96dab1993d247 Jaewon Kim    2023-12-08   197  		};
c96dab1993d247 Jaewon Kim    2023-12-08   198  
c96dab1993d247 Jaewon Kim    2023-12-08   199  		cpu8: cpu@20000 {
c96dab1993d247 Jaewon Kim    2023-12-08   200  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   201  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   202  			reg = <0x0 0x20000>;
c96dab1993d247 Jaewon Kim    2023-12-08   203  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   204  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   205  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   206  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   207  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   208  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   209  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   210  			next-level-cache = <&l2_cache_cl2>;
c96dab1993d247 Jaewon Kim    2023-12-08   211  		};
c96dab1993d247 Jaewon Kim    2023-12-08   212  
c96dab1993d247 Jaewon Kim    2023-12-08   213  		cpu9: cpu@20100 {
c96dab1993d247 Jaewon Kim    2023-12-08   214  			device_type = "cpu";
c96dab1993d247 Jaewon Kim    2023-12-08   215  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim    2023-12-08   216  			reg = <0x0 0x20100>;
c96dab1993d247 Jaewon Kim    2023-12-08   217  			enable-method = "psci";
bbfc70ca7fd26e Devang Tailor 2025-01-08   218  			i-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   219  			i-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   220  			i-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   221  			d-cache-size = <0x10000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   222  			d-cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   223  			d-cache-sets = <256>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   224  			next-level-cache = <&l2_cache_cl2>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   225  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   226  
bbfc70ca7fd26e Devang Tailor 2025-01-08   227  		l2_cache_cl0: l2-cache0 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   228  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   229  			cache-level = <2>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   230  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   231  			cache-size = <0x40000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   232  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   233  			cache-sets = <512>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   234  			next-level-cache = <&l3_cache_cl0>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   235  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   236  
bbfc70ca7fd26e Devang Tailor 2025-01-08   237  		l2_cache_cl1: l2-cache1 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   238  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   239  			cache-level = <2>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   240  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   241  			cache-size = <0x40000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   242  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   243  			cache-sets = <512>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   244  			next-level-cache = <&l3_cache_cl1>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   245  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   246  
bbfc70ca7fd26e Devang Tailor 2025-01-08   247  		l2_cache_cl2: l2-cache2 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   248  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   249  			cache-level = <2>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   250  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   251  			cache-size = <0x40000>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   252  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   253  			cache-sets = <512>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   254  			next-level-cache = <&l3_cache_cl2>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   255  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   256  
bbfc70ca7fd26e Devang Tailor 2025-01-08   257  		l3_cache_cl0: l3-cache0 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   258  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   259  			cache-level = <3>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   260  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   261  			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-0 */
bbfc70ca7fd26e Devang Tailor 2025-01-08   262  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   263  			cache-sets = <2048>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   264  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   265  
bbfc70ca7fd26e Devang Tailor 2025-01-08   266  		l3_cache_cl1: l3-cache1 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   267  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   268  			cache-level = <3>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   269  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   270  			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-1 */
bbfc70ca7fd26e Devang Tailor 2025-01-08   271  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   272  			cache-sets = <2048>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   273  		};
bbfc70ca7fd26e Devang Tailor 2025-01-08   274  
bbfc70ca7fd26e Devang Tailor 2025-01-08   275  		l3_cache_cl2: l3-cache2 {
bbfc70ca7fd26e Devang Tailor 2025-01-08   276  			compatible = "cache";
bbfc70ca7fd26e Devang Tailor 2025-01-08   277  			cache-level = <3>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   278  			cache-unified;
bbfc70ca7fd26e Devang Tailor 2025-01-08   279  			cache-size = <0x100000>;/* 1MB L3 cache for cpu cluster-2 */
bbfc70ca7fd26e Devang Tailor 2025-01-08   280  			cache-line-size = <64>;
bbfc70ca7fd26e Devang Tailor 2025-01-08   281  			cache-sets = <1365>;
c96dab1993d247 Jaewon Kim    2023-12-08   282  		};
c96dab1993d247 Jaewon Kim    2023-12-08   283  	};
c96dab1993d247 Jaewon Kim    2023-12-08   284  
c96dab1993d247 Jaewon Kim    2023-12-08   285  	psci {
c96dab1993d247 Jaewon Kim    2023-12-08   286  		compatible = "arm,psci-1.0";
c96dab1993d247 Jaewon Kim    2023-12-08   287  		method = "smc";
c96dab1993d247 Jaewon Kim    2023-12-08   288  	};
c96dab1993d247 Jaewon Kim    2023-12-08   289  
c96dab1993d247 Jaewon Kim    2023-12-08   290  	soc: soc@0 {
c96dab1993d247 Jaewon Kim    2023-12-08   291  		compatible = "simple-bus";
c96dab1993d247 Jaewon Kim    2023-12-08   292  		#address-cells = <1>;
c96dab1993d247 Jaewon Kim    2023-12-08   293  		#size-cells = <1>;
c96dab1993d247 Jaewon Kim    2023-12-08   294  		ranges = <0x0 0x0 0x0 0x20000000>;
c96dab1993d247 Jaewon Kim    2023-12-08   295  
c96dab1993d247 Jaewon Kim    2023-12-08   296  		chipid@10000000 {
c96dab1993d247 Jaewon Kim    2023-12-08   297  			compatible = "samsung,exynosautov920-chipid",
c96dab1993d247 Jaewon Kim    2023-12-08   298  				     "samsung,exynos850-chipid";
c96dab1993d247 Jaewon Kim    2023-12-08   299  			reg = <0x10000000 0x24>;
c96dab1993d247 Jaewon Kim    2023-12-08   300  		};
c96dab1993d247 Jaewon Kim    2023-12-08   301  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   302  		cmu_misc: clock-controller@10020000 {
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   303  			compatible = "samsung,exynosautov920-cmu-misc";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   304  			reg = <0x10020000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   305  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   306  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   307  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   308  				 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   309  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   310  				      "noc";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   311  		};
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   312  
41979b81b22a35 Byoungtae Cho 2024-12-06   313  		watchdog_cl0: watchdog@10060000 {
41979b81b22a35 Byoungtae Cho 2024-12-06   314  			compatible = "samsung,exynosautov920-wdt";
41979b81b22a35 Byoungtae Cho 2024-12-06   315  			reg = <0x10060000 0x100>;
41979b81b22a35 Byoungtae Cho 2024-12-06   316  			interrupts = <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>;
41979b81b22a35 Byoungtae Cho 2024-12-06   317  			clocks = <&xtcxo>, <&xtcxo>;
41979b81b22a35 Byoungtae Cho 2024-12-06   318  			clock-names = "watchdog", "watchdog_src";
41979b81b22a35 Byoungtae Cho 2024-12-06   319  			samsung,syscon-phandle = <&pmu_system_controller>;
41979b81b22a35 Byoungtae Cho 2024-12-06   320  			samsung,cluster-index = <0>;
41979b81b22a35 Byoungtae Cho 2024-12-06   321  		};
41979b81b22a35 Byoungtae Cho 2024-12-06   322  
41979b81b22a35 Byoungtae Cho 2024-12-06   323  		watchdog_cl1: watchdog@10070000 {
41979b81b22a35 Byoungtae Cho 2024-12-06   324  			compatible = "samsung,exynosautov920-wdt";
41979b81b22a35 Byoungtae Cho 2024-12-06   325  			reg = <0x10070000 0x100>;
41979b81b22a35 Byoungtae Cho 2024-12-06   326  			interrupts = <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>;
41979b81b22a35 Byoungtae Cho 2024-12-06   327  			clocks = <&xtcxo>, <&xtcxo>;
41979b81b22a35 Byoungtae Cho 2024-12-06   328  			clock-names = "watchdog", "watchdog_src";
41979b81b22a35 Byoungtae Cho 2024-12-06   329  			samsung,syscon-phandle = <&pmu_system_controller>;
41979b81b22a35 Byoungtae Cho 2024-12-06   330  			samsung,cluster-index = <1>;
41979b81b22a35 Byoungtae Cho 2024-12-06   331  		};
41979b81b22a35 Byoungtae Cho 2024-12-06   332  
c96dab1993d247 Jaewon Kim    2023-12-08   333  		gic: interrupt-controller@10400000 {
c96dab1993d247 Jaewon Kim    2023-12-08   334  			compatible = "arm,gic-v3";
c96dab1993d247 Jaewon Kim    2023-12-08   335  			#interrupt-cells = <3>;
c96dab1993d247 Jaewon Kim    2023-12-08   336  			#address-cells = <0>;
c96dab1993d247 Jaewon Kim    2023-12-08   337  			interrupt-controller;
c96dab1993d247 Jaewon Kim    2023-12-08   338  			reg = <0x10400000 0x10000>,
c96dab1993d247 Jaewon Kim    2023-12-08   339  			      <0x10460000 0x140000>;
c96dab1993d247 Jaewon Kim    2023-12-08   340  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08   341  		};
c96dab1993d247 Jaewon Kim    2023-12-08   342  
de7a4e01055b04 Faraz Ata     2024-12-12   343  		spdma0: dma-controller@10180000 {
de7a4e01055b04 Faraz Ata     2024-12-12   344  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   345  			reg = <0x10180000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   346  			interrupts = <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   347  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   348  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   349  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   350  		};
de7a4e01055b04 Faraz Ata     2024-12-12   351  
de7a4e01055b04 Faraz Ata     2024-12-12   352  		spdma1: dma-controller@10190000 {
de7a4e01055b04 Faraz Ata     2024-12-12   353  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   354  			reg = <0x10190000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   355  			interrupts = <GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   356  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   357  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   358  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   359  		};
de7a4e01055b04 Faraz Ata     2024-12-12   360  
de7a4e01055b04 Faraz Ata     2024-12-12   361  		pdma0: dma-controller@101a0000 {
de7a4e01055b04 Faraz Ata     2024-12-12   362  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   363  			reg = <0x101a0000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   364  			interrupts = <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   365  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   366  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   367  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   368  		};
de7a4e01055b04 Faraz Ata     2024-12-12   369  
de7a4e01055b04 Faraz Ata     2024-12-12   370  		pdma1: dma-controller@101b0000 {
de7a4e01055b04 Faraz Ata     2024-12-12   371  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   372  			reg = <0x101b0000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   373  			interrupts = <GIC_SPI 915 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   374  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   375  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   376  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   377  		};
de7a4e01055b04 Faraz Ata     2024-12-12   378  
de7a4e01055b04 Faraz Ata     2024-12-12   379  		pdma2: dma-controller@101c0000 {
de7a4e01055b04 Faraz Ata     2024-12-12   380  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   381  			reg = <0x101c0000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   382  			interrupts = <GIC_SPI 914 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   383  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   384  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   385  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   386  		};
de7a4e01055b04 Faraz Ata     2024-12-12   387  
de7a4e01055b04 Faraz Ata     2024-12-12   388  		pdma3: dma-controller@101d0000 {
de7a4e01055b04 Faraz Ata     2024-12-12   389  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   390  			reg = <0x101d0000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   391  			interrupts = <GIC_SPI 913 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   392  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   393  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   394  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   395  		};
de7a4e01055b04 Faraz Ata     2024-12-12   396  
de7a4e01055b04 Faraz Ata     2024-12-12   397  		pdma4: dma-controller@101e0000 {
de7a4e01055b04 Faraz Ata     2024-12-12   398  			compatible = "arm,pl330", "arm,primecell";
de7a4e01055b04 Faraz Ata     2024-12-12   399  			reg = <0x101e0000 0x1000>;
de7a4e01055b04 Faraz Ata     2024-12-12   400  			interrupts = <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>;
de7a4e01055b04 Faraz Ata     2024-12-12   401  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
de7a4e01055b04 Faraz Ata     2024-12-12   402  			clock-names = "apb_pclk";
de7a4e01055b04 Faraz Ata     2024-12-12   403  			#dma-cells = <1>;
de7a4e01055b04 Faraz Ata     2024-12-12   404  		};
de7a4e01055b04 Faraz Ata     2024-12-12   405  
4d06000979cda2 Sunyeal Hong  2024-08-22   406  		cmu_peric0: clock-controller@10800000 {
4d06000979cda2 Sunyeal Hong  2024-08-22   407  			compatible = "samsung,exynosautov920-cmu-peric0";
4d06000979cda2 Sunyeal Hong  2024-08-22   408  			reg = <0x10800000 0x8000>;
4d06000979cda2 Sunyeal Hong  2024-08-22   409  			#clock-cells = <1>;
4d06000979cda2 Sunyeal Hong  2024-08-22   410  
4d06000979cda2 Sunyeal Hong  2024-08-22   411  			clocks = <&xtcxo>,
4d06000979cda2 Sunyeal Hong  2024-08-22   412  				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
4d06000979cda2 Sunyeal Hong  2024-08-22   413  				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
4d06000979cda2 Sunyeal Hong  2024-08-22   414  			clock-names = "oscclk",
4d06000979cda2 Sunyeal Hong  2024-08-22   415  				      "noc",
4d06000979cda2 Sunyeal Hong  2024-08-22   416  				      "ip";
4d06000979cda2 Sunyeal Hong  2024-08-22   417  		};
4d06000979cda2 Sunyeal Hong  2024-08-22   418  
c96dab1993d247 Jaewon Kim    2023-12-08   419  		syscon_peric0: syscon@10820000 {
c96dab1993d247 Jaewon Kim    2023-12-08   420  			compatible = "samsung,exynosautov920-peric0-sysreg",
c96dab1993d247 Jaewon Kim    2023-12-08   421  				     "syscon";
c96dab1993d247 Jaewon Kim    2023-12-08   422  			reg = <0x10820000 0x2000>;
c96dab1993d247 Jaewon Kim    2023-12-08   423  		};
c96dab1993d247 Jaewon Kim    2023-12-08   424  
c96dab1993d247 Jaewon Kim    2023-12-08   425  		pinctrl_peric0: pinctrl@10830000 {
c96dab1993d247 Jaewon Kim    2023-12-08   426  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08   427  			reg = <0x10830000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08   428  			interrupts = <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08   429  		};
c96dab1993d247 Jaewon Kim    2023-12-08   430  
c96dab1993d247 Jaewon Kim    2023-12-08   431  		usi_0: usi@108800c0 {
c96dab1993d247 Jaewon Kim    2023-12-08   432  			compatible = "samsung,exynosautov920-usi",
c96dab1993d247 Jaewon Kim    2023-12-08   433  				     "samsung,exynos850-usi";
c96dab1993d247 Jaewon Kim    2023-12-08   434  			reg = <0x108800c0 0x20>;
c96dab1993d247 Jaewon Kim    2023-12-08   435  			samsung,sysreg = <&syscon_peric0 0x1000>;
4855244996578a Ivaylo Ivanov 2025-02-09   436  			samsung,mode = <USI_MODE_UART>;
c96dab1993d247 Jaewon Kim    2023-12-08   437  			#address-cells = <1>;
c96dab1993d247 Jaewon Kim    2023-12-08   438  			#size-cells = <1>;
c96dab1993d247 Jaewon Kim    2023-12-08   439  			ranges;
4d06000979cda2 Sunyeal Hong  2024-08-22   440  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
4d06000979cda2 Sunyeal Hong  2024-08-22   441  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
c96dab1993d247 Jaewon Kim    2023-12-08   442  			clock-names = "pclk", "ipclk";
c96dab1993d247 Jaewon Kim    2023-12-08   443  			status = "disabled";
c96dab1993d247 Jaewon Kim    2023-12-08   444  
c96dab1993d247 Jaewon Kim    2023-12-08   445  			serial_0: serial@10880000 {
c96dab1993d247 Jaewon Kim    2023-12-08   446  				compatible = "samsung,exynosautov920-uart",
c96dab1993d247 Jaewon Kim    2023-12-08   447  					     "samsung,exynos850-uart";
c96dab1993d247 Jaewon Kim    2023-12-08   448  				reg = <0x10880000 0xc0>;
c96dab1993d247 Jaewon Kim    2023-12-08   449  				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08   450  				pinctrl-names = "default";
c96dab1993d247 Jaewon Kim    2023-12-08   451  				pinctrl-0 = <&uart0_bus>;
4d06000979cda2 Sunyeal Hong  2024-08-22   452  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
4d06000979cda2 Sunyeal Hong  2024-08-22   453  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
c96dab1993d247 Jaewon Kim    2023-12-08   454  				clock-names = "uart", "clk_uart_baud0";
c96dab1993d247 Jaewon Kim    2023-12-08   455  				samsung,uart-fifosize = <256>;
c96dab1993d247 Jaewon Kim    2023-12-08   456  				status = "disabled";
c96dab1993d247 Jaewon Kim    2023-12-08   457  			};
134442a04bb9a6 Faraz Ata     2025-06-13   458  
134442a04bb9a6 Faraz Ata     2025-06-13   459  			spi_0: spi@10880000 {
134442a04bb9a6 Faraz Ata     2025-06-13   460  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   461  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   462  				reg = <0x10880000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   463  				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   464  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   465  				pinctrl-0 = <&spi0_bus &spi0_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   466  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   467  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   468  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   469  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   470  				dmas = <&pdma0 1>, <&pdma0 0>;
134442a04bb9a6 Faraz Ata     2025-06-13   471  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   472  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   473  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   474  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   475  				fifo-depth = <256>;
134442a04bb9a6 Faraz Ata     2025-06-13   476  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   477  			};
c96dab1993d247 Jaewon Kim    2023-12-08   478  		};
c96dab1993d247 Jaewon Kim    2023-12-08   479  
1a6ee48d8757db Faraz Ata     2025-04-17   480  		usi_1: usi@108a00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   481  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   482  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   483  			reg = <0x108a00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   484  			samsung,sysreg = <&syscon_peric0 0x1008>;
1a6ee48d8757db Faraz Ata     2025-04-17   485  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   486  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   487  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   488  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   489  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   490  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   491  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   492  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   493  
1a6ee48d8757db Faraz Ata     2025-04-17   494  			serial_1: serial@108a0000 {
1a6ee48d8757db Faraz Ata     2025-04-17   495  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   496  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   497  				reg = <0x108a0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   498  				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   499  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   500  				pinctrl-0 = <&uart1_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   501  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   502  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   503  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   504  				samsung,uart-fifosize = <256>;
1a6ee48d8757db Faraz Ata     2025-04-17   505  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   506  			};
134442a04bb9a6 Faraz Ata     2025-06-13   507  
134442a04bb9a6 Faraz Ata     2025-06-13   508  			spi_1: spi@108a0000 {
134442a04bb9a6 Faraz Ata     2025-06-13   509  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   510  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   511  				reg = <0x108a0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   512  				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   513  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   514  				pinctrl-0 = <&spi1_bus &spi1_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   515  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   516  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   517  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   518  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   519  				dmas = <&pdma0 3>, <&pdma0 2>;
134442a04bb9a6 Faraz Ata     2025-06-13   520  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   521  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   522  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   523  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   524  				fifo-depth = <256>;
134442a04bb9a6 Faraz Ata     2025-06-13   525  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   526  			};
1a6ee48d8757db Faraz Ata     2025-04-17   527  		};
1a6ee48d8757db Faraz Ata     2025-04-17   528  
1a6ee48d8757db Faraz Ata     2025-04-17   529  		usi_2: usi@108c00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   530  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   531  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   532  			reg = <0x108c00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   533  			samsung,sysreg = <&syscon_peric0 0x1010>;
1a6ee48d8757db Faraz Ata     2025-04-17   534  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   535  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   536  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   537  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   538  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   539  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   540  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   541  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   542  
1a6ee48d8757db Faraz Ata     2025-04-17   543  			serial_2: serial@108c0000 {
1a6ee48d8757db Faraz Ata     2025-04-17   544  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   545  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   546  				reg = <0x108c0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   547  				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   548  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   549  				pinctrl-0 = <&uart2_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   550  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   551  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   552  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   553  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   554  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   555  			};
134442a04bb9a6 Faraz Ata     2025-06-13   556  
134442a04bb9a6 Faraz Ata     2025-06-13   557  			spi_2: spi@108c0000 {
134442a04bb9a6 Faraz Ata     2025-06-13   558  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   559  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   560  				reg = <0x108c0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   561  				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   562  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   563  				pinctrl-0 = <&spi2_bus &spi2_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   564  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   565  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   566  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   567  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   568  				dmas = <&pdma0 5>, <&pdma0 4>;
134442a04bb9a6 Faraz Ata     2025-06-13   569  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   570  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   571  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   572  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   573  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   574  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   575  			};
1a6ee48d8757db Faraz Ata     2025-04-17   576  		};
1a6ee48d8757db Faraz Ata     2025-04-17   577  
1a6ee48d8757db Faraz Ata     2025-04-17   578  		usi_3: usi@108e00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   579  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   580  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   581  			reg = <0x108e00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   582  			samsung,sysreg = <&syscon_peric0 0x1018>;
1a6ee48d8757db Faraz Ata     2025-04-17   583  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   584  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   585  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   586  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   587  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   588  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   589  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   590  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   591  
1a6ee48d8757db Faraz Ata     2025-04-17   592  			serial_3: serial@108e0000 {
1a6ee48d8757db Faraz Ata     2025-04-17   593  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   594  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   595  				reg = <0x108e0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   596  				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   597  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   598  				pinctrl-0 = <&uart3_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   599  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   600  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   601  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   602  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   603  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   604  			};
134442a04bb9a6 Faraz Ata     2025-06-13   605  
134442a04bb9a6 Faraz Ata     2025-06-13   606  			spi_3: spi@108e0000 {
134442a04bb9a6 Faraz Ata     2025-06-13   607  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   608  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   609  				reg = <0x108e0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   610  				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   611  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   612  				pinctrl-0 = <&spi3_bus &spi3_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   613  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   614  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   615  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   616  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   617  				dmas = <&pdma0 7>, <&pdma0 6>;
134442a04bb9a6 Faraz Ata     2025-06-13   618  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   619  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   620  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   621  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   622  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   623  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   624  			};
1a6ee48d8757db Faraz Ata     2025-04-17   625  		};
1a6ee48d8757db Faraz Ata     2025-04-17   626  
1a6ee48d8757db Faraz Ata     2025-04-17   627  		usi_4: usi@109000c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   628  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   629  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   630  			reg = <0x109000c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   631  			samsung,sysreg = <&syscon_peric0 0x1020>;
1a6ee48d8757db Faraz Ata     2025-04-17   632  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   633  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   634  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   635  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   636  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   637  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   638  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   639  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   640  
1a6ee48d8757db Faraz Ata     2025-04-17   641  			serial_4: serial@10900000 {
1a6ee48d8757db Faraz Ata     2025-04-17   642  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   643  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   644  				reg = <0x10900000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   645  				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   646  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   647  				pinctrl-0 = <&uart4_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   648  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   649  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   650  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   651  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   652  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   653  			};
134442a04bb9a6 Faraz Ata     2025-06-13   654  
134442a04bb9a6 Faraz Ata     2025-06-13   655  			spi_4: spi@10900000 {
134442a04bb9a6 Faraz Ata     2025-06-13   656  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   657  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   658  				reg = <0x10900000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   659  				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   660  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   661  				pinctrl-0 = <&spi4_bus &spi4_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   662  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   663  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   664  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   665  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   666  				dmas = <&pdma0 9>, <&pdma0 8>;
134442a04bb9a6 Faraz Ata     2025-06-13   667  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   668  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   669  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   670  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   671  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   672  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   673  			};
1a6ee48d8757db Faraz Ata     2025-04-17   674  		};
1a6ee48d8757db Faraz Ata     2025-04-17   675  
1a6ee48d8757db Faraz Ata     2025-04-17   676  		usi_5: usi@109200c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   677  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   678  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   679  			reg = <0x109200c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   680  			samsung,sysreg = <&syscon_peric0 0x1028>;
1a6ee48d8757db Faraz Ata     2025-04-17   681  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   682  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   683  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   684  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   685  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   686  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   687  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   688  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   689  
1a6ee48d8757db Faraz Ata     2025-04-17   690  			serial_5: serial@10920000 {
1a6ee48d8757db Faraz Ata     2025-04-17   691  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   692  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   693  				reg = <0x10920000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   694  				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   695  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   696  				pinctrl-0 = <&uart5_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   697  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   698  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   699  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   700  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   701  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   702  			};
134442a04bb9a6 Faraz Ata     2025-06-13   703  
134442a04bb9a6 Faraz Ata     2025-06-13   704  			spi_5: spi@10920000 {
134442a04bb9a6 Faraz Ata     2025-06-13   705  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   706  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   707  				reg = <0x10920000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   708  				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   709  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   710  				pinctrl-0 = <&spi5_bus &spi5_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   711  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   712  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   713  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   714  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   715  				dmas = <&pdma0 11>, <&pdma0 10>;
134442a04bb9a6 Faraz Ata     2025-06-13   716  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   717  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   718  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   719  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   720  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   721  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   722  			};
1a6ee48d8757db Faraz Ata     2025-04-17   723  		};
1a6ee48d8757db Faraz Ata     2025-04-17   724  
1a6ee48d8757db Faraz Ata     2025-04-17   725  		usi_6: usi@109400c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   726  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   727  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   728  			reg = <0x109400c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   729  			samsung,sysreg = <&syscon_peric0 0x1030>;
1a6ee48d8757db Faraz Ata     2025-04-17   730  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   731  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   732  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   733  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   734  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   735  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   736  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   737  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   738  
1a6ee48d8757db Faraz Ata     2025-04-17   739  			serial_6: serial@10940000 {
1a6ee48d8757db Faraz Ata     2025-04-17   740  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   741  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   742  				reg = <0x10940000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   743  				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   744  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   745  				pinctrl-0 = <&uart6_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   746  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   747  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   748  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   749  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   750  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   751  			};
134442a04bb9a6 Faraz Ata     2025-06-13   752  
134442a04bb9a6 Faraz Ata     2025-06-13   753  			spi_6: spi@10940000 {
134442a04bb9a6 Faraz Ata     2025-06-13   754  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   755  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   756  				reg = <0x10940000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   757  				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   758  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   759  				pinctrl-0 = <&spi6_bus &spi6_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   760  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   761  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   762  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   763  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   764  				dmas = <&pdma0 13>, <&pdma0 12>;
134442a04bb9a6 Faraz Ata     2025-06-13   765  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   766  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   767  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   768  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   769  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   770  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   771  			};
1a6ee48d8757db Faraz Ata     2025-04-17   772  		};
1a6ee48d8757db Faraz Ata     2025-04-17   773  
1a6ee48d8757db Faraz Ata     2025-04-17   774  		usi_7: usi@109600c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   775  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   776  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   777  			reg = <0x109600c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   778  			samsung,sysreg = <&syscon_peric0 0x1038>;
1a6ee48d8757db Faraz Ata     2025-04-17   779  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   780  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   781  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   782  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   783  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   784  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   785  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   786  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   787  
1a6ee48d8757db Faraz Ata     2025-04-17   788  			serial_7: serial@10960000 {
1a6ee48d8757db Faraz Ata     2025-04-17   789  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   790  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   791  				reg = <0x10960000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   792  				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   793  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   794  				pinctrl-0 = <&uart7_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   795  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   796  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   797  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   798  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   799  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   800  			};
134442a04bb9a6 Faraz Ata     2025-06-13   801  
134442a04bb9a6 Faraz Ata     2025-06-13   802  			spi_7: spi@10960000 {
134442a04bb9a6 Faraz Ata     2025-06-13   803  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   804  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   805  				reg = <0x10960000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   806  				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   807  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   808  				pinctrl-0 = <&spi7_bus &spi7_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   809  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   810  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   811  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   812  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   813  				dmas = <&pdma0 15>, <&pdma0 14>;
134442a04bb9a6 Faraz Ata     2025-06-13   814  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   815  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   816  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   817  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   818  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   819  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   820  			};
1a6ee48d8757db Faraz Ata     2025-04-17   821  		};
1a6ee48d8757db Faraz Ata     2025-04-17   822  
1a6ee48d8757db Faraz Ata     2025-04-17   823  		usi_8: usi@109800c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   824  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   825  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   826  			reg = <0x109800c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   827  			samsung,sysreg = <&syscon_peric0 0x1040>;
1a6ee48d8757db Faraz Ata     2025-04-17   828  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   829  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   830  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   831  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   832  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   833  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   834  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   835  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   836  
1a6ee48d8757db Faraz Ata     2025-04-17   837  			serial_8: serial@10980000 {
1a6ee48d8757db Faraz Ata     2025-04-17   838  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   839  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   840  				reg = <0x10980000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   841  				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   842  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   843  				pinctrl-0 = <&uart8_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   844  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   845  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   846  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   847  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   848  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   849  			};
134442a04bb9a6 Faraz Ata     2025-06-13   850  
134442a04bb9a6 Faraz Ata     2025-06-13   851  			spi_8: spi@10980000 {
134442a04bb9a6 Faraz Ata     2025-06-13   852  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   853  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   854  				reg = <0x10980000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   855  				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   856  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   857  				pinctrl-0 = <&spi8_bus &spi8_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   858  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   859  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   860  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   861  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   862  				dmas = <&pdma0 17>, <&pdma0 16>;
134442a04bb9a6 Faraz Ata     2025-06-13   863  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   864  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   865  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   866  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   867  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13   868  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   869  			};
134442a04bb9a6 Faraz Ata     2025-06-13   870  
1a6ee48d8757db Faraz Ata     2025-04-17   871  		};
1a6ee48d8757db Faraz Ata     2025-04-17   872  
c96dab1993d247 Jaewon Kim    2023-12-08   873  		pwm: pwm@109b0000 {
c96dab1993d247 Jaewon Kim    2023-12-08   874  			compatible = "samsung,exynosautov920-pwm",
c96dab1993d247 Jaewon Kim    2023-12-08   875  				     "samsung,exynos4210-pwm";
c96dab1993d247 Jaewon Kim    2023-12-08   876  			reg = <0x109b0000 0x100>;
c96dab1993d247 Jaewon Kim    2023-12-08   877  			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
c96dab1993d247 Jaewon Kim    2023-12-08   878  			#pwm-cells = <3>;
c96dab1993d247 Jaewon Kim    2023-12-08   879  			clocks = <&xtcxo>;
c96dab1993d247 Jaewon Kim    2023-12-08   880  			clock-names = "timers";
c96dab1993d247 Jaewon Kim    2023-12-08   881  			status = "disabled";
c96dab1993d247 Jaewon Kim    2023-12-08   882  		};
c96dab1993d247 Jaewon Kim    2023-12-08   883  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   884  		cmu_peric1: clock-controller@10c00000 {
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   885  			compatible = "samsung,exynosautov920-cmu-peric1";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   886  			reg = <0x10c00000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   887  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   888  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   889  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   890  				 <&cmu_top DOUT_CLKCMU_PERIC1_NOC>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   891  				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   892  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   893  				      "noc",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   894  				      "ip";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   895  		};
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09   896  
c96dab1993d247 Jaewon Kim    2023-12-08   897  		syscon_peric1: syscon@10c20000 {
c96dab1993d247 Jaewon Kim    2023-12-08   898  			compatible = "samsung,exynosautov920-peric1-sysreg",
c96dab1993d247 Jaewon Kim    2023-12-08   899  				     "syscon";
c96dab1993d247 Jaewon Kim    2023-12-08   900  			reg = <0x10c20000 0x2000>;
c96dab1993d247 Jaewon Kim    2023-12-08   901  		};
c96dab1993d247 Jaewon Kim    2023-12-08   902  
c96dab1993d247 Jaewon Kim    2023-12-08   903  		pinctrl_peric1: pinctrl@10c30000 {
c96dab1993d247 Jaewon Kim    2023-12-08   904  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08   905  			reg = <0x10c30000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08   906  			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08   907  		};
c96dab1993d247 Jaewon Kim    2023-12-08   908  
1a6ee48d8757db Faraz Ata     2025-04-17   909  		usi_9: usi@10c800c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   910  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   911  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   912  			reg = <0x10c800c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   913  			samsung,sysreg = <&syscon_peric1 0x1000>;
1a6ee48d8757db Faraz Ata     2025-04-17   914  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   915  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   916  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   917  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   918  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   919  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   920  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   921  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   922  
1a6ee48d8757db Faraz Ata     2025-04-17   923  			serial_9: serial@10c8000 {
1a6ee48d8757db Faraz Ata     2025-04-17   924  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   925  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   926  				reg = <0x10c80000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   927  				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   928  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   929  				pinctrl-0 = <&uart9_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   930  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   931  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   932  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   933  				samsung,uart-fifosize = <256>;
1a6ee48d8757db Faraz Ata     2025-04-17   934  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   935  			};
134442a04bb9a6 Faraz Ata     2025-06-13   936  
134442a04bb9a6 Faraz Ata     2025-06-13   937  			spi_9: spi@10c80000 {
134442a04bb9a6 Faraz Ata     2025-06-13   938  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   939  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   940  				reg = <0x10c80000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   941  				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   942  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   943  				pinctrl-0 = <&spi9_bus &spi9_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   944  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   945  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   946  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   947  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   948  				dmas = <&pdma1 1>, <&pdma1 0>;
134442a04bb9a6 Faraz Ata     2025-06-13   949  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   950  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   951  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13   952  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   953  				fifo-depth = <256>;
134442a04bb9a6 Faraz Ata     2025-06-13   954  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13   955  			};
1a6ee48d8757db Faraz Ata     2025-04-17   956  		};
1a6ee48d8757db Faraz Ata     2025-04-17   957  
1a6ee48d8757db Faraz Ata     2025-04-17   958  		usi_10: usi@10ca00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17   959  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17   960  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17   961  			reg = <0x10ca00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17   962  			samsung,sysreg = <&syscon_peric1 0x1008>;
1a6ee48d8757db Faraz Ata     2025-04-17   963  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17   964  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   965  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17   966  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17   967  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   968  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   969  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17   970  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   971  
1a6ee48d8757db Faraz Ata     2025-04-17   972  			serial_10: serial@10ca0000 {
1a6ee48d8757db Faraz Ata     2025-04-17   973  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17   974  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17   975  				reg = <0x10ca0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17   976  				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17   977  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17   978  				pinctrl-0 = <&uart10_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17   979  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17   980  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17   981  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17   982  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17   983  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17   984  			};
134442a04bb9a6 Faraz Ata     2025-06-13   985  
134442a04bb9a6 Faraz Ata     2025-06-13   986  			spi_10: spi@10ca0000 {
134442a04bb9a6 Faraz Ata     2025-06-13   987  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13   988  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13   989  				reg = <0x10ca0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13   990  				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13   991  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13   992  				pinctrl-0 = <&spi10_bus &spi10_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13   993  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13   994  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13   995  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13   996  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13   997  				dmas = <&pdma1 3>, <&pdma1 2>;
134442a04bb9a6 Faraz Ata     2025-06-13   998  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13   999  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1000  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1001  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1002  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1003  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1004  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1005  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1006  
1a6ee48d8757db Faraz Ata     2025-04-17  1007  		usi_11: usi@10cc00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1008  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1009  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1010  			reg = <0x10cc00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1011  			samsung,sysreg = <&syscon_peric1 0x1010>;
1a6ee48d8757db Faraz Ata     2025-04-17  1012  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1013  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1014  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1015  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1016  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1017  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1018  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1019  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1020  
1a6ee48d8757db Faraz Ata     2025-04-17  1021  			serial_11: serial@10cc0000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1022  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1023  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1024  				reg = <0x10cc0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1025  				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1026  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1027  				pinctrl-0 = <&uart11_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1028  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1029  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1030  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1031  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1032  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1033  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1034  
134442a04bb9a6 Faraz Ata     2025-06-13  1035  			spi_11: spi@10cc0000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1036  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1037  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1038  				reg = <0x10cc0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1039  				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1040  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1041  				pinctrl-0 = <&spi11_bus &spi11_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1042  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1043  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1044  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1045  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1046  				dmas = <&pdma1 5>, <&pdma1 4>;
134442a04bb9a6 Faraz Ata     2025-06-13  1047  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1048  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1049  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1050  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1051  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1052  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1053  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1054  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1055  
1a6ee48d8757db Faraz Ata     2025-04-17  1056  		usi_12: usi@10ce00c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1057  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1058  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1059  			reg = <0x10ce00c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1060  			samsung,sysreg = <&syscon_peric1 0x1018>;
1a6ee48d8757db Faraz Ata     2025-04-17  1061  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1062  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1063  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1064  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1065  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1066  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1067  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1068  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1069  
1a6ee48d8757db Faraz Ata     2025-04-17  1070  			serial_12: serial@10ce0000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1071  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1072  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1073  				reg = <0x10ce0000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1074  				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1075  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1076  				pinctrl-0 = <&uart12_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1077  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1078  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1079  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1080  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1081  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1082  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1083  
134442a04bb9a6 Faraz Ata     2025-06-13  1084  			spi_12: spi@10ce0000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1085  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1086  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1087  				reg = <0x10ce0000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1088  				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1089  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1090  				pinctrl-0 = <&spi12_bus &spi12_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1091  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1092  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1093  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1094  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1095  				dmas = <&pdma1 7>, <&pdma1 6>;
134442a04bb9a6 Faraz Ata     2025-06-13  1096  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1097  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1098  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1099  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1100  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1101  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1102  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1103  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1104  
1a6ee48d8757db Faraz Ata     2025-04-17  1105  		usi_13: usi@10d000c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1106  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1107  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1108  			reg = <0x10d000c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1109  			samsung,sysreg = <&syscon_peric1 0x1020>;
1a6ee48d8757db Faraz Ata     2025-04-17  1110  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1111  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1112  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1113  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1114  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1115  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1116  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1117  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1118  
1a6ee48d8757db Faraz Ata     2025-04-17  1119  			serial_13: serial@10d00000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1120  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1121  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1122  				reg = <0x10d00000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1123  				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1124  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1125  				pinctrl-0 = <&uart13_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1126  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1127  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1128  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1129  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1130  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1131  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1132  
134442a04bb9a6 Faraz Ata     2025-06-13  1133  			spi_13: spi@10d00000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1134  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1135  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1136  				reg = <0x10d00000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1137  				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1138  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1139  				pinctrl-0 = <&spi13_bus &spi13_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1140  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1141  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1142  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1143  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1144  				dmas = <&pdma1 9>, <&pdma1 8>;
134442a04bb9a6 Faraz Ata     2025-06-13  1145  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1146  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1147  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1148  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1149  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1150  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1151  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1152  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1153  
1a6ee48d8757db Faraz Ata     2025-04-17  1154  		usi_14: usi@10d200c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1155  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1156  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1157  			reg = <0x10d200c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1158  			samsung,sysreg = <&syscon_peric1 0x1028>;
1a6ee48d8757db Faraz Ata     2025-04-17  1159  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1160  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1161  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1162  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1163  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1164  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1165  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1166  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1167  
1a6ee48d8757db Faraz Ata     2025-04-17  1168  			serial_14: serial@10d20000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1169  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1170  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1171  				reg = <0x10d20000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1172  				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1173  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1174  				pinctrl-0 = <&uart14_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1175  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1176  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1177  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1178  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1179  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1180  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1181  
134442a04bb9a6 Faraz Ata     2025-06-13  1182  			spi_14: spi@10d20000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1183  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1184  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1185  				reg = <0x10d20000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1186  				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1187  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1188  				pinctrl-0 = <&spi14_bus &spi14_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1189  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1190  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1191  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1192  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1193  				dmas = <&pdma1 11>, <&pdma1 10>;
134442a04bb9a6 Faraz Ata     2025-06-13  1194  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1195  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1196  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1197  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1198  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1199  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1200  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1201  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1202  
1a6ee48d8757db Faraz Ata     2025-04-17  1203  		usi_15: usi@10d400c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1204  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1205  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1206  			reg = <0x10d400c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1207  			samsung,sysreg = <&syscon_peric1 0x1030>;
1a6ee48d8757db Faraz Ata     2025-04-17  1208  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1209  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1210  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1211  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1212  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1213  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1214  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1215  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1216  
1a6ee48d8757db Faraz Ata     2025-04-17  1217  			serial_15: serial@10d40000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1218  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1219  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1220  				reg = <0x10d40000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1221  				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1222  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1223  				pinctrl-0 = <&uart15_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1224  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1225  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1226  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1227  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1228  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1229  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1230  
134442a04bb9a6 Faraz Ata     2025-06-13  1231  			spi_15: spi@10d40000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1232  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1233  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1234  				reg = <0x10d40000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1235  				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1236  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1237  				pinctrl-0 = <&spi15_bus &spi15_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1238  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1239  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1240  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1241  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1242  				dmas = <&pdma1 13>, <&pdma1 12>;
134442a04bb9a6 Faraz Ata     2025-06-13  1243  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1244  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1245  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1246  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1247  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1248  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1249  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1250  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1251  
1a6ee48d8757db Faraz Ata     2025-04-17  1252  		usi_16: usi@10d600c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1253  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1254  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1255  			reg = <0x10d600c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1256  			samsung,sysreg = <&syscon_peric1 0x1038>;
1a6ee48d8757db Faraz Ata     2025-04-17  1257  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1258  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1259  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1260  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1261  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1262  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1263  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1264  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1265  
1a6ee48d8757db Faraz Ata     2025-04-17  1266  			serial_16: serial@10d60000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1267  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1268  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1269  				reg = <0x10d60000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1270  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1271  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1272  				pinctrl-0 = <&uart16_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1273  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1274  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1275  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1276  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1277  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1278  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1279  
134442a04bb9a6 Faraz Ata     2025-06-13  1280  			spi_16: spi@10d60000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1281  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1282  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1283  				reg = <0x10d60000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1284  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1285  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1286  				pinctrl-0 = <&spi16_bus &spi16_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1287  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1288  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1289  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1290  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1291  				dmas = <&pdma1 15>, <&pdma1 14>;
134442a04bb9a6 Faraz Ata     2025-06-13  1292  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1293  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1294  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1295  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1296  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1297  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1298  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1299  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1300  
1a6ee48d8757db Faraz Ata     2025-04-17  1301  		usi_17: usi@10d800c0 {
1a6ee48d8757db Faraz Ata     2025-04-17  1302  			compatible = "samsung,exynosautov920-usi",
1a6ee48d8757db Faraz Ata     2025-04-17  1303  				     "samsung,exynos850-usi";
1a6ee48d8757db Faraz Ata     2025-04-17  1304  			reg = <0x10d800c0 0x20>;
1a6ee48d8757db Faraz Ata     2025-04-17  1305  			samsung,sysreg = <&syscon_peric1 0x1040>;
1a6ee48d8757db Faraz Ata     2025-04-17  1306  			samsung,mode = <USI_V2_UART>;
1a6ee48d8757db Faraz Ata     2025-04-17  1307  			#address-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1308  			#size-cells = <1>;
1a6ee48d8757db Faraz Ata     2025-04-17  1309  			ranges;
1a6ee48d8757db Faraz Ata     2025-04-17  1310  			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1311  				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1312  			clock-names = "pclk", "ipclk";
1a6ee48d8757db Faraz Ata     2025-04-17  1313  			status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1314  
1a6ee48d8757db Faraz Ata     2025-04-17  1315  			serial_17: serial@10d80000 {
1a6ee48d8757db Faraz Ata     2025-04-17  1316  				compatible = "samsung,exynosautov920-uart",
1a6ee48d8757db Faraz Ata     2025-04-17  1317  					     "samsung,exynos850-uart";
1a6ee48d8757db Faraz Ata     2025-04-17  1318  				reg = <0x10d80000 0xc0>;
1a6ee48d8757db Faraz Ata     2025-04-17  1319  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
1a6ee48d8757db Faraz Ata     2025-04-17  1320  				pinctrl-names = "default";
1a6ee48d8757db Faraz Ata     2025-04-17  1321  				pinctrl-0 = <&uart17_bus>;
1a6ee48d8757db Faraz Ata     2025-04-17  1322  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
1a6ee48d8757db Faraz Ata     2025-04-17  1323  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
1a6ee48d8757db Faraz Ata     2025-04-17  1324  				clock-names = "uart", "clk_uart_baud0";
1a6ee48d8757db Faraz Ata     2025-04-17  1325  				samsung,uart-fifosize = <64>;
1a6ee48d8757db Faraz Ata     2025-04-17  1326  				status = "disabled";
1a6ee48d8757db Faraz Ata     2025-04-17  1327  			};
134442a04bb9a6 Faraz Ata     2025-06-13  1328  
134442a04bb9a6 Faraz Ata     2025-06-13  1329  			spi_17: spi@10d80000 {
134442a04bb9a6 Faraz Ata     2025-06-13  1330  				compatible = "samsung,exynosautov920-spi",
134442a04bb9a6 Faraz Ata     2025-06-13  1331  					     "samsung,exynos850-spi";
134442a04bb9a6 Faraz Ata     2025-06-13  1332  				reg = <0x10d80000 0x30>;
134442a04bb9a6 Faraz Ata     2025-06-13  1333  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
134442a04bb9a6 Faraz Ata     2025-06-13  1334  				pinctrl-names = "default";
134442a04bb9a6 Faraz Ata     2025-06-13  1335  				pinctrl-0 = <&spi17_bus &spi17_cs_func>;
134442a04bb9a6 Faraz Ata     2025-06-13  1336  				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
134442a04bb9a6 Faraz Ata     2025-06-13  1337  					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
134442a04bb9a6 Faraz Ata     2025-06-13  1338  				clock-names = "spi", "spi_busclk0";
134442a04bb9a6 Faraz Ata     2025-06-13  1339  				samsung,spi-src-clk = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1340  				dmas = <&pdma1 17>, <&pdma1 16>;
134442a04bb9a6 Faraz Ata     2025-06-13  1341  				dma-names = "tx", "rx";
134442a04bb9a6 Faraz Ata     2025-06-13  1342  				num-cs = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1343  				#address-cells = <1>;
134442a04bb9a6 Faraz Ata     2025-06-13  1344  				#size-cells = <0>;
134442a04bb9a6 Faraz Ata     2025-06-13  1345  				fifo-depth = <64>;
134442a04bb9a6 Faraz Ata     2025-06-13  1346  				status = "disabled";
134442a04bb9a6 Faraz Ata     2025-06-13  1347  			};
1a6ee48d8757db Faraz Ata     2025-04-17  1348  		};
1a6ee48d8757db Faraz Ata     2025-04-17  1349  
4d06000979cda2 Sunyeal Hong  2024-08-22  1350  		cmu_top: clock-controller@11000000 {
4d06000979cda2 Sunyeal Hong  2024-08-22  1351  			compatible = "samsung,exynosautov920-cmu-top";
4d06000979cda2 Sunyeal Hong  2024-08-22  1352  			reg = <0x11000000 0x8000>;
4d06000979cda2 Sunyeal Hong  2024-08-22  1353  			#clock-cells = <1>;
4d06000979cda2 Sunyeal Hong  2024-08-22  1354  
4d06000979cda2 Sunyeal Hong  2024-08-22  1355  			clocks = <&xtcxo>;
4d06000979cda2 Sunyeal Hong  2024-08-22  1356  			clock-names = "oscclk";
4d06000979cda2 Sunyeal Hong  2024-08-22  1357  		};
4d06000979cda2 Sunyeal Hong  2024-08-22  1358  
c96dab1993d247 Jaewon Kim    2023-12-08  1359  		pinctrl_alive: pinctrl@11850000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1360  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1361  			reg = <0x11850000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1362  
c96dab1993d247 Jaewon Kim    2023-12-08  1363  			wakeup-interrupt-controller {
c96dab1993d247 Jaewon Kim    2023-12-08  1364  				compatible = "samsung,exynosautov920-wakeup-eint";
c96dab1993d247 Jaewon Kim    2023-12-08  1365  			};
c96dab1993d247 Jaewon Kim    2023-12-08  1366  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1367  
c96dab1993d247 Jaewon Kim    2023-12-08  1368  		pmu_system_controller: system-controller@11860000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1369  			compatible = "samsung,exynosautov920-pmu",
c96dab1993d247 Jaewon Kim    2023-12-08  1370  				     "samsung,exynos7-pmu","syscon";
c96dab1993d247 Jaewon Kim    2023-12-08  1371  			reg = <0x11860000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1372  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1373  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1374  		cmu_hsi0: clock-controller@16000000 {
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1375  			compatible = "samsung,exynosautov920-cmu-hsi0";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1376  			reg = <0x16000000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1377  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1378  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1379  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1380  				 <&cmu_top DOUT_CLKCMU_HSI0_NOC>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1381  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1382  				      "noc";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1383  		};
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1384  
c96dab1993d247 Jaewon Kim    2023-12-08  1385  		pinctrl_hsi0: pinctrl@16040000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1386  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1387  			reg = <0x16040000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1388  			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08  1389  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1390  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1391  		cmu_hsi1: clock-controller@16400000 {
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1392  			compatible = "samsung,exynosautov920-cmu-hsi1";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1393  			reg = <0x16400000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1394  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1395  
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1396  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1397  				 <&cmu_top DOUT_CLKCMU_HSI1_NOC>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1398  				 <&cmu_top DOUT_CLKCMU_HSI1_USBDRD>,
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1399  				 <&cmu_top DOUT_CLKCMU_HSI1_MMC_CARD>;
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1400  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1401  				      "noc",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1402  				      "usbdrd",
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1403  				      "mmc_card";
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1404  		};
ef1c2a54cbc7d9 Sunyeal Hong  2024-10-09  1405  
c96dab1993d247 Jaewon Kim    2023-12-08  1406  		pinctrl_hsi1: pinctrl@16450000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1407  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1408  			reg = <0x16450000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1409  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08  1410  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1411  
e2016763590f57 Raghav Sharma 2025-05-29  1412  		cmu_hsi2: clock-controller@16b00000 {
e2016763590f57 Raghav Sharma 2025-05-29  1413  			compatible = "samsung,exynosautov920-cmu-hsi2";
e2016763590f57 Raghav Sharma 2025-05-29  1414  			reg = <0x16b00000 0x8000>;
e2016763590f57 Raghav Sharma 2025-05-29  1415  			#clock-cells = <1>;
e2016763590f57 Raghav Sharma 2025-05-29  1416  
e2016763590f57 Raghav Sharma 2025-05-29  1417  			clocks = <&xtcxo>,
e2016763590f57 Raghav Sharma 2025-05-29  1418  				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
e2016763590f57 Raghav Sharma 2025-05-29  1419  				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
e2016763590f57 Raghav Sharma 2025-05-29  1420  				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
e2016763590f57 Raghav Sharma 2025-05-29  1421  				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
e2016763590f57 Raghav Sharma 2025-05-29  1422  			clock-names = "oscclk",
e2016763590f57 Raghav Sharma 2025-05-29  1423  				      "noc",
e2016763590f57 Raghav Sharma 2025-05-29  1424  				      "ufs",
e2016763590f57 Raghav Sharma 2025-05-29  1425  				      "embd",
e2016763590f57 Raghav Sharma 2025-05-29  1426  				      "ethernet";
e2016763590f57 Raghav Sharma 2025-05-29  1427  		};
e2016763590f57 Raghav Sharma 2025-05-29  1428  
c96dab1993d247 Jaewon Kim    2023-12-08  1429  		pinctrl_hsi2: pinctrl@16c10000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1430  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1431  			reg = <0x16c10000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1432  			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08  1433  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1434  
c96dab1993d247 Jaewon Kim    2023-12-08  1435  		pinctrl_hsi2ufs: pinctrl@16d20000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1436  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1437  			reg = <0x16d20000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1438  			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim    2023-12-08  1439  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1440  
5893f538e33160 Sowon Na      2025-02-19  1441  		ufs_0_phy: phy@16e04000 {
5893f538e33160 Sowon Na      2025-02-19  1442  			compatible = "samsung,exynosautov920-ufs-phy";
5893f538e33160 Sowon Na      2025-02-19  1443  			reg = <0x16e04000 0x4000>;
5893f538e33160 Sowon Na      2025-02-19  1444  			reg-names = "phy-pma";
5893f538e33160 Sowon Na      2025-02-19  1445  			clocks = <&xtcxo>;
5893f538e33160 Sowon Na      2025-02-19  1446  			clock-names = "ref_clk";
5893f538e33160 Sowon Na      2025-02-19  1447  			samsung,pmu-syscon = <&pmu_system_controller>;
5893f538e33160 Sowon Na      2025-02-19  1448  			#phy-cells = <0>;
5893f538e33160 Sowon Na      2025-02-19  1449  			status = "disabled";
5893f538e33160 Sowon Na      2025-02-19  1450  		};
5893f538e33160 Sowon Na      2025-02-19  1451  
c96dab1993d247 Jaewon Kim    2023-12-08  1452  		pinctrl_aud: pinctrl@1a460000 {
c96dab1993d247 Jaewon Kim    2023-12-08  1453  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim    2023-12-08  1454  			reg = <0x1a460000 0x10000>;
c96dab1993d247 Jaewon Kim    2023-12-08  1455  		};
2a4067c89e4137 Shin Son      2025-04-23  1456  
78e0f0e81fd4ea Raghav Sharma 2025-08-08 @1457  		cmu_m2m: clock-controller@0x1a800000 {
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1458  			compatible = "samsung,exynosautov920-cmu-m2m";
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1459  			reg = <0x1a800000 0x8000>;
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1460  			#clock-cells = <1>;
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1461  
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1462  			clocks = <&xtcxo>,
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1463  				 <&cmu_top DOUT_CLKCMU_M2M_NOC>,
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1464  				 <&cmu_top DOUT_CLKCMU_M2M_JPEG>;
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1465  			clock-names = "oscclk",
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1466  				      "noc",
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1467  				      "jpeg";
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1468  		};
78e0f0e81fd4ea Raghav Sharma 2025-08-08  1469  
2a4067c89e4137 Shin Son      2025-04-23  1470  		cmu_cpucl0: clock-controller@1ec00000 {
2a4067c89e4137 Shin Son      2025-04-23  1471  			compatible = "samsung,exynosautov920-cmu-cpucl0";
2a4067c89e4137 Shin Son      2025-04-23  1472  			reg = <0x1ec00000 0x8000>;
2a4067c89e4137 Shin Son      2025-04-23  1473  			#clock-cells = <1>;
2a4067c89e4137 Shin Son      2025-04-23  1474  
2a4067c89e4137 Shin Son      2025-04-23  1475  			clocks = <&xtcxo>,
2a4067c89e4137 Shin Son      2025-04-23  1476  				 <&cmu_top DOUT_CLKCMU_CPUCL0_SWITCH>,
2a4067c89e4137 Shin Son      2025-04-23  1477  				 <&cmu_top DOUT_CLKCMU_CPUCL0_CLUSTER>,
2a4067c89e4137 Shin Son      2025-04-23  1478  				 <&cmu_top DOUT_CLKCMU_CPUCL0_DBG>;
2a4067c89e4137 Shin Son      2025-04-23  1479  			clock-names = "oscclk",
2a4067c89e4137 Shin Son      2025-04-23  1480  				      "switch",
2a4067c89e4137 Shin Son      2025-04-23  1481  				      "cluster",
2a4067c89e4137 Shin Son      2025-04-23  1482  				      "dbg";
2a4067c89e4137 Shin Son      2025-04-23  1483  		};
aa833db4b82205 Shin Son      2025-04-28  1484  
aa833db4b82205 Shin Son      2025-04-28  1485  		cmu_cpucl1: clock-controller@1ed00000 {
aa833db4b82205 Shin Son      2025-04-28  1486  			compatible = "samsung,exynosautov920-cmu-cpucl1";
aa833db4b82205 Shin Son      2025-04-28  1487  			reg = <0x1ed00000 0x8000>;
aa833db4b82205 Shin Son      2025-04-28  1488  			#clock-cells = <1>;
aa833db4b82205 Shin Son      2025-04-28  1489  
aa833db4b82205 Shin Son      2025-04-28  1490  			clocks = <&xtcxo>,
aa833db4b82205 Shin Son      2025-04-28  1491  				 <&cmu_top DOUT_CLKCMU_CPUCL1_SWITCH>,
aa833db4b82205 Shin Son      2025-04-28  1492  				 <&cmu_top DOUT_CLKCMU_CPUCL1_CLUSTER>;
aa833db4b82205 Shin Son      2025-04-28  1493  			clock-names = "oscclk",
aa833db4b82205 Shin Son      2025-04-28  1494  				      "switch",
aa833db4b82205 Shin Son      2025-04-28  1495  				      "cluster";
aa833db4b82205 Shin Son      2025-04-28  1496  		};
aa833db4b82205 Shin Son      2025-04-28  1497  
aa833db4b82205 Shin Son      2025-04-28  1498  		cmu_cpucl2: clock-controller@1ee00000 {
aa833db4b82205 Shin Son      2025-04-28  1499  			compatible = "samsung,exynosautov920-cmu-cpucl2";
aa833db4b82205 Shin Son      2025-04-28  1500  			reg = <0x1ee00000 0x8000>;
aa833db4b82205 Shin Son      2025-04-28  1501  			#clock-cells = <1>;
aa833db4b82205 Shin Son      2025-04-28  1502  
aa833db4b82205 Shin Son      2025-04-28  1503  			clocks = <&xtcxo>,
aa833db4b82205 Shin Son      2025-04-28  1504  				 <&cmu_top DOUT_CLKCMU_CPUCL2_SWITCH>,
aa833db4b82205 Shin Son      2025-04-28  1505  				 <&cmu_top DOUT_CLKCMU_CPUCL2_CLUSTER>;
aa833db4b82205 Shin Son      2025-04-28  1506  			clock-names = "oscclk",
aa833db4b82205 Shin Son      2025-04-28  1507  				      "switch",
aa833db4b82205 Shin Son      2025-04-28  1508  				      "cluster";
aa833db4b82205 Shin Son      2025-04-28  1509  		};
c96dab1993d247 Jaewon Kim    2023-12-08  1510  	};
c96dab1993d247 Jaewon Kim    2023-12-08  1511  
c96dab1993d247 Jaewon Kim    2023-12-08  1512  	timer {
c96dab1993d247 Jaewon Kim    2023-12-08  1513  		compatible = "arm,armv8-timer";
c96dab1993d247 Jaewon Kim    2023-12-08  1514  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim    2023-12-08  1515  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim    2023-12-08  1516  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim    2023-12-08  1517  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim    2023-12-08  1518  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
c96dab1993d247 Jaewon Kim    2023-12-08  1519  	};
c96dab1993d247 Jaewon Kim    2023-12-08  1520  };
c96dab1993d247 Jaewon Kim    2023-12-08  1521  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
