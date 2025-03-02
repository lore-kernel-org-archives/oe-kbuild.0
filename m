Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32000EEB3
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740941103; cv=none; b=sbJTGz+Z5exfJ2G+xy+0UvBTvTkuC2MSv2r4iLL98BJBw2mAXqShj+iMm65cQgPS9e7yvkL1ZkHXkcfBVF1BPHS5ju9PtMv5Jxe6JDkXS12ynHMgbusT4MKjYf6LbNwC/KAySC/D/SV0fWrsXmo+w6xHheYlFmoPxEbd4cy18mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740941103; c=relaxed/simple;
	bh=27a7JlKj720WNtsPBSBRM4AKVWqRgf+s66gxf6QC9NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLfJstzdFSyPoc3kL61S12iOD06oJGIxghQJZyu8qRdf24/2NMcDiHyRsUwcvCjW5mAgcCEAexPuXFQYrVspB1zifFm1EU/MZJIxzV5PU//pB48NbORpQILwUCwgZT3vUmM7YzEvzl4CyIgFhTkrwsrRhlj9lK00dKASlsxRqlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGMz5DQp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGMz5DQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740941097; x=1772477097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27a7JlKj720WNtsPBSBRM4AKVWqRgf+s66gxf6QC9NM=;
  b=ZGMz5DQp2ZstluEOIOW6Czw4d7nRrYQ2Y0xn6LdR5aQrrE9AgaGLdhoQ
   cZHH/hizUd0Y7zfmw7BbKyj/Q4eI8/zUJxiwLhJSI70mqriVyqR2lH1Kk
   T2XO2FqmphUilytXp53zWr68bT8B4MX3cXvuEcjpZNkzmoHnWhFYvnWB9
   RMq35r/Mzcv5GoPtOwxiUSMOOIaRmkqho3zp6uNyTvVzNgdSUl5BXcv1Q
   KBAEPb8MyC3aWAmbHza2tQjiV75bY8fFJJepGJB+lMPeMlQln4g2rliB3
   Fry/CAl8hOfziWX3oImWFiRVUCF+nK3FLwq8+4+vaEHiPGX8ADi3ddLLX
   w==;
X-CSE-ConnectionGUID: sy1NccZMRUaGBPqUMpfTPg==
X-CSE-MsgGUID: j0VAutnKQDC1QX1mfzIrMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41729182"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41729182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 10:44:57 -0800
X-CSE-ConnectionGUID: xr0+Y6gJQmqsm3cQ8qCbSg==
X-CSE-MsgGUID: Q2Jz1D9BRDKpPq0QfD1fCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118299707"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2025 10:44:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tooIv-000HWw-22;
	Sun, 02 Mar 2025 18:44:47 +0000
Date: Mon, 3 Mar 2025 02:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: describe I2c Bus 1 and
 IMX258 world camera on PinePhone Pro
Message-ID: <202503030248.7N5f3FAh-lkp@intel.com>
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
In-Reply-To: <20250302-camera-v2-1-312b44b4a89c@bootlin.com>
References: <20250302-camera-v2-1-312b44b4a89c@bootlin.com>
TO: Olivier Benjamin <olivier.benjamin@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Olivier Benjamin <olivier.benjamin@bootlin.com>
CC: oren@taumoda.com
CC: Dragan Simic <dsimic@manjaro.org>
CC: Ondrej Jirman <megi@xff.cz>

Hi Olivier,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Benjamin/arm64-dts-rockchip-describe-I2c-Bus-1-and-IMX258-world-camera-on-PinePhone-Pro/20250302-234347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250302-camera-v2-1-312b44b4a89c%40bootlin.com
patch subject: [PATCH v2 1/2] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030248.7N5f3FAh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030248.7N5f3FAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030248.7N5f3FAh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (avoid_unnecessary_addr_size): /dsi@ff960000/ports/port@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1984.9-1993.5: Warning (graph_child_address): /isp1@ff920000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1988.11-1992.6: Warning (graph_child_address): /isp1@ff920000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (graph_child_address): /dsi@ff960000/ports/port@1: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary

vim +1984 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi

296602b8e5f715 Dragan Simic 2024-07-21    13  
296602b8e5f715 Dragan Simic 2024-07-21    14  / {
296602b8e5f715 Dragan Simic 2024-07-21    15  	compatible = "rockchip,rk3399";
296602b8e5f715 Dragan Simic 2024-07-21    16  
296602b8e5f715 Dragan Simic 2024-07-21    17  	interrupt-parent = <&gic>;
296602b8e5f715 Dragan Simic 2024-07-21    18  	#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21    19  	#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21    20  
296602b8e5f715 Dragan Simic 2024-07-21    21  	aliases {
296602b8e5f715 Dragan Simic 2024-07-21    22  		gpio0 = &gpio0;
296602b8e5f715 Dragan Simic 2024-07-21    23  		gpio1 = &gpio1;
296602b8e5f715 Dragan Simic 2024-07-21    24  		gpio2 = &gpio2;
296602b8e5f715 Dragan Simic 2024-07-21    25  		gpio3 = &gpio3;
296602b8e5f715 Dragan Simic 2024-07-21    26  		gpio4 = &gpio4;
296602b8e5f715 Dragan Simic 2024-07-21    27  		i2c0 = &i2c0;
296602b8e5f715 Dragan Simic 2024-07-21    28  		i2c1 = &i2c1;
296602b8e5f715 Dragan Simic 2024-07-21    29  		i2c2 = &i2c2;
296602b8e5f715 Dragan Simic 2024-07-21    30  		i2c3 = &i2c3;
296602b8e5f715 Dragan Simic 2024-07-21    31  		i2c4 = &i2c4;
296602b8e5f715 Dragan Simic 2024-07-21    32  		i2c5 = &i2c5;
296602b8e5f715 Dragan Simic 2024-07-21    33  		i2c6 = &i2c6;
296602b8e5f715 Dragan Simic 2024-07-21    34  		i2c7 = &i2c7;
296602b8e5f715 Dragan Simic 2024-07-21    35  		i2c8 = &i2c8;
296602b8e5f715 Dragan Simic 2024-07-21    36  		serial0 = &uart0;
296602b8e5f715 Dragan Simic 2024-07-21    37  		serial1 = &uart1;
296602b8e5f715 Dragan Simic 2024-07-21    38  		serial2 = &uart2;
296602b8e5f715 Dragan Simic 2024-07-21    39  		serial3 = &uart3;
296602b8e5f715 Dragan Simic 2024-07-21    40  		serial4 = &uart4;
296602b8e5f715 Dragan Simic 2024-07-21    41  		spi0 = &spi0;
296602b8e5f715 Dragan Simic 2024-07-21    42  		spi1 = &spi1;
296602b8e5f715 Dragan Simic 2024-07-21    43  		spi2 = &spi2;
296602b8e5f715 Dragan Simic 2024-07-21    44  		spi3 = &spi3;
296602b8e5f715 Dragan Simic 2024-07-21    45  		spi4 = &spi4;
296602b8e5f715 Dragan Simic 2024-07-21    46  		spi5 = &spi5;
296602b8e5f715 Dragan Simic 2024-07-21    47  	};
296602b8e5f715 Dragan Simic 2024-07-21    48  
296602b8e5f715 Dragan Simic 2024-07-21    49  	cpus {
296602b8e5f715 Dragan Simic 2024-07-21    50  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21    51  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21    52  
296602b8e5f715 Dragan Simic 2024-07-21    53  		cpu-map {
296602b8e5f715 Dragan Simic 2024-07-21    54  			cluster0 {	/* Cortex-A53 */
296602b8e5f715 Dragan Simic 2024-07-21    55  				core0 {
296602b8e5f715 Dragan Simic 2024-07-21    56  					cpu = <&cpu_l0>;
296602b8e5f715 Dragan Simic 2024-07-21    57  				};
296602b8e5f715 Dragan Simic 2024-07-21    58  				core1 {
296602b8e5f715 Dragan Simic 2024-07-21    59  					cpu = <&cpu_l1>;
296602b8e5f715 Dragan Simic 2024-07-21    60  				};
296602b8e5f715 Dragan Simic 2024-07-21    61  				core2 {
296602b8e5f715 Dragan Simic 2024-07-21    62  					cpu = <&cpu_l2>;
296602b8e5f715 Dragan Simic 2024-07-21    63  				};
296602b8e5f715 Dragan Simic 2024-07-21    64  				core3 {
296602b8e5f715 Dragan Simic 2024-07-21    65  					cpu = <&cpu_l3>;
296602b8e5f715 Dragan Simic 2024-07-21    66  				};
296602b8e5f715 Dragan Simic 2024-07-21    67  			};
296602b8e5f715 Dragan Simic 2024-07-21    68  
296602b8e5f715 Dragan Simic 2024-07-21    69  			cluster1 {	/* Cortex-A72 */
296602b8e5f715 Dragan Simic 2024-07-21    70  				core0 {
296602b8e5f715 Dragan Simic 2024-07-21    71  					cpu = <&cpu_b0>;
296602b8e5f715 Dragan Simic 2024-07-21    72  				};
296602b8e5f715 Dragan Simic 2024-07-21    73  				core1 {
296602b8e5f715 Dragan Simic 2024-07-21    74  					cpu = <&cpu_b1>;
296602b8e5f715 Dragan Simic 2024-07-21    75  				};
296602b8e5f715 Dragan Simic 2024-07-21    76  			};
296602b8e5f715 Dragan Simic 2024-07-21    77  		};
296602b8e5f715 Dragan Simic 2024-07-21    78  
296602b8e5f715 Dragan Simic 2024-07-21    79  		cpu_l0: cpu@0 {
296602b8e5f715 Dragan Simic 2024-07-21    80  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21    81  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21    82  			reg = <0x0 0x0>;
296602b8e5f715 Dragan Simic 2024-07-21    83  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21    84  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21    85  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21    86  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21    87  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21    88  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21    89  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21    90  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21    91  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21    92  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21    93  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21    94  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21    95  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21    96  		};
296602b8e5f715 Dragan Simic 2024-07-21    97  
296602b8e5f715 Dragan Simic 2024-07-21    98  		cpu_l1: cpu@1 {
296602b8e5f715 Dragan Simic 2024-07-21    99  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   100  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21   101  			reg = <0x0 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21   102  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   103  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21   104  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21   105  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   106  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   107  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   108  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   109  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   110  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   111  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   112  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   113  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21   114  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21   115  		};
296602b8e5f715 Dragan Simic 2024-07-21   116  
296602b8e5f715 Dragan Simic 2024-07-21   117  		cpu_l2: cpu@2 {
296602b8e5f715 Dragan Simic 2024-07-21   118  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   119  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21   120  			reg = <0x0 0x2>;
296602b8e5f715 Dragan Simic 2024-07-21   121  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   122  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21   123  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21   124  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   125  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   126  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   127  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   128  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   129  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   130  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   131  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   132  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21   133  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21   134  		};
296602b8e5f715 Dragan Simic 2024-07-21   135  
296602b8e5f715 Dragan Simic 2024-07-21   136  		cpu_l3: cpu@3 {
296602b8e5f715 Dragan Simic 2024-07-21   137  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   138  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21   139  			reg = <0x0 0x3>;
296602b8e5f715 Dragan Simic 2024-07-21   140  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   141  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21   142  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21   143  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   144  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   145  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   146  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   147  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   148  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   149  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   150  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   151  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21   152  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21   153  		};
296602b8e5f715 Dragan Simic 2024-07-21   154  
296602b8e5f715 Dragan Simic 2024-07-21   155  		cpu_b0: cpu@100 {
296602b8e5f715 Dragan Simic 2024-07-21   156  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   157  			compatible = "arm,cortex-a72";
296602b8e5f715 Dragan Simic 2024-07-21   158  			reg = <0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   159  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   160  			capacity-dmips-mhz = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21   161  			clocks = <&cru ARMCLKB>;
296602b8e5f715 Dragan Simic 2024-07-21   162  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   163  			dynamic-power-coefficient = <436>;
296602b8e5f715 Dragan Simic 2024-07-21   164  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   165  			i-cache-size = <0xC000>;
296602b8e5f715 Dragan Simic 2024-07-21   166  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   167  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   168  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   169  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   170  			d-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   171  			next-level-cache = <&l2_cache_b>;
296602b8e5f715 Dragan Simic 2024-07-21   172  
296602b8e5f715 Dragan Simic 2024-07-21   173  			thermal-idle {
296602b8e5f715 Dragan Simic 2024-07-21   174  				#cooling-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   175  				duration-us = <10000>;
296602b8e5f715 Dragan Simic 2024-07-21   176  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21   177  			};
296602b8e5f715 Dragan Simic 2024-07-21   178  		};
296602b8e5f715 Dragan Simic 2024-07-21   179  
296602b8e5f715 Dragan Simic 2024-07-21   180  		cpu_b1: cpu@101 {
296602b8e5f715 Dragan Simic 2024-07-21   181  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   182  			compatible = "arm,cortex-a72";
296602b8e5f715 Dragan Simic 2024-07-21   183  			reg = <0x0 0x101>;
296602b8e5f715 Dragan Simic 2024-07-21   184  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   185  			capacity-dmips-mhz = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21   186  			clocks = <&cru ARMCLKB>;
296602b8e5f715 Dragan Simic 2024-07-21   187  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   188  			dynamic-power-coefficient = <436>;
296602b8e5f715 Dragan Simic 2024-07-21   189  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   190  			i-cache-size = <0xC000>;
296602b8e5f715 Dragan Simic 2024-07-21   191  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   192  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   193  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   194  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   195  			d-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   196  			next-level-cache = <&l2_cache_b>;
296602b8e5f715 Dragan Simic 2024-07-21   197  
296602b8e5f715 Dragan Simic 2024-07-21   198  			thermal-idle {
296602b8e5f715 Dragan Simic 2024-07-21   199  				#cooling-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   200  				duration-us = <10000>;
296602b8e5f715 Dragan Simic 2024-07-21   201  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21   202  			};
296602b8e5f715 Dragan Simic 2024-07-21   203  		};
296602b8e5f715 Dragan Simic 2024-07-21   204  
296602b8e5f715 Dragan Simic 2024-07-21   205  		l2_cache_l: l2-cache-cluster0 {
296602b8e5f715 Dragan Simic 2024-07-21   206  			compatible = "cache";
296602b8e5f715 Dragan Simic 2024-07-21   207  			cache-level = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   208  			cache-unified;
296602b8e5f715 Dragan Simic 2024-07-21   209  			cache-size = <0x80000>;
296602b8e5f715 Dragan Simic 2024-07-21   210  			cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   211  			cache-sets = <512>;
296602b8e5f715 Dragan Simic 2024-07-21   212  		};
296602b8e5f715 Dragan Simic 2024-07-21   213  
296602b8e5f715 Dragan Simic 2024-07-21   214  		l2_cache_b: l2-cache-cluster1 {
296602b8e5f715 Dragan Simic 2024-07-21   215  			compatible = "cache";
296602b8e5f715 Dragan Simic 2024-07-21   216  			cache-level = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   217  			cache-unified;
296602b8e5f715 Dragan Simic 2024-07-21   218  			cache-size = <0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21   219  			cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   220  			cache-sets = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21   221  		};
296602b8e5f715 Dragan Simic 2024-07-21   222  
296602b8e5f715 Dragan Simic 2024-07-21   223  		idle-states {
296602b8e5f715 Dragan Simic 2024-07-21   224  			entry-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   225  
296602b8e5f715 Dragan Simic 2024-07-21   226  			CPU_SLEEP: cpu-sleep {
296602b8e5f715 Dragan Simic 2024-07-21   227  				compatible = "arm,idle-state";
296602b8e5f715 Dragan Simic 2024-07-21   228  				local-timer-stop;
296602b8e5f715 Dragan Simic 2024-07-21   229  				arm,psci-suspend-param = <0x0010000>;
296602b8e5f715 Dragan Simic 2024-07-21   230  				entry-latency-us = <120>;
296602b8e5f715 Dragan Simic 2024-07-21   231  				exit-latency-us = <250>;
296602b8e5f715 Dragan Simic 2024-07-21   232  				min-residency-us = <900>;
296602b8e5f715 Dragan Simic 2024-07-21   233  			};
296602b8e5f715 Dragan Simic 2024-07-21   234  
296602b8e5f715 Dragan Simic 2024-07-21   235  			CLUSTER_SLEEP: cluster-sleep {
296602b8e5f715 Dragan Simic 2024-07-21   236  				compatible = "arm,idle-state";
296602b8e5f715 Dragan Simic 2024-07-21   237  				local-timer-stop;
296602b8e5f715 Dragan Simic 2024-07-21   238  				arm,psci-suspend-param = <0x1010000>;
296602b8e5f715 Dragan Simic 2024-07-21   239  				entry-latency-us = <400>;
296602b8e5f715 Dragan Simic 2024-07-21   240  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21   241  				min-residency-us = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   242  			};
296602b8e5f715 Dragan Simic 2024-07-21   243  		};
296602b8e5f715 Dragan Simic 2024-07-21   244  	};
296602b8e5f715 Dragan Simic 2024-07-21   245  
296602b8e5f715 Dragan Simic 2024-07-21   246  	display-subsystem {
296602b8e5f715 Dragan Simic 2024-07-21   247  		compatible = "rockchip,display-subsystem";
296602b8e5f715 Dragan Simic 2024-07-21   248  		ports = <&vopl_out>, <&vopb_out>;
296602b8e5f715 Dragan Simic 2024-07-21   249  	};
296602b8e5f715 Dragan Simic 2024-07-21   250  
296602b8e5f715 Dragan Simic 2024-07-21   251  	dmc: memory-controller {
296602b8e5f715 Dragan Simic 2024-07-21   252  		compatible = "rockchip,rk3399-dmc";
296602b8e5f715 Dragan Simic 2024-07-21   253  		rockchip,pmu = <&pmugrf>;
296602b8e5f715 Dragan Simic 2024-07-21   254  		devfreq-events = <&dfi>;
296602b8e5f715 Dragan Simic 2024-07-21   255  		clocks = <&cru SCLK_DDRC>;
296602b8e5f715 Dragan Simic 2024-07-21   256  		clock-names = "dmc_clk";
296602b8e5f715 Dragan Simic 2024-07-21   257  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   258  	};
296602b8e5f715 Dragan Simic 2024-07-21   259  
296602b8e5f715 Dragan Simic 2024-07-21   260  	pmu_a53 {
296602b8e5f715 Dragan Simic 2024-07-21   261  		compatible = "arm,cortex-a53-pmu";
296602b8e5f715 Dragan Simic 2024-07-21   262  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
296602b8e5f715 Dragan Simic 2024-07-21   263  	};
296602b8e5f715 Dragan Simic 2024-07-21   264  
296602b8e5f715 Dragan Simic 2024-07-21   265  	pmu_a72 {
296602b8e5f715 Dragan Simic 2024-07-21   266  		compatible = "arm,cortex-a72-pmu";
296602b8e5f715 Dragan Simic 2024-07-21   267  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
296602b8e5f715 Dragan Simic 2024-07-21   268  	};
296602b8e5f715 Dragan Simic 2024-07-21   269  
296602b8e5f715 Dragan Simic 2024-07-21   270  	psci {
296602b8e5f715 Dragan Simic 2024-07-21   271  		compatible = "arm,psci-1.0";
296602b8e5f715 Dragan Simic 2024-07-21   272  		method = "smc";
296602b8e5f715 Dragan Simic 2024-07-21   273  	};
296602b8e5f715 Dragan Simic 2024-07-21   274  
296602b8e5f715 Dragan Simic 2024-07-21   275  	timer {
296602b8e5f715 Dragan Simic 2024-07-21   276  		compatible = "arm,armv8-timer";
296602b8e5f715 Dragan Simic 2024-07-21   277  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21   278  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21   279  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21   280  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
296602b8e5f715 Dragan Simic 2024-07-21   281  		arm,no-tick-in-suspend;
296602b8e5f715 Dragan Simic 2024-07-21   282  	};
296602b8e5f715 Dragan Simic 2024-07-21   283  
296602b8e5f715 Dragan Simic 2024-07-21   284  	xin24m: xin24m {
296602b8e5f715 Dragan Simic 2024-07-21   285  		compatible = "fixed-clock";
296602b8e5f715 Dragan Simic 2024-07-21   286  		clock-frequency = <24000000>;
296602b8e5f715 Dragan Simic 2024-07-21   287  		clock-output-names = "xin24m";
296602b8e5f715 Dragan Simic 2024-07-21   288  		#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   289  	};
296602b8e5f715 Dragan Simic 2024-07-21   290  
296602b8e5f715 Dragan Simic 2024-07-21   291  	pcie0: pcie@f8000000 {
296602b8e5f715 Dragan Simic 2024-07-21   292  		compatible = "rockchip,rk3399-pcie";
296602b8e5f715 Dragan Simic 2024-07-21   293  		reg = <0x0 0xf8000000 0x0 0x2000000>,
296602b8e5f715 Dragan Simic 2024-07-21   294  		      <0x0 0xfd000000 0x0 0x1000000>;
296602b8e5f715 Dragan Simic 2024-07-21   295  		reg-names = "axi-base", "apb-base";
296602b8e5f715 Dragan Simic 2024-07-21   296  		device_type = "pci";
296602b8e5f715 Dragan Simic 2024-07-21   297  		#address-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21   298  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   299  		#interrupt-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   300  		aspm-no-l0s;
296602b8e5f715 Dragan Simic 2024-07-21   301  		bus-range = <0x0 0x1f>;
296602b8e5f715 Dragan Simic 2024-07-21   302  		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21   303  			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
296602b8e5f715 Dragan Simic 2024-07-21   304  		clock-names = "aclk", "aclk-perf",
296602b8e5f715 Dragan Simic 2024-07-21   305  			      "hclk", "pm";
296602b8e5f715 Dragan Simic 2024-07-21   306  		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21   307  			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21   308  			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   309  		interrupt-names = "sys", "legacy", "client";
296602b8e5f715 Dragan Simic 2024-07-21   310  		interrupt-map-mask = <0 0 0 7>;
296602b8e5f715 Dragan Simic 2024-07-21   311  		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
296602b8e5f715 Dragan Simic 2024-07-21   312  				<0 0 0 2 &pcie0_intc 1>,
296602b8e5f715 Dragan Simic 2024-07-21   313  				<0 0 0 3 &pcie0_intc 2>,
296602b8e5f715 Dragan Simic 2024-07-21   314  				<0 0 0 4 &pcie0_intc 3>;
296602b8e5f715 Dragan Simic 2024-07-21   315  		max-link-speed = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   316  		msi-map = <0x0 &its 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   317  		phys = <&pcie_phy 0>, <&pcie_phy 1>,
296602b8e5f715 Dragan Simic 2024-07-21   318  		       <&pcie_phy 2>, <&pcie_phy 3>;
296602b8e5f715 Dragan Simic 2024-07-21   319  		phy-names = "pcie-phy-0", "pcie-phy-1",
296602b8e5f715 Dragan Simic 2024-07-21   320  			    "pcie-phy-2", "pcie-phy-3";
296602b8e5f715 Dragan Simic 2024-07-21   321  		ranges = <0x82000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x1e00000>,
296602b8e5f715 Dragan Simic 2024-07-21   322  			 <0x81000000 0x0 0xfbe00000 0x0 0xfbe00000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21   323  		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
296602b8e5f715 Dragan Simic 2024-07-21   324  			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
296602b8e5f715 Dragan Simic 2024-07-21   325  			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21   326  			 <&cru SRST_A_PCIE>;
296602b8e5f715 Dragan Simic 2024-07-21   327  		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
296602b8e5f715 Dragan Simic 2024-07-21   328  			      "pm", "pclk", "aclk";
296602b8e5f715 Dragan Simic 2024-07-21   329  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   330  
296602b8e5f715 Dragan Simic 2024-07-21   331  		pcie0_intc: interrupt-controller {
296602b8e5f715 Dragan Simic 2024-07-21   332  			interrupt-controller;
296602b8e5f715 Dragan Simic 2024-07-21   333  			#address-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   334  			#interrupt-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   335  		};
296602b8e5f715 Dragan Simic 2024-07-21   336  	};
296602b8e5f715 Dragan Simic 2024-07-21   337  
296602b8e5f715 Dragan Simic 2024-07-21   338  	pcie0_ep: pcie-ep@f8000000 {
296602b8e5f715 Dragan Simic 2024-07-21   339  		compatible = "rockchip,rk3399-pcie-ep";
296602b8e5f715 Dragan Simic 2024-07-21   340  		reg = <0x0 0xfd000000 0x0 0x1000000>,
296602b8e5f715 Dragan Simic 2024-07-21   341  		      <0x0 0xfa000000 0x0 0x2000000>;
296602b8e5f715 Dragan Simic 2024-07-21   342  		reg-names = "apb-base", "mem-base";
296602b8e5f715 Dragan Simic 2024-07-21   343  		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21   344  			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
296602b8e5f715 Dragan Simic 2024-07-21   345  		clock-names = "aclk", "aclk-perf",
296602b8e5f715 Dragan Simic 2024-07-21   346  			      "hclk", "pm";
296602b8e5f715 Dragan Simic 2024-07-21   347  		max-functions = /bits/ 8 <8>;
296602b8e5f715 Dragan Simic 2024-07-21   348  		num-lanes = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   349  		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
296602b8e5f715 Dragan Simic 2024-07-21   350  			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
296602b8e5f715 Dragan Simic 2024-07-21   351  			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21   352  			 <&cru SRST_A_PCIE>;
296602b8e5f715 Dragan Simic 2024-07-21   353  		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
296602b8e5f715 Dragan Simic 2024-07-21   354  			      "pm", "pclk", "aclk";
296602b8e5f715 Dragan Simic 2024-07-21   355  		phys = <&pcie_phy 0>, <&pcie_phy 1>,
296602b8e5f715 Dragan Simic 2024-07-21   356  		       <&pcie_phy 2>, <&pcie_phy 3>;
296602b8e5f715 Dragan Simic 2024-07-21   357  		phy-names = "pcie-phy-0", "pcie-phy-1",
296602b8e5f715 Dragan Simic 2024-07-21   358  			    "pcie-phy-2", "pcie-phy-3";
296602b8e5f715 Dragan Simic 2024-07-21   359  		rockchip,max-outbound-regions = <32>;
296602b8e5f715 Dragan Simic 2024-07-21   360  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   361  		pinctrl-0 = <&pcie_clkreqnb_cpm>;
296602b8e5f715 Dragan Simic 2024-07-21   362  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   363  	};
296602b8e5f715 Dragan Simic 2024-07-21   364  
296602b8e5f715 Dragan Simic 2024-07-21   365  	gmac: ethernet@fe300000 {
296602b8e5f715 Dragan Simic 2024-07-21   366  		compatible = "rockchip,rk3399-gmac";
296602b8e5f715 Dragan Simic 2024-07-21   367  		reg = <0x0 0xfe300000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21   368  		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   369  		interrupt-names = "macirq";
296602b8e5f715 Dragan Simic 2024-07-21   370  		clocks = <&cru SCLK_MAC>, <&cru SCLK_MAC_RX>,
296602b8e5f715 Dragan Simic 2024-07-21   371  			 <&cru SCLK_MAC_TX>, <&cru SCLK_MACREF>,
296602b8e5f715 Dragan Simic 2024-07-21   372  			 <&cru SCLK_MACREF_OUT>, <&cru ACLK_GMAC>,
296602b8e5f715 Dragan Simic 2024-07-21   373  			 <&cru PCLK_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21   374  		clock-names = "stmmaceth", "mac_clk_rx",
296602b8e5f715 Dragan Simic 2024-07-21   375  			      "mac_clk_tx", "clk_mac_ref",
296602b8e5f715 Dragan Simic 2024-07-21   376  			      "clk_mac_refout", "aclk_mac",
296602b8e5f715 Dragan Simic 2024-07-21   377  			      "pclk_mac";
296602b8e5f715 Dragan Simic 2024-07-21   378  		power-domains = <&power RK3399_PD_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21   379  		resets = <&cru SRST_A_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21   380  		reset-names = "stmmaceth";
296602b8e5f715 Dragan Simic 2024-07-21   381  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21   382  		snps,txpbl = <0x4>;
296602b8e5f715 Dragan Simic 2024-07-21   383  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   384  	};
296602b8e5f715 Dragan Simic 2024-07-21   385  
296602b8e5f715 Dragan Simic 2024-07-21   386  	sdio0: mmc@fe310000 {
296602b8e5f715 Dragan Simic 2024-07-21   387  		compatible = "rockchip,rk3399-dw-mshc",
296602b8e5f715 Dragan Simic 2024-07-21   388  			     "rockchip,rk3288-dw-mshc";
296602b8e5f715 Dragan Simic 2024-07-21   389  		reg = <0x0 0xfe310000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21   390  		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   391  		max-frequency = <150000000>;
296602b8e5f715 Dragan Simic 2024-07-21   392  		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
296602b8e5f715 Dragan Simic 2024-07-21   393  			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
296602b8e5f715 Dragan Simic 2024-07-21   394  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
296602b8e5f715 Dragan Simic 2024-07-21   395  		fifo-depth = <0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   396  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21   397  		resets = <&cru SRST_SDIO0>;
296602b8e5f715 Dragan Simic 2024-07-21   398  		reset-names = "reset";
296602b8e5f715 Dragan Simic 2024-07-21   399  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   400  	};
296602b8e5f715 Dragan Simic 2024-07-21   401  
296602b8e5f715 Dragan Simic 2024-07-21   402  	sdmmc: mmc@fe320000 {
296602b8e5f715 Dragan Simic 2024-07-21   403  		compatible = "rockchip,rk3399-dw-mshc",
296602b8e5f715 Dragan Simic 2024-07-21   404  			     "rockchip,rk3288-dw-mshc";
296602b8e5f715 Dragan Simic 2024-07-21   405  		reg = <0x0 0xfe320000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21   406  		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   407  		max-frequency = <150000000>;
296602b8e5f715 Dragan Simic 2024-07-21   408  		assigned-clocks = <&cru HCLK_SD>;
296602b8e5f715 Dragan Simic 2024-07-21   409  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   410  		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
296602b8e5f715 Dragan Simic 2024-07-21   411  			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
296602b8e5f715 Dragan Simic 2024-07-21   412  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
296602b8e5f715 Dragan Simic 2024-07-21   413  		fifo-depth = <0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   414  		power-domains = <&power RK3399_PD_SD>;
296602b8e5f715 Dragan Simic 2024-07-21   415  		resets = <&cru SRST_SDMMC>;
296602b8e5f715 Dragan Simic 2024-07-21   416  		reset-names = "reset";
296602b8e5f715 Dragan Simic 2024-07-21   417  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   418  	};
296602b8e5f715 Dragan Simic 2024-07-21   419  
296602b8e5f715 Dragan Simic 2024-07-21   420  	sdhci: mmc@fe330000 {
296602b8e5f715 Dragan Simic 2024-07-21   421  		compatible = "rockchip,rk3399-sdhci-5.1", "arasan,sdhci-5.1";
296602b8e5f715 Dragan Simic 2024-07-21   422  		reg = <0x0 0xfe330000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21   423  		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   424  		arasan,soc-ctl-syscon = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21   425  		assigned-clocks = <&cru SCLK_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21   426  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   427  		clocks = <&cru SCLK_EMMC>, <&cru ACLK_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21   428  		clock-names = "clk_xin", "clk_ahb";
296602b8e5f715 Dragan Simic 2024-07-21   429  		clock-output-names = "emmc_cardclock";
296602b8e5f715 Dragan Simic 2024-07-21   430  		#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   431  		phys = <&emmc_phy>;
296602b8e5f715 Dragan Simic 2024-07-21   432  		phy-names = "phy_arasan";
296602b8e5f715 Dragan Simic 2024-07-21   433  		power-domains = <&power RK3399_PD_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21   434  		disable-cqe-dcmd;
296602b8e5f715 Dragan Simic 2024-07-21   435  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   436  	};
296602b8e5f715 Dragan Simic 2024-07-21   437  
296602b8e5f715 Dragan Simic 2024-07-21   438  	usb_host0_ehci: usb@fe380000 {
296602b8e5f715 Dragan Simic 2024-07-21   439  		compatible = "generic-ehci";
296602b8e5f715 Dragan Simic 2024-07-21   440  		reg = <0x0 0xfe380000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21   441  		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   442  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21   443  			 <&u2phy0>;
296602b8e5f715 Dragan Simic 2024-07-21   444  		phys = <&u2phy0_host>;
296602b8e5f715 Dragan Simic 2024-07-21   445  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21   446  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   447  	};
296602b8e5f715 Dragan Simic 2024-07-21   448  
296602b8e5f715 Dragan Simic 2024-07-21   449  	usb_host0_ohci: usb@fe3a0000 {
296602b8e5f715 Dragan Simic 2024-07-21   450  		compatible = "generic-ohci";
296602b8e5f715 Dragan Simic 2024-07-21   451  		reg = <0x0 0xfe3a0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21   452  		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   453  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21   454  			 <&u2phy0>;
296602b8e5f715 Dragan Simic 2024-07-21   455  		phys = <&u2phy0_host>;
296602b8e5f715 Dragan Simic 2024-07-21   456  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21   457  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   458  	};
296602b8e5f715 Dragan Simic 2024-07-21   459  
296602b8e5f715 Dragan Simic 2024-07-21   460  	usb_host1_ehci: usb@fe3c0000 {
296602b8e5f715 Dragan Simic 2024-07-21   461  		compatible = "generic-ehci";
296602b8e5f715 Dragan Simic 2024-07-21   462  		reg = <0x0 0xfe3c0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21   463  		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   464  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21   465  			 <&u2phy1>;
296602b8e5f715 Dragan Simic 2024-07-21   466  		phys = <&u2phy1_host>;
296602b8e5f715 Dragan Simic 2024-07-21   467  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21   468  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   469  	};
296602b8e5f715 Dragan Simic 2024-07-21   470  
296602b8e5f715 Dragan Simic 2024-07-21   471  	usb_host1_ohci: usb@fe3e0000 {
296602b8e5f715 Dragan Simic 2024-07-21   472  		compatible = "generic-ohci";
296602b8e5f715 Dragan Simic 2024-07-21   473  		reg = <0x0 0xfe3e0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21   474  		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   475  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21   476  			 <&u2phy1>;
296602b8e5f715 Dragan Simic 2024-07-21   477  		phys = <&u2phy1_host>;
296602b8e5f715 Dragan Simic 2024-07-21   478  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21   479  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   480  	};
296602b8e5f715 Dragan Simic 2024-07-21   481  
296602b8e5f715 Dragan Simic 2024-07-21   482  	debug@fe430000 {
296602b8e5f715 Dragan Simic 2024-07-21   483  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   484  		reg = <0 0xfe430000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   485  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21   486  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   487  		cpu = <&cpu_l0>;
296602b8e5f715 Dragan Simic 2024-07-21   488  	};
296602b8e5f715 Dragan Simic 2024-07-21   489  
296602b8e5f715 Dragan Simic 2024-07-21   490  	debug@fe432000 {
296602b8e5f715 Dragan Simic 2024-07-21   491  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   492  		reg = <0 0xfe432000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   493  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21   494  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   495  		cpu = <&cpu_l1>;
296602b8e5f715 Dragan Simic 2024-07-21   496  	};
296602b8e5f715 Dragan Simic 2024-07-21   497  
296602b8e5f715 Dragan Simic 2024-07-21   498  	debug@fe434000 {
296602b8e5f715 Dragan Simic 2024-07-21   499  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   500  		reg = <0 0xfe434000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   501  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21   502  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   503  		cpu = <&cpu_l2>;
296602b8e5f715 Dragan Simic 2024-07-21   504  	};
296602b8e5f715 Dragan Simic 2024-07-21   505  
296602b8e5f715 Dragan Simic 2024-07-21   506  	debug@fe436000 {
296602b8e5f715 Dragan Simic 2024-07-21   507  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   508  		reg = <0 0xfe436000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   509  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21   510  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   511  		cpu = <&cpu_l3>;
296602b8e5f715 Dragan Simic 2024-07-21   512  	};
296602b8e5f715 Dragan Simic 2024-07-21   513  
296602b8e5f715 Dragan Simic 2024-07-21   514  	debug@fe610000 {
296602b8e5f715 Dragan Simic 2024-07-21   515  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   516  		reg = <0 0xfe610000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   517  		clocks = <&cru PCLK_COREDBG_B>;
296602b8e5f715 Dragan Simic 2024-07-21   518  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   519  		cpu = <&cpu_b0>;
296602b8e5f715 Dragan Simic 2024-07-21   520  	};
296602b8e5f715 Dragan Simic 2024-07-21   521  
296602b8e5f715 Dragan Simic 2024-07-21   522  	debug@fe710000 {
296602b8e5f715 Dragan Simic 2024-07-21   523  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21   524  		reg = <0 0xfe710000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   525  		clocks = <&cru PCLK_COREDBG_B>;
296602b8e5f715 Dragan Simic 2024-07-21   526  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   527  		cpu = <&cpu_b1>;
296602b8e5f715 Dragan Simic 2024-07-21   528  	};
296602b8e5f715 Dragan Simic 2024-07-21   529  
296602b8e5f715 Dragan Simic 2024-07-21   530  	usbdrd3_0: usb@fe800000 {
296602b8e5f715 Dragan Simic 2024-07-21   531  		compatible = "rockchip,rk3399-dwc3";
296602b8e5f715 Dragan Simic 2024-07-21   532  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   533  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   534  		ranges;
296602b8e5f715 Dragan Simic 2024-07-21   535  		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
296602b8e5f715 Dragan Simic 2024-07-21   536  			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
296602b8e5f715 Dragan Simic 2024-07-21   537  			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
296602b8e5f715 Dragan Simic 2024-07-21   538  		clock-names = "ref_clk", "suspend_clk",
296602b8e5f715 Dragan Simic 2024-07-21   539  			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
296602b8e5f715 Dragan Simic 2024-07-21   540  			      "aclk_usb3", "grf_clk";
296602b8e5f715 Dragan Simic 2024-07-21   541  		resets = <&cru SRST_A_USB3_OTG0>;
296602b8e5f715 Dragan Simic 2024-07-21   542  		reset-names = "usb3-otg";
296602b8e5f715 Dragan Simic 2024-07-21   543  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   544  
296602b8e5f715 Dragan Simic 2024-07-21   545  		usbdrd_dwc3_0: usb@fe800000 {
296602b8e5f715 Dragan Simic 2024-07-21   546  			compatible = "snps,dwc3";
296602b8e5f715 Dragan Simic 2024-07-21   547  			reg = <0x0 0xfe800000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21   548  			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   549  			clocks = <&cru SCLK_USB3OTG0_REF>, <&cru ACLK_USB3OTG0>,
296602b8e5f715 Dragan Simic 2024-07-21   550  				 <&cru SCLK_USB3OTG0_SUSPEND>;
296602b8e5f715 Dragan Simic 2024-07-21   551  			clock-names = "ref", "bus_early", "suspend";
296602b8e5f715 Dragan Simic 2024-07-21   552  			dr_mode = "otg";
296602b8e5f715 Dragan Simic 2024-07-21   553  			phys = <&u2phy0_otg>, <&tcphy0_usb3>;
296602b8e5f715 Dragan Simic 2024-07-21   554  			phy-names = "usb2-phy", "usb3-phy";
296602b8e5f715 Dragan Simic 2024-07-21   555  			phy_type = "utmi_wide";
296602b8e5f715 Dragan Simic 2024-07-21   556  			snps,dis_enblslpm_quirk;
296602b8e5f715 Dragan Simic 2024-07-21   557  			snps,dis-u2-freeclk-exists-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   558  			snps,dis_u2_susphy_quirk;
296602b8e5f715 Dragan Simic 2024-07-21   559  			snps,dis-del-phy-power-chg-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   560  			snps,dis-tx-ipgap-linecheck-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   561  			power-domains = <&power RK3399_PD_USB3>;
296602b8e5f715 Dragan Simic 2024-07-21   562  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   563  		};
296602b8e5f715 Dragan Simic 2024-07-21   564  	};
296602b8e5f715 Dragan Simic 2024-07-21   565  
296602b8e5f715 Dragan Simic 2024-07-21   566  	usbdrd3_1: usb@fe900000 {
296602b8e5f715 Dragan Simic 2024-07-21   567  		compatible = "rockchip,rk3399-dwc3";
296602b8e5f715 Dragan Simic 2024-07-21   568  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   569  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   570  		ranges;
296602b8e5f715 Dragan Simic 2024-07-21   571  		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
296602b8e5f715 Dragan Simic 2024-07-21   572  			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
296602b8e5f715 Dragan Simic 2024-07-21   573  			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
296602b8e5f715 Dragan Simic 2024-07-21   574  		clock-names = "ref_clk", "suspend_clk",
296602b8e5f715 Dragan Simic 2024-07-21   575  			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
296602b8e5f715 Dragan Simic 2024-07-21   576  			      "aclk_usb3", "grf_clk";
296602b8e5f715 Dragan Simic 2024-07-21   577  		resets = <&cru SRST_A_USB3_OTG1>;
296602b8e5f715 Dragan Simic 2024-07-21   578  		reset-names = "usb3-otg";
296602b8e5f715 Dragan Simic 2024-07-21   579  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   580  
296602b8e5f715 Dragan Simic 2024-07-21   581  		usbdrd_dwc3_1: usb@fe900000 {
296602b8e5f715 Dragan Simic 2024-07-21   582  			compatible = "snps,dwc3";
296602b8e5f715 Dragan Simic 2024-07-21   583  			reg = <0x0 0xfe900000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21   584  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   585  			clocks = <&cru SCLK_USB3OTG1_REF>, <&cru ACLK_USB3OTG1>,
296602b8e5f715 Dragan Simic 2024-07-21   586  				 <&cru SCLK_USB3OTG1_SUSPEND>;
296602b8e5f715 Dragan Simic 2024-07-21   587  			clock-names = "ref", "bus_early", "suspend";
296602b8e5f715 Dragan Simic 2024-07-21   588  			dr_mode = "otg";
296602b8e5f715 Dragan Simic 2024-07-21   589  			phys = <&u2phy1_otg>, <&tcphy1_usb3>;
296602b8e5f715 Dragan Simic 2024-07-21   590  			phy-names = "usb2-phy", "usb3-phy";
296602b8e5f715 Dragan Simic 2024-07-21   591  			phy_type = "utmi_wide";
296602b8e5f715 Dragan Simic 2024-07-21   592  			snps,dis_enblslpm_quirk;
296602b8e5f715 Dragan Simic 2024-07-21   593  			snps,dis-u2-freeclk-exists-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   594  			snps,dis_u2_susphy_quirk;
296602b8e5f715 Dragan Simic 2024-07-21   595  			snps,dis-del-phy-power-chg-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   596  			snps,dis-tx-ipgap-linecheck-quirk;
296602b8e5f715 Dragan Simic 2024-07-21   597  			power-domains = <&power RK3399_PD_USB3>;
296602b8e5f715 Dragan Simic 2024-07-21   598  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   599  		};
296602b8e5f715 Dragan Simic 2024-07-21   600  	};
296602b8e5f715 Dragan Simic 2024-07-21   601  
296602b8e5f715 Dragan Simic 2024-07-21   602  	cdn_dp: dp@fec00000 {
296602b8e5f715 Dragan Simic 2024-07-21   603  		compatible = "rockchip,rk3399-cdn-dp";
296602b8e5f715 Dragan Simic 2024-07-21   604  		reg = <0x0 0xfec00000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21   605  		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   606  		assigned-clocks = <&cru SCLK_DP_CORE>, <&cru SCLK_SPDIF_REC_DPTX>;
296602b8e5f715 Dragan Simic 2024-07-21   607  		assigned-clock-rates = <100000000>, <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   608  		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
296602b8e5f715 Dragan Simic 2024-07-21   609  			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
296602b8e5f715 Dragan Simic 2024-07-21   610  		clock-names = "core-clk", "pclk", "spdif", "grf";
296602b8e5f715 Dragan Simic 2024-07-21   611  		phys = <&tcphy0_dp>, <&tcphy1_dp>;
296602b8e5f715 Dragan Simic 2024-07-21   612  		power-domains = <&power RK3399_PD_HDCP>;
296602b8e5f715 Dragan Simic 2024-07-21   613  		resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
296602b8e5f715 Dragan Simic 2024-07-21   614  			 <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
296602b8e5f715 Dragan Simic 2024-07-21   615  		reset-names = "spdif", "dptx", "apb", "core";
296602b8e5f715 Dragan Simic 2024-07-21   616  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21   617  		#sound-dai-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   618  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   619  
296602b8e5f715 Dragan Simic 2024-07-21   620  		ports {
296602b8e5f715 Dragan Simic 2024-07-21   621  			dp_in: port {
296602b8e5f715 Dragan Simic 2024-07-21   622  				#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   623  				#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   624  
296602b8e5f715 Dragan Simic 2024-07-21   625  				dp_in_vopb: endpoint@0 {
296602b8e5f715 Dragan Simic 2024-07-21   626  					reg = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   627  					remote-endpoint = <&vopb_out_dp>;
296602b8e5f715 Dragan Simic 2024-07-21   628  				};
296602b8e5f715 Dragan Simic 2024-07-21   629  
296602b8e5f715 Dragan Simic 2024-07-21   630  				dp_in_vopl: endpoint@1 {
296602b8e5f715 Dragan Simic 2024-07-21   631  					reg = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   632  					remote-endpoint = <&vopl_out_dp>;
296602b8e5f715 Dragan Simic 2024-07-21   633  				};
296602b8e5f715 Dragan Simic 2024-07-21   634  			};
296602b8e5f715 Dragan Simic 2024-07-21   635  		};
296602b8e5f715 Dragan Simic 2024-07-21   636  	};
296602b8e5f715 Dragan Simic 2024-07-21   637  
296602b8e5f715 Dragan Simic 2024-07-21   638  	gic: interrupt-controller@fee00000 {
296602b8e5f715 Dragan Simic 2024-07-21   639  		compatible = "arm,gic-v3";
296602b8e5f715 Dragan Simic 2024-07-21   640  		#interrupt-cells = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   641  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   642  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   643  		ranges;
296602b8e5f715 Dragan Simic 2024-07-21   644  		interrupt-controller;
296602b8e5f715 Dragan Simic 2024-07-21   645  
296602b8e5f715 Dragan Simic 2024-07-21   646  		reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
296602b8e5f715 Dragan Simic 2024-07-21   647  		      <0x0 0xfef00000 0 0xc0000>, /* GICR */
296602b8e5f715 Dragan Simic 2024-07-21   648  		      <0x0 0xfff00000 0 0x10000>, /* GICC */
296602b8e5f715 Dragan Simic 2024-07-21   649  		      <0x0 0xfff10000 0 0x10000>, /* GICH */
296602b8e5f715 Dragan Simic 2024-07-21   650  		      <0x0 0xfff20000 0 0x10000>; /* GICV */
296602b8e5f715 Dragan Simic 2024-07-21   651  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   652  		its: msi-controller@fee20000 {
296602b8e5f715 Dragan Simic 2024-07-21   653  			compatible = "arm,gic-v3-its";
296602b8e5f715 Dragan Simic 2024-07-21   654  			msi-controller;
296602b8e5f715 Dragan Simic 2024-07-21   655  			#msi-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   656  			reg = <0x0 0xfee20000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21   657  		};
296602b8e5f715 Dragan Simic 2024-07-21   658  
296602b8e5f715 Dragan Simic 2024-07-21   659  		ppi-partitions {
296602b8e5f715 Dragan Simic 2024-07-21   660  			ppi_cluster0: interrupt-partition-0 {
296602b8e5f715 Dragan Simic 2024-07-21   661  				affinity = <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
296602b8e5f715 Dragan Simic 2024-07-21   662  			};
296602b8e5f715 Dragan Simic 2024-07-21   663  
296602b8e5f715 Dragan Simic 2024-07-21   664  			ppi_cluster1: interrupt-partition-1 {
296602b8e5f715 Dragan Simic 2024-07-21   665  				affinity = <&cpu_b0 &cpu_b1>;
296602b8e5f715 Dragan Simic 2024-07-21   666  			};
296602b8e5f715 Dragan Simic 2024-07-21   667  		};
296602b8e5f715 Dragan Simic 2024-07-21   668  	};
296602b8e5f715 Dragan Simic 2024-07-21   669  
296602b8e5f715 Dragan Simic 2024-07-21   670  	saradc: saradc@ff100000 {
296602b8e5f715 Dragan Simic 2024-07-21   671  		compatible = "rockchip,rk3399-saradc";
296602b8e5f715 Dragan Simic 2024-07-21   672  		reg = <0x0 0xff100000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   673  		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   674  		#io-channel-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   675  		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
296602b8e5f715 Dragan Simic 2024-07-21   676  		clock-names = "saradc", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   677  		resets = <&cru SRST_P_SARADC>;
296602b8e5f715 Dragan Simic 2024-07-21   678  		reset-names = "saradc-apb";
296602b8e5f715 Dragan Simic 2024-07-21   679  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   680  	};
296602b8e5f715 Dragan Simic 2024-07-21   681  
296602b8e5f715 Dragan Simic 2024-07-21   682  	crypto0: crypto@ff8b0000 {
296602b8e5f715 Dragan Simic 2024-07-21   683  		compatible = "rockchip,rk3399-crypto";
296602b8e5f715 Dragan Simic 2024-07-21   684  		reg = <0x0 0xff8b0000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21   685  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   686  		clocks = <&cru HCLK_M_CRYPTO0>, <&cru HCLK_S_CRYPTO0>, <&cru SCLK_CRYPTO0>;
296602b8e5f715 Dragan Simic 2024-07-21   687  		clock-names = "hclk_master", "hclk_slave", "sclk";
296602b8e5f715 Dragan Simic 2024-07-21   688  		resets = <&cru SRST_CRYPTO0>, <&cru SRST_CRYPTO0_S>, <&cru SRST_CRYPTO0_M>;
296602b8e5f715 Dragan Simic 2024-07-21   689  		reset-names = "master", "slave", "crypto-rst";
296602b8e5f715 Dragan Simic 2024-07-21   690  	};
296602b8e5f715 Dragan Simic 2024-07-21   691  
296602b8e5f715 Dragan Simic 2024-07-21   692  	crypto1: crypto@ff8b8000 {
296602b8e5f715 Dragan Simic 2024-07-21   693  		compatible = "rockchip,rk3399-crypto";
296602b8e5f715 Dragan Simic 2024-07-21   694  		reg = <0x0 0xff8b8000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21   695  		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   696  		clocks = <&cru HCLK_M_CRYPTO1>, <&cru HCLK_S_CRYPTO1>, <&cru SCLK_CRYPTO1>;
296602b8e5f715 Dragan Simic 2024-07-21   697  		clock-names = "hclk_master", "hclk_slave", "sclk";
296602b8e5f715 Dragan Simic 2024-07-21   698  		resets = <&cru SRST_CRYPTO1>, <&cru SRST_CRYPTO1_S>, <&cru SRST_CRYPTO1_M>;
296602b8e5f715 Dragan Simic 2024-07-21   699  		reset-names = "master", "slave", "crypto-rst";
296602b8e5f715 Dragan Simic 2024-07-21   700  	};
296602b8e5f715 Dragan Simic 2024-07-21   701  
296602b8e5f715 Dragan Simic 2024-07-21   702  	i2c1: i2c@ff110000 {
296602b8e5f715 Dragan Simic 2024-07-21   703  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   704  		reg = <0x0 0xff110000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   705  		assigned-clocks = <&cru SCLK_I2C1>;
296602b8e5f715 Dragan Simic 2024-07-21   706  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   707  		clocks = <&cru SCLK_I2C1>, <&cru PCLK_I2C1>;
296602b8e5f715 Dragan Simic 2024-07-21   708  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   709  		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   710  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   711  		pinctrl-0 = <&i2c1_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   712  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   713  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   714  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   715  	};
296602b8e5f715 Dragan Simic 2024-07-21   716  
296602b8e5f715 Dragan Simic 2024-07-21   717  	i2c2: i2c@ff120000 {
296602b8e5f715 Dragan Simic 2024-07-21   718  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   719  		reg = <0x0 0xff120000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   720  		assigned-clocks = <&cru SCLK_I2C2>;
296602b8e5f715 Dragan Simic 2024-07-21   721  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   722  		clocks = <&cru SCLK_I2C2>, <&cru PCLK_I2C2>;
296602b8e5f715 Dragan Simic 2024-07-21   723  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   724  		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   725  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   726  		pinctrl-0 = <&i2c2_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   727  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   728  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   729  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   730  	};
296602b8e5f715 Dragan Simic 2024-07-21   731  
296602b8e5f715 Dragan Simic 2024-07-21   732  	i2c3: i2c@ff130000 {
296602b8e5f715 Dragan Simic 2024-07-21   733  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   734  		reg = <0x0 0xff130000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   735  		assigned-clocks = <&cru SCLK_I2C3>;
296602b8e5f715 Dragan Simic 2024-07-21   736  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   737  		clocks = <&cru SCLK_I2C3>, <&cru PCLK_I2C3>;
296602b8e5f715 Dragan Simic 2024-07-21   738  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   739  		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   740  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   741  		pinctrl-0 = <&i2c3_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   742  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   743  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   744  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   745  	};
296602b8e5f715 Dragan Simic 2024-07-21   746  
296602b8e5f715 Dragan Simic 2024-07-21   747  	i2c5: i2c@ff140000 {
296602b8e5f715 Dragan Simic 2024-07-21   748  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   749  		reg = <0x0 0xff140000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   750  		assigned-clocks = <&cru SCLK_I2C5>;
296602b8e5f715 Dragan Simic 2024-07-21   751  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   752  		clocks = <&cru SCLK_I2C5>, <&cru PCLK_I2C5>;
296602b8e5f715 Dragan Simic 2024-07-21   753  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   754  		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   755  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   756  		pinctrl-0 = <&i2c5_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   757  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   758  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   759  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   760  	};
296602b8e5f715 Dragan Simic 2024-07-21   761  
296602b8e5f715 Dragan Simic 2024-07-21   762  	i2c6: i2c@ff150000 {
296602b8e5f715 Dragan Simic 2024-07-21   763  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   764  		reg = <0x0 0xff150000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   765  		assigned-clocks = <&cru SCLK_I2C6>;
296602b8e5f715 Dragan Simic 2024-07-21   766  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   767  		clocks = <&cru SCLK_I2C6>, <&cru PCLK_I2C6>;
296602b8e5f715 Dragan Simic 2024-07-21   768  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   769  		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   770  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   771  		pinctrl-0 = <&i2c6_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   772  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   773  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   774  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   775  	};
296602b8e5f715 Dragan Simic 2024-07-21   776  
296602b8e5f715 Dragan Simic 2024-07-21   777  	i2c7: i2c@ff160000 {
296602b8e5f715 Dragan Simic 2024-07-21   778  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21   779  		reg = <0x0 0xff160000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   780  		assigned-clocks = <&cru SCLK_I2C7>;
296602b8e5f715 Dragan Simic 2024-07-21   781  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21   782  		clocks = <&cru SCLK_I2C7>, <&cru PCLK_I2C7>;
296602b8e5f715 Dragan Simic 2024-07-21   783  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21   784  		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   785  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   786  		pinctrl-0 = <&i2c7_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   787  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   788  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   789  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   790  	};
296602b8e5f715 Dragan Simic 2024-07-21   791  
296602b8e5f715 Dragan Simic 2024-07-21   792  	uart0: serial@ff180000 {
296602b8e5f715 Dragan Simic 2024-07-21   793  		compatible = "rockchip,rk3399-uart", "snps,dw-apb-uart";
296602b8e5f715 Dragan Simic 2024-07-21   794  		reg = <0x0 0xff180000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   795  		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
296602b8e5f715 Dragan Simic 2024-07-21   796  		clock-names = "baudclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   797  		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   798  		reg-shift = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   799  		reg-io-width = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   800  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   801  		pinctrl-0 = <&uart0_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   802  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   803  	};
296602b8e5f715 Dragan Simic 2024-07-21   804  
296602b8e5f715 Dragan Simic 2024-07-21   805  	uart1: serial@ff190000 {
296602b8e5f715 Dragan Simic 2024-07-21   806  		compatible = "rockchip,rk3399-uart", "snps,dw-apb-uart";
296602b8e5f715 Dragan Simic 2024-07-21   807  		reg = <0x0 0xff190000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   808  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
296602b8e5f715 Dragan Simic 2024-07-21   809  		clock-names = "baudclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   810  		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   811  		reg-shift = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   812  		reg-io-width = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   813  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   814  		pinctrl-0 = <&uart1_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   815  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   816  	};
296602b8e5f715 Dragan Simic 2024-07-21   817  
296602b8e5f715 Dragan Simic 2024-07-21   818  	uart2: serial@ff1a0000 {
296602b8e5f715 Dragan Simic 2024-07-21   819  		compatible = "rockchip,rk3399-uart", "snps,dw-apb-uart";
296602b8e5f715 Dragan Simic 2024-07-21   820  		reg = <0x0 0xff1a0000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   821  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
296602b8e5f715 Dragan Simic 2024-07-21   822  		clock-names = "baudclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   823  		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   824  		reg-shift = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   825  		reg-io-width = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   826  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   827  		pinctrl-0 = <&uart2c_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   828  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   829  	};
296602b8e5f715 Dragan Simic 2024-07-21   830  
296602b8e5f715 Dragan Simic 2024-07-21   831  	uart3: serial@ff1b0000 {
296602b8e5f715 Dragan Simic 2024-07-21   832  		compatible = "rockchip,rk3399-uart", "snps,dw-apb-uart";
296602b8e5f715 Dragan Simic 2024-07-21   833  		reg = <0x0 0xff1b0000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   834  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
296602b8e5f715 Dragan Simic 2024-07-21   835  		clock-names = "baudclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   836  		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   837  		reg-shift = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   838  		reg-io-width = <4>;
296602b8e5f715 Dragan Simic 2024-07-21   839  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   840  		pinctrl-0 = <&uart3_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21   841  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   842  	};
296602b8e5f715 Dragan Simic 2024-07-21   843  
296602b8e5f715 Dragan Simic 2024-07-21   844  	spi0: spi@ff1c0000 {
296602b8e5f715 Dragan Simic 2024-07-21   845  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21   846  		reg = <0x0 0xff1c0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   847  		clocks = <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
296602b8e5f715 Dragan Simic 2024-07-21   848  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   849  		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   850  		dmas = <&dmac_peri 10>, <&dmac_peri 11>;
296602b8e5f715 Dragan Simic 2024-07-21   851  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21   852  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   853  		pinctrl-0 = <&spi0_clk &spi0_tx &spi0_rx &spi0_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21   854  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   855  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   856  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   857  	};
296602b8e5f715 Dragan Simic 2024-07-21   858  
296602b8e5f715 Dragan Simic 2024-07-21   859  	spi1: spi@ff1d0000 {
296602b8e5f715 Dragan Simic 2024-07-21   860  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21   861  		reg = <0x0 0xff1d0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   862  		clocks = <&cru SCLK_SPI1>, <&cru PCLK_SPI1>;
296602b8e5f715 Dragan Simic 2024-07-21   863  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   864  		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   865  		dmas = <&dmac_peri 12>, <&dmac_peri 13>;
296602b8e5f715 Dragan Simic 2024-07-21   866  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21   867  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   868  		pinctrl-0 = <&spi1_clk &spi1_tx &spi1_rx &spi1_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21   869  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   870  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   871  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   872  	};
296602b8e5f715 Dragan Simic 2024-07-21   873  
296602b8e5f715 Dragan Simic 2024-07-21   874  	spi2: spi@ff1e0000 {
296602b8e5f715 Dragan Simic 2024-07-21   875  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21   876  		reg = <0x0 0xff1e0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   877  		clocks = <&cru SCLK_SPI2>, <&cru PCLK_SPI2>;
296602b8e5f715 Dragan Simic 2024-07-21   878  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   879  		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   880  		dmas = <&dmac_peri 14>, <&dmac_peri 15>;
296602b8e5f715 Dragan Simic 2024-07-21   881  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21   882  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   883  		pinctrl-0 = <&spi2_clk &spi2_tx &spi2_rx &spi2_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21   884  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   885  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   886  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   887  	};
296602b8e5f715 Dragan Simic 2024-07-21   888  
296602b8e5f715 Dragan Simic 2024-07-21   889  	spi4: spi@ff1f0000 {
296602b8e5f715 Dragan Simic 2024-07-21   890  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21   891  		reg = <0x0 0xff1f0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   892  		clocks = <&cru SCLK_SPI4>, <&cru PCLK_SPI4>;
296602b8e5f715 Dragan Simic 2024-07-21   893  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   894  		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   895  		dmas = <&dmac_peri 18>, <&dmac_peri 19>;
296602b8e5f715 Dragan Simic 2024-07-21   896  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21   897  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   898  		pinctrl-0 = <&spi4_clk &spi4_tx &spi4_rx &spi4_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21   899  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   900  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   901  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   902  	};
296602b8e5f715 Dragan Simic 2024-07-21   903  
296602b8e5f715 Dragan Simic 2024-07-21   904  	spi5: spi@ff200000 {
296602b8e5f715 Dragan Simic 2024-07-21   905  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21   906  		reg = <0x0 0xff200000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21   907  		clocks = <&cru SCLK_SPI5>, <&cru PCLK_SPI5>;
296602b8e5f715 Dragan Simic 2024-07-21   908  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21   909  		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   910  		dmas = <&dmac_bus 8>, <&dmac_bus 9>;
296602b8e5f715 Dragan Simic 2024-07-21   911  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21   912  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21   913  		pinctrl-0 = <&spi5_clk &spi5_tx &spi5_rx &spi5_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21   914  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21   915  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21   916  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   917  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21   918  	};
296602b8e5f715 Dragan Simic 2024-07-21   919  
296602b8e5f715 Dragan Simic 2024-07-21   920  	thermal_zones: thermal-zones {
296602b8e5f715 Dragan Simic 2024-07-21   921  		cpu_thermal: cpu-thermal {
296602b8e5f715 Dragan Simic 2024-07-21   922  			polling-delay-passive = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   923  			polling-delay = <1000>;
296602b8e5f715 Dragan Simic 2024-07-21   924  
296602b8e5f715 Dragan Simic 2024-07-21   925  			thermal-sensors = <&tsadc 0>;
296602b8e5f715 Dragan Simic 2024-07-21   926  
296602b8e5f715 Dragan Simic 2024-07-21   927  			trips {
296602b8e5f715 Dragan Simic 2024-07-21   928  				cpu_alert0: cpu_alert0 {
296602b8e5f715 Dragan Simic 2024-07-21   929  					temperature = <70000>;
296602b8e5f715 Dragan Simic 2024-07-21   930  					hysteresis = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   931  					type = "passive";
296602b8e5f715 Dragan Simic 2024-07-21   932  				};
296602b8e5f715 Dragan Simic 2024-07-21   933  				cpu_alert1: cpu_alert1 {
296602b8e5f715 Dragan Simic 2024-07-21   934  					temperature = <75000>;
296602b8e5f715 Dragan Simic 2024-07-21   935  					hysteresis = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   936  					type = "passive";
296602b8e5f715 Dragan Simic 2024-07-21   937  				};
296602b8e5f715 Dragan Simic 2024-07-21   938  				cpu_crit: cpu_crit {
296602b8e5f715 Dragan Simic 2024-07-21   939  					temperature = <95000>;
296602b8e5f715 Dragan Simic 2024-07-21   940  					hysteresis = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   941  					type = "critical";
296602b8e5f715 Dragan Simic 2024-07-21   942  				};
296602b8e5f715 Dragan Simic 2024-07-21   943  			};
296602b8e5f715 Dragan Simic 2024-07-21   944  
296602b8e5f715 Dragan Simic 2024-07-21   945  			cooling-maps {
296602b8e5f715 Dragan Simic 2024-07-21   946  				map0 {
296602b8e5f715 Dragan Simic 2024-07-21   947  					trip = <&cpu_alert0>;
296602b8e5f715 Dragan Simic 2024-07-21   948  					cooling-device =
296602b8e5f715 Dragan Simic 2024-07-21   949  						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   950  						<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
296602b8e5f715 Dragan Simic 2024-07-21   951  				};
296602b8e5f715 Dragan Simic 2024-07-21   952  				map1 {
296602b8e5f715 Dragan Simic 2024-07-21   953  					trip = <&cpu_alert1>;
296602b8e5f715 Dragan Simic 2024-07-21   954  					cooling-device =
296602b8e5f715 Dragan Simic 2024-07-21   955  						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   956  						<&cpu_l1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   957  						<&cpu_l2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   958  						<&cpu_l3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   959  						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
296602b8e5f715 Dragan Simic 2024-07-21   960  						<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
296602b8e5f715 Dragan Simic 2024-07-21   961  				};
296602b8e5f715 Dragan Simic 2024-07-21   962  			};
296602b8e5f715 Dragan Simic 2024-07-21   963  		};
296602b8e5f715 Dragan Simic 2024-07-21   964  
296602b8e5f715 Dragan Simic 2024-07-21   965  		gpu_thermal: gpu-thermal {
296602b8e5f715 Dragan Simic 2024-07-21   966  			polling-delay-passive = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   967  			polling-delay = <1000>;
296602b8e5f715 Dragan Simic 2024-07-21   968  
296602b8e5f715 Dragan Simic 2024-07-21   969  			thermal-sensors = <&tsadc 1>;
296602b8e5f715 Dragan Simic 2024-07-21   970  
296602b8e5f715 Dragan Simic 2024-07-21   971  			trips {
296602b8e5f715 Dragan Simic 2024-07-21   972  				gpu_alert0: gpu_alert0 {
296602b8e5f715 Dragan Simic 2024-07-21   973  					temperature = <75000>;
296602b8e5f715 Dragan Simic 2024-07-21   974  					hysteresis = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   975  					type = "passive";
296602b8e5f715 Dragan Simic 2024-07-21   976  				};
296602b8e5f715 Dragan Simic 2024-07-21   977  				gpu_crit: gpu_crit {
296602b8e5f715 Dragan Simic 2024-07-21   978  					temperature = <95000>;
296602b8e5f715 Dragan Simic 2024-07-21   979  					hysteresis = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21   980  					type = "critical";
296602b8e5f715 Dragan Simic 2024-07-21   981  				};
296602b8e5f715 Dragan Simic 2024-07-21   982  			};
296602b8e5f715 Dragan Simic 2024-07-21   983  
296602b8e5f715 Dragan Simic 2024-07-21   984  			cooling-maps {
296602b8e5f715 Dragan Simic 2024-07-21   985  				map0 {
296602b8e5f715 Dragan Simic 2024-07-21   986  					trip = <&gpu_alert0>;
296602b8e5f715 Dragan Simic 2024-07-21   987  					cooling-device =
296602b8e5f715 Dragan Simic 2024-07-21   988  						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
296602b8e5f715 Dragan Simic 2024-07-21   989  				};
296602b8e5f715 Dragan Simic 2024-07-21   990  			};
296602b8e5f715 Dragan Simic 2024-07-21   991  		};
296602b8e5f715 Dragan Simic 2024-07-21   992  	};
296602b8e5f715 Dragan Simic 2024-07-21   993  
296602b8e5f715 Dragan Simic 2024-07-21   994  	tsadc: tsadc@ff260000 {
296602b8e5f715 Dragan Simic 2024-07-21   995  		compatible = "rockchip,rk3399-tsadc";
296602b8e5f715 Dragan Simic 2024-07-21   996  		reg = <0x0 0xff260000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21   997  		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21   998  		assigned-clocks = <&cru SCLK_TSADC>;
296602b8e5f715 Dragan Simic 2024-07-21   999  		assigned-clock-rates = <750000>;
296602b8e5f715 Dragan Simic 2024-07-21  1000  		clocks = <&cru SCLK_TSADC>, <&cru PCLK_TSADC>;
296602b8e5f715 Dragan Simic 2024-07-21  1001  		clock-names = "tsadc", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1002  		resets = <&cru SRST_TSADC>;
296602b8e5f715 Dragan Simic 2024-07-21  1003  		reset-names = "tsadc-apb";
296602b8e5f715 Dragan Simic 2024-07-21  1004  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  1005  		rockchip,hw-tshut-temp = <95000>;
296602b8e5f715 Dragan Simic 2024-07-21  1006  		pinctrl-names = "init", "default", "sleep";
296602b8e5f715 Dragan Simic 2024-07-21  1007  		pinctrl-0 = <&otp_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1008  		pinctrl-1 = <&otp_out>;
296602b8e5f715 Dragan Simic 2024-07-21  1009  		pinctrl-2 = <&otp_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1010  		#thermal-sensor-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1011  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1012  	};
296602b8e5f715 Dragan Simic 2024-07-21  1013  
296602b8e5f715 Dragan Simic 2024-07-21  1014  	qos_emmc: qos@ffa58000 {
296602b8e5f715 Dragan Simic 2024-07-21  1015  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1016  		reg = <0x0 0xffa58000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1017  	};
296602b8e5f715 Dragan Simic 2024-07-21  1018  
296602b8e5f715 Dragan Simic 2024-07-21  1019  	qos_gmac: qos@ffa5c000 {
296602b8e5f715 Dragan Simic 2024-07-21  1020  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1021  		reg = <0x0 0xffa5c000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1022  	};
296602b8e5f715 Dragan Simic 2024-07-21  1023  
296602b8e5f715 Dragan Simic 2024-07-21  1024  	qos_pcie: qos@ffa60080 {
296602b8e5f715 Dragan Simic 2024-07-21  1025  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1026  		reg = <0x0 0xffa60080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1027  	};
296602b8e5f715 Dragan Simic 2024-07-21  1028  
296602b8e5f715 Dragan Simic 2024-07-21  1029  	qos_usb_host0: qos@ffa60100 {
296602b8e5f715 Dragan Simic 2024-07-21  1030  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1031  		reg = <0x0 0xffa60100 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1032  	};
296602b8e5f715 Dragan Simic 2024-07-21  1033  
296602b8e5f715 Dragan Simic 2024-07-21  1034  	qos_usb_host1: qos@ffa60180 {
296602b8e5f715 Dragan Simic 2024-07-21  1035  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1036  		reg = <0x0 0xffa60180 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1037  	};
296602b8e5f715 Dragan Simic 2024-07-21  1038  
296602b8e5f715 Dragan Simic 2024-07-21  1039  	qos_usb_otg0: qos@ffa70000 {
296602b8e5f715 Dragan Simic 2024-07-21  1040  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1041  		reg = <0x0 0xffa70000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1042  	};
296602b8e5f715 Dragan Simic 2024-07-21  1043  
296602b8e5f715 Dragan Simic 2024-07-21  1044  	qos_usb_otg1: qos@ffa70080 {
296602b8e5f715 Dragan Simic 2024-07-21  1045  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1046  		reg = <0x0 0xffa70080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1047  	};
296602b8e5f715 Dragan Simic 2024-07-21  1048  
296602b8e5f715 Dragan Simic 2024-07-21  1049  	qos_sd: qos@ffa74000 {
296602b8e5f715 Dragan Simic 2024-07-21  1050  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1051  		reg = <0x0 0xffa74000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1052  	};
296602b8e5f715 Dragan Simic 2024-07-21  1053  
296602b8e5f715 Dragan Simic 2024-07-21  1054  	qos_sdioaudio: qos@ffa76000 {
296602b8e5f715 Dragan Simic 2024-07-21  1055  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1056  		reg = <0x0 0xffa76000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1057  	};
296602b8e5f715 Dragan Simic 2024-07-21  1058  
296602b8e5f715 Dragan Simic 2024-07-21  1059  	qos_hdcp: qos@ffa90000 {
296602b8e5f715 Dragan Simic 2024-07-21  1060  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1061  		reg = <0x0 0xffa90000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1062  	};
296602b8e5f715 Dragan Simic 2024-07-21  1063  
296602b8e5f715 Dragan Simic 2024-07-21  1064  	qos_iep: qos@ffa98000 {
296602b8e5f715 Dragan Simic 2024-07-21  1065  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1066  		reg = <0x0 0xffa98000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1067  	};
296602b8e5f715 Dragan Simic 2024-07-21  1068  
296602b8e5f715 Dragan Simic 2024-07-21  1069  	qos_isp0_m0: qos@ffaa0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1070  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1071  		reg = <0x0 0xffaa0000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1072  	};
296602b8e5f715 Dragan Simic 2024-07-21  1073  
296602b8e5f715 Dragan Simic 2024-07-21  1074  	qos_isp0_m1: qos@ffaa0080 {
296602b8e5f715 Dragan Simic 2024-07-21  1075  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1076  		reg = <0x0 0xffaa0080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1077  	};
296602b8e5f715 Dragan Simic 2024-07-21  1078  
296602b8e5f715 Dragan Simic 2024-07-21  1079  	qos_isp1_m0: qos@ffaa8000 {
296602b8e5f715 Dragan Simic 2024-07-21  1080  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1081  		reg = <0x0 0xffaa8000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1082  	};
296602b8e5f715 Dragan Simic 2024-07-21  1083  
296602b8e5f715 Dragan Simic 2024-07-21  1084  	qos_isp1_m1: qos@ffaa8080 {
296602b8e5f715 Dragan Simic 2024-07-21  1085  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1086  		reg = <0x0 0xffaa8080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1087  	};
296602b8e5f715 Dragan Simic 2024-07-21  1088  
296602b8e5f715 Dragan Simic 2024-07-21  1089  	qos_rga_r: qos@ffab0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1090  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1091  		reg = <0x0 0xffab0000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1092  	};
296602b8e5f715 Dragan Simic 2024-07-21  1093  
296602b8e5f715 Dragan Simic 2024-07-21  1094  	qos_rga_w: qos@ffab0080 {
296602b8e5f715 Dragan Simic 2024-07-21  1095  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1096  		reg = <0x0 0xffab0080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1097  	};
296602b8e5f715 Dragan Simic 2024-07-21  1098  
296602b8e5f715 Dragan Simic 2024-07-21  1099  	qos_video_m0: qos@ffab8000 {
296602b8e5f715 Dragan Simic 2024-07-21  1100  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1101  		reg = <0x0 0xffab8000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1102  	};
296602b8e5f715 Dragan Simic 2024-07-21  1103  
296602b8e5f715 Dragan Simic 2024-07-21  1104  	qos_video_m1_r: qos@ffac0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1105  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1106  		reg = <0x0 0xffac0000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1107  	};
296602b8e5f715 Dragan Simic 2024-07-21  1108  
296602b8e5f715 Dragan Simic 2024-07-21  1109  	qos_video_m1_w: qos@ffac0080 {
296602b8e5f715 Dragan Simic 2024-07-21  1110  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1111  		reg = <0x0 0xffac0080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1112  	};
296602b8e5f715 Dragan Simic 2024-07-21  1113  
296602b8e5f715 Dragan Simic 2024-07-21  1114  	qos_vop_big_r: qos@ffac8000 {
296602b8e5f715 Dragan Simic 2024-07-21  1115  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1116  		reg = <0x0 0xffac8000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1117  	};
296602b8e5f715 Dragan Simic 2024-07-21  1118  
296602b8e5f715 Dragan Simic 2024-07-21  1119  	qos_vop_big_w: qos@ffac8080 {
296602b8e5f715 Dragan Simic 2024-07-21  1120  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1121  		reg = <0x0 0xffac8080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1122  	};
296602b8e5f715 Dragan Simic 2024-07-21  1123  
296602b8e5f715 Dragan Simic 2024-07-21  1124  	qos_vop_little: qos@ffad0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1125  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1126  		reg = <0x0 0xffad0000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1127  	};
296602b8e5f715 Dragan Simic 2024-07-21  1128  
296602b8e5f715 Dragan Simic 2024-07-21  1129  	qos_perihp: qos@ffad8080 {
296602b8e5f715 Dragan Simic 2024-07-21  1130  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1131  		reg = <0x0 0xffad8080 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1132  	};
296602b8e5f715 Dragan Simic 2024-07-21  1133  
296602b8e5f715 Dragan Simic 2024-07-21  1134  	qos_gpu: qos@ffae0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1135  		compatible = "rockchip,rk3399-qos", "syscon";
296602b8e5f715 Dragan Simic 2024-07-21  1136  		reg = <0x0 0xffae0000 0x0 0x20>;
296602b8e5f715 Dragan Simic 2024-07-21  1137  	};
296602b8e5f715 Dragan Simic 2024-07-21  1138  
296602b8e5f715 Dragan Simic 2024-07-21  1139  	pmu: power-management@ff310000 {
296602b8e5f715 Dragan Simic 2024-07-21  1140  		compatible = "rockchip,rk3399-pmu", "syscon", "simple-mfd";
296602b8e5f715 Dragan Simic 2024-07-21  1141  		reg = <0x0 0xff310000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1142  
296602b8e5f715 Dragan Simic 2024-07-21  1143  		/*
296602b8e5f715 Dragan Simic 2024-07-21  1144  		 * Note: RK3399 supports 6 voltage domains including VD_CORE_L,
296602b8e5f715 Dragan Simic 2024-07-21  1145  		 * VD_CORE_B, VD_CENTER, VD_GPU, VD_LOGIC and VD_PMU.
296602b8e5f715 Dragan Simic 2024-07-21  1146  		 * Some of the power domains are grouped together for every
296602b8e5f715 Dragan Simic 2024-07-21  1147  		 * voltage domain.
296602b8e5f715 Dragan Simic 2024-07-21  1148  		 * The detail contents as below.
296602b8e5f715 Dragan Simic 2024-07-21  1149  		 */
296602b8e5f715 Dragan Simic 2024-07-21  1150  		power: power-controller {
296602b8e5f715 Dragan Simic 2024-07-21  1151  			compatible = "rockchip,rk3399-power-controller";
296602b8e5f715 Dragan Simic 2024-07-21  1152  			#power-domain-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1153  			#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1154  			#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1155  
296602b8e5f715 Dragan Simic 2024-07-21  1156  			/* These power domains are grouped by VD_CENTER */
296602b8e5f715 Dragan Simic 2024-07-21  1157  			power-domain@RK3399_PD_IEP {
296602b8e5f715 Dragan Simic 2024-07-21  1158  				reg = <RK3399_PD_IEP>;
296602b8e5f715 Dragan Simic 2024-07-21  1159  				clocks = <&cru ACLK_IEP>,
296602b8e5f715 Dragan Simic 2024-07-21  1160  					 <&cru HCLK_IEP>;
296602b8e5f715 Dragan Simic 2024-07-21  1161  				pm_qos = <&qos_iep>;
296602b8e5f715 Dragan Simic 2024-07-21  1162  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1163  			};
296602b8e5f715 Dragan Simic 2024-07-21  1164  			power-domain@RK3399_PD_RGA {
296602b8e5f715 Dragan Simic 2024-07-21  1165  				reg = <RK3399_PD_RGA>;
296602b8e5f715 Dragan Simic 2024-07-21  1166  				clocks = <&cru ACLK_RGA>,
296602b8e5f715 Dragan Simic 2024-07-21  1167  					 <&cru HCLK_RGA>;
296602b8e5f715 Dragan Simic 2024-07-21  1168  				pm_qos = <&qos_rga_r>,
296602b8e5f715 Dragan Simic 2024-07-21  1169  					 <&qos_rga_w>;
296602b8e5f715 Dragan Simic 2024-07-21  1170  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1171  			};
296602b8e5f715 Dragan Simic 2024-07-21  1172  			power-domain@RK3399_PD_VCODEC {
296602b8e5f715 Dragan Simic 2024-07-21  1173  				reg = <RK3399_PD_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1174  				clocks = <&cru ACLK_VCODEC>,
296602b8e5f715 Dragan Simic 2024-07-21  1175  					 <&cru HCLK_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1176  				pm_qos = <&qos_video_m0>;
296602b8e5f715 Dragan Simic 2024-07-21  1177  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1178  			};
296602b8e5f715 Dragan Simic 2024-07-21  1179  			power-domain@RK3399_PD_VDU {
296602b8e5f715 Dragan Simic 2024-07-21  1180  				reg = <RK3399_PD_VDU>;
296602b8e5f715 Dragan Simic 2024-07-21  1181  				clocks = <&cru ACLK_VDU>,
296602b8e5f715 Dragan Simic 2024-07-21  1182  					 <&cru HCLK_VDU>,
296602b8e5f715 Dragan Simic 2024-07-21  1183  					 <&cru SCLK_VDU_CA>,
296602b8e5f715 Dragan Simic 2024-07-21  1184  					 <&cru SCLK_VDU_CORE>;
296602b8e5f715 Dragan Simic 2024-07-21  1185  				pm_qos = <&qos_video_m1_r>,
296602b8e5f715 Dragan Simic 2024-07-21  1186  					 <&qos_video_m1_w>;
296602b8e5f715 Dragan Simic 2024-07-21  1187  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1188  			};
296602b8e5f715 Dragan Simic 2024-07-21  1189  
296602b8e5f715 Dragan Simic 2024-07-21  1190  			/* These power domains are grouped by VD_GPU */
296602b8e5f715 Dragan Simic 2024-07-21  1191  			power-domain@RK3399_PD_GPU {
296602b8e5f715 Dragan Simic 2024-07-21  1192  				reg = <RK3399_PD_GPU>;
296602b8e5f715 Dragan Simic 2024-07-21  1193  				clocks = <&cru ACLK_GPU>;
296602b8e5f715 Dragan Simic 2024-07-21  1194  				pm_qos = <&qos_gpu>;
296602b8e5f715 Dragan Simic 2024-07-21  1195  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1196  			};
296602b8e5f715 Dragan Simic 2024-07-21  1197  
296602b8e5f715 Dragan Simic 2024-07-21  1198  			/* These power domains are grouped by VD_LOGIC */
296602b8e5f715 Dragan Simic 2024-07-21  1199  			power-domain@RK3399_PD_EDP {
296602b8e5f715 Dragan Simic 2024-07-21  1200  				reg = <RK3399_PD_EDP>;
296602b8e5f715 Dragan Simic 2024-07-21  1201  				clocks = <&cru PCLK_EDP_CTRL>;
296602b8e5f715 Dragan Simic 2024-07-21  1202  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1203  			};
296602b8e5f715 Dragan Simic 2024-07-21  1204  			power-domain@RK3399_PD_EMMC {
296602b8e5f715 Dragan Simic 2024-07-21  1205  				reg = <RK3399_PD_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  1206  				clocks = <&cru ACLK_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  1207  				pm_qos = <&qos_emmc>;
296602b8e5f715 Dragan Simic 2024-07-21  1208  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1209  			};
296602b8e5f715 Dragan Simic 2024-07-21  1210  			power-domain@RK3399_PD_GMAC {
296602b8e5f715 Dragan Simic 2024-07-21  1211  				reg = <RK3399_PD_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21  1212  				clocks = <&cru ACLK_GMAC>,
296602b8e5f715 Dragan Simic 2024-07-21  1213  					 <&cru PCLK_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21  1214  				pm_qos = <&qos_gmac>;
296602b8e5f715 Dragan Simic 2024-07-21  1215  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1216  			};
296602b8e5f715 Dragan Simic 2024-07-21  1217  			power-domain@RK3399_PD_SD {
296602b8e5f715 Dragan Simic 2024-07-21  1218  				reg = <RK3399_PD_SD>;
296602b8e5f715 Dragan Simic 2024-07-21  1219  				clocks = <&cru HCLK_SDMMC>,
296602b8e5f715 Dragan Simic 2024-07-21  1220  					 <&cru SCLK_SDMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  1221  				pm_qos = <&qos_sd>;
296602b8e5f715 Dragan Simic 2024-07-21  1222  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1223  			};
296602b8e5f715 Dragan Simic 2024-07-21  1224  			power-domain@RK3399_PD_SDIOAUDIO {
296602b8e5f715 Dragan Simic 2024-07-21  1225  				reg = <RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1226  				clocks = <&cru HCLK_SDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1227  				pm_qos = <&qos_sdioaudio>;
296602b8e5f715 Dragan Simic 2024-07-21  1228  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1229  			};
296602b8e5f715 Dragan Simic 2024-07-21  1230  			power-domain@RK3399_PD_TCPD0 {
296602b8e5f715 Dragan Simic 2024-07-21  1231  				reg = <RK3399_PD_TCPD0>;
296602b8e5f715 Dragan Simic 2024-07-21  1232  				clocks = <&cru SCLK_UPHY0_TCPDCORE>,
296602b8e5f715 Dragan Simic 2024-07-21  1233  					 <&cru SCLK_UPHY0_TCPDPHY_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1234  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1235  			};
296602b8e5f715 Dragan Simic 2024-07-21  1236  			power-domain@RK3399_PD_TCPD1 {
296602b8e5f715 Dragan Simic 2024-07-21  1237  				reg = <RK3399_PD_TCPD1>;
296602b8e5f715 Dragan Simic 2024-07-21  1238  				clocks = <&cru SCLK_UPHY1_TCPDCORE>,
296602b8e5f715 Dragan Simic 2024-07-21  1239  					 <&cru SCLK_UPHY1_TCPDPHY_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1240  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1241  			};
296602b8e5f715 Dragan Simic 2024-07-21  1242  			power-domain@RK3399_PD_USB3 {
296602b8e5f715 Dragan Simic 2024-07-21  1243  				reg = <RK3399_PD_USB3>;
296602b8e5f715 Dragan Simic 2024-07-21  1244  				clocks = <&cru ACLK_USB3>;
296602b8e5f715 Dragan Simic 2024-07-21  1245  				pm_qos = <&qos_usb_otg0>,
296602b8e5f715 Dragan Simic 2024-07-21  1246  					 <&qos_usb_otg1>;
296602b8e5f715 Dragan Simic 2024-07-21  1247  				#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1248  			};
296602b8e5f715 Dragan Simic 2024-07-21  1249  			power-domain@RK3399_PD_VIO {
296602b8e5f715 Dragan Simic 2024-07-21  1250  				reg = <RK3399_PD_VIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1251  				#power-domain-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1252  				#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1253  				#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1254  
296602b8e5f715 Dragan Simic 2024-07-21  1255  				power-domain@RK3399_PD_HDCP {
296602b8e5f715 Dragan Simic 2024-07-21  1256  					reg = <RK3399_PD_HDCP>;
296602b8e5f715 Dragan Simic 2024-07-21  1257  					clocks = <&cru ACLK_HDCP>,
296602b8e5f715 Dragan Simic 2024-07-21  1258  						 <&cru HCLK_HDCP>,
296602b8e5f715 Dragan Simic 2024-07-21  1259  						 <&cru PCLK_HDCP>;
296602b8e5f715 Dragan Simic 2024-07-21  1260  					pm_qos = <&qos_hdcp>;
296602b8e5f715 Dragan Simic 2024-07-21  1261  					#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1262  				};
296602b8e5f715 Dragan Simic 2024-07-21  1263  				power-domain@RK3399_PD_ISP0 {
296602b8e5f715 Dragan Simic 2024-07-21  1264  					reg = <RK3399_PD_ISP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1265  					clocks = <&cru ACLK_ISP0>,
296602b8e5f715 Dragan Simic 2024-07-21  1266  						 <&cru HCLK_ISP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1267  					pm_qos = <&qos_isp0_m0>,
296602b8e5f715 Dragan Simic 2024-07-21  1268  						 <&qos_isp0_m1>;
296602b8e5f715 Dragan Simic 2024-07-21  1269  					#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1270  				};
296602b8e5f715 Dragan Simic 2024-07-21  1271  				power-domain@RK3399_PD_ISP1 {
296602b8e5f715 Dragan Simic 2024-07-21  1272  					reg = <RK3399_PD_ISP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1273  					clocks = <&cru ACLK_ISP1>,
296602b8e5f715 Dragan Simic 2024-07-21  1274  						 <&cru HCLK_ISP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1275  					pm_qos = <&qos_isp1_m0>,
296602b8e5f715 Dragan Simic 2024-07-21  1276  						 <&qos_isp1_m1>;
296602b8e5f715 Dragan Simic 2024-07-21  1277  					#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1278  				};
296602b8e5f715 Dragan Simic 2024-07-21  1279  				power-domain@RK3399_PD_VO {
296602b8e5f715 Dragan Simic 2024-07-21  1280  					reg = <RK3399_PD_VO>;
296602b8e5f715 Dragan Simic 2024-07-21  1281  					#power-domain-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1282  					#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1283  					#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1284  
296602b8e5f715 Dragan Simic 2024-07-21  1285  					power-domain@RK3399_PD_VOPB {
296602b8e5f715 Dragan Simic 2024-07-21  1286  						reg = <RK3399_PD_VOPB>;
296602b8e5f715 Dragan Simic 2024-07-21  1287  						clocks = <&cru ACLK_VOP0>,
296602b8e5f715 Dragan Simic 2024-07-21  1288  							 <&cru HCLK_VOP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1289  						pm_qos = <&qos_vop_big_r>,
296602b8e5f715 Dragan Simic 2024-07-21  1290  							 <&qos_vop_big_w>;
296602b8e5f715 Dragan Simic 2024-07-21  1291  						#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1292  					};
296602b8e5f715 Dragan Simic 2024-07-21  1293  					power-domain@RK3399_PD_VOPL {
296602b8e5f715 Dragan Simic 2024-07-21  1294  						reg = <RK3399_PD_VOPL>;
296602b8e5f715 Dragan Simic 2024-07-21  1295  						clocks = <&cru ACLK_VOP1>,
296602b8e5f715 Dragan Simic 2024-07-21  1296  							 <&cru HCLK_VOP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1297  						pm_qos = <&qos_vop_little>;
296602b8e5f715 Dragan Simic 2024-07-21  1298  						#power-domain-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1299  					};
296602b8e5f715 Dragan Simic 2024-07-21  1300  				};
296602b8e5f715 Dragan Simic 2024-07-21  1301  			};
296602b8e5f715 Dragan Simic 2024-07-21  1302  		};
296602b8e5f715 Dragan Simic 2024-07-21  1303  	};
296602b8e5f715 Dragan Simic 2024-07-21  1304  
296602b8e5f715 Dragan Simic 2024-07-21  1305  	pmugrf: syscon@ff320000 {
296602b8e5f715 Dragan Simic 2024-07-21  1306  		compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";
296602b8e5f715 Dragan Simic 2024-07-21  1307  		reg = <0x0 0xff320000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1308  
296602b8e5f715 Dragan Simic 2024-07-21  1309  		pmu_io_domains: io-domains {
296602b8e5f715 Dragan Simic 2024-07-21  1310  			compatible = "rockchip,rk3399-pmu-io-voltage-domain";
296602b8e5f715 Dragan Simic 2024-07-21  1311  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1312  		};
296602b8e5f715 Dragan Simic 2024-07-21  1313  	};
296602b8e5f715 Dragan Simic 2024-07-21  1314  
296602b8e5f715 Dragan Simic 2024-07-21  1315  	spi3: spi@ff350000 {
296602b8e5f715 Dragan Simic 2024-07-21  1316  		compatible = "rockchip,rk3399-spi", "rockchip,rk3066-spi";
296602b8e5f715 Dragan Simic 2024-07-21  1317  		reg = <0x0 0xff350000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1318  		clocks = <&pmucru SCLK_SPI3_PMU>, <&pmucru PCLK_SPI3_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1319  		clock-names = "spiclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1320  		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1321  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1322  		pinctrl-0 = <&spi3_clk &spi3_tx &spi3_rx &spi3_cs0>;
296602b8e5f715 Dragan Simic 2024-07-21  1323  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1324  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1325  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1326  	};
296602b8e5f715 Dragan Simic 2024-07-21  1327  
296602b8e5f715 Dragan Simic 2024-07-21  1328  	uart4: serial@ff370000 {
296602b8e5f715 Dragan Simic 2024-07-21  1329  		compatible = "rockchip,rk3399-uart", "snps,dw-apb-uart";
296602b8e5f715 Dragan Simic 2024-07-21  1330  		reg = <0x0 0xff370000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  1331  		clocks = <&pmucru SCLK_UART4_PMU>, <&pmucru PCLK_UART4_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1332  		clock-names = "baudclk", "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1333  		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1334  		reg-shift = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  1335  		reg-io-width = <4>;
296602b8e5f715 Dragan Simic 2024-07-21  1336  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1337  		pinctrl-0 = <&uart4_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21  1338  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1339  	};
296602b8e5f715 Dragan Simic 2024-07-21  1340  
296602b8e5f715 Dragan Simic 2024-07-21  1341  	i2c0: i2c@ff3c0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1342  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21  1343  		reg = <0x0 0xff3c0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1344  		assigned-clocks = <&pmucru SCLK_I2C0_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1345  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1346  		clocks = <&pmucru SCLK_I2C0_PMU>, <&pmucru PCLK_I2C0_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1347  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1348  		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1349  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1350  		pinctrl-0 = <&i2c0_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21  1351  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1352  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1353  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1354  	};
296602b8e5f715 Dragan Simic 2024-07-21  1355  
296602b8e5f715 Dragan Simic 2024-07-21  1356  	i2c4: i2c@ff3d0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1357  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21  1358  		reg = <0x0 0xff3d0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1359  		assigned-clocks = <&pmucru SCLK_I2C4_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1360  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1361  		clocks = <&pmucru SCLK_I2C4_PMU>, <&pmucru PCLK_I2C4_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1362  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1363  		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1364  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1365  		pinctrl-0 = <&i2c4_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21  1366  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1367  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1368  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1369  	};
296602b8e5f715 Dragan Simic 2024-07-21  1370  
296602b8e5f715 Dragan Simic 2024-07-21  1371  	i2c8: i2c@ff3e0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1372  		compatible = "rockchip,rk3399-i2c";
296602b8e5f715 Dragan Simic 2024-07-21  1373  		reg = <0x0 0xff3e0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1374  		assigned-clocks = <&pmucru SCLK_I2C8_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1375  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1376  		clocks = <&pmucru SCLK_I2C8_PMU>, <&pmucru PCLK_I2C8_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1377  		clock-names = "i2c", "pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1378  		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1379  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1380  		pinctrl-0 = <&i2c8_xfer>;
296602b8e5f715 Dragan Simic 2024-07-21  1381  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1382  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1383  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1384  	};
296602b8e5f715 Dragan Simic 2024-07-21  1385  
296602b8e5f715 Dragan Simic 2024-07-21  1386  	pwm0: pwm@ff420000 {
296602b8e5f715 Dragan Simic 2024-07-21  1387  		compatible = "rockchip,rk3399-pwm", "rockchip,rk3288-pwm";
296602b8e5f715 Dragan Simic 2024-07-21  1388  		reg = <0x0 0xff420000 0x0 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1389  		#pwm-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1390  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1391  		pinctrl-0 = <&pwm0_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1392  		clocks = <&pmucru PCLK_RKPWM_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1393  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1394  	};
296602b8e5f715 Dragan Simic 2024-07-21  1395  
296602b8e5f715 Dragan Simic 2024-07-21  1396  	pwm1: pwm@ff420010 {
296602b8e5f715 Dragan Simic 2024-07-21  1397  		compatible = "rockchip,rk3399-pwm", "rockchip,rk3288-pwm";
296602b8e5f715 Dragan Simic 2024-07-21  1398  		reg = <0x0 0xff420010 0x0 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1399  		#pwm-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1400  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1401  		pinctrl-0 = <&pwm1_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1402  		clocks = <&pmucru PCLK_RKPWM_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1403  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1404  	};
296602b8e5f715 Dragan Simic 2024-07-21  1405  
296602b8e5f715 Dragan Simic 2024-07-21  1406  	pwm2: pwm@ff420020 {
296602b8e5f715 Dragan Simic 2024-07-21  1407  		compatible = "rockchip,rk3399-pwm", "rockchip,rk3288-pwm";
296602b8e5f715 Dragan Simic 2024-07-21  1408  		reg = <0x0 0xff420020 0x0 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1409  		#pwm-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1410  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1411  		pinctrl-0 = <&pwm2_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1412  		clocks = <&pmucru PCLK_RKPWM_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1413  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1414  	};
296602b8e5f715 Dragan Simic 2024-07-21  1415  
296602b8e5f715 Dragan Simic 2024-07-21  1416  	pwm3: pwm@ff420030 {
296602b8e5f715 Dragan Simic 2024-07-21  1417  		compatible = "rockchip,rk3399-pwm", "rockchip,rk3288-pwm";
296602b8e5f715 Dragan Simic 2024-07-21  1418  		reg = <0x0 0xff420030 0x0 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1419  		#pwm-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1420  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1421  		pinctrl-0 = <&pwm3a_pin>;
296602b8e5f715 Dragan Simic 2024-07-21  1422  		clocks = <&pmucru PCLK_RKPWM_PMU>;
296602b8e5f715 Dragan Simic 2024-07-21  1423  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1424  	};
296602b8e5f715 Dragan Simic 2024-07-21  1425  
296602b8e5f715 Dragan Simic 2024-07-21  1426  	dfi: dfi@ff630000 {
296602b8e5f715 Dragan Simic 2024-07-21  1427  		reg = <0x00 0xff630000 0x00 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  1428  		compatible = "rockchip,rk3399-dfi";
296602b8e5f715 Dragan Simic 2024-07-21  1429  		rockchip,pmu = <&pmugrf>;
296602b8e5f715 Dragan Simic 2024-07-21  1430  		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1431  		clocks = <&cru PCLK_DDR_MON>;
296602b8e5f715 Dragan Simic 2024-07-21  1432  		clock-names = "pclk_ddr_mon";
296602b8e5f715 Dragan Simic 2024-07-21  1433  	};
296602b8e5f715 Dragan Simic 2024-07-21  1434  
296602b8e5f715 Dragan Simic 2024-07-21  1435  	vpu: video-codec@ff650000 {
296602b8e5f715 Dragan Simic 2024-07-21  1436  		compatible = "rockchip,rk3399-vpu";
296602b8e5f715 Dragan Simic 2024-07-21  1437  		reg = <0x0 0xff650000 0x0 0x800>;
296602b8e5f715 Dragan Simic 2024-07-21  1438  		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1439  			     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1440  		interrupt-names = "vepu", "vdpu";
296602b8e5f715 Dragan Simic 2024-07-21  1441  		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1442  		clock-names = "aclk", "hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1443  		iommus = <&vpu_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1444  		power-domains = <&power RK3399_PD_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1445  	};
296602b8e5f715 Dragan Simic 2024-07-21  1446  
296602b8e5f715 Dragan Simic 2024-07-21  1447  	vpu_mmu: iommu@ff650800 {
296602b8e5f715 Dragan Simic 2024-07-21  1448  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1449  		reg = <0x0 0xff650800 0x0 0x40>;
296602b8e5f715 Dragan Simic 2024-07-21  1450  		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1451  		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1452  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1453  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1454  		power-domains = <&power RK3399_PD_VCODEC>;
296602b8e5f715 Dragan Simic 2024-07-21  1455  	};
296602b8e5f715 Dragan Simic 2024-07-21  1456  
296602b8e5f715 Dragan Simic 2024-07-21  1457  	vdec: video-codec@ff660000 {
296602b8e5f715 Dragan Simic 2024-07-21  1458  		compatible = "rockchip,rk3399-vdec";
296602b8e5f715 Dragan Simic 2024-07-21  1459  		reg = <0x0 0xff660000 0x0 0x480>;
296602b8e5f715 Dragan Simic 2024-07-21  1460  		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1461  		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
296602b8e5f715 Dragan Simic 2024-07-21  1462  			 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
296602b8e5f715 Dragan Simic 2024-07-21  1463  		clock-names = "axi", "ahb", "cabac", "core";
296602b8e5f715 Dragan Simic 2024-07-21  1464  		iommus = <&vdec_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1465  		power-domains = <&power RK3399_PD_VDU>;
296602b8e5f715 Dragan Simic 2024-07-21  1466  	};
296602b8e5f715 Dragan Simic 2024-07-21  1467  
296602b8e5f715 Dragan Simic 2024-07-21  1468  	vdec_mmu: iommu@ff660480 {
296602b8e5f715 Dragan Simic 2024-07-21  1469  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1470  		reg = <0x0 0xff660480 0x0 0x40>, <0x0 0xff6604c0 0x0 0x40>;
296602b8e5f715 Dragan Simic 2024-07-21  1471  		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1472  		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>;
296602b8e5f715 Dragan Simic 2024-07-21  1473  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1474  		power-domains = <&power RK3399_PD_VDU>;
296602b8e5f715 Dragan Simic 2024-07-21  1475  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1476  	};
296602b8e5f715 Dragan Simic 2024-07-21  1477  
296602b8e5f715 Dragan Simic 2024-07-21  1478  	iep_mmu: iommu@ff670800 {
296602b8e5f715 Dragan Simic 2024-07-21  1479  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1480  		reg = <0x0 0xff670800 0x0 0x40>;
296602b8e5f715 Dragan Simic 2024-07-21  1481  		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1482  		clocks = <&cru ACLK_IEP>, <&cru HCLK_IEP>;
296602b8e5f715 Dragan Simic 2024-07-21  1483  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1484  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1485  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1486  	};
296602b8e5f715 Dragan Simic 2024-07-21  1487  
296602b8e5f715 Dragan Simic 2024-07-21  1488  	rga: rga@ff680000 {
296602b8e5f715 Dragan Simic 2024-07-21  1489  		compatible = "rockchip,rk3399-rga";
296602b8e5f715 Dragan Simic 2024-07-21  1490  		reg = <0x0 0xff680000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21  1491  		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1492  		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
296602b8e5f715 Dragan Simic 2024-07-21  1493  		clock-names = "aclk", "hclk", "sclk";
296602b8e5f715 Dragan Simic 2024-07-21  1494  		resets = <&cru SRST_RGA_CORE>, <&cru SRST_A_RGA>, <&cru SRST_H_RGA>;
296602b8e5f715 Dragan Simic 2024-07-21  1495  		reset-names = "core", "axi", "ahb";
296602b8e5f715 Dragan Simic 2024-07-21  1496  		power-domains = <&power RK3399_PD_RGA>;
296602b8e5f715 Dragan Simic 2024-07-21  1497  	};
296602b8e5f715 Dragan Simic 2024-07-21  1498  
296602b8e5f715 Dragan Simic 2024-07-21  1499  	efuse0: efuse@ff690000 {
296602b8e5f715 Dragan Simic 2024-07-21  1500  		compatible = "rockchip,rk3399-efuse";
296602b8e5f715 Dragan Simic 2024-07-21  1501  		reg = <0x0 0xff690000 0x0 0x80>;
296602b8e5f715 Dragan Simic 2024-07-21  1502  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1503  		#size-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1504  		clocks = <&cru PCLK_EFUSE1024NS>;
296602b8e5f715 Dragan Simic 2024-07-21  1505  		clock-names = "pclk_efuse";
296602b8e5f715 Dragan Simic 2024-07-21  1506  
296602b8e5f715 Dragan Simic 2024-07-21  1507  		/* Data cells */
296602b8e5f715 Dragan Simic 2024-07-21  1508  		cpu_id: cpu-id@7 {
296602b8e5f715 Dragan Simic 2024-07-21  1509  			reg = <0x07 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1510  		};
296602b8e5f715 Dragan Simic 2024-07-21  1511  		cpub_leakage: cpu-leakage@17 {
296602b8e5f715 Dragan Simic 2024-07-21  1512  			reg = <0x17 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1513  		};
296602b8e5f715 Dragan Simic 2024-07-21  1514  		gpu_leakage: gpu-leakage@18 {
296602b8e5f715 Dragan Simic 2024-07-21  1515  			reg = <0x18 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1516  		};
296602b8e5f715 Dragan Simic 2024-07-21  1517  		center_leakage: center-leakage@19 {
296602b8e5f715 Dragan Simic 2024-07-21  1518  			reg = <0x19 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1519  		};
296602b8e5f715 Dragan Simic 2024-07-21  1520  		cpul_leakage: cpu-leakage@1a {
296602b8e5f715 Dragan Simic 2024-07-21  1521  			reg = <0x1a 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1522  		};
296602b8e5f715 Dragan Simic 2024-07-21  1523  		logic_leakage: logic-leakage@1b {
296602b8e5f715 Dragan Simic 2024-07-21  1524  			reg = <0x1b 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1525  		};
296602b8e5f715 Dragan Simic 2024-07-21  1526  		wafer_info: wafer-info@1c {
296602b8e5f715 Dragan Simic 2024-07-21  1527  			reg = <0x1c 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  1528  		};
296602b8e5f715 Dragan Simic 2024-07-21  1529  	};
296602b8e5f715 Dragan Simic 2024-07-21  1530  
296602b8e5f715 Dragan Simic 2024-07-21  1531  	dmac_bus: dma-controller@ff6d0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1532  		compatible = "arm,pl330", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  1533  		reg = <0x0 0xff6d0000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  1534  		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1535  			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1536  		#dma-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1537  		arm,pl330-periph-burst;
296602b8e5f715 Dragan Simic 2024-07-21  1538  		clocks = <&cru ACLK_DMAC0_PERILP>;
296602b8e5f715 Dragan Simic 2024-07-21  1539  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1540  	};
296602b8e5f715 Dragan Simic 2024-07-21  1541  
296602b8e5f715 Dragan Simic 2024-07-21  1542  	dmac_peri: dma-controller@ff6e0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1543  		compatible = "arm,pl330", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  1544  		reg = <0x0 0xff6e0000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  1545  		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1546  			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1547  		#dma-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1548  		arm,pl330-periph-burst;
296602b8e5f715 Dragan Simic 2024-07-21  1549  		clocks = <&cru ACLK_DMAC1_PERILP>;
296602b8e5f715 Dragan Simic 2024-07-21  1550  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  1551  	};
296602b8e5f715 Dragan Simic 2024-07-21  1552  
296602b8e5f715 Dragan Simic 2024-07-21  1553  	pmucru: clock-controller@ff750000 {
296602b8e5f715 Dragan Simic 2024-07-21  1554  		compatible = "rockchip,rk3399-pmucru";
296602b8e5f715 Dragan Simic 2024-07-21  1555  		reg = <0x0 0xff750000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1556  		clocks = <&xin24m>;
296602b8e5f715 Dragan Simic 2024-07-21  1557  		clock-names = "xin24m";
296602b8e5f715 Dragan Simic 2024-07-21  1558  		rockchip,grf = <&pmugrf>;
296602b8e5f715 Dragan Simic 2024-07-21  1559  		#clock-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1560  		#reset-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1561  		assigned-clocks = <&pmucru PLL_PPLL>;
296602b8e5f715 Dragan Simic 2024-07-21  1562  		assigned-clock-rates = <676000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1563  	};
296602b8e5f715 Dragan Simic 2024-07-21  1564  
296602b8e5f715 Dragan Simic 2024-07-21  1565  	cru: clock-controller@ff760000 {
296602b8e5f715 Dragan Simic 2024-07-21  1566  		compatible = "rockchip,rk3399-cru";
296602b8e5f715 Dragan Simic 2024-07-21  1567  		reg = <0x0 0xff760000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1568  		clocks = <&xin24m>;
296602b8e5f715 Dragan Simic 2024-07-21  1569  		clock-names = "xin24m";
296602b8e5f715 Dragan Simic 2024-07-21  1570  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  1571  		#clock-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1572  		#reset-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1573  		assigned-clocks =
296602b8e5f715 Dragan Simic 2024-07-21  1574  			<&cru PLL_GPLL>, <&cru PLL_CPLL>,
296602b8e5f715 Dragan Simic 2024-07-21  1575  			<&cru PLL_NPLL>,
296602b8e5f715 Dragan Simic 2024-07-21  1576  			<&cru ACLK_PERIHP>, <&cru HCLK_PERIHP>,
296602b8e5f715 Dragan Simic 2024-07-21  1577  			<&cru PCLK_PERIHP>,
296602b8e5f715 Dragan Simic 2024-07-21  1578  			<&cru ACLK_PERILP0>, <&cru HCLK_PERILP0>,
296602b8e5f715 Dragan Simic 2024-07-21  1579  			<&cru PCLK_PERILP0>, <&cru ACLK_CCI>,
296602b8e5f715 Dragan Simic 2024-07-21  1580  			<&cru HCLK_PERILP1>, <&cru PCLK_PERILP1>,
296602b8e5f715 Dragan Simic 2024-07-21  1581  			<&cru ACLK_VIO>, <&cru ACLK_HDCP>,
296602b8e5f715 Dragan Simic 2024-07-21  1582  			<&cru ACLK_GIC_PRE>,
296602b8e5f715 Dragan Simic 2024-07-21  1583  			<&cru PCLK_DDR>,
296602b8e5f715 Dragan Simic 2024-07-21  1584  			<&cru ACLK_VDU>;
296602b8e5f715 Dragan Simic 2024-07-21  1585  		assigned-clock-rates =
296602b8e5f715 Dragan Simic 2024-07-21  1586  			 <594000000>,  <800000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1587  			<1000000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1588  			 <150000000>,   <75000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1589  			  <37500000>,
296602b8e5f715 Dragan Simic 2024-07-21  1590  			 <100000000>,  <100000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1591  			  <50000000>, <600000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1592  			 <100000000>,   <50000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1593  			 <400000000>, <400000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1594  			 <200000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1595  			 <200000000>,
296602b8e5f715 Dragan Simic 2024-07-21  1596  			 <400000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1597  	};
296602b8e5f715 Dragan Simic 2024-07-21  1598  
296602b8e5f715 Dragan Simic 2024-07-21  1599  	grf: syscon@ff770000 {
296602b8e5f715 Dragan Simic 2024-07-21  1600  		compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
296602b8e5f715 Dragan Simic 2024-07-21  1601  		reg = <0x0 0xff770000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21  1602  		#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1603  		#size-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1604  
296602b8e5f715 Dragan Simic 2024-07-21  1605  		io_domains: io-domains {
296602b8e5f715 Dragan Simic 2024-07-21  1606  			compatible = "rockchip,rk3399-io-voltage-domain";
296602b8e5f715 Dragan Simic 2024-07-21  1607  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1608  		};
296602b8e5f715 Dragan Simic 2024-07-21  1609  
296602b8e5f715 Dragan Simic 2024-07-21  1610  		mipi_dphy_rx0: mipi-dphy-rx0 {
296602b8e5f715 Dragan Simic 2024-07-21  1611  			compatible = "rockchip,rk3399-mipi-dphy-rx0";
296602b8e5f715 Dragan Simic 2024-07-21  1612  			clocks = <&cru SCLK_MIPIDPHY_REF>,
296602b8e5f715 Dragan Simic 2024-07-21  1613  				 <&cru SCLK_DPHY_RX0_CFG>,
296602b8e5f715 Dragan Simic 2024-07-21  1614  				 <&cru PCLK_VIO_GRF>;
296602b8e5f715 Dragan Simic 2024-07-21  1615  			clock-names = "dphy-ref", "dphy-cfg", "grf";
296602b8e5f715 Dragan Simic 2024-07-21  1616  			power-domains = <&power RK3399_PD_VIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1617  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1618  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1619  		};
296602b8e5f715 Dragan Simic 2024-07-21  1620  
296602b8e5f715 Dragan Simic 2024-07-21  1621  		u2phy0: usb2phy@e450 {
296602b8e5f715 Dragan Simic 2024-07-21  1622  			compatible = "rockchip,rk3399-usb2phy";
296602b8e5f715 Dragan Simic 2024-07-21  1623  			reg = <0xe450 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1624  			clocks = <&cru SCLK_USB2PHY0_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1625  			clock-names = "phyclk";
296602b8e5f715 Dragan Simic 2024-07-21  1626  			#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1627  			clock-output-names = "clk_usbphy0_480m";
296602b8e5f715 Dragan Simic 2024-07-21  1628  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1629  
296602b8e5f715 Dragan Simic 2024-07-21  1630  			u2phy0_host: host-port {
296602b8e5f715 Dragan Simic 2024-07-21  1631  				#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1632  				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1633  				interrupt-names = "linestate";
296602b8e5f715 Dragan Simic 2024-07-21  1634  				status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1635  			};
296602b8e5f715 Dragan Simic 2024-07-21  1636  
296602b8e5f715 Dragan Simic 2024-07-21  1637  			u2phy0_otg: otg-port {
296602b8e5f715 Dragan Simic 2024-07-21  1638  				#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1639  				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1640  					     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1641  					     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1642  				interrupt-names = "otg-bvalid", "otg-id",
296602b8e5f715 Dragan Simic 2024-07-21  1643  						  "linestate";
296602b8e5f715 Dragan Simic 2024-07-21  1644  				status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1645  			};
296602b8e5f715 Dragan Simic 2024-07-21  1646  		};
296602b8e5f715 Dragan Simic 2024-07-21  1647  
296602b8e5f715 Dragan Simic 2024-07-21  1648  		u2phy1: usb2phy@e460 {
296602b8e5f715 Dragan Simic 2024-07-21  1649  			compatible = "rockchip,rk3399-usb2phy";
296602b8e5f715 Dragan Simic 2024-07-21  1650  			reg = <0xe460 0x10>;
296602b8e5f715 Dragan Simic 2024-07-21  1651  			clocks = <&cru SCLK_USB2PHY1_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1652  			clock-names = "phyclk";
296602b8e5f715 Dragan Simic 2024-07-21  1653  			#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1654  			clock-output-names = "clk_usbphy1_480m";
296602b8e5f715 Dragan Simic 2024-07-21  1655  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1656  
296602b8e5f715 Dragan Simic 2024-07-21  1657  			u2phy1_host: host-port {
296602b8e5f715 Dragan Simic 2024-07-21  1658  				#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1659  				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1660  				interrupt-names = "linestate";
296602b8e5f715 Dragan Simic 2024-07-21  1661  				status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1662  			};
296602b8e5f715 Dragan Simic 2024-07-21  1663  
296602b8e5f715 Dragan Simic 2024-07-21  1664  			u2phy1_otg: otg-port {
296602b8e5f715 Dragan Simic 2024-07-21  1665  				#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1666  				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1667  					     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  1668  					     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1669  				interrupt-names = "otg-bvalid", "otg-id",
296602b8e5f715 Dragan Simic 2024-07-21  1670  						  "linestate";
296602b8e5f715 Dragan Simic 2024-07-21  1671  				status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1672  			};
296602b8e5f715 Dragan Simic 2024-07-21  1673  		};
296602b8e5f715 Dragan Simic 2024-07-21  1674  
296602b8e5f715 Dragan Simic 2024-07-21  1675  		emmc_phy: phy@f780 {
296602b8e5f715 Dragan Simic 2024-07-21  1676  			compatible = "rockchip,rk3399-emmc-phy";
296602b8e5f715 Dragan Simic 2024-07-21  1677  			reg = <0xf780 0x24>;
296602b8e5f715 Dragan Simic 2024-07-21  1678  			clocks = <&sdhci>;
296602b8e5f715 Dragan Simic 2024-07-21  1679  			clock-names = "emmcclk";
296602b8e5f715 Dragan Simic 2024-07-21  1680  			drive-impedance-ohm = <50>;
296602b8e5f715 Dragan Simic 2024-07-21  1681  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1682  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1683  		};
296602b8e5f715 Dragan Simic 2024-07-21  1684  
296602b8e5f715 Dragan Simic 2024-07-21  1685  		pcie_phy: pcie-phy {
296602b8e5f715 Dragan Simic 2024-07-21  1686  			compatible = "rockchip,rk3399-pcie-phy";
296602b8e5f715 Dragan Simic 2024-07-21  1687  			clocks = <&cru SCLK_PCIEPHY_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1688  			clock-names = "refclk";
296602b8e5f715 Dragan Simic 2024-07-21  1689  			#phy-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1690  			resets = <&cru SRST_PCIEPHY>;
296602b8e5f715 Dragan Simic 2024-07-21  1691  			reset-names = "phy";
296602b8e5f715 Dragan Simic 2024-07-21  1692  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1693  		};
296602b8e5f715 Dragan Simic 2024-07-21  1694  	};
296602b8e5f715 Dragan Simic 2024-07-21  1695  
296602b8e5f715 Dragan Simic 2024-07-21  1696  	tcphy0: phy@ff7c0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1697  		compatible = "rockchip,rk3399-typec-phy";
296602b8e5f715 Dragan Simic 2024-07-21  1698  		reg = <0x0 0xff7c0000 0x0 0x40000>;
296602b8e5f715 Dragan Simic 2024-07-21  1699  		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
296602b8e5f715 Dragan Simic 2024-07-21  1700  			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1701  		clock-names = "tcpdcore", "tcpdphy-ref";
296602b8e5f715 Dragan Simic 2024-07-21  1702  		assigned-clocks = <&cru SCLK_UPHY0_TCPDCORE>;
296602b8e5f715 Dragan Simic 2024-07-21  1703  		assigned-clock-rates = <50000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1704  		power-domains = <&power RK3399_PD_TCPD0>;
296602b8e5f715 Dragan Simic 2024-07-21  1705  		resets = <&cru SRST_UPHY0>,
296602b8e5f715 Dragan Simic 2024-07-21  1706  			 <&cru SRST_UPHY0_PIPE_L00>,
296602b8e5f715 Dragan Simic 2024-07-21  1707  			 <&cru SRST_P_UPHY0_TCPHY>;
296602b8e5f715 Dragan Simic 2024-07-21  1708  		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
296602b8e5f715 Dragan Simic 2024-07-21  1709  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  1710  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1711  
296602b8e5f715 Dragan Simic 2024-07-21  1712  		tcphy0_dp: dp-port {
296602b8e5f715 Dragan Simic 2024-07-21  1713  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1714  		};
296602b8e5f715 Dragan Simic 2024-07-21  1715  
296602b8e5f715 Dragan Simic 2024-07-21  1716  		tcphy0_usb3: usb3-port {
296602b8e5f715 Dragan Simic 2024-07-21  1717  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1718  		};
296602b8e5f715 Dragan Simic 2024-07-21  1719  	};
296602b8e5f715 Dragan Simic 2024-07-21  1720  
296602b8e5f715 Dragan Simic 2024-07-21  1721  	tcphy1: phy@ff800000 {
296602b8e5f715 Dragan Simic 2024-07-21  1722  		compatible = "rockchip,rk3399-typec-phy";
296602b8e5f715 Dragan Simic 2024-07-21  1723  		reg = <0x0 0xff800000 0x0 0x40000>;
296602b8e5f715 Dragan Simic 2024-07-21  1724  		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
296602b8e5f715 Dragan Simic 2024-07-21  1725  			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
296602b8e5f715 Dragan Simic 2024-07-21  1726  		clock-names = "tcpdcore", "tcpdphy-ref";
296602b8e5f715 Dragan Simic 2024-07-21  1727  		assigned-clocks = <&cru SCLK_UPHY1_TCPDCORE>;
296602b8e5f715 Dragan Simic 2024-07-21  1728  		assigned-clock-rates = <50000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1729  		power-domains = <&power RK3399_PD_TCPD1>;
296602b8e5f715 Dragan Simic 2024-07-21  1730  		resets = <&cru SRST_UPHY1>,
296602b8e5f715 Dragan Simic 2024-07-21  1731  			 <&cru SRST_UPHY1_PIPE_L00>,
296602b8e5f715 Dragan Simic 2024-07-21  1732  			 <&cru SRST_P_UPHY1_TCPHY>;
296602b8e5f715 Dragan Simic 2024-07-21  1733  		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
296602b8e5f715 Dragan Simic 2024-07-21  1734  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  1735  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1736  
296602b8e5f715 Dragan Simic 2024-07-21  1737  		tcphy1_dp: dp-port {
296602b8e5f715 Dragan Simic 2024-07-21  1738  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1739  		};
296602b8e5f715 Dragan Simic 2024-07-21  1740  
296602b8e5f715 Dragan Simic 2024-07-21  1741  		tcphy1_usb3: usb3-port {
296602b8e5f715 Dragan Simic 2024-07-21  1742  			#phy-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1743  		};
296602b8e5f715 Dragan Simic 2024-07-21  1744  	};
296602b8e5f715 Dragan Simic 2024-07-21  1745  
296602b8e5f715 Dragan Simic 2024-07-21  1746  	watchdog@ff848000 {
296602b8e5f715 Dragan Simic 2024-07-21  1747  		compatible = "rockchip,rk3399-wdt", "snps,dw-wdt";
296602b8e5f715 Dragan Simic 2024-07-21  1748  		reg = <0x0 0xff848000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  1749  		clocks = <&cru PCLK_WDT>;
296602b8e5f715 Dragan Simic 2024-07-21  1750  		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1751  	};
296602b8e5f715 Dragan Simic 2024-07-21  1752  
296602b8e5f715 Dragan Simic 2024-07-21  1753  	rktimer: rktimer@ff850000 {
296602b8e5f715 Dragan Simic 2024-07-21  1754  		compatible = "rockchip,rk3399-timer";
296602b8e5f715 Dragan Simic 2024-07-21  1755  		reg = <0x0 0xff850000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1756  		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1757  		clocks = <&cru PCLK_TIMER0>, <&cru SCLK_TIMER00>;
296602b8e5f715 Dragan Simic 2024-07-21  1758  		clock-names = "pclk", "timer";
296602b8e5f715 Dragan Simic 2024-07-21  1759  	};
296602b8e5f715 Dragan Simic 2024-07-21  1760  
296602b8e5f715 Dragan Simic 2024-07-21  1761  	spdif: spdif@ff870000 {
296602b8e5f715 Dragan Simic 2024-07-21  1762  		compatible = "rockchip,rk3399-spdif";
296602b8e5f715 Dragan Simic 2024-07-21  1763  		reg = <0x0 0xff870000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1764  		interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1765  		dmas = <&dmac_bus 7>;
296602b8e5f715 Dragan Simic 2024-07-21  1766  		dma-names = "tx";
296602b8e5f715 Dragan Simic 2024-07-21  1767  		clock-names = "mclk", "hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1768  		clocks = <&cru SCLK_SPDIF_8CH>, <&cru HCLK_SPDIF>;
296602b8e5f715 Dragan Simic 2024-07-21  1769  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1770  		pinctrl-0 = <&spdif_bus>;
296602b8e5f715 Dragan Simic 2024-07-21  1771  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1772  		#sound-dai-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1773  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1774  	};
296602b8e5f715 Dragan Simic 2024-07-21  1775  
296602b8e5f715 Dragan Simic 2024-07-21  1776  	i2s0: i2s@ff880000 {
296602b8e5f715 Dragan Simic 2024-07-21  1777  		compatible = "rockchip,rk3399-i2s", "rockchip,rk3066-i2s";
296602b8e5f715 Dragan Simic 2024-07-21  1778  		reg = <0x0 0xff880000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1779  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  1780  		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1781  		dmas = <&dmac_bus 0>, <&dmac_bus 1>;
296602b8e5f715 Dragan Simic 2024-07-21  1782  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21  1783  		clock-names = "i2s_clk", "i2s_hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1784  		clocks = <&cru SCLK_I2S0_8CH>, <&cru HCLK_I2S0_8CH>;
296602b8e5f715 Dragan Simic 2024-07-21  1785  		pinctrl-names = "bclk_on", "bclk_off";
296602b8e5f715 Dragan Simic 2024-07-21  1786  		pinctrl-0 = <&i2s0_8ch_bus>;
296602b8e5f715 Dragan Simic 2024-07-21  1787  		pinctrl-1 = <&i2s0_8ch_bus_bclk_off>;
296602b8e5f715 Dragan Simic 2024-07-21  1788  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1789  		#sound-dai-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1790  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1791  	};
296602b8e5f715 Dragan Simic 2024-07-21  1792  
296602b8e5f715 Dragan Simic 2024-07-21  1793  	i2s1: i2s@ff890000 {
296602b8e5f715 Dragan Simic 2024-07-21  1794  		compatible = "rockchip,rk3399-i2s", "rockchip,rk3066-i2s";
296602b8e5f715 Dragan Simic 2024-07-21  1795  		reg = <0x0 0xff890000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1796  		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1797  		dmas = <&dmac_bus 2>, <&dmac_bus 3>;
296602b8e5f715 Dragan Simic 2024-07-21  1798  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21  1799  		clock-names = "i2s_clk", "i2s_hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1800  		clocks = <&cru SCLK_I2S1_8CH>, <&cru HCLK_I2S1_8CH>;
296602b8e5f715 Dragan Simic 2024-07-21  1801  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  1802  		pinctrl-0 = <&i2s1_2ch_bus>;
296602b8e5f715 Dragan Simic 2024-07-21  1803  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1804  		#sound-dai-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1805  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1806  	};
296602b8e5f715 Dragan Simic 2024-07-21  1807  
296602b8e5f715 Dragan Simic 2024-07-21  1808  	i2s2: i2s@ff8a0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1809  		compatible = "rockchip,rk3399-i2s", "rockchip,rk3066-i2s";
296602b8e5f715 Dragan Simic 2024-07-21  1810  		reg = <0x0 0xff8a0000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1811  		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1812  		dmas = <&dmac_bus 4>, <&dmac_bus 5>;
296602b8e5f715 Dragan Simic 2024-07-21  1813  		dma-names = "tx", "rx";
296602b8e5f715 Dragan Simic 2024-07-21  1814  		clock-names = "i2s_clk", "i2s_hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1815  		clocks = <&cru SCLK_I2S2_8CH>, <&cru HCLK_I2S2_8CH>;
296602b8e5f715 Dragan Simic 2024-07-21  1816  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  1817  		#sound-dai-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1818  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1819  	};
296602b8e5f715 Dragan Simic 2024-07-21  1820  
296602b8e5f715 Dragan Simic 2024-07-21  1821  	vopl: vop@ff8f0000 {
296602b8e5f715 Dragan Simic 2024-07-21  1822  		compatible = "rockchip,rk3399-vop-lit";
296602b8e5f715 Dragan Simic 2024-07-21  1823  		reg = <0x0 0xff8f0000 0x0 0x2000>, <0x0 0xff8f2000 0x0 0x400>;
296602b8e5f715 Dragan Simic 2024-07-21  1824  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1825  		assigned-clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1826  		assigned-clock-rates = <400000000>, <100000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1827  		clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1828  		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
296602b8e5f715 Dragan Simic 2024-07-21  1829  		iommus = <&vopl_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1830  		power-domains = <&power RK3399_PD_VOPL>;
296602b8e5f715 Dragan Simic 2024-07-21  1831  		resets = <&cru SRST_A_VOP1>, <&cru SRST_H_VOP1>, <&cru SRST_D_VOP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1832  		reset-names = "axi", "ahb", "dclk";
296602b8e5f715 Dragan Simic 2024-07-21  1833  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1834  
296602b8e5f715 Dragan Simic 2024-07-21  1835  		vopl_out: port {
296602b8e5f715 Dragan Simic 2024-07-21  1836  			#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1837  			#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1838  
296602b8e5f715 Dragan Simic 2024-07-21  1839  			vopl_out_mipi: endpoint@0 {
296602b8e5f715 Dragan Simic 2024-07-21  1840  				reg = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1841  				remote-endpoint = <&mipi_in_vopl>;
296602b8e5f715 Dragan Simic 2024-07-21  1842  			};
296602b8e5f715 Dragan Simic 2024-07-21  1843  
296602b8e5f715 Dragan Simic 2024-07-21  1844  			vopl_out_edp: endpoint@1 {
296602b8e5f715 Dragan Simic 2024-07-21  1845  				reg = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1846  				remote-endpoint = <&edp_in_vopl>;
296602b8e5f715 Dragan Simic 2024-07-21  1847  			};
296602b8e5f715 Dragan Simic 2024-07-21  1848  
296602b8e5f715 Dragan Simic 2024-07-21  1849  			vopl_out_hdmi: endpoint@2 {
296602b8e5f715 Dragan Simic 2024-07-21  1850  				reg = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  1851  				remote-endpoint = <&hdmi_in_vopl>;
296602b8e5f715 Dragan Simic 2024-07-21  1852  			};
296602b8e5f715 Dragan Simic 2024-07-21  1853  
296602b8e5f715 Dragan Simic 2024-07-21  1854  			vopl_out_mipi1: endpoint@3 {
296602b8e5f715 Dragan Simic 2024-07-21  1855  				reg = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1856  				remote-endpoint = <&mipi1_in_vopl>;
296602b8e5f715 Dragan Simic 2024-07-21  1857  			};
296602b8e5f715 Dragan Simic 2024-07-21  1858  
296602b8e5f715 Dragan Simic 2024-07-21  1859  			vopl_out_dp: endpoint@4 {
296602b8e5f715 Dragan Simic 2024-07-21  1860  				reg = <4>;
296602b8e5f715 Dragan Simic 2024-07-21  1861  				remote-endpoint = <&dp_in_vopl>;
296602b8e5f715 Dragan Simic 2024-07-21  1862  			};
296602b8e5f715 Dragan Simic 2024-07-21  1863  		};
296602b8e5f715 Dragan Simic 2024-07-21  1864  	};
296602b8e5f715 Dragan Simic 2024-07-21  1865  
296602b8e5f715 Dragan Simic 2024-07-21  1866  	vopl_mmu: iommu@ff8f3f00 {
296602b8e5f715 Dragan Simic 2024-07-21  1867  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1868  		reg = <0x0 0xff8f3f00 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  1869  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1870  		clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1871  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1872  		power-domains = <&power RK3399_PD_VOPL>;
296602b8e5f715 Dragan Simic 2024-07-21  1873  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1874  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1875  	};
296602b8e5f715 Dragan Simic 2024-07-21  1876  
296602b8e5f715 Dragan Simic 2024-07-21  1877  	vopb: vop@ff900000 {
296602b8e5f715 Dragan Simic 2024-07-21  1878  		compatible = "rockchip,rk3399-vop-big";
296602b8e5f715 Dragan Simic 2024-07-21  1879  		reg = <0x0 0xff900000 0x0 0x2000>, <0x0 0xff902000 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  1880  		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1881  		assigned-clocks = <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1882  		assigned-clock-rates = <400000000>, <100000000>;
296602b8e5f715 Dragan Simic 2024-07-21  1883  		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1884  		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
296602b8e5f715 Dragan Simic 2024-07-21  1885  		iommus = <&vopb_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1886  		power-domains = <&power RK3399_PD_VOPB>;
296602b8e5f715 Dragan Simic 2024-07-21  1887  		resets = <&cru SRST_A_VOP0>, <&cru SRST_H_VOP0>, <&cru SRST_D_VOP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1888  		reset-names = "axi", "ahb", "dclk";
296602b8e5f715 Dragan Simic 2024-07-21  1889  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1890  
296602b8e5f715 Dragan Simic 2024-07-21  1891  		vopb_out: port {
296602b8e5f715 Dragan Simic 2024-07-21  1892  			#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1893  			#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1894  
296602b8e5f715 Dragan Simic 2024-07-21  1895  			vopb_out_edp: endpoint@0 {
296602b8e5f715 Dragan Simic 2024-07-21  1896  				reg = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1897  				remote-endpoint = <&edp_in_vopb>;
296602b8e5f715 Dragan Simic 2024-07-21  1898  			};
296602b8e5f715 Dragan Simic 2024-07-21  1899  
296602b8e5f715 Dragan Simic 2024-07-21  1900  			vopb_out_mipi: endpoint@1 {
296602b8e5f715 Dragan Simic 2024-07-21  1901  				reg = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1902  				remote-endpoint = <&mipi_in_vopb>;
296602b8e5f715 Dragan Simic 2024-07-21  1903  			};
296602b8e5f715 Dragan Simic 2024-07-21  1904  
296602b8e5f715 Dragan Simic 2024-07-21  1905  			vopb_out_hdmi: endpoint@2 {
296602b8e5f715 Dragan Simic 2024-07-21  1906  				reg = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  1907  				remote-endpoint = <&hdmi_in_vopb>;
296602b8e5f715 Dragan Simic 2024-07-21  1908  			};
296602b8e5f715 Dragan Simic 2024-07-21  1909  
296602b8e5f715 Dragan Simic 2024-07-21  1910  			vopb_out_mipi1: endpoint@3 {
296602b8e5f715 Dragan Simic 2024-07-21  1911  				reg = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  1912  				remote-endpoint = <&mipi1_in_vopb>;
296602b8e5f715 Dragan Simic 2024-07-21  1913  			};
296602b8e5f715 Dragan Simic 2024-07-21  1914  
296602b8e5f715 Dragan Simic 2024-07-21  1915  			vopb_out_dp: endpoint@4 {
296602b8e5f715 Dragan Simic 2024-07-21  1916  				reg = <4>;
296602b8e5f715 Dragan Simic 2024-07-21  1917  				remote-endpoint = <&dp_in_vopb>;
296602b8e5f715 Dragan Simic 2024-07-21  1918  			};
296602b8e5f715 Dragan Simic 2024-07-21  1919  		};
296602b8e5f715 Dragan Simic 2024-07-21  1920  	};
296602b8e5f715 Dragan Simic 2024-07-21  1921  
296602b8e5f715 Dragan Simic 2024-07-21  1922  	vopb_mmu: iommu@ff903f00 {
296602b8e5f715 Dragan Simic 2024-07-21  1923  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1924  		reg = <0x0 0xff903f00 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  1925  		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1926  		clocks = <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1927  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1928  		power-domains = <&power RK3399_PD_VOPB>;
296602b8e5f715 Dragan Simic 2024-07-21  1929  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1930  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1931  	};
296602b8e5f715 Dragan Simic 2024-07-21  1932  
296602b8e5f715 Dragan Simic 2024-07-21  1933  	isp0: isp0@ff910000 {
296602b8e5f715 Dragan Simic 2024-07-21  1934  		compatible = "rockchip,rk3399-cif-isp";
296602b8e5f715 Dragan Simic 2024-07-21  1935  		reg = <0x0 0xff910000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  1936  		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1937  		clocks = <&cru SCLK_ISP0>,
296602b8e5f715 Dragan Simic 2024-07-21  1938  			 <&cru ACLK_ISP0_WRAPPER>,
296602b8e5f715 Dragan Simic 2024-07-21  1939  			 <&cru HCLK_ISP0_WRAPPER>;
296602b8e5f715 Dragan Simic 2024-07-21  1940  		clock-names = "isp", "aclk", "hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1941  		iommus = <&isp0_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1942  		phys = <&mipi_dphy_rx0>;
296602b8e5f715 Dragan Simic 2024-07-21  1943  		phy-names = "dphy";
296602b8e5f715 Dragan Simic 2024-07-21  1944  		power-domains = <&power RK3399_PD_ISP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1945  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1946  
296602b8e5f715 Dragan Simic 2024-07-21  1947  		ports {
296602b8e5f715 Dragan Simic 2024-07-21  1948  			#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1949  			#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1950  
296602b8e5f715 Dragan Simic 2024-07-21  1951  			port@0 {
296602b8e5f715 Dragan Simic 2024-07-21  1952  				reg = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1953  				#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1954  				#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1955  			};
296602b8e5f715 Dragan Simic 2024-07-21  1956  		};
296602b8e5f715 Dragan Simic 2024-07-21  1957  	};
296602b8e5f715 Dragan Simic 2024-07-21  1958  
296602b8e5f715 Dragan Simic 2024-07-21  1959  	isp0_mmu: iommu@ff914000 {
296602b8e5f715 Dragan Simic 2024-07-21  1960  		compatible = "rockchip,iommu";
296602b8e5f715 Dragan Simic 2024-07-21  1961  		reg = <0x0 0xff914000 0x0 0x100>, <0x0 0xff915000 0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  1962  		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1963  		clocks = <&cru ACLK_ISP0_WRAPPER>, <&cru HCLK_ISP0_WRAPPER>;
296602b8e5f715 Dragan Simic 2024-07-21  1964  		clock-names = "aclk", "iface";
296602b8e5f715 Dragan Simic 2024-07-21  1965  		#iommu-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1966  		power-domains = <&power RK3399_PD_ISP0>;
296602b8e5f715 Dragan Simic 2024-07-21  1967  		rockchip,disable-mmu-reset;
296602b8e5f715 Dragan Simic 2024-07-21  1968  	};
296602b8e5f715 Dragan Simic 2024-07-21  1969  
296602b8e5f715 Dragan Simic 2024-07-21  1970  	isp1: isp1@ff920000 {
296602b8e5f715 Dragan Simic 2024-07-21  1971  		compatible = "rockchip,rk3399-cif-isp";
296602b8e5f715 Dragan Simic 2024-07-21  1972  		reg = <0x0 0xff920000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  1973  		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  1974  		clocks = <&cru SCLK_ISP1>,
296602b8e5f715 Dragan Simic 2024-07-21  1975  			 <&cru ACLK_ISP1_WRAPPER>,
296602b8e5f715 Dragan Simic 2024-07-21  1976  			 <&cru HCLK_ISP1_WRAPPER>;
296602b8e5f715 Dragan Simic 2024-07-21  1977  		clock-names = "isp", "aclk", "hclk";
296602b8e5f715 Dragan Simic 2024-07-21  1978  		iommus = <&isp1_mmu>;
296602b8e5f715 Dragan Simic 2024-07-21  1979  		phys = <&mipi_dsi1>;
296602b8e5f715 Dragan Simic 2024-07-21  1980  		phy-names = "dphy";
296602b8e5f715 Dragan Simic 2024-07-21  1981  		power-domains = <&power RK3399_PD_ISP1>;
296602b8e5f715 Dragan Simic 2024-07-21  1982  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  1983  
296602b8e5f715 Dragan Simic 2024-07-21 @1984  		ports {
296602b8e5f715 Dragan Simic 2024-07-21  1985  			#address-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  1986  			#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  1987  
296602b8e5f715 Dragan Simic 2024-07-21 @1988  			port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
