Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6A1EB2F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734280749; cv=none; b=dE1BGFSC1arEKRDgelQu8L00wFr8FbG87bizXDUno3sClRIYww5ojdzgYxG7pB0Yip2vtYCG76pjHstogS3gQde72B+lZdpY+zN7n08k6fZ2/Y5reHn+jxp3peUVssQgd7fs097trNoNNqO9NneKMRZqEZRZ31Kydnbq78E+YIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734280749; c=relaxed/simple;
	bh=GusFPxTtmXJd5cO/RoAyt6p7ikqGvs2usqWJ8vOMsVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRlypAfGqcsVhbew9M53uPrzsyyVxdzv35JdDMICjlbPdot8hhJbgytug+NPB2WoWTcAxsWEc3e5uwXY05upDb7rTQdWJvje0oKZzad+0XKsTVI/pRL1SgvSy9bQXT26nDN4GK0Eo28BnCL01wn1hQuYoiVpH0HmISvgR8y3ZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilAgjemJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilAgjemJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734280740; x=1765816740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GusFPxTtmXJd5cO/RoAyt6p7ikqGvs2usqWJ8vOMsVc=;
  b=ilAgjemJSYMa6upKgVcYFae18vhSSbZMnio+azLDrGy1KsLBvtiA1X/h
   LR8OZw7HbRXK9wbSIe3rgTHISSZo5uqlyA3naI7RIJWNxy1hwsuTYcNeW
   0kt2uOZNnnYm2rgsgCE/xuJFnac4iBqDKjhqPdV2mgnryNCNvH8syBP1Y
   vY4T3DRwx+NZZ5J8TmzQlBPoPCw4m4gMd1G1vebf/eqUdcv0KZHhKw227
   w2cxAfpg2TUsVI62gJh3FEhT4MmXVPOMMiv8D1BV45RoS2EVNP15QNTWC
   i7KCKUiTVVlciDOYVqUct66RgIffpp8B6EZSsDTvyryi8sAe2Zigfxjju
   w==;
X-CSE-ConnectionGUID: 4jd5fYPlQ3KNH7RNUtJPgA==
X-CSE-MsgGUID: dTszBJRHQkisSzBu+KzpWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="60059516"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="60059516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 08:38:59 -0800
X-CSE-ConnectionGUID: M3eS724ZRku001X4RCMQRw==
X-CSE-MsgGUID: 62XFyuJ2SE6plINjOkONug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="96731952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2024 08:38:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMrdu-000Dk6-1G;
	Sun, 15 Dec 2024 16:38:54 +0000
Date: Mon, 16 Dec 2024 00:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO
 extender bindings on some Rockchip-based devices
Message-ID: <202412160028.WWgjcN4S-lkp@intel.com>
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
In-Reply-To: <20241215032507.4739-3-shimrrashai@gmail.com>
References: <20241215032507.4739-3-shimrrashai@gmail.com>
TO: Shimrra Shai <shimrrashai@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: heiko@sntech.de
CC: krzk+dt@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: robh@kernel.org
CC: Shimrra Shai <shimrrashai@gmail.com>

Hi Shimrra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.13-rc2 next-20241213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shimrra-Shai/arm64-dts-rockchip-add-DTs-for-Firefly-ITX-3588J-and-its-Core-3588J-SoM/20241215-112831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241215032507.4739-3-shimrrashai%40gmail.com
patch subject: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO extender bindings on some Rockchip-based devices
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-002-20241215 (https://download.01.org/0day-ci/archive/20241216/202412160028.WWgjcN4S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160028.WWgjcN4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412160028.WWgjcN4S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:355.39-358.4: Warning (clocks_property): /display-subsystem: Missing property '#clock-cells' in node /phy@fed60000 or bad phandle (referred from clocks[0])
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:636.7-644.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +355 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi

def88eb4d8365a Dragan Simic        2024-06-09    14  
def88eb4d8365a Dragan Simic        2024-06-09    15  / {
def88eb4d8365a Dragan Simic        2024-06-09    16  	compatible = "rockchip,rk3588";
def88eb4d8365a Dragan Simic        2024-06-09    17  
def88eb4d8365a Dragan Simic        2024-06-09    18  	interrupt-parent = <&gic>;
def88eb4d8365a Dragan Simic        2024-06-09    19  	#address-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09    20  	#size-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09    21  
def88eb4d8365a Dragan Simic        2024-06-09    22  	aliases {
def88eb4d8365a Dragan Simic        2024-06-09    23  		gpio0 = &gpio0;
def88eb4d8365a Dragan Simic        2024-06-09    24  		gpio1 = &gpio1;
def88eb4d8365a Dragan Simic        2024-06-09    25  		gpio2 = &gpio2;
def88eb4d8365a Dragan Simic        2024-06-09    26  		gpio3 = &gpio3;
def88eb4d8365a Dragan Simic        2024-06-09    27  		gpio4 = &gpio4;
def88eb4d8365a Dragan Simic        2024-06-09    28  		i2c0 = &i2c0;
def88eb4d8365a Dragan Simic        2024-06-09    29  		i2c1 = &i2c1;
def88eb4d8365a Dragan Simic        2024-06-09    30  		i2c2 = &i2c2;
def88eb4d8365a Dragan Simic        2024-06-09    31  		i2c3 = &i2c3;
def88eb4d8365a Dragan Simic        2024-06-09    32  		i2c4 = &i2c4;
def88eb4d8365a Dragan Simic        2024-06-09    33  		i2c5 = &i2c5;
def88eb4d8365a Dragan Simic        2024-06-09    34  		i2c6 = &i2c6;
def88eb4d8365a Dragan Simic        2024-06-09    35  		i2c7 = &i2c7;
def88eb4d8365a Dragan Simic        2024-06-09    36  		i2c8 = &i2c8;
def88eb4d8365a Dragan Simic        2024-06-09    37  		serial0 = &uart0;
def88eb4d8365a Dragan Simic        2024-06-09    38  		serial1 = &uart1;
def88eb4d8365a Dragan Simic        2024-06-09    39  		serial2 = &uart2;
def88eb4d8365a Dragan Simic        2024-06-09    40  		serial3 = &uart3;
def88eb4d8365a Dragan Simic        2024-06-09    41  		serial4 = &uart4;
def88eb4d8365a Dragan Simic        2024-06-09    42  		serial5 = &uart5;
def88eb4d8365a Dragan Simic        2024-06-09    43  		serial6 = &uart6;
def88eb4d8365a Dragan Simic        2024-06-09    44  		serial7 = &uart7;
def88eb4d8365a Dragan Simic        2024-06-09    45  		serial8 = &uart8;
def88eb4d8365a Dragan Simic        2024-06-09    46  		serial9 = &uart9;
def88eb4d8365a Dragan Simic        2024-06-09    47  		spi0 = &spi0;
def88eb4d8365a Dragan Simic        2024-06-09    48  		spi1 = &spi1;
def88eb4d8365a Dragan Simic        2024-06-09    49  		spi2 = &spi2;
def88eb4d8365a Dragan Simic        2024-06-09    50  		spi3 = &spi3;
def88eb4d8365a Dragan Simic        2024-06-09    51  		spi4 = &spi4;
def88eb4d8365a Dragan Simic        2024-06-09    52  	};
def88eb4d8365a Dragan Simic        2024-06-09    53  
def88eb4d8365a Dragan Simic        2024-06-09    54  	cpus {
def88eb4d8365a Dragan Simic        2024-06-09    55  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09    56  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09    57  
def88eb4d8365a Dragan Simic        2024-06-09    58  		cpu-map {
def88eb4d8365a Dragan Simic        2024-06-09    59  			cluster0 {
def88eb4d8365a Dragan Simic        2024-06-09    60  				core0 {
def88eb4d8365a Dragan Simic        2024-06-09    61  					cpu = <&cpu_l0>;
def88eb4d8365a Dragan Simic        2024-06-09    62  				};
def88eb4d8365a Dragan Simic        2024-06-09    63  				core1 {
def88eb4d8365a Dragan Simic        2024-06-09    64  					cpu = <&cpu_l1>;
def88eb4d8365a Dragan Simic        2024-06-09    65  				};
def88eb4d8365a Dragan Simic        2024-06-09    66  				core2 {
def88eb4d8365a Dragan Simic        2024-06-09    67  					cpu = <&cpu_l2>;
def88eb4d8365a Dragan Simic        2024-06-09    68  				};
def88eb4d8365a Dragan Simic        2024-06-09    69  				core3 {
def88eb4d8365a Dragan Simic        2024-06-09    70  					cpu = <&cpu_l3>;
def88eb4d8365a Dragan Simic        2024-06-09    71  				};
def88eb4d8365a Dragan Simic        2024-06-09    72  			};
def88eb4d8365a Dragan Simic        2024-06-09    73  			cluster1 {
def88eb4d8365a Dragan Simic        2024-06-09    74  				core0 {
def88eb4d8365a Dragan Simic        2024-06-09    75  					cpu = <&cpu_b0>;
def88eb4d8365a Dragan Simic        2024-06-09    76  				};
def88eb4d8365a Dragan Simic        2024-06-09    77  				core1 {
def88eb4d8365a Dragan Simic        2024-06-09    78  					cpu = <&cpu_b1>;
def88eb4d8365a Dragan Simic        2024-06-09    79  				};
def88eb4d8365a Dragan Simic        2024-06-09    80  			};
def88eb4d8365a Dragan Simic        2024-06-09    81  			cluster2 {
def88eb4d8365a Dragan Simic        2024-06-09    82  				core0 {
def88eb4d8365a Dragan Simic        2024-06-09    83  					cpu = <&cpu_b2>;
def88eb4d8365a Dragan Simic        2024-06-09    84  				};
def88eb4d8365a Dragan Simic        2024-06-09    85  				core1 {
def88eb4d8365a Dragan Simic        2024-06-09    86  					cpu = <&cpu_b3>;
def88eb4d8365a Dragan Simic        2024-06-09    87  				};
def88eb4d8365a Dragan Simic        2024-06-09    88  			};
def88eb4d8365a Dragan Simic        2024-06-09    89  		};
def88eb4d8365a Dragan Simic        2024-06-09    90  
def88eb4d8365a Dragan Simic        2024-06-09    91  		cpu_l0: cpu@0 {
def88eb4d8365a Dragan Simic        2024-06-09    92  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09    93  			compatible = "arm,cortex-a55";
def88eb4d8365a Dragan Simic        2024-06-09    94  			reg = <0x0>;
def88eb4d8365a Dragan Simic        2024-06-09    95  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09    96  			capacity-dmips-mhz = <530>;
def88eb4d8365a Dragan Simic        2024-06-09    97  			clocks = <&scmi_clk SCMI_CLK_CPUL>;
def88eb4d8365a Dragan Simic        2024-06-09    98  			assigned-clocks = <&scmi_clk SCMI_CLK_CPUL>;
def88eb4d8365a Dragan Simic        2024-06-09    99  			assigned-clock-rates = <816000000>;
def88eb4d8365a Dragan Simic        2024-06-09   100  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   101  			i-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   102  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   103  			i-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   104  			d-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   105  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   106  			d-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   107  			next-level-cache = <&l2_cache_l0>;
def88eb4d8365a Dragan Simic        2024-06-09   108  			dynamic-power-coefficient = <228>;
def88eb4d8365a Dragan Simic        2024-06-09   109  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   110  		};
def88eb4d8365a Dragan Simic        2024-06-09   111  
def88eb4d8365a Dragan Simic        2024-06-09   112  		cpu_l1: cpu@100 {
def88eb4d8365a Dragan Simic        2024-06-09   113  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   114  			compatible = "arm,cortex-a55";
def88eb4d8365a Dragan Simic        2024-06-09   115  			reg = <0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   116  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   117  			capacity-dmips-mhz = <530>;
def88eb4d8365a Dragan Simic        2024-06-09   118  			clocks = <&scmi_clk SCMI_CLK_CPUL>;
def88eb4d8365a Dragan Simic        2024-06-09   119  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   120  			i-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   121  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   122  			i-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   123  			d-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   124  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   125  			d-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   126  			next-level-cache = <&l2_cache_l1>;
def88eb4d8365a Dragan Simic        2024-06-09   127  			dynamic-power-coefficient = <228>;
def88eb4d8365a Dragan Simic        2024-06-09   128  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   129  		};
def88eb4d8365a Dragan Simic        2024-06-09   130  
def88eb4d8365a Dragan Simic        2024-06-09   131  		cpu_l2: cpu@200 {
def88eb4d8365a Dragan Simic        2024-06-09   132  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   133  			compatible = "arm,cortex-a55";
def88eb4d8365a Dragan Simic        2024-06-09   134  			reg = <0x200>;
def88eb4d8365a Dragan Simic        2024-06-09   135  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   136  			capacity-dmips-mhz = <530>;
def88eb4d8365a Dragan Simic        2024-06-09   137  			clocks = <&scmi_clk SCMI_CLK_CPUL>;
def88eb4d8365a Dragan Simic        2024-06-09   138  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   139  			i-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   140  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   141  			i-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   142  			d-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   143  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   144  			d-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   145  			next-level-cache = <&l2_cache_l2>;
def88eb4d8365a Dragan Simic        2024-06-09   146  			dynamic-power-coefficient = <228>;
def88eb4d8365a Dragan Simic        2024-06-09   147  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   148  		};
def88eb4d8365a Dragan Simic        2024-06-09   149  
def88eb4d8365a Dragan Simic        2024-06-09   150  		cpu_l3: cpu@300 {
def88eb4d8365a Dragan Simic        2024-06-09   151  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   152  			compatible = "arm,cortex-a55";
def88eb4d8365a Dragan Simic        2024-06-09   153  			reg = <0x300>;
def88eb4d8365a Dragan Simic        2024-06-09   154  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   155  			capacity-dmips-mhz = <530>;
def88eb4d8365a Dragan Simic        2024-06-09   156  			clocks = <&scmi_clk SCMI_CLK_CPUL>;
def88eb4d8365a Dragan Simic        2024-06-09   157  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   158  			i-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   159  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   160  			i-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   161  			d-cache-size = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   162  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   163  			d-cache-sets = <128>;
def88eb4d8365a Dragan Simic        2024-06-09   164  			next-level-cache = <&l2_cache_l3>;
def88eb4d8365a Dragan Simic        2024-06-09   165  			dynamic-power-coefficient = <228>;
def88eb4d8365a Dragan Simic        2024-06-09   166  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   167  		};
def88eb4d8365a Dragan Simic        2024-06-09   168  
def88eb4d8365a Dragan Simic        2024-06-09   169  		cpu_b0: cpu@400 {
def88eb4d8365a Dragan Simic        2024-06-09   170  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   171  			compatible = "arm,cortex-a76";
def88eb4d8365a Dragan Simic        2024-06-09   172  			reg = <0x400>;
def88eb4d8365a Dragan Simic        2024-06-09   173  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   174  			capacity-dmips-mhz = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   175  			clocks = <&scmi_clk SCMI_CLK_CPUB01>;
def88eb4d8365a Dragan Simic        2024-06-09   176  			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB01>;
def88eb4d8365a Dragan Simic        2024-06-09   177  			assigned-clock-rates = <816000000>;
def88eb4d8365a Dragan Simic        2024-06-09   178  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   179  			i-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   180  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   181  			i-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   182  			d-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   183  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   184  			d-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   185  			next-level-cache = <&l2_cache_b0>;
def88eb4d8365a Dragan Simic        2024-06-09   186  			dynamic-power-coefficient = <416>;
def88eb4d8365a Dragan Simic        2024-06-09   187  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   188  		};
def88eb4d8365a Dragan Simic        2024-06-09   189  
def88eb4d8365a Dragan Simic        2024-06-09   190  		cpu_b1: cpu@500 {
def88eb4d8365a Dragan Simic        2024-06-09   191  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   192  			compatible = "arm,cortex-a76";
def88eb4d8365a Dragan Simic        2024-06-09   193  			reg = <0x500>;
def88eb4d8365a Dragan Simic        2024-06-09   194  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   195  			capacity-dmips-mhz = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   196  			clocks = <&scmi_clk SCMI_CLK_CPUB01>;
def88eb4d8365a Dragan Simic        2024-06-09   197  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   198  			i-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   199  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   200  			i-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   201  			d-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   202  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   203  			d-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   204  			next-level-cache = <&l2_cache_b1>;
def88eb4d8365a Dragan Simic        2024-06-09   205  			dynamic-power-coefficient = <416>;
def88eb4d8365a Dragan Simic        2024-06-09   206  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   207  		};
def88eb4d8365a Dragan Simic        2024-06-09   208  
def88eb4d8365a Dragan Simic        2024-06-09   209  		cpu_b2: cpu@600 {
def88eb4d8365a Dragan Simic        2024-06-09   210  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   211  			compatible = "arm,cortex-a76";
def88eb4d8365a Dragan Simic        2024-06-09   212  			reg = <0x600>;
def88eb4d8365a Dragan Simic        2024-06-09   213  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   214  			capacity-dmips-mhz = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   215  			clocks = <&scmi_clk SCMI_CLK_CPUB23>;
def88eb4d8365a Dragan Simic        2024-06-09   216  			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB23>;
def88eb4d8365a Dragan Simic        2024-06-09   217  			assigned-clock-rates = <816000000>;
def88eb4d8365a Dragan Simic        2024-06-09   218  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   219  			i-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   220  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   221  			i-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   222  			d-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   223  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   224  			d-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   225  			next-level-cache = <&l2_cache_b2>;
def88eb4d8365a Dragan Simic        2024-06-09   226  			dynamic-power-coefficient = <416>;
def88eb4d8365a Dragan Simic        2024-06-09   227  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   228  		};
def88eb4d8365a Dragan Simic        2024-06-09   229  
def88eb4d8365a Dragan Simic        2024-06-09   230  		cpu_b3: cpu@700 {
def88eb4d8365a Dragan Simic        2024-06-09   231  			device_type = "cpu";
def88eb4d8365a Dragan Simic        2024-06-09   232  			compatible = "arm,cortex-a76";
def88eb4d8365a Dragan Simic        2024-06-09   233  			reg = <0x700>;
def88eb4d8365a Dragan Simic        2024-06-09   234  			enable-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   235  			capacity-dmips-mhz = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   236  			clocks = <&scmi_clk SCMI_CLK_CPUB23>;
def88eb4d8365a Dragan Simic        2024-06-09   237  			cpu-idle-states = <&CPU_SLEEP>;
def88eb4d8365a Dragan Simic        2024-06-09   238  			i-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   239  			i-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   240  			i-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   241  			d-cache-size = <65536>;
def88eb4d8365a Dragan Simic        2024-06-09   242  			d-cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   243  			d-cache-sets = <256>;
def88eb4d8365a Dragan Simic        2024-06-09   244  			next-level-cache = <&l2_cache_b3>;
def88eb4d8365a Dragan Simic        2024-06-09   245  			dynamic-power-coefficient = <416>;
def88eb4d8365a Dragan Simic        2024-06-09   246  			#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   247  		};
def88eb4d8365a Dragan Simic        2024-06-09   248  
def88eb4d8365a Dragan Simic        2024-06-09   249  		idle-states {
def88eb4d8365a Dragan Simic        2024-06-09   250  			entry-method = "psci";
def88eb4d8365a Dragan Simic        2024-06-09   251  			CPU_SLEEP: cpu-sleep {
def88eb4d8365a Dragan Simic        2024-06-09   252  				compatible = "arm,idle-state";
def88eb4d8365a Dragan Simic        2024-06-09   253  				local-timer-stop;
def88eb4d8365a Dragan Simic        2024-06-09   254  				arm,psci-suspend-param = <0x0010000>;
def88eb4d8365a Dragan Simic        2024-06-09   255  				entry-latency-us = <100>;
def88eb4d8365a Dragan Simic        2024-06-09   256  				exit-latency-us = <120>;
def88eb4d8365a Dragan Simic        2024-06-09   257  				min-residency-us = <1000>;
def88eb4d8365a Dragan Simic        2024-06-09   258  			};
def88eb4d8365a Dragan Simic        2024-06-09   259  		};
def88eb4d8365a Dragan Simic        2024-06-09   260  
def88eb4d8365a Dragan Simic        2024-06-09   261  		l2_cache_l0: l2-cache-l0 {
def88eb4d8365a Dragan Simic        2024-06-09   262  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   263  			cache-size = <131072>;
def88eb4d8365a Dragan Simic        2024-06-09   264  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   265  			cache-sets = <512>;
def88eb4d8365a Dragan Simic        2024-06-09   266  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   267  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   268  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   269  		};
def88eb4d8365a Dragan Simic        2024-06-09   270  
def88eb4d8365a Dragan Simic        2024-06-09   271  		l2_cache_l1: l2-cache-l1 {
def88eb4d8365a Dragan Simic        2024-06-09   272  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   273  			cache-size = <131072>;
def88eb4d8365a Dragan Simic        2024-06-09   274  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   275  			cache-sets = <512>;
def88eb4d8365a Dragan Simic        2024-06-09   276  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   277  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   278  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   279  		};
def88eb4d8365a Dragan Simic        2024-06-09   280  
def88eb4d8365a Dragan Simic        2024-06-09   281  		l2_cache_l2: l2-cache-l2 {
def88eb4d8365a Dragan Simic        2024-06-09   282  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   283  			cache-size = <131072>;
def88eb4d8365a Dragan Simic        2024-06-09   284  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   285  			cache-sets = <512>;
def88eb4d8365a Dragan Simic        2024-06-09   286  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   287  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   288  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   289  		};
def88eb4d8365a Dragan Simic        2024-06-09   290  
def88eb4d8365a Dragan Simic        2024-06-09   291  		l2_cache_l3: l2-cache-l3 {
def88eb4d8365a Dragan Simic        2024-06-09   292  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   293  			cache-size = <131072>;
def88eb4d8365a Dragan Simic        2024-06-09   294  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   295  			cache-sets = <512>;
def88eb4d8365a Dragan Simic        2024-06-09   296  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   297  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   298  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   299  		};
def88eb4d8365a Dragan Simic        2024-06-09   300  
def88eb4d8365a Dragan Simic        2024-06-09   301  		l2_cache_b0: l2-cache-b0 {
def88eb4d8365a Dragan Simic        2024-06-09   302  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   303  			cache-size = <524288>;
def88eb4d8365a Dragan Simic        2024-06-09   304  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   305  			cache-sets = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   306  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   307  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   308  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   309  		};
def88eb4d8365a Dragan Simic        2024-06-09   310  
def88eb4d8365a Dragan Simic        2024-06-09   311  		l2_cache_b1: l2-cache-b1 {
def88eb4d8365a Dragan Simic        2024-06-09   312  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   313  			cache-size = <524288>;
def88eb4d8365a Dragan Simic        2024-06-09   314  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   315  			cache-sets = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   316  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   317  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   318  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   319  		};
def88eb4d8365a Dragan Simic        2024-06-09   320  
def88eb4d8365a Dragan Simic        2024-06-09   321  		l2_cache_b2: l2-cache-b2 {
def88eb4d8365a Dragan Simic        2024-06-09   322  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   323  			cache-size = <524288>;
def88eb4d8365a Dragan Simic        2024-06-09   324  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   325  			cache-sets = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   326  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   327  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   328  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   329  		};
def88eb4d8365a Dragan Simic        2024-06-09   330  
def88eb4d8365a Dragan Simic        2024-06-09   331  		l2_cache_b3: l2-cache-b3 {
def88eb4d8365a Dragan Simic        2024-06-09   332  			compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   333  			cache-size = <524288>;
def88eb4d8365a Dragan Simic        2024-06-09   334  			cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   335  			cache-sets = <1024>;
def88eb4d8365a Dragan Simic        2024-06-09   336  			cache-level = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   337  			cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   338  			next-level-cache = <&l3_cache>;
def88eb4d8365a Dragan Simic        2024-06-09   339  		};
df5f6f2f62b9b5 Dragan Simic        2024-09-26   340  	};
def88eb4d8365a Dragan Simic        2024-06-09   341  
df5f6f2f62b9b5 Dragan Simic        2024-09-26   342  	/*
df5f6f2f62b9b5 Dragan Simic        2024-09-26   343  	 * The L3 cache belongs to the DynamIQ Shared Unit (DSU),
df5f6f2f62b9b5 Dragan Simic        2024-09-26   344  	 * so it's represented here, outside the "cpus" node
df5f6f2f62b9b5 Dragan Simic        2024-09-26   345  	 */
def88eb4d8365a Dragan Simic        2024-06-09   346  	l3_cache: l3-cache {
def88eb4d8365a Dragan Simic        2024-06-09   347  		compatible = "cache";
def88eb4d8365a Dragan Simic        2024-06-09   348  		cache-size = <3145728>;
def88eb4d8365a Dragan Simic        2024-06-09   349  		cache-line-size = <64>;
def88eb4d8365a Dragan Simic        2024-06-09   350  		cache-sets = <4096>;
def88eb4d8365a Dragan Simic        2024-06-09   351  		cache-level = <3>;
def88eb4d8365a Dragan Simic        2024-06-09   352  		cache-unified;
def88eb4d8365a Dragan Simic        2024-06-09   353  	};
def88eb4d8365a Dragan Simic        2024-06-09   354  
def88eb4d8365a Dragan Simic        2024-06-09  @355  	display_subsystem: display-subsystem {
def88eb4d8365a Dragan Simic        2024-06-09   356  		compatible = "rockchip,display-subsystem";
def88eb4d8365a Dragan Simic        2024-06-09   357  		ports = <&vop_out>;
def88eb4d8365a Dragan Simic        2024-06-09   358  	};
def88eb4d8365a Dragan Simic        2024-06-09   359  
def88eb4d8365a Dragan Simic        2024-06-09   360  	firmware {
def88eb4d8365a Dragan Simic        2024-06-09   361  		optee: optee {
def88eb4d8365a Dragan Simic        2024-06-09   362  			compatible = "linaro,optee-tz";
def88eb4d8365a Dragan Simic        2024-06-09   363  			method = "smc";
def88eb4d8365a Dragan Simic        2024-06-09   364  		};
def88eb4d8365a Dragan Simic        2024-06-09   365  
def88eb4d8365a Dragan Simic        2024-06-09   366  		scmi: scmi {
def88eb4d8365a Dragan Simic        2024-06-09   367  			compatible = "arm,scmi-smc";
def88eb4d8365a Dragan Simic        2024-06-09   368  			arm,smc-id = <0x82000010>;
def88eb4d8365a Dragan Simic        2024-06-09   369  			shmem = <&scmi_shmem>;
def88eb4d8365a Dragan Simic        2024-06-09   370  			#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   371  			#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   372  
def88eb4d8365a Dragan Simic        2024-06-09   373  			scmi_clk: protocol@14 {
def88eb4d8365a Dragan Simic        2024-06-09   374  				reg = <0x14>;
def88eb4d8365a Dragan Simic        2024-06-09   375  				#clock-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   376  			};
def88eb4d8365a Dragan Simic        2024-06-09   377  
def88eb4d8365a Dragan Simic        2024-06-09   378  			scmi_reset: protocol@16 {
def88eb4d8365a Dragan Simic        2024-06-09   379  				reg = <0x16>;
def88eb4d8365a Dragan Simic        2024-06-09   380  				#reset-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   381  			};
def88eb4d8365a Dragan Simic        2024-06-09   382  		};
def88eb4d8365a Dragan Simic        2024-06-09   383  	};
def88eb4d8365a Dragan Simic        2024-06-09   384  
def88eb4d8365a Dragan Simic        2024-06-09   385  	pmu-a55 {
def88eb4d8365a Dragan Simic        2024-06-09   386  		compatible = "arm,cortex-a55-pmu";
def88eb4d8365a Dragan Simic        2024-06-09   387  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_partition0>;
def88eb4d8365a Dragan Simic        2024-06-09   388  	};
def88eb4d8365a Dragan Simic        2024-06-09   389  
def88eb4d8365a Dragan Simic        2024-06-09   390  	pmu-a76 {
def88eb4d8365a Dragan Simic        2024-06-09   391  		compatible = "arm,cortex-a76-pmu";
def88eb4d8365a Dragan Simic        2024-06-09   392  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_partition1>;
def88eb4d8365a Dragan Simic        2024-06-09   393  	};
def88eb4d8365a Dragan Simic        2024-06-09   394  
def88eb4d8365a Dragan Simic        2024-06-09   395  	psci {
def88eb4d8365a Dragan Simic        2024-06-09   396  		compatible = "arm,psci-1.0";
def88eb4d8365a Dragan Simic        2024-06-09   397  		method = "smc";
def88eb4d8365a Dragan Simic        2024-06-09   398  	};
def88eb4d8365a Dragan Simic        2024-06-09   399  
def88eb4d8365a Dragan Simic        2024-06-09   400  	spll: clock-0 {
def88eb4d8365a Dragan Simic        2024-06-09   401  		compatible = "fixed-clock";
def88eb4d8365a Dragan Simic        2024-06-09   402  		clock-frequency = <702000000>;
def88eb4d8365a Dragan Simic        2024-06-09   403  		clock-output-names = "spll";
def88eb4d8365a Dragan Simic        2024-06-09   404  		#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   405  	};
def88eb4d8365a Dragan Simic        2024-06-09   406  
def88eb4d8365a Dragan Simic        2024-06-09   407  	timer {
def88eb4d8365a Dragan Simic        2024-06-09   408  		compatible = "arm,armv8-timer";
def88eb4d8365a Dragan Simic        2024-06-09   409  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   410  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   411  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   412  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   413  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   414  		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
def88eb4d8365a Dragan Simic        2024-06-09   415  	};
def88eb4d8365a Dragan Simic        2024-06-09   416  
def88eb4d8365a Dragan Simic        2024-06-09   417  	xin24m: clock-1 {
def88eb4d8365a Dragan Simic        2024-06-09   418  		compatible = "fixed-clock";
def88eb4d8365a Dragan Simic        2024-06-09   419  		clock-frequency = <24000000>;
def88eb4d8365a Dragan Simic        2024-06-09   420  		clock-output-names = "xin24m";
def88eb4d8365a Dragan Simic        2024-06-09   421  		#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   422  	};
def88eb4d8365a Dragan Simic        2024-06-09   423  
def88eb4d8365a Dragan Simic        2024-06-09   424  	xin32k: clock-2 {
def88eb4d8365a Dragan Simic        2024-06-09   425  		compatible = "fixed-clock";
def88eb4d8365a Dragan Simic        2024-06-09   426  		clock-frequency = <32768>;
def88eb4d8365a Dragan Simic        2024-06-09   427  		clock-output-names = "xin32k";
def88eb4d8365a Dragan Simic        2024-06-09   428  		#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   429  	};
def88eb4d8365a Dragan Simic        2024-06-09   430  
def88eb4d8365a Dragan Simic        2024-06-09   431  	pmu_sram: sram@10f000 {
def88eb4d8365a Dragan Simic        2024-06-09   432  		compatible = "mmio-sram";
def88eb4d8365a Dragan Simic        2024-06-09   433  		reg = <0x0 0x0010f000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   434  		ranges = <0 0x0 0x0010f000 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   435  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   436  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   437  
def88eb4d8365a Dragan Simic        2024-06-09   438  		scmi_shmem: sram@0 {
def88eb4d8365a Dragan Simic        2024-06-09   439  			compatible = "arm,scmi-shmem";
def88eb4d8365a Dragan Simic        2024-06-09   440  			reg = <0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   441  		};
def88eb4d8365a Dragan Simic        2024-06-09   442  	};
def88eb4d8365a Dragan Simic        2024-06-09   443  
def88eb4d8365a Dragan Simic        2024-06-09   444  	gpu: gpu@fb000000 {
def88eb4d8365a Dragan Simic        2024-06-09   445  		compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
def88eb4d8365a Dragan Simic        2024-06-09   446  		reg = <0x0 0xfb000000 0x0 0x200000>;
def88eb4d8365a Dragan Simic        2024-06-09   447  		#cooling-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   448  		assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
def88eb4d8365a Dragan Simic        2024-06-09   449  		assigned-clock-rates = <200000000>;
def88eb4d8365a Dragan Simic        2024-06-09   450  		clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
def88eb4d8365a Dragan Simic        2024-06-09   451  			 <&cru CLK_GPU_STACKS>;
def88eb4d8365a Dragan Simic        2024-06-09   452  		clock-names = "core", "coregroup", "stacks";
def88eb4d8365a Dragan Simic        2024-06-09   453  		dynamic-power-coefficient = <2982>;
def88eb4d8365a Dragan Simic        2024-06-09   454  		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   455  			     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   456  			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   457  		interrupt-names = "job", "mmu", "gpu";
def88eb4d8365a Dragan Simic        2024-06-09   458  		power-domains = <&power RK3588_PD_GPU>;
def88eb4d8365a Dragan Simic        2024-06-09   459  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   460  	};
def88eb4d8365a Dragan Simic        2024-06-09   461  
def88eb4d8365a Dragan Simic        2024-06-09   462  	usb_host0_xhci: usb@fc000000 {
def88eb4d8365a Dragan Simic        2024-06-09   463  		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
def88eb4d8365a Dragan Simic        2024-06-09   464  		reg = <0x0 0xfc000000 0x0 0x400000>;
def88eb4d8365a Dragan Simic        2024-06-09   465  		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   466  		clocks = <&cru REF_CLK_USB3OTG0>, <&cru SUSPEND_CLK_USB3OTG0>,
def88eb4d8365a Dragan Simic        2024-06-09   467  			 <&cru ACLK_USB3OTG0>;
def88eb4d8365a Dragan Simic        2024-06-09   468  		clock-names = "ref_clk", "suspend_clk", "bus_clk";
def88eb4d8365a Dragan Simic        2024-06-09   469  		dr_mode = "otg";
def88eb4d8365a Dragan Simic        2024-06-09   470  		phys = <&u2phy0_otg>, <&usbdp_phy0 PHY_TYPE_USB3>;
def88eb4d8365a Dragan Simic        2024-06-09   471  		phy-names = "usb2-phy", "usb3-phy";
def88eb4d8365a Dragan Simic        2024-06-09   472  		phy_type = "utmi_wide";
def88eb4d8365a Dragan Simic        2024-06-09   473  		power-domains = <&power RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09   474  		resets = <&cru SRST_A_USB3OTG0>;
def88eb4d8365a Dragan Simic        2024-06-09   475  		snps,dis_enblslpm_quirk;
def88eb4d8365a Dragan Simic        2024-06-09   476  		snps,dis-u1-entry-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   477  		snps,dis-u2-entry-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   478  		snps,dis-u2-freeclk-exists-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   479  		snps,dis-del-phy-power-chg-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   480  		snps,dis-tx-ipgap-linecheck-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   481  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   482  	};
def88eb4d8365a Dragan Simic        2024-06-09   483  
def88eb4d8365a Dragan Simic        2024-06-09   484  	usb_host0_ehci: usb@fc800000 {
def88eb4d8365a Dragan Simic        2024-06-09   485  		compatible = "rockchip,rk3588-ehci", "generic-ehci";
def88eb4d8365a Dragan Simic        2024-06-09   486  		reg = <0x0 0xfc800000 0x0 0x40000>;
def88eb4d8365a Dragan Simic        2024-06-09   487  		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   488  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST_ARB0>, <&cru ACLK_USB>, <&u2phy2>;
def88eb4d8365a Dragan Simic        2024-06-09   489  		phys = <&u2phy2_host>;
def88eb4d8365a Dragan Simic        2024-06-09   490  		phy-names = "usb";
def88eb4d8365a Dragan Simic        2024-06-09   491  		power-domains = <&power RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09   492  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   493  	};
def88eb4d8365a Dragan Simic        2024-06-09   494  
def88eb4d8365a Dragan Simic        2024-06-09   495  	usb_host0_ohci: usb@fc840000 {
def88eb4d8365a Dragan Simic        2024-06-09   496  		compatible = "rockchip,rk3588-ohci", "generic-ohci";
def88eb4d8365a Dragan Simic        2024-06-09   497  		reg = <0x0 0xfc840000 0x0 0x40000>;
def88eb4d8365a Dragan Simic        2024-06-09   498  		interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   499  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST_ARB0>, <&cru ACLK_USB>, <&u2phy2>;
def88eb4d8365a Dragan Simic        2024-06-09   500  		phys = <&u2phy2_host>;
def88eb4d8365a Dragan Simic        2024-06-09   501  		phy-names = "usb";
def88eb4d8365a Dragan Simic        2024-06-09   502  		power-domains = <&power RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09   503  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   504  	};
def88eb4d8365a Dragan Simic        2024-06-09   505  
def88eb4d8365a Dragan Simic        2024-06-09   506  	usb_host1_ehci: usb@fc880000 {
def88eb4d8365a Dragan Simic        2024-06-09   507  		compatible = "rockchip,rk3588-ehci", "generic-ehci";
def88eb4d8365a Dragan Simic        2024-06-09   508  		reg = <0x0 0xfc880000 0x0 0x40000>;
def88eb4d8365a Dragan Simic        2024-06-09   509  		interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   510  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST_ARB1>, <&cru ACLK_USB>, <&u2phy3>;
def88eb4d8365a Dragan Simic        2024-06-09   511  		phys = <&u2phy3_host>;
def88eb4d8365a Dragan Simic        2024-06-09   512  		phy-names = "usb";
def88eb4d8365a Dragan Simic        2024-06-09   513  		power-domains = <&power RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09   514  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   515  	};
def88eb4d8365a Dragan Simic        2024-06-09   516  
def88eb4d8365a Dragan Simic        2024-06-09   517  	usb_host1_ohci: usb@fc8c0000 {
def88eb4d8365a Dragan Simic        2024-06-09   518  		compatible = "rockchip,rk3588-ohci", "generic-ohci";
def88eb4d8365a Dragan Simic        2024-06-09   519  		reg = <0x0 0xfc8c0000 0x0 0x40000>;
def88eb4d8365a Dragan Simic        2024-06-09   520  		interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   521  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST_ARB1>, <&cru ACLK_USB>, <&u2phy3>;
def88eb4d8365a Dragan Simic        2024-06-09   522  		phys = <&u2phy3_host>;
def88eb4d8365a Dragan Simic        2024-06-09   523  		phy-names = "usb";
def88eb4d8365a Dragan Simic        2024-06-09   524  		power-domains = <&power RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09   525  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   526  	};
def88eb4d8365a Dragan Simic        2024-06-09   527  
def88eb4d8365a Dragan Simic        2024-06-09   528  	usb_host2_xhci: usb@fcd00000 {
def88eb4d8365a Dragan Simic        2024-06-09   529  		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
def88eb4d8365a Dragan Simic        2024-06-09   530  		reg = <0x0 0xfcd00000 0x0 0x400000>;
def88eb4d8365a Dragan Simic        2024-06-09   531  		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   532  		clocks = <&cru REF_CLK_USB3OTG2>, <&cru SUSPEND_CLK_USB3OTG2>,
def88eb4d8365a Dragan Simic        2024-06-09   533  			 <&cru ACLK_USB3OTG2>, <&cru CLK_UTMI_OTG2>,
def88eb4d8365a Dragan Simic        2024-06-09   534  			 <&cru CLK_PIPEPHY2_PIPE_U3_G>;
def88eb4d8365a Dragan Simic        2024-06-09   535  		clock-names = "ref_clk", "suspend_clk", "bus_clk", "utmi", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09   536  		dr_mode = "host";
def88eb4d8365a Dragan Simic        2024-06-09   537  		phys = <&combphy2_psu PHY_TYPE_USB3>;
def88eb4d8365a Dragan Simic        2024-06-09   538  		phy-names = "usb3-phy";
def88eb4d8365a Dragan Simic        2024-06-09   539  		phy_type = "utmi_wide";
def88eb4d8365a Dragan Simic        2024-06-09   540  		resets = <&cru SRST_A_USB3OTG2>;
def88eb4d8365a Dragan Simic        2024-06-09   541  		snps,dis_enblslpm_quirk;
def88eb4d8365a Dragan Simic        2024-06-09   542  		snps,dis-u2-freeclk-exists-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   543  		snps,dis-del-phy-power-chg-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   544  		snps,dis-tx-ipgap-linecheck-quirk;
def88eb4d8365a Dragan Simic        2024-06-09   545  		snps,dis_rxdet_inp3_quirk;
def88eb4d8365a Dragan Simic        2024-06-09   546  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   547  	};
def88eb4d8365a Dragan Simic        2024-06-09   548  
def88eb4d8365a Dragan Simic        2024-06-09   549  	mmu600_pcie: iommu@fc900000 {
def88eb4d8365a Dragan Simic        2024-06-09   550  		compatible = "arm,smmu-v3";
def88eb4d8365a Dragan Simic        2024-06-09   551  		reg = <0x0 0xfc900000 0x0 0x200000>;
def88eb4d8365a Dragan Simic        2024-06-09   552  		interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   553  			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   554  			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   555  			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   556  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
def88eb4d8365a Dragan Simic        2024-06-09   557  		#iommu-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   558  	};
def88eb4d8365a Dragan Simic        2024-06-09   559  
def88eb4d8365a Dragan Simic        2024-06-09   560  	mmu600_php: iommu@fcb00000 {
def88eb4d8365a Dragan Simic        2024-06-09   561  		compatible = "arm,smmu-v3";
def88eb4d8365a Dragan Simic        2024-06-09   562  		reg = <0x0 0xfcb00000 0x0 0x200000>;
def88eb4d8365a Dragan Simic        2024-06-09   563  		interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   564  			     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   565  			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09   566  			     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   567  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
def88eb4d8365a Dragan Simic        2024-06-09   568  		#iommu-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   569  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   570  	};
def88eb4d8365a Dragan Simic        2024-06-09   571  
def88eb4d8365a Dragan Simic        2024-06-09   572  	pmu1grf: syscon@fd58a000 {
def88eb4d8365a Dragan Simic        2024-06-09   573  		compatible = "rockchip,rk3588-pmugrf", "syscon", "simple-mfd";
def88eb4d8365a Dragan Simic        2024-06-09   574  		reg = <0x0 0xfd58a000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09   575  	};
def88eb4d8365a Dragan Simic        2024-06-09   576  
def88eb4d8365a Dragan Simic        2024-06-09   577  	sys_grf: syscon@fd58c000 {
def88eb4d8365a Dragan Simic        2024-06-09   578  		compatible = "rockchip,rk3588-sys-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   579  		reg = <0x0 0xfd58c000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09   580  	};
def88eb4d8365a Dragan Simic        2024-06-09   581  
def88eb4d8365a Dragan Simic        2024-06-09   582  	vop_grf: syscon@fd5a4000 {
def88eb4d8365a Dragan Simic        2024-06-09   583  		compatible = "rockchip,rk3588-vop-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   584  		reg = <0x0 0xfd5a4000 0x0 0x2000>;
def88eb4d8365a Dragan Simic        2024-06-09   585  	};
def88eb4d8365a Dragan Simic        2024-06-09   586  
def88eb4d8365a Dragan Simic        2024-06-09   587  	vo0_grf: syscon@fd5a6000 {
5956ee09c82542 Cristian Ciocaltea  2024-08-28   588  		compatible = "rockchip,rk3588-vo0-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   589  		reg = <0x0 0xfd5a6000 0x0 0x2000>;
def88eb4d8365a Dragan Simic        2024-06-09   590  		clocks = <&cru PCLK_VO0GRF>;
def88eb4d8365a Dragan Simic        2024-06-09   591  	};
def88eb4d8365a Dragan Simic        2024-06-09   592  
def88eb4d8365a Dragan Simic        2024-06-09   593  	vo1_grf: syscon@fd5a8000 {
5956ee09c82542 Cristian Ciocaltea  2024-08-28   594  		compatible = "rockchip,rk3588-vo1-grf", "syscon";
5956ee09c82542 Cristian Ciocaltea  2024-08-28   595  		reg = <0x0 0xfd5a8000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   596  		clocks = <&cru PCLK_VO1GRF>;
def88eb4d8365a Dragan Simic        2024-06-09   597  	};
def88eb4d8365a Dragan Simic        2024-06-09   598  
def88eb4d8365a Dragan Simic        2024-06-09   599  	usb_grf: syscon@fd5ac000 {
def88eb4d8365a Dragan Simic        2024-06-09   600  		compatible = "rockchip,rk3588-usb-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   601  		reg = <0x0 0xfd5ac000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   602  	};
def88eb4d8365a Dragan Simic        2024-06-09   603  
def88eb4d8365a Dragan Simic        2024-06-09   604  	php_grf: syscon@fd5b0000 {
def88eb4d8365a Dragan Simic        2024-06-09   605  		compatible = "rockchip,rk3588-php-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   606  		reg = <0x0 0xfd5b0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09   607  	};
def88eb4d8365a Dragan Simic        2024-06-09   608  
def88eb4d8365a Dragan Simic        2024-06-09   609  	pipe_phy0_grf: syscon@fd5bc000 {
def88eb4d8365a Dragan Simic        2024-06-09   610  		compatible = "rockchip,rk3588-pipe-phy-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   611  		reg = <0x0 0xfd5bc000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   612  	};
def88eb4d8365a Dragan Simic        2024-06-09   613  
def88eb4d8365a Dragan Simic        2024-06-09   614  	pipe_phy2_grf: syscon@fd5c4000 {
def88eb4d8365a Dragan Simic        2024-06-09   615  		compatible = "rockchip,rk3588-pipe-phy-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   616  		reg = <0x0 0xfd5c4000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   617  	};
def88eb4d8365a Dragan Simic        2024-06-09   618  
def88eb4d8365a Dragan Simic        2024-06-09   619  	usbdpphy0_grf: syscon@fd5c8000 {
def88eb4d8365a Dragan Simic        2024-06-09   620  		compatible = "rockchip,rk3588-usbdpphy-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   621  		reg = <0x0 0xfd5c8000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   622  	};
def88eb4d8365a Dragan Simic        2024-06-09   623  
def88eb4d8365a Dragan Simic        2024-06-09   624  	usb2phy0_grf: syscon@fd5d0000 {
def88eb4d8365a Dragan Simic        2024-06-09   625  		compatible = "rockchip,rk3588-usb2phy-grf", "syscon", "simple-mfd";
def88eb4d8365a Dragan Simic        2024-06-09   626  		reg = <0x0 0xfd5d0000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   627  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   628  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   629  
def88eb4d8365a Dragan Simic        2024-06-09   630  		u2phy0: usb2phy@0 {
def88eb4d8365a Dragan Simic        2024-06-09   631  			compatible = "rockchip,rk3588-usb2phy";
def88eb4d8365a Dragan Simic        2024-06-09   632  			reg = <0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   633  			#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   634  			clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>;
def88eb4d8365a Dragan Simic        2024-06-09   635  			clock-names = "phyclk";
def88eb4d8365a Dragan Simic        2024-06-09   636  			clock-output-names = "usb480m_phy0";
def88eb4d8365a Dragan Simic        2024-06-09   637  			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   638  			resets = <&cru SRST_OTGPHY_U3_0>, <&cru SRST_P_USB2PHY_U3_0_GRF0>;
def88eb4d8365a Dragan Simic        2024-06-09   639  			reset-names = "phy", "apb";
def88eb4d8365a Dragan Simic        2024-06-09   640  			status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   641  
def88eb4d8365a Dragan Simic        2024-06-09   642  			u2phy0_otg: otg-port {
def88eb4d8365a Dragan Simic        2024-06-09   643  				#phy-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   644  				status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   645  			};
def88eb4d8365a Dragan Simic        2024-06-09   646  		};
def88eb4d8365a Dragan Simic        2024-06-09   647  	};
def88eb4d8365a Dragan Simic        2024-06-09   648  
def88eb4d8365a Dragan Simic        2024-06-09   649  	usb2phy2_grf: syscon@fd5d8000 {
def88eb4d8365a Dragan Simic        2024-06-09   650  		compatible = "rockchip,rk3588-usb2phy-grf", "syscon", "simple-mfd";
def88eb4d8365a Dragan Simic        2024-06-09   651  		reg = <0x0 0xfd5d8000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   652  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   653  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   654  
def88eb4d8365a Dragan Simic        2024-06-09   655  		u2phy2: usb2phy@8000 {
def88eb4d8365a Dragan Simic        2024-06-09   656  			compatible = "rockchip,rk3588-usb2phy";
def88eb4d8365a Dragan Simic        2024-06-09   657  			reg = <0x8000 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   658  			#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   659  			clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>;
def88eb4d8365a Dragan Simic        2024-06-09   660  			clock-names = "phyclk";
def88eb4d8365a Dragan Simic        2024-06-09   661  			clock-output-names = "usb480m_phy2";
def88eb4d8365a Dragan Simic        2024-06-09   662  			interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   663  			resets = <&cru SRST_OTGPHY_U2_0>, <&cru SRST_P_USB2PHY_U2_0_GRF0>;
def88eb4d8365a Dragan Simic        2024-06-09   664  			reset-names = "phy", "apb";
def88eb4d8365a Dragan Simic        2024-06-09   665  			status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   666  
def88eb4d8365a Dragan Simic        2024-06-09   667  			u2phy2_host: host-port {
def88eb4d8365a Dragan Simic        2024-06-09   668  				#phy-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   669  				status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   670  			};
def88eb4d8365a Dragan Simic        2024-06-09   671  		};
def88eb4d8365a Dragan Simic        2024-06-09   672  	};
def88eb4d8365a Dragan Simic        2024-06-09   673  
def88eb4d8365a Dragan Simic        2024-06-09   674  	usb2phy3_grf: syscon@fd5dc000 {
def88eb4d8365a Dragan Simic        2024-06-09   675  		compatible = "rockchip,rk3588-usb2phy-grf", "syscon", "simple-mfd";
def88eb4d8365a Dragan Simic        2024-06-09   676  		reg = <0x0 0xfd5dc000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09   677  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   678  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   679  
def88eb4d8365a Dragan Simic        2024-06-09   680  		u2phy3: usb2phy@c000 {
def88eb4d8365a Dragan Simic        2024-06-09   681  			compatible = "rockchip,rk3588-usb2phy";
def88eb4d8365a Dragan Simic        2024-06-09   682  			reg = <0xc000 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   683  			#clock-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   684  			clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>;
def88eb4d8365a Dragan Simic        2024-06-09   685  			clock-names = "phyclk";
def88eb4d8365a Dragan Simic        2024-06-09   686  			clock-output-names = "usb480m_phy3";
def88eb4d8365a Dragan Simic        2024-06-09   687  			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   688  			resets = <&cru SRST_OTGPHY_U2_1>, <&cru SRST_P_USB2PHY_U2_1_GRF0>;
def88eb4d8365a Dragan Simic        2024-06-09   689  			reset-names = "phy", "apb";
def88eb4d8365a Dragan Simic        2024-06-09   690  			status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   691  
def88eb4d8365a Dragan Simic        2024-06-09   692  			u2phy3_host: host-port {
def88eb4d8365a Dragan Simic        2024-06-09   693  				#phy-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   694  				status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   695  			};
def88eb4d8365a Dragan Simic        2024-06-09   696  		};
def88eb4d8365a Dragan Simic        2024-06-09   697  	};
def88eb4d8365a Dragan Simic        2024-06-09   698  
def88eb4d8365a Dragan Simic        2024-06-09   699  	hdptxphy0_grf: syscon@fd5e0000 {
def88eb4d8365a Dragan Simic        2024-06-09   700  		compatible = "rockchip,rk3588-hdptxphy-grf", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   701  		reg = <0x0 0xfd5e0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   702  	};
def88eb4d8365a Dragan Simic        2024-06-09   703  
def88eb4d8365a Dragan Simic        2024-06-09   704  	ioc: syscon@fd5f0000 {
def88eb4d8365a Dragan Simic        2024-06-09   705  		compatible = "rockchip,rk3588-ioc", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09   706  		reg = <0x0 0xfd5f0000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09   707  	};
def88eb4d8365a Dragan Simic        2024-06-09   708  
def88eb4d8365a Dragan Simic        2024-06-09   709  	system_sram1: sram@fd600000 {
def88eb4d8365a Dragan Simic        2024-06-09   710  		compatible = "mmio-sram";
def88eb4d8365a Dragan Simic        2024-06-09   711  		reg = <0x0 0xfd600000 0x0 0x100000>;
def88eb4d8365a Dragan Simic        2024-06-09   712  		ranges = <0x0 0x0 0xfd600000 0x100000>;
def88eb4d8365a Dragan Simic        2024-06-09   713  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   714  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   715  	};
def88eb4d8365a Dragan Simic        2024-06-09   716  
def88eb4d8365a Dragan Simic        2024-06-09   717  	cru: clock-controller@fd7c0000 {
def88eb4d8365a Dragan Simic        2024-06-09   718  		compatible = "rockchip,rk3588-cru";
def88eb4d8365a Dragan Simic        2024-06-09   719  		reg = <0x0 0xfd7c0000 0x0 0x5c000>;
def88eb4d8365a Dragan Simic        2024-06-09   720  		assigned-clocks =
def88eb4d8365a Dragan Simic        2024-06-09   721  			<&cru PLL_PPLL>, <&cru PLL_AUPLL>,
def88eb4d8365a Dragan Simic        2024-06-09   722  			<&cru PLL_NPLL>, <&cru PLL_GPLL>,
def88eb4d8365a Dragan Simic        2024-06-09   723  			<&cru ACLK_CENTER_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   724  			<&cru HCLK_CENTER_ROOT>, <&cru ACLK_CENTER_LOW_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   725  			<&cru ACLK_TOP_ROOT>, <&cru PCLK_TOP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   726  			<&cru ACLK_LOW_TOP_ROOT>, <&cru PCLK_PMU0_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   727  			<&cru HCLK_PMU_CM0_ROOT>, <&cru ACLK_VOP>,
def88eb4d8365a Dragan Simic        2024-06-09   728  			<&cru ACLK_BUS_ROOT>, <&cru CLK_150M_SRC>,
def88eb4d8365a Dragan Simic        2024-06-09   729  			<&cru CLK_GPU>;
def88eb4d8365a Dragan Simic        2024-06-09   730  		assigned-clock-rates =
def88eb4d8365a Dragan Simic        2024-06-09   731  			<1100000000>, <786432000>,
def88eb4d8365a Dragan Simic        2024-06-09   732  			<850000000>, <1188000000>,
def88eb4d8365a Dragan Simic        2024-06-09   733  			<702000000>,
def88eb4d8365a Dragan Simic        2024-06-09   734  			<400000000>, <500000000>,
def88eb4d8365a Dragan Simic        2024-06-09   735  			<800000000>, <100000000>,
def88eb4d8365a Dragan Simic        2024-06-09   736  			<400000000>, <100000000>,
def88eb4d8365a Dragan Simic        2024-06-09   737  			<200000000>, <500000000>,
def88eb4d8365a Dragan Simic        2024-06-09   738  			<375000000>, <150000000>,
def88eb4d8365a Dragan Simic        2024-06-09   739  			<200000000>;
def88eb4d8365a Dragan Simic        2024-06-09   740  		rockchip,grf = <&php_grf>;
def88eb4d8365a Dragan Simic        2024-06-09   741  		#clock-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   742  		#reset-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   743  	};
def88eb4d8365a Dragan Simic        2024-06-09   744  
def88eb4d8365a Dragan Simic        2024-06-09   745  	i2c0: i2c@fd880000 {
def88eb4d8365a Dragan Simic        2024-06-09   746  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09   747  		reg = <0x0 0xfd880000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09   748  		interrupts = <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   749  		clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
def88eb4d8365a Dragan Simic        2024-06-09   750  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09   751  		pinctrl-0 = <&i2c0m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09   752  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   753  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   754  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   755  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   756  	};
def88eb4d8365a Dragan Simic        2024-06-09   757  
def88eb4d8365a Dragan Simic        2024-06-09   758  	uart0: serial@fd890000 {
def88eb4d8365a Dragan Simic        2024-06-09   759  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09   760  		reg = <0x0 0xfd890000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09   761  		interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09   762  		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
def88eb4d8365a Dragan Simic        2024-06-09   763  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09   764  		dmas = <&dmac0 6>, <&dmac0 7>;
def88eb4d8365a Dragan Simic        2024-06-09   765  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09   766  		pinctrl-0 = <&uart0m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09   767  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   768  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09   769  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09   770  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   771  	};
def88eb4d8365a Dragan Simic        2024-06-09   772  
def88eb4d8365a Dragan Simic        2024-06-09   773  	pwm0: pwm@fd8b0000 {
def88eb4d8365a Dragan Simic        2024-06-09   774  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09   775  		reg = <0x0 0xfd8b0000 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   776  		clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
def88eb4d8365a Dragan Simic        2024-06-09   777  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09   778  		pinctrl-0 = <&pwm0m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09   779  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   780  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09   781  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   782  	};
def88eb4d8365a Dragan Simic        2024-06-09   783  
def88eb4d8365a Dragan Simic        2024-06-09   784  	pwm1: pwm@fd8b0010 {
def88eb4d8365a Dragan Simic        2024-06-09   785  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09   786  		reg = <0x0 0xfd8b0010 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   787  		clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
def88eb4d8365a Dragan Simic        2024-06-09   788  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09   789  		pinctrl-0 = <&pwm1m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09   790  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   791  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09   792  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   793  	};
def88eb4d8365a Dragan Simic        2024-06-09   794  
def88eb4d8365a Dragan Simic        2024-06-09   795  	pwm2: pwm@fd8b0020 {
def88eb4d8365a Dragan Simic        2024-06-09   796  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09   797  		reg = <0x0 0xfd8b0020 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   798  		clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
def88eb4d8365a Dragan Simic        2024-06-09   799  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09   800  		pinctrl-0 = <&pwm2m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09   801  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   802  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09   803  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   804  	};
def88eb4d8365a Dragan Simic        2024-06-09   805  
def88eb4d8365a Dragan Simic        2024-06-09   806  	pwm3: pwm@fd8b0030 {
def88eb4d8365a Dragan Simic        2024-06-09   807  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09   808  		reg = <0x0 0xfd8b0030 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09   809  		clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
def88eb4d8365a Dragan Simic        2024-06-09   810  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09   811  		pinctrl-0 = <&pwm3m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09   812  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09   813  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09   814  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09   815  	};
def88eb4d8365a Dragan Simic        2024-06-09   816  
def88eb4d8365a Dragan Simic        2024-06-09   817  	pmu: power-management@fd8d8000 {
def88eb4d8365a Dragan Simic        2024-06-09   818  		compatible = "rockchip,rk3588-pmu", "syscon", "simple-mfd";
def88eb4d8365a Dragan Simic        2024-06-09   819  		reg = <0x0 0xfd8d8000 0x0 0x400>;
def88eb4d8365a Dragan Simic        2024-06-09   820  
def88eb4d8365a Dragan Simic        2024-06-09   821  		power: power-controller {
def88eb4d8365a Dragan Simic        2024-06-09   822  			compatible = "rockchip,rk3588-power-controller";
def88eb4d8365a Dragan Simic        2024-06-09   823  			#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   824  			#power-domain-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   825  			#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   826  			status = "okay";
def88eb4d8365a Dragan Simic        2024-06-09   827  
def88eb4d8365a Dragan Simic        2024-06-09   828  			/* These power domains are grouped by VD_NPU */
def88eb4d8365a Dragan Simic        2024-06-09   829  			power-domain@RK3588_PD_NPU {
def88eb4d8365a Dragan Simic        2024-06-09   830  				reg = <RK3588_PD_NPU>;
def88eb4d8365a Dragan Simic        2024-06-09   831  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   832  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   833  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   834  
def88eb4d8365a Dragan Simic        2024-06-09   835  				power-domain@RK3588_PD_NPUTOP {
def88eb4d8365a Dragan Simic        2024-06-09   836  					reg = <RK3588_PD_NPUTOP>;
def88eb4d8365a Dragan Simic        2024-06-09   837  					clocks = <&cru HCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   838  						 <&cru PCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   839  						 <&cru CLK_NPU_DSU0>,
def88eb4d8365a Dragan Simic        2024-06-09   840  						 <&cru HCLK_NPU_CM0_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09   841  					pm_qos = <&qos_npu0_mwr>,
def88eb4d8365a Dragan Simic        2024-06-09   842  						 <&qos_npu0_mro>,
def88eb4d8365a Dragan Simic        2024-06-09   843  						 <&qos_mcu_npu>;
def88eb4d8365a Dragan Simic        2024-06-09   844  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   845  					#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   846  					#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   847  
def88eb4d8365a Dragan Simic        2024-06-09   848  					power-domain@RK3588_PD_NPU1 {
def88eb4d8365a Dragan Simic        2024-06-09   849  						reg = <RK3588_PD_NPU1>;
def88eb4d8365a Dragan Simic        2024-06-09   850  						clocks = <&cru HCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   851  							 <&cru PCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   852  							 <&cru CLK_NPU_DSU0>;
def88eb4d8365a Dragan Simic        2024-06-09   853  						pm_qos = <&qos_npu1>;
def88eb4d8365a Dragan Simic        2024-06-09   854  						#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   855  					};
def88eb4d8365a Dragan Simic        2024-06-09   856  					power-domain@RK3588_PD_NPU2 {
def88eb4d8365a Dragan Simic        2024-06-09   857  						reg = <RK3588_PD_NPU2>;
def88eb4d8365a Dragan Simic        2024-06-09   858  						clocks = <&cru HCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   859  							 <&cru PCLK_NPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   860  							 <&cru CLK_NPU_DSU0>;
def88eb4d8365a Dragan Simic        2024-06-09   861  						pm_qos = <&qos_npu2>;
def88eb4d8365a Dragan Simic        2024-06-09   862  						#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   863  					};
def88eb4d8365a Dragan Simic        2024-06-09   864  				};
def88eb4d8365a Dragan Simic        2024-06-09   865  			};
def88eb4d8365a Dragan Simic        2024-06-09   866  			/* These power domains are grouped by VD_GPU */
def88eb4d8365a Dragan Simic        2024-06-09   867  			power-domain@RK3588_PD_GPU {
def88eb4d8365a Dragan Simic        2024-06-09   868  				reg = <RK3588_PD_GPU>;
def88eb4d8365a Dragan Simic        2024-06-09   869  				clocks = <&cru CLK_GPU>,
def88eb4d8365a Dragan Simic        2024-06-09   870  					 <&cru CLK_GPU_COREGROUP>,
def88eb4d8365a Dragan Simic        2024-06-09   871  					 <&cru CLK_GPU_STACKS>;
def88eb4d8365a Dragan Simic        2024-06-09   872  				pm_qos = <&qos_gpu_m0>,
def88eb4d8365a Dragan Simic        2024-06-09   873  					 <&qos_gpu_m1>,
def88eb4d8365a Dragan Simic        2024-06-09   874  					 <&qos_gpu_m2>,
def88eb4d8365a Dragan Simic        2024-06-09   875  					 <&qos_gpu_m3>;
def88eb4d8365a Dragan Simic        2024-06-09   876  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   877  			};
def88eb4d8365a Dragan Simic        2024-06-09   878  			/* These power domains are grouped by VD_VCODEC */
def88eb4d8365a Dragan Simic        2024-06-09   879  			power-domain@RK3588_PD_VCODEC {
def88eb4d8365a Dragan Simic        2024-06-09   880  				reg = <RK3588_PD_VCODEC>;
def88eb4d8365a Dragan Simic        2024-06-09   881  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   882  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   883  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   884  
def88eb4d8365a Dragan Simic        2024-06-09   885  				power-domain@RK3588_PD_RKVDEC0 {
def88eb4d8365a Dragan Simic        2024-06-09   886  					reg = <RK3588_PD_RKVDEC0>;
def88eb4d8365a Dragan Simic        2024-06-09   887  					clocks = <&cru HCLK_RKVDEC0>,
def88eb4d8365a Dragan Simic        2024-06-09   888  						 <&cru HCLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   889  						 <&cru ACLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   890  						 <&cru ACLK_RKVDEC0>,
def88eb4d8365a Dragan Simic        2024-06-09   891  						 <&cru ACLK_RKVDEC_CCU>;
def88eb4d8365a Dragan Simic        2024-06-09   892  					pm_qos = <&qos_rkvdec0>;
def88eb4d8365a Dragan Simic        2024-06-09   893  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   894  				};
def88eb4d8365a Dragan Simic        2024-06-09   895  				power-domain@RK3588_PD_RKVDEC1 {
def88eb4d8365a Dragan Simic        2024-06-09   896  					reg = <RK3588_PD_RKVDEC1>;
def88eb4d8365a Dragan Simic        2024-06-09   897  					clocks = <&cru HCLK_RKVDEC1>,
def88eb4d8365a Dragan Simic        2024-06-09   898  						 <&cru HCLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   899  						 <&cru ACLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   900  						 <&cru ACLK_RKVDEC1>;
def88eb4d8365a Dragan Simic        2024-06-09   901  					pm_qos = <&qos_rkvdec1>;
def88eb4d8365a Dragan Simic        2024-06-09   902  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   903  				};
def88eb4d8365a Dragan Simic        2024-06-09   904  				power-domain@RK3588_PD_VENC0 {
def88eb4d8365a Dragan Simic        2024-06-09   905  					reg = <RK3588_PD_VENC0>;
def88eb4d8365a Dragan Simic        2024-06-09   906  					clocks = <&cru HCLK_RKVENC0>,
def88eb4d8365a Dragan Simic        2024-06-09   907  						 <&cru ACLK_RKVENC0>;
def88eb4d8365a Dragan Simic        2024-06-09   908  					pm_qos = <&qos_rkvenc0_m0ro>,
def88eb4d8365a Dragan Simic        2024-06-09   909  						 <&qos_rkvenc0_m1ro>,
def88eb4d8365a Dragan Simic        2024-06-09   910  						 <&qos_rkvenc0_m2wo>;
def88eb4d8365a Dragan Simic        2024-06-09   911  					#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   912  					#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   913  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   914  
def88eb4d8365a Dragan Simic        2024-06-09   915  					power-domain@RK3588_PD_VENC1 {
def88eb4d8365a Dragan Simic        2024-06-09   916  						reg = <RK3588_PD_VENC1>;
def88eb4d8365a Dragan Simic        2024-06-09   917  						clocks = <&cru HCLK_RKVENC1>,
def88eb4d8365a Dragan Simic        2024-06-09   918  							 <&cru HCLK_RKVENC0>,
def88eb4d8365a Dragan Simic        2024-06-09   919  							 <&cru ACLK_RKVENC0>,
def88eb4d8365a Dragan Simic        2024-06-09   920  							 <&cru ACLK_RKVENC1>;
def88eb4d8365a Dragan Simic        2024-06-09   921  						pm_qos = <&qos_rkvenc1_m0ro>,
def88eb4d8365a Dragan Simic        2024-06-09   922  							 <&qos_rkvenc1_m1ro>,
def88eb4d8365a Dragan Simic        2024-06-09   923  							 <&qos_rkvenc1_m2wo>;
def88eb4d8365a Dragan Simic        2024-06-09   924  						#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   925  					};
def88eb4d8365a Dragan Simic        2024-06-09   926  				};
def88eb4d8365a Dragan Simic        2024-06-09   927  			};
def88eb4d8365a Dragan Simic        2024-06-09   928  			/* These power domains are grouped by VD_LOGIC */
def88eb4d8365a Dragan Simic        2024-06-09   929  			power-domain@RK3588_PD_VDPU {
def88eb4d8365a Dragan Simic        2024-06-09   930  				reg = <RK3588_PD_VDPU>;
def88eb4d8365a Dragan Simic        2024-06-09   931  				clocks = <&cru HCLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   932  					 <&cru ACLK_VDPU_LOW_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   933  					 <&cru ACLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   934  					 <&cru ACLK_JPEG_DECODER_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   935  					 <&cru ACLK_IEP2P0>,
def88eb4d8365a Dragan Simic        2024-06-09   936  					 <&cru HCLK_IEP2P0>,
def88eb4d8365a Dragan Simic        2024-06-09   937  					 <&cru ACLK_JPEG_ENCODER0>,
def88eb4d8365a Dragan Simic        2024-06-09   938  					 <&cru HCLK_JPEG_ENCODER0>,
def88eb4d8365a Dragan Simic        2024-06-09   939  					 <&cru ACLK_JPEG_ENCODER1>,
def88eb4d8365a Dragan Simic        2024-06-09   940  					 <&cru HCLK_JPEG_ENCODER1>,
def88eb4d8365a Dragan Simic        2024-06-09   941  					 <&cru ACLK_JPEG_ENCODER2>,
def88eb4d8365a Dragan Simic        2024-06-09   942  					 <&cru HCLK_JPEG_ENCODER2>,
def88eb4d8365a Dragan Simic        2024-06-09   943  					 <&cru ACLK_JPEG_ENCODER3>,
def88eb4d8365a Dragan Simic        2024-06-09   944  					 <&cru HCLK_JPEG_ENCODER3>,
def88eb4d8365a Dragan Simic        2024-06-09   945  					 <&cru ACLK_JPEG_DECODER>,
def88eb4d8365a Dragan Simic        2024-06-09   946  					 <&cru HCLK_JPEG_DECODER>,
def88eb4d8365a Dragan Simic        2024-06-09   947  					 <&cru ACLK_RGA2>,
def88eb4d8365a Dragan Simic        2024-06-09   948  					 <&cru HCLK_RGA2>;
def88eb4d8365a Dragan Simic        2024-06-09   949  				pm_qos = <&qos_iep>,
def88eb4d8365a Dragan Simic        2024-06-09   950  					 <&qos_jpeg_dec>,
def88eb4d8365a Dragan Simic        2024-06-09   951  					 <&qos_jpeg_enc0>,
def88eb4d8365a Dragan Simic        2024-06-09   952  					 <&qos_jpeg_enc1>,
def88eb4d8365a Dragan Simic        2024-06-09   953  					 <&qos_jpeg_enc2>,
def88eb4d8365a Dragan Simic        2024-06-09   954  					 <&qos_jpeg_enc3>,
def88eb4d8365a Dragan Simic        2024-06-09   955  					 <&qos_rga2_mro>,
def88eb4d8365a Dragan Simic        2024-06-09   956  					 <&qos_rga2_mwo>;
def88eb4d8365a Dragan Simic        2024-06-09   957  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09   958  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   959  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   960  
def88eb4d8365a Dragan Simic        2024-06-09   961  
def88eb4d8365a Dragan Simic        2024-06-09   962  				power-domain@RK3588_PD_AV1 {
def88eb4d8365a Dragan Simic        2024-06-09   963  					reg = <RK3588_PD_AV1>;
def88eb4d8365a Dragan Simic        2024-06-09   964  					clocks = <&cru PCLK_AV1>,
def88eb4d8365a Dragan Simic        2024-06-09   965  						 <&cru ACLK_AV1>,
def88eb4d8365a Dragan Simic        2024-06-09   966  						 <&cru HCLK_VDPU_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09   967  					pm_qos = <&qos_av1>;
def88eb4d8365a Dragan Simic        2024-06-09   968  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   969  				};
def88eb4d8365a Dragan Simic        2024-06-09   970  				power-domain@RK3588_PD_RKVDEC0 {
def88eb4d8365a Dragan Simic        2024-06-09   971  					reg = <RK3588_PD_RKVDEC0>;
def88eb4d8365a Dragan Simic        2024-06-09   972  					clocks = <&cru HCLK_RKVDEC0>,
def88eb4d8365a Dragan Simic        2024-06-09   973  						 <&cru HCLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   974  						 <&cru ACLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   975  						 <&cru ACLK_RKVDEC0>;
def88eb4d8365a Dragan Simic        2024-06-09   976  					pm_qos = <&qos_rkvdec0>;
def88eb4d8365a Dragan Simic        2024-06-09   977  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   978  				};
def88eb4d8365a Dragan Simic        2024-06-09   979  				power-domain@RK3588_PD_RKVDEC1 {
def88eb4d8365a Dragan Simic        2024-06-09   980  					reg = <RK3588_PD_RKVDEC1>;
def88eb4d8365a Dragan Simic        2024-06-09   981  					clocks = <&cru HCLK_RKVDEC1>,
def88eb4d8365a Dragan Simic        2024-06-09   982  						 <&cru HCLK_VDPU_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   983  						 <&cru ACLK_VDPU_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09   984  					pm_qos = <&qos_rkvdec1>;
def88eb4d8365a Dragan Simic        2024-06-09   985  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   986  				};
def88eb4d8365a Dragan Simic        2024-06-09   987  				power-domain@RK3588_PD_RGA30 {
def88eb4d8365a Dragan Simic        2024-06-09   988  					reg = <RK3588_PD_RGA30>;
def88eb4d8365a Dragan Simic        2024-06-09   989  					clocks = <&cru ACLK_RGA3_0>,
def88eb4d8365a Dragan Simic        2024-06-09   990  						 <&cru HCLK_RGA3_0>;
def88eb4d8365a Dragan Simic        2024-06-09   991  					pm_qos = <&qos_rga3_0>;
def88eb4d8365a Dragan Simic        2024-06-09   992  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09   993  				};
def88eb4d8365a Dragan Simic        2024-06-09   994  			};
def88eb4d8365a Dragan Simic        2024-06-09   995  			power-domain@RK3588_PD_VOP {
def88eb4d8365a Dragan Simic        2024-06-09   996  				reg = <RK3588_PD_VOP>;
def88eb4d8365a Dragan Simic        2024-06-09   997  				clocks = <&cru PCLK_VOP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   998  					 <&cru HCLK_VOP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09   999  					 <&cru ACLK_VOP>;
def88eb4d8365a Dragan Simic        2024-06-09  1000  				pm_qos = <&qos_vop_m0>,
def88eb4d8365a Dragan Simic        2024-06-09  1001  					 <&qos_vop_m1>;
def88eb4d8365a Dragan Simic        2024-06-09  1002  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1003  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1004  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1005  
def88eb4d8365a Dragan Simic        2024-06-09  1006  				power-domain@RK3588_PD_VO0 {
def88eb4d8365a Dragan Simic        2024-06-09  1007  					reg = <RK3588_PD_VO0>;
def88eb4d8365a Dragan Simic        2024-06-09  1008  					clocks = <&cru PCLK_VO0_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1009  						 <&cru PCLK_VO0_S_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1010  						 <&cru HCLK_VO0_S_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1011  						 <&cru ACLK_VO0_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1012  						 <&cru HCLK_HDCP0>,
def88eb4d8365a Dragan Simic        2024-06-09  1013  						 <&cru ACLK_HDCP0>,
def88eb4d8365a Dragan Simic        2024-06-09  1014  						 <&cru HCLK_VOP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1015  					pm_qos = <&qos_hdcp0>;
def88eb4d8365a Dragan Simic        2024-06-09  1016  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1017  				};
def88eb4d8365a Dragan Simic        2024-06-09  1018  			};
def88eb4d8365a Dragan Simic        2024-06-09  1019  			power-domain@RK3588_PD_VO1 {
def88eb4d8365a Dragan Simic        2024-06-09  1020  				reg = <RK3588_PD_VO1>;
def88eb4d8365a Dragan Simic        2024-06-09  1021  				clocks = <&cru PCLK_VO1_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1022  					 <&cru PCLK_VO1_S_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1023  					 <&cru HCLK_VO1_S_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1024  					 <&cru HCLK_HDCP1>,
def88eb4d8365a Dragan Simic        2024-06-09  1025  					 <&cru ACLK_HDCP1>,
def88eb4d8365a Dragan Simic        2024-06-09  1026  					 <&cru ACLK_HDMIRX_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1027  					 <&cru HCLK_VO1USB_TOP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1028  				pm_qos = <&qos_hdcp1>,
def88eb4d8365a Dragan Simic        2024-06-09  1029  					 <&qos_hdmirx>;
def88eb4d8365a Dragan Simic        2024-06-09  1030  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1031  			};
def88eb4d8365a Dragan Simic        2024-06-09  1032  			power-domain@RK3588_PD_VI {
def88eb4d8365a Dragan Simic        2024-06-09  1033  				reg = <RK3588_PD_VI>;
def88eb4d8365a Dragan Simic        2024-06-09  1034  				clocks = <&cru HCLK_VI_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1035  					 <&cru PCLK_VI_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1036  					 <&cru HCLK_ISP0>,
def88eb4d8365a Dragan Simic        2024-06-09  1037  					 <&cru ACLK_ISP0>,
def88eb4d8365a Dragan Simic        2024-06-09  1038  					 <&cru HCLK_VICAP>,
def88eb4d8365a Dragan Simic        2024-06-09  1039  					 <&cru ACLK_VICAP>;
def88eb4d8365a Dragan Simic        2024-06-09  1040  				pm_qos = <&qos_isp0_mro>,
def88eb4d8365a Dragan Simic        2024-06-09  1041  					 <&qos_isp0_mwo>,
def88eb4d8365a Dragan Simic        2024-06-09  1042  					 <&qos_vicap_m0>,
def88eb4d8365a Dragan Simic        2024-06-09  1043  					 <&qos_vicap_m1>;
def88eb4d8365a Dragan Simic        2024-06-09  1044  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1045  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1046  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1047  
def88eb4d8365a Dragan Simic        2024-06-09  1048  				power-domain@RK3588_PD_ISP1 {
def88eb4d8365a Dragan Simic        2024-06-09  1049  					reg = <RK3588_PD_ISP1>;
def88eb4d8365a Dragan Simic        2024-06-09  1050  					clocks = <&cru HCLK_ISP1>,
def88eb4d8365a Dragan Simic        2024-06-09  1051  						 <&cru ACLK_ISP1>,
def88eb4d8365a Dragan Simic        2024-06-09  1052  						 <&cru HCLK_VI_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1053  						 <&cru PCLK_VI_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1054  					pm_qos = <&qos_isp1_mwo>,
def88eb4d8365a Dragan Simic        2024-06-09  1055  						 <&qos_isp1_mro>;
def88eb4d8365a Dragan Simic        2024-06-09  1056  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1057  				};
def88eb4d8365a Dragan Simic        2024-06-09  1058  				power-domain@RK3588_PD_FEC {
def88eb4d8365a Dragan Simic        2024-06-09  1059  					reg = <RK3588_PD_FEC>;
def88eb4d8365a Dragan Simic        2024-06-09  1060  					clocks = <&cru HCLK_FISHEYE0>,
def88eb4d8365a Dragan Simic        2024-06-09  1061  						 <&cru ACLK_FISHEYE0>,
def88eb4d8365a Dragan Simic        2024-06-09  1062  						 <&cru HCLK_FISHEYE1>,
def88eb4d8365a Dragan Simic        2024-06-09  1063  						 <&cru ACLK_FISHEYE1>,
def88eb4d8365a Dragan Simic        2024-06-09  1064  						 <&cru PCLK_VI_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1065  					pm_qos = <&qos_fisheye0>,
def88eb4d8365a Dragan Simic        2024-06-09  1066  						 <&qos_fisheye1>;
def88eb4d8365a Dragan Simic        2024-06-09  1067  					#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1068  				};
def88eb4d8365a Dragan Simic        2024-06-09  1069  			};
def88eb4d8365a Dragan Simic        2024-06-09  1070  			power-domain@RK3588_PD_RGA31 {
def88eb4d8365a Dragan Simic        2024-06-09  1071  				reg = <RK3588_PD_RGA31>;
def88eb4d8365a Dragan Simic        2024-06-09  1072  				clocks = <&cru HCLK_RGA3_1>,
def88eb4d8365a Dragan Simic        2024-06-09  1073  					 <&cru ACLK_RGA3_1>;
def88eb4d8365a Dragan Simic        2024-06-09  1074  				pm_qos = <&qos_rga3_1>;
def88eb4d8365a Dragan Simic        2024-06-09  1075  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1076  			};
def88eb4d8365a Dragan Simic        2024-06-09  1077  			power-domain@RK3588_PD_USB {
def88eb4d8365a Dragan Simic        2024-06-09  1078  				reg = <RK3588_PD_USB>;
def88eb4d8365a Dragan Simic        2024-06-09  1079  				clocks = <&cru PCLK_PHP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1080  					 <&cru ACLK_USB_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1081  					 <&cru ACLK_USB>,
def88eb4d8365a Dragan Simic        2024-06-09  1082  					 <&cru HCLK_USB_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1083  					 <&cru HCLK_HOST0>,
def88eb4d8365a Dragan Simic        2024-06-09  1084  					 <&cru HCLK_HOST_ARB0>,
def88eb4d8365a Dragan Simic        2024-06-09  1085  					 <&cru HCLK_HOST1>,
def88eb4d8365a Dragan Simic        2024-06-09  1086  					 <&cru HCLK_HOST_ARB1>;
def88eb4d8365a Dragan Simic        2024-06-09  1087  				pm_qos = <&qos_usb3_0>,
def88eb4d8365a Dragan Simic        2024-06-09  1088  					 <&qos_usb3_1>,
def88eb4d8365a Dragan Simic        2024-06-09  1089  					 <&qos_usb2host_0>,
def88eb4d8365a Dragan Simic        2024-06-09  1090  					 <&qos_usb2host_1>;
def88eb4d8365a Dragan Simic        2024-06-09  1091  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1092  			};
def88eb4d8365a Dragan Simic        2024-06-09  1093  			power-domain@RK3588_PD_GMAC {
def88eb4d8365a Dragan Simic        2024-06-09  1094  				reg = <RK3588_PD_GMAC>;
def88eb4d8365a Dragan Simic        2024-06-09  1095  				clocks = <&cru PCLK_PHP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1096  					 <&cru ACLK_PCIE_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1097  					 <&cru ACLK_PHP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1098  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1099  			};
def88eb4d8365a Dragan Simic        2024-06-09  1100  			power-domain@RK3588_PD_PCIE {
def88eb4d8365a Dragan Simic        2024-06-09  1101  				reg = <RK3588_PD_PCIE>;
def88eb4d8365a Dragan Simic        2024-06-09  1102  				clocks = <&cru PCLK_PHP_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1103  					 <&cru ACLK_PCIE_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1104  					 <&cru ACLK_PHP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1105  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1106  			};
def88eb4d8365a Dragan Simic        2024-06-09  1107  			power-domain@RK3588_PD_SDIO {
def88eb4d8365a Dragan Simic        2024-06-09  1108  				reg = <RK3588_PD_SDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  1109  				clocks = <&cru HCLK_SDIO>,
def88eb4d8365a Dragan Simic        2024-06-09  1110  					 <&cru HCLK_NVM_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1111  				pm_qos = <&qos_sdio>;
def88eb4d8365a Dragan Simic        2024-06-09  1112  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1113  			};
def88eb4d8365a Dragan Simic        2024-06-09  1114  			power-domain@RK3588_PD_AUDIO {
def88eb4d8365a Dragan Simic        2024-06-09  1115  				reg = <RK3588_PD_AUDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  1116  				clocks = <&cru HCLK_AUDIO_ROOT>,
def88eb4d8365a Dragan Simic        2024-06-09  1117  					 <&cru PCLK_AUDIO_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1118  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1119  			};
def88eb4d8365a Dragan Simic        2024-06-09  1120  			power-domain@RK3588_PD_SDMMC {
def88eb4d8365a Dragan Simic        2024-06-09  1121  				reg = <RK3588_PD_SDMMC>;
def88eb4d8365a Dragan Simic        2024-06-09  1122  				pm_qos = <&qos_sdmmc>;
def88eb4d8365a Dragan Simic        2024-06-09  1123  				#power-domain-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1124  			};
def88eb4d8365a Dragan Simic        2024-06-09  1125  		};
def88eb4d8365a Dragan Simic        2024-06-09  1126  	};
def88eb4d8365a Dragan Simic        2024-06-09  1127  
6166b1c0084e05 Jianfeng Liu        2024-08-27  1128  	vpu121: video-codec@fdb50000 {
6166b1c0084e05 Jianfeng Liu        2024-08-27  1129  		compatible = "rockchip,rk3588-vpu121", "rockchip,rk3568-vpu";
6166b1c0084e05 Jianfeng Liu        2024-08-27  1130  		reg = <0x0 0xfdb50000 0x0 0x800>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1131  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1132  		interrupt-names = "vdpu";
6166b1c0084e05 Jianfeng Liu        2024-08-27  1133  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1134  		clock-names = "aclk", "hclk";
6166b1c0084e05 Jianfeng Liu        2024-08-27  1135  		iommus = <&vpu121_mmu>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1136  		power-domains = <&power RK3588_PD_VDPU>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1137  	};
6166b1c0084e05 Jianfeng Liu        2024-08-27  1138  
6166b1c0084e05 Jianfeng Liu        2024-08-27  1139  	vpu121_mmu: iommu@fdb50800 {
6166b1c0084e05 Jianfeng Liu        2024-08-27  1140  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
6166b1c0084e05 Jianfeng Liu        2024-08-27  1141  		reg = <0x0 0xfdb50800 0x0 0x40>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1142  		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1143  		clock-names = "aclk", "iface";
6166b1c0084e05 Jianfeng Liu        2024-08-27  1144  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1145  		power-domains = <&power RK3588_PD_VDPU>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1146  		#iommu-cells = <0>;
6166b1c0084e05 Jianfeng Liu        2024-08-27  1147  	};
6166b1c0084e05 Jianfeng Liu        2024-08-27  1148  
13066fc101ca2d Jianfeng Liu        2024-09-01  1149  	rga: rga@fdb80000 {
13066fc101ca2d Jianfeng Liu        2024-09-01  1150  		compatible = "rockchip,rk3588-rga", "rockchip,rk3288-rga";
13066fc101ca2d Jianfeng Liu        2024-09-01  1151  		reg = <0x0 0xfdb80000 0x0 0x180>;
13066fc101ca2d Jianfeng Liu        2024-09-01  1152  		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
13066fc101ca2d Jianfeng Liu        2024-09-01  1153  		clocks = <&cru ACLK_RGA2>, <&cru HCLK_RGA2>, <&cru CLK_RGA2_CORE>;
13066fc101ca2d Jianfeng Liu        2024-09-01  1154  		clock-names = "aclk", "hclk", "sclk";
13066fc101ca2d Jianfeng Liu        2024-09-01  1155  		resets = <&cru SRST_RGA2_CORE>, <&cru SRST_A_RGA2>, <&cru SRST_H_RGA2>;
13066fc101ca2d Jianfeng Liu        2024-09-01  1156  		reset-names = "core", "axi", "ahb";
13066fc101ca2d Jianfeng Liu        2024-09-01  1157  		power-domains = <&power RK3588_PD_VDPU>;
13066fc101ca2d Jianfeng Liu        2024-09-01  1158  	};
13066fc101ca2d Jianfeng Liu        2024-09-01  1159  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1160  	vepu121_0: video-codec@fdba0000 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1161  		compatible = "rockchip,rk3588-vepu121";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1162  		reg = <0x0 0xfdba0000 0x0 0x800>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1163  		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1164  		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1165  		clock-names = "aclk", "hclk";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1166  		iommus = <&vepu121_0_mmu>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1167  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1168  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1169  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1170  	vepu121_0_mmu: iommu@fdba0800 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1171  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1172  		reg = <0x0 0xfdba0800 0x0 0x40>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1173  		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1174  		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1175  		clock-names = "aclk", "iface";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1176  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1177  		#iommu-cells = <0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1178  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1179  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1180  	vepu121_1: video-codec@fdba4000 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1181  		compatible = "rockchip,rk3588-vepu121";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1182  		reg = <0x0 0xfdba4000 0x0 0x800>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1183  		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1184  		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1185  		clock-names = "aclk", "hclk";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1186  		iommus = <&vepu121_1_mmu>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1187  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1188  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1189  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1190  	vepu121_1_mmu: iommu@fdba4800 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1191  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1192  		reg = <0x0 0xfdba4800 0x0 0x40>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1193  		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1194  		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1195  		clock-names = "aclk", "iface";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1196  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1197  		#iommu-cells = <0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1198  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1199  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1200  	vepu121_2: video-codec@fdba8000 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1201  		compatible = "rockchip,rk3588-vepu121";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1202  		reg = <0x0 0xfdba8000 0x0 0x800>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1203  		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1204  		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1205  		clock-names = "aclk", "hclk";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1206  		iommus = <&vepu121_2_mmu>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1207  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1208  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1209  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1210  	vepu121_2_mmu: iommu@fdba8800 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1211  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1212  		reg = <0x0 0xfdba8800 0x0 0x40>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1213  		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1214  		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1215  		clock-names = "aclk", "iface";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1216  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1217  		#iommu-cells = <0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1218  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1219  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1220  	vepu121_3: video-codec@fdbac000 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1221  		compatible = "rockchip,rk3588-vepu121";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1222  		reg = <0x0 0xfdbac000 0x0 0x800>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1223  		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1224  		clocks = <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1225  		clock-names = "aclk", "hclk";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1226  		iommus = <&vepu121_3_mmu>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1227  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1228  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1229  
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1230  	vepu121_3_mmu: iommu@fdbac800 {
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1231  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1232  		reg = <0x0 0xfdbac800 0x0 0x40>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1233  		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1234  		clocks = <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1235  		clock-names = "aclk", "iface";
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1236  		power-domains = <&power RK3588_PD_VDPU>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1237  		#iommu-cells = <0>;
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1238  	};
cc0a05865cd5ff Emmanuel Gil Peyrot 2024-08-27  1239  
def88eb4d8365a Dragan Simic        2024-06-09  1240  	av1d: video-codec@fdc70000 {
def88eb4d8365a Dragan Simic        2024-06-09  1241  		compatible = "rockchip,rk3588-av1-vpu";
def88eb4d8365a Dragan Simic        2024-06-09  1242  		reg = <0x0 0xfdc70000 0x0 0x800>;
def88eb4d8365a Dragan Simic        2024-06-09  1243  		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1244  		interrupt-names = "vdpu";
def88eb4d8365a Dragan Simic        2024-06-09  1245  		assigned-clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
def88eb4d8365a Dragan Simic        2024-06-09  1246  		assigned-clock-rates = <400000000>, <400000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1247  		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
def88eb4d8365a Dragan Simic        2024-06-09  1248  		clock-names = "aclk", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1249  		power-domains = <&power RK3588_PD_AV1>;
def88eb4d8365a Dragan Simic        2024-06-09  1250  		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
def88eb4d8365a Dragan Simic        2024-06-09  1251  	};
def88eb4d8365a Dragan Simic        2024-06-09  1252  
def88eb4d8365a Dragan Simic        2024-06-09  1253  	vop: vop@fdd90000 {
def88eb4d8365a Dragan Simic        2024-06-09  1254  		compatible = "rockchip,rk3588-vop";
def88eb4d8365a Dragan Simic        2024-06-09  1255  		reg = <0x0 0xfdd90000 0x0 0x4200>, <0x0 0xfdd95000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1256  		reg-names = "vop", "gamma-lut";
def88eb4d8365a Dragan Simic        2024-06-09  1257  		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1258  		clocks = <&cru ACLK_VOP>,
def88eb4d8365a Dragan Simic        2024-06-09  1259  			 <&cru HCLK_VOP>,
def88eb4d8365a Dragan Simic        2024-06-09  1260  			 <&cru DCLK_VOP0>,
def88eb4d8365a Dragan Simic        2024-06-09  1261  			 <&cru DCLK_VOP1>,
def88eb4d8365a Dragan Simic        2024-06-09  1262  			 <&cru DCLK_VOP2>,
def88eb4d8365a Dragan Simic        2024-06-09  1263  			 <&cru DCLK_VOP3>,
def88eb4d8365a Dragan Simic        2024-06-09  1264  			 <&cru PCLK_VOP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  1265  		clock-names = "aclk",
def88eb4d8365a Dragan Simic        2024-06-09  1266  			      "hclk",
def88eb4d8365a Dragan Simic        2024-06-09  1267  			      "dclk_vp0",
def88eb4d8365a Dragan Simic        2024-06-09  1268  			      "dclk_vp1",
def88eb4d8365a Dragan Simic        2024-06-09  1269  			      "dclk_vp2",
def88eb4d8365a Dragan Simic        2024-06-09  1270  			      "dclk_vp3",
def88eb4d8365a Dragan Simic        2024-06-09  1271  			      "pclk_vop";
def88eb4d8365a Dragan Simic        2024-06-09  1272  		iommus = <&vop_mmu>;
def88eb4d8365a Dragan Simic        2024-06-09  1273  		power-domains = <&power RK3588_PD_VOP>;
def88eb4d8365a Dragan Simic        2024-06-09  1274  		rockchip,grf = <&sys_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1275  		rockchip,vop-grf = <&vop_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1276  		rockchip,vo1-grf = <&vo1_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1277  		rockchip,pmu = <&pmu>;
def88eb4d8365a Dragan Simic        2024-06-09  1278  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1279  
def88eb4d8365a Dragan Simic        2024-06-09  1280  		vop_out: ports {
def88eb4d8365a Dragan Simic        2024-06-09  1281  			#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1282  			#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1283  
def88eb4d8365a Dragan Simic        2024-06-09  1284  			vp0: port@0 {
def88eb4d8365a Dragan Simic        2024-06-09  1285  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1286  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1287  				reg = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1288  			};
def88eb4d8365a Dragan Simic        2024-06-09  1289  
def88eb4d8365a Dragan Simic        2024-06-09  1290  			vp1: port@1 {
def88eb4d8365a Dragan Simic        2024-06-09  1291  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1292  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1293  				reg = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1294  			};
def88eb4d8365a Dragan Simic        2024-06-09  1295  
def88eb4d8365a Dragan Simic        2024-06-09  1296  			vp2: port@2 {
def88eb4d8365a Dragan Simic        2024-06-09  1297  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1298  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1299  				reg = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1300  			};
def88eb4d8365a Dragan Simic        2024-06-09  1301  
def88eb4d8365a Dragan Simic        2024-06-09  1302  			vp3: port@3 {
def88eb4d8365a Dragan Simic        2024-06-09  1303  				#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1304  				#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1305  				reg = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  1306  			};
def88eb4d8365a Dragan Simic        2024-06-09  1307  		};
def88eb4d8365a Dragan Simic        2024-06-09  1308  	};
def88eb4d8365a Dragan Simic        2024-06-09  1309  
def88eb4d8365a Dragan Simic        2024-06-09  1310  	vop_mmu: iommu@fdd97e00 {
def88eb4d8365a Dragan Simic        2024-06-09  1311  		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
def88eb4d8365a Dragan Simic        2024-06-09  1312  		reg = <0x0 0xfdd97e00 0x0 0x100>, <0x0 0xfdd97f00 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  1313  		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1314  		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
def88eb4d8365a Dragan Simic        2024-06-09  1315  		clock-names = "aclk", "iface";
def88eb4d8365a Dragan Simic        2024-06-09  1316  		#iommu-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1317  		power-domains = <&power RK3588_PD_VOP>;
def88eb4d8365a Dragan Simic        2024-06-09  1318  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1319  	};
def88eb4d8365a Dragan Simic        2024-06-09  1320  
def88eb4d8365a Dragan Simic        2024-06-09  1321  	i2s4_8ch: i2s@fddc0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1322  		compatible = "rockchip,rk3588-i2s-tdm";
def88eb4d8365a Dragan Simic        2024-06-09  1323  		reg = <0x0 0xfddc0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1324  		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1325  		clocks = <&cru MCLK_I2S4_8CH_TX>, <&cru MCLK_I2S4_8CH_TX>, <&cru HCLK_I2S4_8CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1326  		clock-names = "mclk_tx", "mclk_rx", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1327  		assigned-clocks = <&cru CLK_I2S4_8CH_TX_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  1328  		assigned-clock-parents = <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  1329  		dmas = <&dmac2 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1330  		dma-names = "tx";
def88eb4d8365a Dragan Simic        2024-06-09  1331  		power-domains = <&power RK3588_PD_VO0>;
def88eb4d8365a Dragan Simic        2024-06-09  1332  		resets = <&cru SRST_M_I2S4_8CH_TX>;
def88eb4d8365a Dragan Simic        2024-06-09  1333  		reset-names = "tx-m";
def88eb4d8365a Dragan Simic        2024-06-09  1334  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1335  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1336  	};
def88eb4d8365a Dragan Simic        2024-06-09  1337  
def88eb4d8365a Dragan Simic        2024-06-09  1338  	i2s5_8ch: i2s@fddf0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1339  		compatible = "rockchip,rk3588-i2s-tdm";
def88eb4d8365a Dragan Simic        2024-06-09  1340  		reg = <0x0 0xfddf0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1341  		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1342  		clocks = <&cru MCLK_I2S5_8CH_TX>, <&cru MCLK_I2S5_8CH_TX>, <&cru HCLK_I2S5_8CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1343  		clock-names = "mclk_tx", "mclk_rx", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1344  		assigned-clocks = <&cru CLK_I2S5_8CH_TX_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  1345  		assigned-clock-parents = <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  1346  		dmas = <&dmac2 2>;
def88eb4d8365a Dragan Simic        2024-06-09  1347  		dma-names = "tx";
def88eb4d8365a Dragan Simic        2024-06-09  1348  		power-domains = <&power RK3588_PD_VO1>;
def88eb4d8365a Dragan Simic        2024-06-09  1349  		resets = <&cru SRST_M_I2S5_8CH_TX>;
def88eb4d8365a Dragan Simic        2024-06-09  1350  		reset-names = "tx-m";
def88eb4d8365a Dragan Simic        2024-06-09  1351  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1352  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1353  	};
def88eb4d8365a Dragan Simic        2024-06-09  1354  
def88eb4d8365a Dragan Simic        2024-06-09  1355  	i2s9_8ch: i2s@fddfc000 {
def88eb4d8365a Dragan Simic        2024-06-09  1356  		compatible = "rockchip,rk3588-i2s-tdm";
def88eb4d8365a Dragan Simic        2024-06-09  1357  		reg = <0x0 0xfddfc000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1358  		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1359  		clocks = <&cru MCLK_I2S9_8CH_RX>, <&cru MCLK_I2S9_8CH_RX>, <&cru HCLK_I2S9_8CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1360  		clock-names = "mclk_tx", "mclk_rx", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1361  		assigned-clocks = <&cru CLK_I2S9_8CH_RX_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  1362  		assigned-clock-parents = <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  1363  		dmas = <&dmac2 23>;
def88eb4d8365a Dragan Simic        2024-06-09  1364  		dma-names = "rx";
def88eb4d8365a Dragan Simic        2024-06-09  1365  		power-domains = <&power RK3588_PD_VO1>;
def88eb4d8365a Dragan Simic        2024-06-09  1366  		resets = <&cru SRST_M_I2S9_8CH_RX>;
def88eb4d8365a Dragan Simic        2024-06-09  1367  		reset-names = "rx-m";
def88eb4d8365a Dragan Simic        2024-06-09  1368  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1369  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1370  	};
def88eb4d8365a Dragan Simic        2024-06-09  1371  
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1372  	hdmi0: hdmi@fde80000 {
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1373  		compatible = "rockchip,rk3588-dw-hdmi-qp";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1374  		reg = <0x0 0xfde80000 0x0 0x20000>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1375  		clocks = <&cru PCLK_HDMITX0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1376  			 <&cru CLK_HDMITX0_EARC>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1377  			 <&cru CLK_HDMITX0_REF>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1378  			 <&cru MCLK_I2S5_8CH_TX>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1379  			 <&cru CLK_HDMIHDP0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1380  			 <&cru HCLK_VO1>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1381  		clock-names = "pclk", "earc", "ref", "aud", "hdp", "hclk_vo1";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1382  		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1383  			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1384  			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1385  			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1386  			     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1387  		interrupt-names = "avp", "cec", "earc", "main", "hpd";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1388  		phys = <&hdptxphy_hdmi0>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1389  		pinctrl-names = "default";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1390  		pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1391  			     &hdmim0_tx0_scl &hdmim0_tx0_sda>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1392  		power-domains = <&power RK3588_PD_VO1>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1393  		resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1394  		reset-names = "ref", "hdp";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1395  		rockchip,grf = <&sys_grf>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1396  		rockchip,vo-grf = <&vo1_grf>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1397  		status = "disabled";
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1398  
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1399  		ports {
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1400  			#address-cells = <1>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1401  			#size-cells = <0>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1402  
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1403  			hdmi0_in: port@0 {
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1404  				reg = <0>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1405  			};
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1406  
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1407  			hdmi0_out: port@1 {
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1408  				reg = <1>;
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1409  			};
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1410  		};
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1411  	};
d7bb71e69f58c1 Cristian Ciocaltea  2024-10-19  1412  
def88eb4d8365a Dragan Simic        2024-06-09  1413  	qos_gpu_m0: qos@fdf35000 {
def88eb4d8365a Dragan Simic        2024-06-09  1414  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1415  		reg = <0x0 0xfdf35000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1416  	};
def88eb4d8365a Dragan Simic        2024-06-09  1417  
def88eb4d8365a Dragan Simic        2024-06-09  1418  	qos_gpu_m1: qos@fdf35200 {
def88eb4d8365a Dragan Simic        2024-06-09  1419  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1420  		reg = <0x0 0xfdf35200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1421  	};
def88eb4d8365a Dragan Simic        2024-06-09  1422  
def88eb4d8365a Dragan Simic        2024-06-09  1423  	qos_gpu_m2: qos@fdf35400 {
def88eb4d8365a Dragan Simic        2024-06-09  1424  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1425  		reg = <0x0 0xfdf35400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1426  	};
def88eb4d8365a Dragan Simic        2024-06-09  1427  
def88eb4d8365a Dragan Simic        2024-06-09  1428  	qos_gpu_m3: qos@fdf35600 {
def88eb4d8365a Dragan Simic        2024-06-09  1429  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1430  		reg = <0x0 0xfdf35600 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1431  	};
def88eb4d8365a Dragan Simic        2024-06-09  1432  
def88eb4d8365a Dragan Simic        2024-06-09  1433  	qos_rga3_1: qos@fdf36000 {
def88eb4d8365a Dragan Simic        2024-06-09  1434  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1435  		reg = <0x0 0xfdf36000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1436  	};
def88eb4d8365a Dragan Simic        2024-06-09  1437  
def88eb4d8365a Dragan Simic        2024-06-09  1438  	qos_sdio: qos@fdf39000 {
def88eb4d8365a Dragan Simic        2024-06-09  1439  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1440  		reg = <0x0 0xfdf39000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1441  	};
def88eb4d8365a Dragan Simic        2024-06-09  1442  
def88eb4d8365a Dragan Simic        2024-06-09  1443  	qos_sdmmc: qos@fdf3d800 {
def88eb4d8365a Dragan Simic        2024-06-09  1444  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1445  		reg = <0x0 0xfdf3d800 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1446  	};
def88eb4d8365a Dragan Simic        2024-06-09  1447  
def88eb4d8365a Dragan Simic        2024-06-09  1448  	qos_usb3_1: qos@fdf3e000 {
def88eb4d8365a Dragan Simic        2024-06-09  1449  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1450  		reg = <0x0 0xfdf3e000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1451  	};
def88eb4d8365a Dragan Simic        2024-06-09  1452  
def88eb4d8365a Dragan Simic        2024-06-09  1453  	qos_usb3_0: qos@fdf3e200 {
def88eb4d8365a Dragan Simic        2024-06-09  1454  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1455  		reg = <0x0 0xfdf3e200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1456  	};
def88eb4d8365a Dragan Simic        2024-06-09  1457  
def88eb4d8365a Dragan Simic        2024-06-09  1458  	qos_usb2host_0: qos@fdf3e400 {
def88eb4d8365a Dragan Simic        2024-06-09  1459  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1460  		reg = <0x0 0xfdf3e400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1461  	};
def88eb4d8365a Dragan Simic        2024-06-09  1462  
def88eb4d8365a Dragan Simic        2024-06-09  1463  	qos_usb2host_1: qos@fdf3e600 {
def88eb4d8365a Dragan Simic        2024-06-09  1464  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1465  		reg = <0x0 0xfdf3e600 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1466  	};
def88eb4d8365a Dragan Simic        2024-06-09  1467  
def88eb4d8365a Dragan Simic        2024-06-09  1468  	qos_fisheye0: qos@fdf40000 {
def88eb4d8365a Dragan Simic        2024-06-09  1469  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1470  		reg = <0x0 0xfdf40000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1471  	};
def88eb4d8365a Dragan Simic        2024-06-09  1472  
def88eb4d8365a Dragan Simic        2024-06-09  1473  	qos_fisheye1: qos@fdf40200 {
def88eb4d8365a Dragan Simic        2024-06-09  1474  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1475  		reg = <0x0 0xfdf40200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1476  	};
def88eb4d8365a Dragan Simic        2024-06-09  1477  
def88eb4d8365a Dragan Simic        2024-06-09  1478  	qos_isp0_mro: qos@fdf40400 {
def88eb4d8365a Dragan Simic        2024-06-09  1479  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1480  		reg = <0x0 0xfdf40400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1481  	};
def88eb4d8365a Dragan Simic        2024-06-09  1482  
def88eb4d8365a Dragan Simic        2024-06-09  1483  	qos_isp0_mwo: qos@fdf40500 {
def88eb4d8365a Dragan Simic        2024-06-09  1484  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1485  		reg = <0x0 0xfdf40500 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1486  	};
def88eb4d8365a Dragan Simic        2024-06-09  1487  
def88eb4d8365a Dragan Simic        2024-06-09  1488  	qos_vicap_m0: qos@fdf40600 {
def88eb4d8365a Dragan Simic        2024-06-09  1489  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1490  		reg = <0x0 0xfdf40600 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1491  	};
def88eb4d8365a Dragan Simic        2024-06-09  1492  
def88eb4d8365a Dragan Simic        2024-06-09  1493  	qos_vicap_m1: qos@fdf40800 {
def88eb4d8365a Dragan Simic        2024-06-09  1494  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1495  		reg = <0x0 0xfdf40800 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1496  	};
def88eb4d8365a Dragan Simic        2024-06-09  1497  
def88eb4d8365a Dragan Simic        2024-06-09  1498  	qos_isp1_mwo: qos@fdf41000 {
def88eb4d8365a Dragan Simic        2024-06-09  1499  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1500  		reg = <0x0 0xfdf41000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1501  	};
def88eb4d8365a Dragan Simic        2024-06-09  1502  
def88eb4d8365a Dragan Simic        2024-06-09  1503  	qos_isp1_mro: qos@fdf41100 {
def88eb4d8365a Dragan Simic        2024-06-09  1504  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1505  		reg = <0x0 0xfdf41100 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1506  	};
def88eb4d8365a Dragan Simic        2024-06-09  1507  
def88eb4d8365a Dragan Simic        2024-06-09  1508  	qos_rkvenc0_m0ro: qos@fdf60000 {
def88eb4d8365a Dragan Simic        2024-06-09  1509  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1510  		reg = <0x0 0xfdf60000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1511  	};
def88eb4d8365a Dragan Simic        2024-06-09  1512  
def88eb4d8365a Dragan Simic        2024-06-09  1513  	qos_rkvenc0_m1ro: qos@fdf60200 {
def88eb4d8365a Dragan Simic        2024-06-09  1514  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1515  		reg = <0x0 0xfdf60200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1516  	};
def88eb4d8365a Dragan Simic        2024-06-09  1517  
def88eb4d8365a Dragan Simic        2024-06-09  1518  	qos_rkvenc0_m2wo: qos@fdf60400 {
def88eb4d8365a Dragan Simic        2024-06-09  1519  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1520  		reg = <0x0 0xfdf60400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1521  	};
def88eb4d8365a Dragan Simic        2024-06-09  1522  
def88eb4d8365a Dragan Simic        2024-06-09  1523  	qos_rkvenc1_m0ro: qos@fdf61000 {
def88eb4d8365a Dragan Simic        2024-06-09  1524  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1525  		reg = <0x0 0xfdf61000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1526  	};
def88eb4d8365a Dragan Simic        2024-06-09  1527  
def88eb4d8365a Dragan Simic        2024-06-09  1528  	qos_rkvenc1_m1ro: qos@fdf61200 {
def88eb4d8365a Dragan Simic        2024-06-09  1529  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1530  		reg = <0x0 0xfdf61200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1531  	};
def88eb4d8365a Dragan Simic        2024-06-09  1532  
def88eb4d8365a Dragan Simic        2024-06-09  1533  	qos_rkvenc1_m2wo: qos@fdf61400 {
def88eb4d8365a Dragan Simic        2024-06-09  1534  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1535  		reg = <0x0 0xfdf61400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1536  	};
def88eb4d8365a Dragan Simic        2024-06-09  1537  
def88eb4d8365a Dragan Simic        2024-06-09  1538  	qos_rkvdec0: qos@fdf62000 {
def88eb4d8365a Dragan Simic        2024-06-09  1539  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1540  		reg = <0x0 0xfdf62000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1541  	};
def88eb4d8365a Dragan Simic        2024-06-09  1542  
def88eb4d8365a Dragan Simic        2024-06-09  1543  	qos_rkvdec1: qos@fdf63000 {
def88eb4d8365a Dragan Simic        2024-06-09  1544  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1545  		reg = <0x0 0xfdf63000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1546  	};
def88eb4d8365a Dragan Simic        2024-06-09  1547  
def88eb4d8365a Dragan Simic        2024-06-09  1548  	qos_av1: qos@fdf64000 {
def88eb4d8365a Dragan Simic        2024-06-09  1549  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1550  		reg = <0x0 0xfdf64000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1551  	};
def88eb4d8365a Dragan Simic        2024-06-09  1552  
def88eb4d8365a Dragan Simic        2024-06-09  1553  	qos_iep: qos@fdf66000 {
def88eb4d8365a Dragan Simic        2024-06-09  1554  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1555  		reg = <0x0 0xfdf66000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1556  	};
def88eb4d8365a Dragan Simic        2024-06-09  1557  
def88eb4d8365a Dragan Simic        2024-06-09  1558  	qos_jpeg_dec: qos@fdf66200 {
def88eb4d8365a Dragan Simic        2024-06-09  1559  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1560  		reg = <0x0 0xfdf66200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1561  	};
def88eb4d8365a Dragan Simic        2024-06-09  1562  
def88eb4d8365a Dragan Simic        2024-06-09  1563  	qos_jpeg_enc0: qos@fdf66400 {
def88eb4d8365a Dragan Simic        2024-06-09  1564  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1565  		reg = <0x0 0xfdf66400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1566  	};
def88eb4d8365a Dragan Simic        2024-06-09  1567  
def88eb4d8365a Dragan Simic        2024-06-09  1568  	qos_jpeg_enc1: qos@fdf66600 {
def88eb4d8365a Dragan Simic        2024-06-09  1569  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1570  		reg = <0x0 0xfdf66600 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1571  	};
def88eb4d8365a Dragan Simic        2024-06-09  1572  
def88eb4d8365a Dragan Simic        2024-06-09  1573  	qos_jpeg_enc2: qos@fdf66800 {
def88eb4d8365a Dragan Simic        2024-06-09  1574  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1575  		reg = <0x0 0xfdf66800 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1576  	};
def88eb4d8365a Dragan Simic        2024-06-09  1577  
def88eb4d8365a Dragan Simic        2024-06-09  1578  	qos_jpeg_enc3: qos@fdf66a00 {
def88eb4d8365a Dragan Simic        2024-06-09  1579  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1580  		reg = <0x0 0xfdf66a00 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1581  	};
def88eb4d8365a Dragan Simic        2024-06-09  1582  
def88eb4d8365a Dragan Simic        2024-06-09  1583  	qos_rga2_mro: qos@fdf66c00 {
def88eb4d8365a Dragan Simic        2024-06-09  1584  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1585  		reg = <0x0 0xfdf66c00 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1586  	};
def88eb4d8365a Dragan Simic        2024-06-09  1587  
def88eb4d8365a Dragan Simic        2024-06-09  1588  	qos_rga2_mwo: qos@fdf66e00 {
def88eb4d8365a Dragan Simic        2024-06-09  1589  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1590  		reg = <0x0 0xfdf66e00 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1591  	};
def88eb4d8365a Dragan Simic        2024-06-09  1592  
def88eb4d8365a Dragan Simic        2024-06-09  1593  	qos_rga3_0: qos@fdf67000 {
def88eb4d8365a Dragan Simic        2024-06-09  1594  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1595  		reg = <0x0 0xfdf67000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1596  	};
def88eb4d8365a Dragan Simic        2024-06-09  1597  
def88eb4d8365a Dragan Simic        2024-06-09  1598  	qos_vdpu: qos@fdf67200 {
def88eb4d8365a Dragan Simic        2024-06-09  1599  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1600  		reg = <0x0 0xfdf67200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1601  	};
def88eb4d8365a Dragan Simic        2024-06-09  1602  
def88eb4d8365a Dragan Simic        2024-06-09  1603  	qos_npu1: qos@fdf70000 {
def88eb4d8365a Dragan Simic        2024-06-09  1604  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1605  		reg = <0x0 0xfdf70000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1606  	};
def88eb4d8365a Dragan Simic        2024-06-09  1607  
def88eb4d8365a Dragan Simic        2024-06-09  1608  	qos_npu2: qos@fdf71000 {
def88eb4d8365a Dragan Simic        2024-06-09  1609  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1610  		reg = <0x0 0xfdf71000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1611  	};
def88eb4d8365a Dragan Simic        2024-06-09  1612  
def88eb4d8365a Dragan Simic        2024-06-09  1613  	qos_npu0_mwr: qos@fdf72000 {
def88eb4d8365a Dragan Simic        2024-06-09  1614  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1615  		reg = <0x0 0xfdf72000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1616  	};
def88eb4d8365a Dragan Simic        2024-06-09  1617  
def88eb4d8365a Dragan Simic        2024-06-09  1618  	qos_npu0_mro: qos@fdf72200 {
def88eb4d8365a Dragan Simic        2024-06-09  1619  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1620  		reg = <0x0 0xfdf72200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1621  	};
def88eb4d8365a Dragan Simic        2024-06-09  1622  
def88eb4d8365a Dragan Simic        2024-06-09  1623  	qos_mcu_npu: qos@fdf72400 {
def88eb4d8365a Dragan Simic        2024-06-09  1624  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1625  		reg = <0x0 0xfdf72400 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1626  	};
def88eb4d8365a Dragan Simic        2024-06-09  1627  
def88eb4d8365a Dragan Simic        2024-06-09  1628  	qos_hdcp0: qos@fdf80000 {
def88eb4d8365a Dragan Simic        2024-06-09  1629  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1630  		reg = <0x0 0xfdf80000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1631  	};
def88eb4d8365a Dragan Simic        2024-06-09  1632  
def88eb4d8365a Dragan Simic        2024-06-09  1633  	qos_hdcp1: qos@fdf81000 {
def88eb4d8365a Dragan Simic        2024-06-09  1634  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1635  		reg = <0x0 0xfdf81000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1636  	};
def88eb4d8365a Dragan Simic        2024-06-09  1637  
def88eb4d8365a Dragan Simic        2024-06-09  1638  	qos_hdmirx: qos@fdf81200 {
def88eb4d8365a Dragan Simic        2024-06-09  1639  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1640  		reg = <0x0 0xfdf81200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1641  	};
def88eb4d8365a Dragan Simic        2024-06-09  1642  
def88eb4d8365a Dragan Simic        2024-06-09  1643  	qos_vop_m0: qos@fdf82000 {
def88eb4d8365a Dragan Simic        2024-06-09  1644  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1645  		reg = <0x0 0xfdf82000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1646  	};
def88eb4d8365a Dragan Simic        2024-06-09  1647  
def88eb4d8365a Dragan Simic        2024-06-09  1648  	qos_vop_m1: qos@fdf82200 {
def88eb4d8365a Dragan Simic        2024-06-09  1649  		compatible = "rockchip,rk3588-qos", "syscon";
def88eb4d8365a Dragan Simic        2024-06-09  1650  		reg = <0x0 0xfdf82200 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  1651  	};
def88eb4d8365a Dragan Simic        2024-06-09  1652  
def88eb4d8365a Dragan Simic        2024-06-09  1653  	dfi: dfi@fe060000 {
def88eb4d8365a Dragan Simic        2024-06-09  1654  		reg = <0x00 0xfe060000 0x00 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09  1655  		compatible = "rockchip,rk3588-dfi";
def88eb4d8365a Dragan Simic        2024-06-09  1656  		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1657  			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1658  			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1659  			     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1660  		rockchip,pmu = <&pmu1grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1661  	};
def88eb4d8365a Dragan Simic        2024-06-09  1662  
def88eb4d8365a Dragan Simic        2024-06-09  1663  	pcie2x1l1: pcie@fe180000 {
def88eb4d8365a Dragan Simic        2024-06-09  1664  		compatible = "rockchip,rk3588-pcie", "rockchip,rk3568-pcie";
def88eb4d8365a Dragan Simic        2024-06-09  1665  		bus-range = <0x30 0x3f>;
def88eb4d8365a Dragan Simic        2024-06-09  1666  		clocks = <&cru ACLK_PCIE_1L1_MSTR>, <&cru ACLK_PCIE_1L1_SLV>,
def88eb4d8365a Dragan Simic        2024-06-09  1667  			 <&cru ACLK_PCIE_1L1_DBI>, <&cru PCLK_PCIE_1L1>,
def88eb4d8365a Dragan Simic        2024-06-09  1668  			 <&cru CLK_PCIE_AUX3>, <&cru CLK_PCIE1L1_PIPE>;
def88eb4d8365a Dragan Simic        2024-06-09  1669  		clock-names = "aclk_mst", "aclk_slv",
def88eb4d8365a Dragan Simic        2024-06-09  1670  			      "aclk_dbi", "pclk",
def88eb4d8365a Dragan Simic        2024-06-09  1671  			      "aux", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  1672  		device_type = "pci";
def88eb4d8365a Dragan Simic        2024-06-09  1673  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1674  			     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1675  			     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1676  			     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1677  			     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1678  		interrupt-names = "sys", "pmc", "msg", "legacy", "err";
def88eb4d8365a Dragan Simic        2024-06-09  1679  		#interrupt-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1680  		interrupt-map-mask = <0 0 0 7>;
def88eb4d8365a Dragan Simic        2024-06-09  1681  		interrupt-map = <0 0 0 1 &pcie2x1l1_intc 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1682  				<0 0 0 2 &pcie2x1l1_intc 1>,
def88eb4d8365a Dragan Simic        2024-06-09  1683  				<0 0 0 3 &pcie2x1l1_intc 2>,
def88eb4d8365a Dragan Simic        2024-06-09  1684  				<0 0 0 4 &pcie2x1l1_intc 3>;
def88eb4d8365a Dragan Simic        2024-06-09  1685  		linux,pci-domain = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  1686  		max-link-speed = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1687  		msi-map = <0x3000 &its0 0x3000 0x1000>;
da92d3dfc871e8 Niklas Cassel       2024-11-07  1688  		iommu-map = <0x3000 &mmu600_pcie 0x3000 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1689  		num-lanes = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1690  		phys = <&combphy2_psu PHY_TYPE_PCIE>;
def88eb4d8365a Dragan Simic        2024-06-09  1691  		phy-names = "pcie-phy";
def88eb4d8365a Dragan Simic        2024-06-09  1692  		power-domains = <&power RK3588_PD_PCIE>;
def88eb4d8365a Dragan Simic        2024-06-09  1693  		ranges = <0x01000000 0x0 0xf3100000 0x0 0xf3100000 0x0 0x00100000>,
def88eb4d8365a Dragan Simic        2024-06-09  1694  			 <0x02000000 0x0 0xf3200000 0x0 0xf3200000 0x0 0x00e00000>,
def88eb4d8365a Dragan Simic        2024-06-09  1695  			 <0x03000000 0x0 0x40000000 0x9 0xc0000000 0x0 0x40000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1696  		reg = <0xa 0x40c00000 0x0 0x00400000>,
def88eb4d8365a Dragan Simic        2024-06-09  1697  		      <0x0 0xfe180000 0x0 0x00010000>,
def88eb4d8365a Dragan Simic        2024-06-09  1698  		      <0x0 0xf3000000 0x0 0x00100000>;
def88eb4d8365a Dragan Simic        2024-06-09  1699  		reg-names = "dbi", "apb", "config";
def88eb4d8365a Dragan Simic        2024-06-09  1700  		resets = <&cru SRST_PCIE3_POWER_UP>, <&cru SRST_P_PCIE3>;
def88eb4d8365a Dragan Simic        2024-06-09  1701  		reset-names = "pwr", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  1702  		#address-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  1703  		#size-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1704  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1705  
def88eb4d8365a Dragan Simic        2024-06-09  1706  		pcie2x1l1_intc: legacy-interrupt-controller {
def88eb4d8365a Dragan Simic        2024-06-09  1707  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  1708  			#address-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1709  			#interrupt-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1710  			interrupt-parent = <&gic>;
def88eb4d8365a Dragan Simic        2024-06-09  1711  			interrupts = <GIC_SPI 245 IRQ_TYPE_EDGE_RISING 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1712  		};
def88eb4d8365a Dragan Simic        2024-06-09  1713  	};
def88eb4d8365a Dragan Simic        2024-06-09  1714  
def88eb4d8365a Dragan Simic        2024-06-09  1715  	pcie2x1l2: pcie@fe190000 {
def88eb4d8365a Dragan Simic        2024-06-09  1716  		compatible = "rockchip,rk3588-pcie", "rockchip,rk3568-pcie";
def88eb4d8365a Dragan Simic        2024-06-09  1717  		bus-range = <0x40 0x4f>;
def88eb4d8365a Dragan Simic        2024-06-09  1718  		clocks = <&cru ACLK_PCIE_1L2_MSTR>, <&cru ACLK_PCIE_1L2_SLV>,
def88eb4d8365a Dragan Simic        2024-06-09  1719  			 <&cru ACLK_PCIE_1L2_DBI>, <&cru PCLK_PCIE_1L2>,
def88eb4d8365a Dragan Simic        2024-06-09  1720  			 <&cru CLK_PCIE_AUX4>, <&cru CLK_PCIE1L2_PIPE>;
def88eb4d8365a Dragan Simic        2024-06-09  1721  		clock-names = "aclk_mst", "aclk_slv",
def88eb4d8365a Dragan Simic        2024-06-09  1722  			      "aclk_dbi", "pclk",
def88eb4d8365a Dragan Simic        2024-06-09  1723  			      "aux", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  1724  		device_type = "pci";
def88eb4d8365a Dragan Simic        2024-06-09  1725  		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1726  			     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1727  			     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1728  			     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1729  			     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1730  		interrupt-names = "sys", "pmc", "msg", "legacy", "err";
def88eb4d8365a Dragan Simic        2024-06-09  1731  		#interrupt-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1732  		interrupt-map-mask = <0 0 0 7>;
def88eb4d8365a Dragan Simic        2024-06-09  1733  		interrupt-map = <0 0 0 1 &pcie2x1l2_intc 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1734  				<0 0 0 2 &pcie2x1l2_intc 1>,
def88eb4d8365a Dragan Simic        2024-06-09  1735  				<0 0 0 3 &pcie2x1l2_intc 2>,
def88eb4d8365a Dragan Simic        2024-06-09  1736  				<0 0 0 4 &pcie2x1l2_intc 3>;
def88eb4d8365a Dragan Simic        2024-06-09  1737  		linux,pci-domain = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  1738  		max-link-speed = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1739  		msi-map = <0x4000 &its0 0x4000 0x1000>;
da92d3dfc871e8 Niklas Cassel       2024-11-07  1740  		iommu-map = <0x4000 &mmu600_pcie 0x4000 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1741  		num-lanes = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1742  		phys = <&combphy0_ps PHY_TYPE_PCIE>;
def88eb4d8365a Dragan Simic        2024-06-09  1743  		phy-names = "pcie-phy";
def88eb4d8365a Dragan Simic        2024-06-09  1744  		power-domains = <&power RK3588_PD_PCIE>;
def88eb4d8365a Dragan Simic        2024-06-09  1745  		ranges = <0x01000000 0x0 0xf4100000 0x0 0xf4100000 0x0 0x00100000>,
def88eb4d8365a Dragan Simic        2024-06-09  1746  			 <0x02000000 0x0 0xf4200000 0x0 0xf4200000 0x0 0x00e00000>,
def88eb4d8365a Dragan Simic        2024-06-09  1747  			 <0x03000000 0x0 0x40000000 0xa 0x00000000 0x0 0x40000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1748  		reg = <0xa 0x41000000 0x0 0x00400000>,
def88eb4d8365a Dragan Simic        2024-06-09  1749  		      <0x0 0xfe190000 0x0 0x00010000>,
def88eb4d8365a Dragan Simic        2024-06-09  1750  		      <0x0 0xf4000000 0x0 0x00100000>;
def88eb4d8365a Dragan Simic        2024-06-09  1751  		reg-names = "dbi", "apb", "config";
def88eb4d8365a Dragan Simic        2024-06-09  1752  		resets = <&cru SRST_PCIE4_POWER_UP>, <&cru SRST_P_PCIE4>;
def88eb4d8365a Dragan Simic        2024-06-09  1753  		reset-names = "pwr", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  1754  		#address-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  1755  		#size-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1756  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1757  
def88eb4d8365a Dragan Simic        2024-06-09  1758  		pcie2x1l2_intc: legacy-interrupt-controller {
def88eb4d8365a Dragan Simic        2024-06-09  1759  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  1760  			#address-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1761  			#interrupt-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1762  			interrupt-parent = <&gic>;
def88eb4d8365a Dragan Simic        2024-06-09  1763  			interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1764  		};
def88eb4d8365a Dragan Simic        2024-06-09  1765  	};
def88eb4d8365a Dragan Simic        2024-06-09  1766  
def88eb4d8365a Dragan Simic        2024-06-09  1767  	gmac1: ethernet@fe1c0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1768  		compatible = "rockchip,rk3588-gmac", "snps,dwmac-4.20a";
def88eb4d8365a Dragan Simic        2024-06-09  1769  		reg = <0x0 0xfe1c0000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09  1770  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  1771  			     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1772  		interrupt-names = "macirq", "eth_wake_irq";
def88eb4d8365a Dragan Simic        2024-06-09  1773  		clocks = <&cru CLK_GMAC_125M>, <&cru CLK_GMAC_50M>,
def88eb4d8365a Dragan Simic        2024-06-09  1774  			 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
def88eb4d8365a Dragan Simic        2024-06-09  1775  			 <&cru CLK_GMAC1_PTP_REF>;
def88eb4d8365a Dragan Simic        2024-06-09  1776  		clock-names = "stmmaceth", "clk_mac_ref",
def88eb4d8365a Dragan Simic        2024-06-09  1777  			      "pclk_mac", "aclk_mac",
def88eb4d8365a Dragan Simic        2024-06-09  1778  			      "ptp_ref";
def88eb4d8365a Dragan Simic        2024-06-09  1779  		power-domains = <&power RK3588_PD_GMAC>;
def88eb4d8365a Dragan Simic        2024-06-09  1780  		resets = <&cru SRST_A_GMAC1>;
def88eb4d8365a Dragan Simic        2024-06-09  1781  		reset-names = "stmmaceth";
def88eb4d8365a Dragan Simic        2024-06-09  1782  		rockchip,grf = <&sys_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1783  		rockchip,php-grf = <&php_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  1784  		snps,axi-config = <&gmac1_stmmac_axi_setup>;
def88eb4d8365a Dragan Simic        2024-06-09  1785  		snps,mixed-burst;
def88eb4d8365a Dragan Simic        2024-06-09  1786  		snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
def88eb4d8365a Dragan Simic        2024-06-09  1787  		snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
def88eb4d8365a Dragan Simic        2024-06-09  1788  		snps,tso;
def88eb4d8365a Dragan Simic        2024-06-09  1789  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1790  
def88eb4d8365a Dragan Simic        2024-06-09  1791  		mdio1: mdio {
def88eb4d8365a Dragan Simic        2024-06-09  1792  			compatible = "snps,dwmac-mdio";
def88eb4d8365a Dragan Simic        2024-06-09  1793  			#address-cells = <0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  1794  			#size-cells = <0x0>;
def88eb4d8365a Dragan Simic        2024-06-09  1795  		};
def88eb4d8365a Dragan Simic        2024-06-09  1796  
def88eb4d8365a Dragan Simic        2024-06-09  1797  		gmac1_stmmac_axi_setup: stmmac-axi-config {
def88eb4d8365a Dragan Simic        2024-06-09  1798  			snps,blen = <0 0 0 0 16 8 4>;
def88eb4d8365a Dragan Simic        2024-06-09  1799  			snps,wr_osr_lmt = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  1800  			snps,rd_osr_lmt = <8>;
def88eb4d8365a Dragan Simic        2024-06-09  1801  		};
def88eb4d8365a Dragan Simic        2024-06-09  1802  
def88eb4d8365a Dragan Simic        2024-06-09  1803  		gmac1_mtl_rx_setup: rx-queues-config {
def88eb4d8365a Dragan Simic        2024-06-09  1804  			snps,rx-queues-to-use = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1805  			queue0 {};
def88eb4d8365a Dragan Simic        2024-06-09  1806  			queue1 {};
def88eb4d8365a Dragan Simic        2024-06-09  1807  		};
def88eb4d8365a Dragan Simic        2024-06-09  1808  
def88eb4d8365a Dragan Simic        2024-06-09  1809  		gmac1_mtl_tx_setup: tx-queues-config {
def88eb4d8365a Dragan Simic        2024-06-09  1810  			snps,tx-queues-to-use = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  1811  			queue0 {};
def88eb4d8365a Dragan Simic        2024-06-09  1812  			queue1 {};
def88eb4d8365a Dragan Simic        2024-06-09  1813  		};
def88eb4d8365a Dragan Simic        2024-06-09  1814  	};
def88eb4d8365a Dragan Simic        2024-06-09  1815  
def88eb4d8365a Dragan Simic        2024-06-09  1816  	sata0: sata@fe210000 {
def88eb4d8365a Dragan Simic        2024-06-09  1817  		compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci";
def88eb4d8365a Dragan Simic        2024-06-09  1818  		reg = <0 0xfe210000 0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1819  		interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1820  		clocks = <&cru ACLK_SATA0>, <&cru CLK_PMALIVE0>,
def88eb4d8365a Dragan Simic        2024-06-09  1821  			 <&cru CLK_RXOOB0>, <&cru CLK_PIPEPHY0_REF>,
def88eb4d8365a Dragan Simic        2024-06-09  1822  			 <&cru CLK_PIPEPHY0_PIPE_ASIC_G>;
def88eb4d8365a Dragan Simic        2024-06-09  1823  		clock-names = "sata", "pmalive", "rxoob", "ref", "asic";
def88eb4d8365a Dragan Simic        2024-06-09  1824  		ports-implemented = <0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  1825  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1826  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1827  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1828  
def88eb4d8365a Dragan Simic        2024-06-09  1829  		sata-port@0 {
def88eb4d8365a Dragan Simic        2024-06-09  1830  			reg = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1831  			hba-port-cap = <HBA_PORT_FBSCP>;
def88eb4d8365a Dragan Simic        2024-06-09  1832  			phys = <&combphy0_ps PHY_TYPE_SATA>;
def88eb4d8365a Dragan Simic        2024-06-09  1833  			phy-names = "sata-phy";
def88eb4d8365a Dragan Simic        2024-06-09  1834  			snps,rx-ts-max = <32>;
def88eb4d8365a Dragan Simic        2024-06-09  1835  			snps,tx-ts-max = <32>;
def88eb4d8365a Dragan Simic        2024-06-09  1836  		};
def88eb4d8365a Dragan Simic        2024-06-09  1837  	};
def88eb4d8365a Dragan Simic        2024-06-09  1838  
def88eb4d8365a Dragan Simic        2024-06-09  1839  	sata2: sata@fe230000 {
def88eb4d8365a Dragan Simic        2024-06-09  1840  		compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci";
def88eb4d8365a Dragan Simic        2024-06-09  1841  		reg = <0 0xfe230000 0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1842  		interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1843  		clocks = <&cru ACLK_SATA2>, <&cru CLK_PMALIVE2>,
def88eb4d8365a Dragan Simic        2024-06-09  1844  			 <&cru CLK_RXOOB2>, <&cru CLK_PIPEPHY2_REF>,
def88eb4d8365a Dragan Simic        2024-06-09  1845  			 <&cru CLK_PIPEPHY2_PIPE_ASIC_G>;
def88eb4d8365a Dragan Simic        2024-06-09  1846  		clock-names = "sata", "pmalive", "rxoob", "ref", "asic";
def88eb4d8365a Dragan Simic        2024-06-09  1847  		ports-implemented = <0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  1848  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1849  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1850  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1851  
def88eb4d8365a Dragan Simic        2024-06-09  1852  		sata-port@0 {
def88eb4d8365a Dragan Simic        2024-06-09  1853  			reg = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1854  			hba-port-cap = <HBA_PORT_FBSCP>;
def88eb4d8365a Dragan Simic        2024-06-09  1855  			phys = <&combphy2_psu PHY_TYPE_SATA>;
def88eb4d8365a Dragan Simic        2024-06-09  1856  			phy-names = "sata-phy";
def88eb4d8365a Dragan Simic        2024-06-09  1857  			snps,rx-ts-max = <32>;
def88eb4d8365a Dragan Simic        2024-06-09  1858  			snps,tx-ts-max = <32>;
def88eb4d8365a Dragan Simic        2024-06-09  1859  		};
def88eb4d8365a Dragan Simic        2024-06-09  1860  	};
def88eb4d8365a Dragan Simic        2024-06-09  1861  
def88eb4d8365a Dragan Simic        2024-06-09  1862  	sfc: spi@fe2b0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1863  		compatible = "rockchip,sfc";
def88eb4d8365a Dragan Simic        2024-06-09  1864  		reg = <0x0 0xfe2b0000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  1865  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1866  		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
def88eb4d8365a Dragan Simic        2024-06-09  1867  		clock-names = "clk_sfc", "hclk_sfc";
def88eb4d8365a Dragan Simic        2024-06-09  1868  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  1869  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1870  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1871  	};
def88eb4d8365a Dragan Simic        2024-06-09  1872  
def88eb4d8365a Dragan Simic        2024-06-09  1873  	sdmmc: mmc@fe2c0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1874  		compatible = "rockchip,rk3588-dw-mshc", "rockchip,rk3288-dw-mshc";
def88eb4d8365a Dragan Simic        2024-06-09  1875  		reg = <0x0 0xfe2c0000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  1876  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1877  		clocks = <&scmi_clk SCMI_HCLK_SD>, <&scmi_clk SCMI_CCLK_SD>,
def88eb4d8365a Dragan Simic        2024-06-09  1878  			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
def88eb4d8365a Dragan Simic        2024-06-09  1879  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
def88eb4d8365a Dragan Simic        2024-06-09  1880  		fifo-depth = <0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  1881  		max-frequency = <200000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1882  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1883  		pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_det &sdmmc_bus4>;
def88eb4d8365a Dragan Simic        2024-06-09  1884  		power-domains = <&power RK3588_PD_SDMMC>;
def88eb4d8365a Dragan Simic        2024-06-09  1885  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1886  	};
def88eb4d8365a Dragan Simic        2024-06-09  1887  
def88eb4d8365a Dragan Simic        2024-06-09  1888  	sdio: mmc@fe2d0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1889  		compatible = "rockchip,rk3588-dw-mshc", "rockchip,rk3288-dw-mshc";
def88eb4d8365a Dragan Simic        2024-06-09  1890  		reg = <0x00 0xfe2d0000 0x00 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  1891  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1892  		clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>,
def88eb4d8365a Dragan Simic        2024-06-09  1893  			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
def88eb4d8365a Dragan Simic        2024-06-09  1894  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
def88eb4d8365a Dragan Simic        2024-06-09  1895  		fifo-depth = <0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  1896  		max-frequency = <200000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1897  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1898  		pinctrl-0 = <&sdiom1_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  1899  		power-domains = <&power RK3588_PD_SDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  1900  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1901  	};
def88eb4d8365a Dragan Simic        2024-06-09  1902  
def88eb4d8365a Dragan Simic        2024-06-09  1903  	sdhci: mmc@fe2e0000 {
def88eb4d8365a Dragan Simic        2024-06-09  1904  		compatible = "rockchip,rk3588-dwcmshc";
def88eb4d8365a Dragan Simic        2024-06-09  1905  		reg = <0x0 0xfe2e0000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09  1906  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1907  		assigned-clocks = <&cru BCLK_EMMC>, <&cru TMCLK_EMMC>, <&cru CCLK_EMMC>;
def88eb4d8365a Dragan Simic        2024-06-09  1908  		assigned-clock-rates = <200000000>, <24000000>, <200000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1909  		clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
def88eb4d8365a Dragan Simic        2024-06-09  1910  			 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
def88eb4d8365a Dragan Simic        2024-06-09  1911  			 <&cru TMCLK_EMMC>;
def88eb4d8365a Dragan Simic        2024-06-09  1912  		clock-names = "core", "bus", "axi", "block", "timer";
def88eb4d8365a Dragan Simic        2024-06-09  1913  		max-frequency = <200000000>;
def88eb4d8365a Dragan Simic        2024-06-09  1914  		pinctrl-0 = <&emmc_rstnout>, <&emmc_bus8>, <&emmc_clk>,
def88eb4d8365a Dragan Simic        2024-06-09  1915  			    <&emmc_cmd>, <&emmc_data_strobe>;
def88eb4d8365a Dragan Simic        2024-06-09  1916  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1917  		resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
def88eb4d8365a Dragan Simic        2024-06-09  1918  			 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
def88eb4d8365a Dragan Simic        2024-06-09  1919  			 <&cru SRST_T_EMMC>;
def88eb4d8365a Dragan Simic        2024-06-09  1920  		reset-names = "core", "bus", "axi", "block", "timer";
def88eb4d8365a Dragan Simic        2024-06-09  1921  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1922  	};
def88eb4d8365a Dragan Simic        2024-06-09  1923  
def88eb4d8365a Dragan Simic        2024-06-09  1924  	i2s0_8ch: i2s@fe470000 {
def88eb4d8365a Dragan Simic        2024-06-09  1925  		compatible = "rockchip,rk3588-i2s-tdm";
def88eb4d8365a Dragan Simic        2024-06-09  1926  		reg = <0x0 0xfe470000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1927  		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1928  		clocks = <&cru MCLK_I2S0_8CH_TX>, <&cru MCLK_I2S0_8CH_RX>, <&cru HCLK_I2S0_8CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1929  		clock-names = "mclk_tx", "mclk_rx", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1930  		assigned-clocks = <&cru CLK_I2S0_8CH_TX_SRC>, <&cru CLK_I2S0_8CH_RX_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  1931  		assigned-clock-parents = <&cru PLL_AUPLL>, <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  1932  		dmas = <&dmac0 0>, <&dmac0 1>;
def88eb4d8365a Dragan Simic        2024-06-09  1933  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  1934  		power-domains = <&power RK3588_PD_AUDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  1935  		resets = <&cru SRST_M_I2S0_8CH_TX>, <&cru SRST_M_I2S0_8CH_RX>;
def88eb4d8365a Dragan Simic        2024-06-09  1936  		reset-names = "tx-m", "rx-m";
def88eb4d8365a Dragan Simic        2024-06-09  1937  		rockchip,trcm-sync-tx-only;
def88eb4d8365a Dragan Simic        2024-06-09  1938  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1939  		pinctrl-0 = <&i2s0_lrck
def88eb4d8365a Dragan Simic        2024-06-09  1940  			     &i2s0_sclk
def88eb4d8365a Dragan Simic        2024-06-09  1941  			     &i2s0_sdi0
def88eb4d8365a Dragan Simic        2024-06-09  1942  			     &i2s0_sdi1
def88eb4d8365a Dragan Simic        2024-06-09  1943  			     &i2s0_sdi2
def88eb4d8365a Dragan Simic        2024-06-09  1944  			     &i2s0_sdi3
def88eb4d8365a Dragan Simic        2024-06-09  1945  			     &i2s0_sdo0
def88eb4d8365a Dragan Simic        2024-06-09  1946  			     &i2s0_sdo1
def88eb4d8365a Dragan Simic        2024-06-09  1947  			     &i2s0_sdo2
def88eb4d8365a Dragan Simic        2024-06-09  1948  			     &i2s0_sdo3>;
def88eb4d8365a Dragan Simic        2024-06-09  1949  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1950  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1951  	};
def88eb4d8365a Dragan Simic        2024-06-09  1952  
def88eb4d8365a Dragan Simic        2024-06-09  1953  	i2s1_8ch: i2s@fe480000 {
def88eb4d8365a Dragan Simic        2024-06-09  1954  		compatible = "rockchip,rk3588-i2s-tdm";
def88eb4d8365a Dragan Simic        2024-06-09  1955  		reg = <0x0 0xfe480000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1956  		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1957  		clocks = <&cru MCLK_I2S1_8CH_TX>, <&cru MCLK_I2S1_8CH_RX>, <&cru HCLK_I2S1_8CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1958  		clock-names = "mclk_tx", "mclk_rx", "hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1959  		dmas = <&dmac0 2>, <&dmac0 3>;
def88eb4d8365a Dragan Simic        2024-06-09  1960  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  1961  		resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
def88eb4d8365a Dragan Simic        2024-06-09  1962  		reset-names = "tx-m", "rx-m";
def88eb4d8365a Dragan Simic        2024-06-09  1963  		rockchip,trcm-sync-tx-only;
def88eb4d8365a Dragan Simic        2024-06-09  1964  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1965  		pinctrl-0 = <&i2s1m0_lrck
def88eb4d8365a Dragan Simic        2024-06-09  1966  			     &i2s1m0_sclk
def88eb4d8365a Dragan Simic        2024-06-09  1967  			     &i2s1m0_sdi0
def88eb4d8365a Dragan Simic        2024-06-09  1968  			     &i2s1m0_sdi1
def88eb4d8365a Dragan Simic        2024-06-09  1969  			     &i2s1m0_sdi2
def88eb4d8365a Dragan Simic        2024-06-09  1970  			     &i2s1m0_sdi3
def88eb4d8365a Dragan Simic        2024-06-09  1971  			     &i2s1m0_sdo0
def88eb4d8365a Dragan Simic        2024-06-09  1972  			     &i2s1m0_sdo1
def88eb4d8365a Dragan Simic        2024-06-09  1973  			     &i2s1m0_sdo2
def88eb4d8365a Dragan Simic        2024-06-09  1974  			     &i2s1m0_sdo3>;
def88eb4d8365a Dragan Simic        2024-06-09  1975  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1976  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1977  	};
def88eb4d8365a Dragan Simic        2024-06-09  1978  
def88eb4d8365a Dragan Simic        2024-06-09  1979  	i2s2_2ch: i2s@fe490000 {
def88eb4d8365a Dragan Simic        2024-06-09  1980  		compatible = "rockchip,rk3588-i2s", "rockchip,rk3066-i2s";
def88eb4d8365a Dragan Simic        2024-06-09  1981  		reg = <0x0 0xfe490000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  1982  		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  1983  		clocks = <&cru MCLK_I2S2_2CH>, <&cru HCLK_I2S2_2CH>;
def88eb4d8365a Dragan Simic        2024-06-09  1984  		clock-names = "i2s_clk", "i2s_hclk";
def88eb4d8365a Dragan Simic        2024-06-09  1985  		assigned-clocks = <&cru CLK_I2S2_2CH_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  1986  		assigned-clock-parents = <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  1987  		dmas = <&dmac1 0>, <&dmac1 1>;
def88eb4d8365a Dragan Simic        2024-06-09  1988  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  1989  		power-domains = <&power RK3588_PD_AUDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  1990  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  1991  		pinctrl-0 = <&i2s2m1_lrck
def88eb4d8365a Dragan Simic        2024-06-09  1992  			     &i2s2m1_sclk
def88eb4d8365a Dragan Simic        2024-06-09  1993  			     &i2s2m1_sdi
def88eb4d8365a Dragan Simic        2024-06-09  1994  			     &i2s2m1_sdo>;
def88eb4d8365a Dragan Simic        2024-06-09  1995  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  1996  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  1997  	};
def88eb4d8365a Dragan Simic        2024-06-09  1998  
def88eb4d8365a Dragan Simic        2024-06-09  1999  	i2s3_2ch: i2s@fe4a0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2000  		compatible = "rockchip,rk3588-i2s", "rockchip,rk3066-i2s";
def88eb4d8365a Dragan Simic        2024-06-09  2001  		reg = <0x0 0xfe4a0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2002  		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2003  		clocks = <&cru MCLK_I2S3_2CH>, <&cru HCLK_I2S3_2CH>;
def88eb4d8365a Dragan Simic        2024-06-09  2004  		clock-names = "i2s_clk", "i2s_hclk";
def88eb4d8365a Dragan Simic        2024-06-09  2005  		assigned-clocks = <&cru CLK_I2S3_2CH_SRC>;
def88eb4d8365a Dragan Simic        2024-06-09  2006  		assigned-clock-parents = <&cru PLL_AUPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  2007  		dmas = <&dmac1 2>, <&dmac1 3>;
def88eb4d8365a Dragan Simic        2024-06-09  2008  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2009  		power-domains = <&power RK3588_PD_AUDIO>;
def88eb4d8365a Dragan Simic        2024-06-09  2010  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2011  		pinctrl-0 = <&i2s3_lrck
def88eb4d8365a Dragan Simic        2024-06-09  2012  			     &i2s3_sclk
def88eb4d8365a Dragan Simic        2024-06-09  2013  			     &i2s3_sdi
def88eb4d8365a Dragan Simic        2024-06-09  2014  			     &i2s3_sdo>;
def88eb4d8365a Dragan Simic        2024-06-09  2015  		#sound-dai-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2016  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2017  	};
def88eb4d8365a Dragan Simic        2024-06-09  2018  
def88eb4d8365a Dragan Simic        2024-06-09  2019  	gic: interrupt-controller@fe600000 {
def88eb4d8365a Dragan Simic        2024-06-09  2020  		compatible = "arm,gic-v3";
def88eb4d8365a Dragan Simic        2024-06-09  2021  		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
def88eb4d8365a Dragan Simic        2024-06-09  2022  		      <0x0 0xfe680000 0 0x100000>; /* GICR */
def88eb4d8365a Dragan Simic        2024-06-09  2023  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2024  		interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2025  		mbi-alias = <0x0 0xfe610000>;
def88eb4d8365a Dragan Simic        2024-06-09  2026  		mbi-ranges = <424 56>;
def88eb4d8365a Dragan Simic        2024-06-09  2027  		msi-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2028  		ranges;
def88eb4d8365a Dragan Simic        2024-06-09  2029  		#address-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2030  		#interrupt-cells = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2031  		#size-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2032  
def88eb4d8365a Dragan Simic        2024-06-09  2033  		its0: msi-controller@fe640000 {
def88eb4d8365a Dragan Simic        2024-06-09  2034  			compatible = "arm,gic-v3-its";
def88eb4d8365a Dragan Simic        2024-06-09  2035  			reg = <0x0 0xfe640000 0x0 0x20000>;
def88eb4d8365a Dragan Simic        2024-06-09  2036  			msi-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2037  			#msi-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2038  		};
def88eb4d8365a Dragan Simic        2024-06-09  2039  
def88eb4d8365a Dragan Simic        2024-06-09  2040  		its1: msi-controller@fe660000 {
def88eb4d8365a Dragan Simic        2024-06-09  2041  			compatible = "arm,gic-v3-its";
def88eb4d8365a Dragan Simic        2024-06-09  2042  			reg = <0x0 0xfe660000 0x0 0x20000>;
def88eb4d8365a Dragan Simic        2024-06-09  2043  			msi-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2044  			#msi-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2045  		};
def88eb4d8365a Dragan Simic        2024-06-09  2046  
def88eb4d8365a Dragan Simic        2024-06-09  2047  		ppi-partitions {
def88eb4d8365a Dragan Simic        2024-06-09  2048  			ppi_partition0: interrupt-partition-0 {
def88eb4d8365a Dragan Simic        2024-06-09  2049  				affinity = <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
def88eb4d8365a Dragan Simic        2024-06-09  2050  			};
def88eb4d8365a Dragan Simic        2024-06-09  2051  
def88eb4d8365a Dragan Simic        2024-06-09  2052  			ppi_partition1: interrupt-partition-1 {
def88eb4d8365a Dragan Simic        2024-06-09  2053  				affinity = <&cpu_b0 &cpu_b1 &cpu_b2 &cpu_b3>;
def88eb4d8365a Dragan Simic        2024-06-09  2054  			};
def88eb4d8365a Dragan Simic        2024-06-09  2055  		};
def88eb4d8365a Dragan Simic        2024-06-09  2056  	};
def88eb4d8365a Dragan Simic        2024-06-09  2057  
def88eb4d8365a Dragan Simic        2024-06-09  2058  	dmac0: dma-controller@fea10000 {
def88eb4d8365a Dragan Simic        2024-06-09  2059  		compatible = "arm,pl330", "arm,primecell";
def88eb4d8365a Dragan Simic        2024-06-09  2060  		reg = <0x0 0xfea10000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  2061  		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  2062  			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2063  		arm,pl330-periph-burst;
def88eb4d8365a Dragan Simic        2024-06-09  2064  		clocks = <&cru ACLK_DMAC0>;
def88eb4d8365a Dragan Simic        2024-06-09  2065  		clock-names = "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2066  		#dma-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2067  	};
def88eb4d8365a Dragan Simic        2024-06-09  2068  
def88eb4d8365a Dragan Simic        2024-06-09  2069  	dmac1: dma-controller@fea30000 {
def88eb4d8365a Dragan Simic        2024-06-09  2070  		compatible = "arm,pl330", "arm,primecell";
def88eb4d8365a Dragan Simic        2024-06-09  2071  		reg = <0x0 0xfea30000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  2072  		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  2073  			     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2074  		arm,pl330-periph-burst;
def88eb4d8365a Dragan Simic        2024-06-09  2075  		clocks = <&cru ACLK_DMAC1>;
def88eb4d8365a Dragan Simic        2024-06-09  2076  		clock-names = "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2077  		#dma-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2078  	};
def88eb4d8365a Dragan Simic        2024-06-09  2079  
def88eb4d8365a Dragan Simic        2024-06-09  2080  	i2c1: i2c@fea90000 {
def88eb4d8365a Dragan Simic        2024-06-09  2081  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2082  		reg = <0x0 0xfea90000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2083  		clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
def88eb4d8365a Dragan Simic        2024-06-09  2084  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2085  		interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2086  		pinctrl-0 = <&i2c1m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2087  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2088  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2089  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2090  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2091  	};
def88eb4d8365a Dragan Simic        2024-06-09  2092  
def88eb4d8365a Dragan Simic        2024-06-09  2093  	i2c2: i2c@feaa0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2094  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2095  		reg = <0x0 0xfeaa0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2096  		clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
def88eb4d8365a Dragan Simic        2024-06-09  2097  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2098  		interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2099  		pinctrl-0 = <&i2c2m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2100  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2101  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2102  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2103  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2104  	};
def88eb4d8365a Dragan Simic        2024-06-09  2105  
def88eb4d8365a Dragan Simic        2024-06-09  2106  	i2c3: i2c@feab0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2107  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2108  		reg = <0x0 0xfeab0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2109  		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
def88eb4d8365a Dragan Simic        2024-06-09  2110  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2111  		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2112  		pinctrl-0 = <&i2c3m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2113  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2114  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2115  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2116  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2117  	};
def88eb4d8365a Dragan Simic        2024-06-09  2118  
def88eb4d8365a Dragan Simic        2024-06-09  2119  	i2c4: i2c@feac0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2120  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2121  		reg = <0x0 0xfeac0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2122  		clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
def88eb4d8365a Dragan Simic        2024-06-09  2123  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2124  		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2125  		pinctrl-0 = <&i2c4m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2126  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2127  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2128  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2129  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2130  	};
def88eb4d8365a Dragan Simic        2024-06-09  2131  
def88eb4d8365a Dragan Simic        2024-06-09  2132  	i2c5: i2c@fead0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2133  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2134  		reg = <0x0 0xfead0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2135  		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
def88eb4d8365a Dragan Simic        2024-06-09  2136  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2137  		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2138  		pinctrl-0 = <&i2c5m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2139  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2140  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2141  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2142  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2143  	};
def88eb4d8365a Dragan Simic        2024-06-09  2144  
def88eb4d8365a Dragan Simic        2024-06-09  2145  	timer0: timer@feae0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2146  		compatible = "rockchip,rk3588-timer", "rockchip,rk3288-timer";
def88eb4d8365a Dragan Simic        2024-06-09  2147  		reg = <0x0 0xfeae0000 0x0 0x20>;
def88eb4d8365a Dragan Simic        2024-06-09  2148  		interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2149  		clocks = <&cru PCLK_BUSTIMER0>, <&cru CLK_BUSTIMER0>;
def88eb4d8365a Dragan Simic        2024-06-09  2150  		clock-names = "pclk", "timer";
def88eb4d8365a Dragan Simic        2024-06-09  2151  	};
def88eb4d8365a Dragan Simic        2024-06-09  2152  
def88eb4d8365a Dragan Simic        2024-06-09  2153  	wdt: watchdog@feaf0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2154  		compatible = "rockchip,rk3588-wdt", "snps,dw-wdt";
def88eb4d8365a Dragan Simic        2024-06-09  2155  		reg = <0x0 0xfeaf0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2156  		clocks = <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
def88eb4d8365a Dragan Simic        2024-06-09  2157  		clock-names = "tclk", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2158  		interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2159  	};
def88eb4d8365a Dragan Simic        2024-06-09  2160  
def88eb4d8365a Dragan Simic        2024-06-09  2161  	spi0: spi@feb00000 {
def88eb4d8365a Dragan Simic        2024-06-09  2162  		compatible = "rockchip,rk3588-spi", "rockchip,rk3066-spi";
def88eb4d8365a Dragan Simic        2024-06-09  2163  		reg = <0x0 0xfeb00000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2164  		interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2165  		clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
def88eb4d8365a Dragan Simic        2024-06-09  2166  		clock-names = "spiclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2167  		dmas = <&dmac0 14>, <&dmac0 15>;
def88eb4d8365a Dragan Simic        2024-06-09  2168  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2169  		num-cs = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2170  		pinctrl-0 = <&spi0m0_cs0 &spi0m0_cs1 &spi0m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2171  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2172  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2173  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2174  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2175  	};
def88eb4d8365a Dragan Simic        2024-06-09  2176  
def88eb4d8365a Dragan Simic        2024-06-09  2177  	spi1: spi@feb10000 {
def88eb4d8365a Dragan Simic        2024-06-09  2178  		compatible = "rockchip,rk3588-spi", "rockchip,rk3066-spi";
def88eb4d8365a Dragan Simic        2024-06-09  2179  		reg = <0x0 0xfeb10000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2180  		interrupts = <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2181  		clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
def88eb4d8365a Dragan Simic        2024-06-09  2182  		clock-names = "spiclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2183  		dmas = <&dmac0 16>, <&dmac0 17>;
def88eb4d8365a Dragan Simic        2024-06-09  2184  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2185  		num-cs = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2186  		pinctrl-0 = <&spi1m1_cs0 &spi1m1_cs1 &spi1m1_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2187  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2188  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2189  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2190  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2191  	};
def88eb4d8365a Dragan Simic        2024-06-09  2192  
def88eb4d8365a Dragan Simic        2024-06-09  2193  	spi2: spi@feb20000 {
def88eb4d8365a Dragan Simic        2024-06-09  2194  		compatible = "rockchip,rk3588-spi", "rockchip,rk3066-spi";
def88eb4d8365a Dragan Simic        2024-06-09  2195  		reg = <0x0 0xfeb20000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2196  		interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2197  		clocks = <&cru CLK_SPI2>, <&cru PCLK_SPI2>;
def88eb4d8365a Dragan Simic        2024-06-09  2198  		clock-names = "spiclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2199  		dmas = <&dmac1 15>, <&dmac1 16>;
def88eb4d8365a Dragan Simic        2024-06-09  2200  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2201  		num-cs = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2202  		pinctrl-0 = <&spi2m2_cs0 &spi2m2_cs1 &spi2m2_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2203  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2204  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2205  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2206  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2207  	};
def88eb4d8365a Dragan Simic        2024-06-09  2208  
def88eb4d8365a Dragan Simic        2024-06-09  2209  	spi3: spi@feb30000 {
def88eb4d8365a Dragan Simic        2024-06-09  2210  		compatible = "rockchip,rk3588-spi", "rockchip,rk3066-spi";
def88eb4d8365a Dragan Simic        2024-06-09  2211  		reg = <0x0 0xfeb30000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2212  		interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2213  		clocks = <&cru CLK_SPI3>, <&cru PCLK_SPI3>;
def88eb4d8365a Dragan Simic        2024-06-09  2214  		clock-names = "spiclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2215  		dmas = <&dmac1 17>, <&dmac1 18>;
def88eb4d8365a Dragan Simic        2024-06-09  2216  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2217  		num-cs = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2218  		pinctrl-0 = <&spi3m1_cs0 &spi3m1_cs1 &spi3m1_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2219  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2220  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2221  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2222  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2223  	};
def88eb4d8365a Dragan Simic        2024-06-09  2224  
def88eb4d8365a Dragan Simic        2024-06-09  2225  	uart1: serial@feb40000 {
def88eb4d8365a Dragan Simic        2024-06-09  2226  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2227  		reg = <0x0 0xfeb40000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2228  		interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2229  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
def88eb4d8365a Dragan Simic        2024-06-09  2230  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2231  		dmas = <&dmac0 8>, <&dmac0 9>;
def88eb4d8365a Dragan Simic        2024-06-09  2232  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2233  		pinctrl-0 = <&uart1m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2234  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2235  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2236  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2237  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2238  	};
def88eb4d8365a Dragan Simic        2024-06-09  2239  
def88eb4d8365a Dragan Simic        2024-06-09  2240  	uart2: serial@feb50000 {
def88eb4d8365a Dragan Simic        2024-06-09  2241  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2242  		reg = <0x0 0xfeb50000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2243  		interrupts = <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2244  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
def88eb4d8365a Dragan Simic        2024-06-09  2245  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2246  		dmas = <&dmac0 10>, <&dmac0 11>;
def88eb4d8365a Dragan Simic        2024-06-09  2247  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2248  		pinctrl-0 = <&uart2m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2249  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2250  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2251  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2252  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2253  	};
def88eb4d8365a Dragan Simic        2024-06-09  2254  
def88eb4d8365a Dragan Simic        2024-06-09  2255  	uart3: serial@feb60000 {
def88eb4d8365a Dragan Simic        2024-06-09  2256  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2257  		reg = <0x0 0xfeb60000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2258  		interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2259  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
def88eb4d8365a Dragan Simic        2024-06-09  2260  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2261  		dmas = <&dmac0 12>, <&dmac0 13>;
def88eb4d8365a Dragan Simic        2024-06-09  2262  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2263  		pinctrl-0 = <&uart3m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2264  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2265  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2266  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2267  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2268  	};
def88eb4d8365a Dragan Simic        2024-06-09  2269  
def88eb4d8365a Dragan Simic        2024-06-09  2270  	uart4: serial@feb70000 {
def88eb4d8365a Dragan Simic        2024-06-09  2271  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2272  		reg = <0x0 0xfeb70000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2273  		interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2274  		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
def88eb4d8365a Dragan Simic        2024-06-09  2275  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2276  		dmas = <&dmac1 9>, <&dmac1 10>;
def88eb4d8365a Dragan Simic        2024-06-09  2277  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2278  		pinctrl-0 = <&uart4m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2279  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2280  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2281  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2282  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2283  	};
def88eb4d8365a Dragan Simic        2024-06-09  2284  
def88eb4d8365a Dragan Simic        2024-06-09  2285  	uart5: serial@feb80000 {
def88eb4d8365a Dragan Simic        2024-06-09  2286  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2287  		reg = <0x0 0xfeb80000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2288  		interrupts = <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2289  		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
def88eb4d8365a Dragan Simic        2024-06-09  2290  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2291  		dmas = <&dmac1 11>, <&dmac1 12>;
def88eb4d8365a Dragan Simic        2024-06-09  2292  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2293  		pinctrl-0 = <&uart5m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2294  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2295  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2296  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2297  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2298  	};
def88eb4d8365a Dragan Simic        2024-06-09  2299  
def88eb4d8365a Dragan Simic        2024-06-09  2300  	uart6: serial@feb90000 {
def88eb4d8365a Dragan Simic        2024-06-09  2301  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2302  		reg = <0x0 0xfeb90000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2303  		interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2304  		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
def88eb4d8365a Dragan Simic        2024-06-09  2305  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2306  		dmas = <&dmac1 13>, <&dmac1 14>;
def88eb4d8365a Dragan Simic        2024-06-09  2307  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2308  		pinctrl-0 = <&uart6m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2309  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2310  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2311  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2312  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2313  	};
def88eb4d8365a Dragan Simic        2024-06-09  2314  
def88eb4d8365a Dragan Simic        2024-06-09  2315  	uart7: serial@feba0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2316  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2317  		reg = <0x0 0xfeba0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2318  		interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2319  		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
def88eb4d8365a Dragan Simic        2024-06-09  2320  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2321  		dmas = <&dmac2 7>, <&dmac2 8>;
def88eb4d8365a Dragan Simic        2024-06-09  2322  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2323  		pinctrl-0 = <&uart7m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2324  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2325  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2326  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2327  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2328  	};
def88eb4d8365a Dragan Simic        2024-06-09  2329  
def88eb4d8365a Dragan Simic        2024-06-09  2330  	uart8: serial@febb0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2331  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2332  		reg = <0x0 0xfebb0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2333  		interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2334  		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
def88eb4d8365a Dragan Simic        2024-06-09  2335  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2336  		dmas = <&dmac2 9>, <&dmac2 10>;
def88eb4d8365a Dragan Simic        2024-06-09  2337  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2338  		pinctrl-0 = <&uart8m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2339  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2340  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2341  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2342  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2343  	};
def88eb4d8365a Dragan Simic        2024-06-09  2344  
def88eb4d8365a Dragan Simic        2024-06-09  2345  	uart9: serial@febc0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2346  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
def88eb4d8365a Dragan Simic        2024-06-09  2347  		reg = <0x0 0xfebc0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2348  		interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2349  		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
def88eb4d8365a Dragan Simic        2024-06-09  2350  		clock-names = "baudclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2351  		dmas = <&dmac2 11>, <&dmac2 12>;
def88eb4d8365a Dragan Simic        2024-06-09  2352  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2353  		pinctrl-0 = <&uart9m1_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2354  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2355  		reg-io-width = <4>;
def88eb4d8365a Dragan Simic        2024-06-09  2356  		reg-shift = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2357  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2358  	};
def88eb4d8365a Dragan Simic        2024-06-09  2359  
def88eb4d8365a Dragan Simic        2024-06-09  2360  	pwm4: pwm@febd0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2361  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2362  		reg = <0x0 0xfebd0000 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2363  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
def88eb4d8365a Dragan Simic        2024-06-09  2364  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2365  		pinctrl-0 = <&pwm4m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2366  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2367  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2368  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2369  	};
def88eb4d8365a Dragan Simic        2024-06-09  2370  
def88eb4d8365a Dragan Simic        2024-06-09  2371  	pwm5: pwm@febd0010 {
def88eb4d8365a Dragan Simic        2024-06-09  2372  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2373  		reg = <0x0 0xfebd0010 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2374  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
def88eb4d8365a Dragan Simic        2024-06-09  2375  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2376  		pinctrl-0 = <&pwm5m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2377  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2378  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2379  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2380  	};
def88eb4d8365a Dragan Simic        2024-06-09  2381  
def88eb4d8365a Dragan Simic        2024-06-09  2382  	pwm6: pwm@febd0020 {
def88eb4d8365a Dragan Simic        2024-06-09  2383  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2384  		reg = <0x0 0xfebd0020 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2385  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
def88eb4d8365a Dragan Simic        2024-06-09  2386  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2387  		pinctrl-0 = <&pwm6m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2388  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2389  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2390  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2391  	};
def88eb4d8365a Dragan Simic        2024-06-09  2392  
def88eb4d8365a Dragan Simic        2024-06-09  2393  	pwm7: pwm@febd0030 {
def88eb4d8365a Dragan Simic        2024-06-09  2394  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2395  		reg = <0x0 0xfebd0030 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2396  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
def88eb4d8365a Dragan Simic        2024-06-09  2397  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2398  		pinctrl-0 = <&pwm7m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2399  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2400  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2401  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2402  	};
def88eb4d8365a Dragan Simic        2024-06-09  2403  
def88eb4d8365a Dragan Simic        2024-06-09  2404  	pwm8: pwm@febe0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2405  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2406  		reg = <0x0 0xfebe0000 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2407  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
def88eb4d8365a Dragan Simic        2024-06-09  2408  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2409  		pinctrl-0 = <&pwm8m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2410  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2411  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2412  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2413  	};
def88eb4d8365a Dragan Simic        2024-06-09  2414  
def88eb4d8365a Dragan Simic        2024-06-09  2415  	pwm9: pwm@febe0010 {
def88eb4d8365a Dragan Simic        2024-06-09  2416  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2417  		reg = <0x0 0xfebe0010 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2418  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
def88eb4d8365a Dragan Simic        2024-06-09  2419  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2420  		pinctrl-0 = <&pwm9m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2421  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2422  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2423  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2424  	};
def88eb4d8365a Dragan Simic        2024-06-09  2425  
def88eb4d8365a Dragan Simic        2024-06-09  2426  	pwm10: pwm@febe0020 {
def88eb4d8365a Dragan Simic        2024-06-09  2427  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2428  		reg = <0x0 0xfebe0020 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2429  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
def88eb4d8365a Dragan Simic        2024-06-09  2430  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2431  		pinctrl-0 = <&pwm10m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2432  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2433  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2434  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2435  	};
def88eb4d8365a Dragan Simic        2024-06-09  2436  
def88eb4d8365a Dragan Simic        2024-06-09  2437  	pwm11: pwm@febe0030 {
def88eb4d8365a Dragan Simic        2024-06-09  2438  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2439  		reg = <0x0 0xfebe0030 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2440  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
def88eb4d8365a Dragan Simic        2024-06-09  2441  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2442  		pinctrl-0 = <&pwm11m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2443  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2444  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2445  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2446  	};
def88eb4d8365a Dragan Simic        2024-06-09  2447  
def88eb4d8365a Dragan Simic        2024-06-09  2448  	pwm12: pwm@febf0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2449  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2450  		reg = <0x0 0xfebf0000 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2451  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
def88eb4d8365a Dragan Simic        2024-06-09  2452  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2453  		pinctrl-0 = <&pwm12m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2454  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2455  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2456  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2457  	};
def88eb4d8365a Dragan Simic        2024-06-09  2458  
def88eb4d8365a Dragan Simic        2024-06-09  2459  	pwm13: pwm@febf0010 {
def88eb4d8365a Dragan Simic        2024-06-09  2460  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2461  		reg = <0x0 0xfebf0010 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2462  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
def88eb4d8365a Dragan Simic        2024-06-09  2463  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2464  		pinctrl-0 = <&pwm13m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2465  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2466  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2467  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2468  	};
def88eb4d8365a Dragan Simic        2024-06-09  2469  
def88eb4d8365a Dragan Simic        2024-06-09  2470  	pwm14: pwm@febf0020 {
def88eb4d8365a Dragan Simic        2024-06-09  2471  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2472  		reg = <0x0 0xfebf0020 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2473  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
def88eb4d8365a Dragan Simic        2024-06-09  2474  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2475  		pinctrl-0 = <&pwm14m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2476  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2477  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2478  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2479  	};
def88eb4d8365a Dragan Simic        2024-06-09  2480  
def88eb4d8365a Dragan Simic        2024-06-09  2481  	pwm15: pwm@febf0030 {
def88eb4d8365a Dragan Simic        2024-06-09  2482  		compatible = "rockchip,rk3588-pwm", "rockchip,rk3328-pwm";
def88eb4d8365a Dragan Simic        2024-06-09  2483  		reg = <0x0 0xfebf0030 0x0 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2484  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
def88eb4d8365a Dragan Simic        2024-06-09  2485  		clock-names = "pwm", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2486  		pinctrl-0 = <&pwm15m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2487  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2488  		#pwm-cells = <3>;
def88eb4d8365a Dragan Simic        2024-06-09  2489  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2490  	};
def88eb4d8365a Dragan Simic        2024-06-09  2491  
510cd9e6884531 Alexey Charkov      2024-06-17  2492  	thermal_zones: thermal-zones {
510cd9e6884531 Alexey Charkov      2024-06-17  2493  		/* sensor near the center of the SoC */
510cd9e6884531 Alexey Charkov      2024-06-17  2494  		package_thermal: package-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2495  			polling-delay-passive = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2496  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2497  			thermal-sensors = <&tsadc 0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2498  
510cd9e6884531 Alexey Charkov      2024-06-17  2499  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2500  				package_crit: package-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2501  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2502  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2503  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2504  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2505  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2506  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2507  
510cd9e6884531 Alexey Charkov      2024-06-17  2508  		/* sensor between A76 cores 0 and 1 */
510cd9e6884531 Alexey Charkov      2024-06-17  2509  		bigcore0_thermal: bigcore0-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2510  			polling-delay-passive = <100>;
510cd9e6884531 Alexey Charkov      2024-06-17  2511  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2512  			thermal-sensors = <&tsadc 1>;
510cd9e6884531 Alexey Charkov      2024-06-17  2513  
510cd9e6884531 Alexey Charkov      2024-06-17  2514  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2515  				bigcore0_alert: bigcore0-alert {
510cd9e6884531 Alexey Charkov      2024-06-17  2516  					temperature = <85000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2517  					hysteresis = <2000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2518  					type = "passive";
510cd9e6884531 Alexey Charkov      2024-06-17  2519  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2520  
510cd9e6884531 Alexey Charkov      2024-06-17  2521  				bigcore0_crit: bigcore0-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2522  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2523  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2524  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2525  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2526  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2527  
510cd9e6884531 Alexey Charkov      2024-06-17  2528  			cooling-maps {
510cd9e6884531 Alexey Charkov      2024-06-17  2529  				map0 {
510cd9e6884531 Alexey Charkov      2024-06-17  2530  					trip = <&bigcore0_alert>;
510cd9e6884531 Alexey Charkov      2024-06-17  2531  					cooling-device =
510cd9e6884531 Alexey Charkov      2024-06-17  2532  						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
510cd9e6884531 Alexey Charkov      2024-06-17  2533  						<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
510cd9e6884531 Alexey Charkov      2024-06-17  2534  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2535  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2536  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2537  
510cd9e6884531 Alexey Charkov      2024-06-17  2538  		/* sensor between A76 cores 2 and 3 */
510cd9e6884531 Alexey Charkov      2024-06-17  2539  		bigcore2_thermal: bigcore2-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2540  			polling-delay-passive = <100>;
510cd9e6884531 Alexey Charkov      2024-06-17  2541  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2542  			thermal-sensors = <&tsadc 2>;
510cd9e6884531 Alexey Charkov      2024-06-17  2543  
510cd9e6884531 Alexey Charkov      2024-06-17  2544  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2545  				bigcore2_alert: bigcore2-alert {
510cd9e6884531 Alexey Charkov      2024-06-17  2546  					temperature = <85000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2547  					hysteresis = <2000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2548  					type = "passive";
510cd9e6884531 Alexey Charkov      2024-06-17  2549  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2550  
510cd9e6884531 Alexey Charkov      2024-06-17  2551  				bigcore2_crit: bigcore2-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2552  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2553  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2554  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2555  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2556  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2557  
510cd9e6884531 Alexey Charkov      2024-06-17  2558  			cooling-maps {
510cd9e6884531 Alexey Charkov      2024-06-17  2559  				map0 {
510cd9e6884531 Alexey Charkov      2024-06-17  2560  					trip = <&bigcore2_alert>;
510cd9e6884531 Alexey Charkov      2024-06-17  2561  					cooling-device =
510cd9e6884531 Alexey Charkov      2024-06-17  2562  						<&cpu_b2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
510cd9e6884531 Alexey Charkov      2024-06-17  2563  						<&cpu_b3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
510cd9e6884531 Alexey Charkov      2024-06-17  2564  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2565  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2566  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2567  
510cd9e6884531 Alexey Charkov      2024-06-17  2568  		/* sensor between the four A55 cores */
510cd9e6884531 Alexey Charkov      2024-06-17  2569  		little_core_thermal: littlecore-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2570  			polling-delay-passive = <100>;
510cd9e6884531 Alexey Charkov      2024-06-17  2571  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2572  			thermal-sensors = <&tsadc 3>;
510cd9e6884531 Alexey Charkov      2024-06-17  2573  
510cd9e6884531 Alexey Charkov      2024-06-17  2574  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2575  				littlecore_alert: littlecore-alert {
510cd9e6884531 Alexey Charkov      2024-06-17  2576  					temperature = <85000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2577  					hysteresis = <2000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2578  					type = "passive";
510cd9e6884531 Alexey Charkov      2024-06-17  2579  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2580  
510cd9e6884531 Alexey Charkov      2024-06-17  2581  				littlecore_crit: littlecore-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2582  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2583  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2584  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2585  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2586  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2587  
510cd9e6884531 Alexey Charkov      2024-06-17  2588  			cooling-maps {
510cd9e6884531 Alexey Charkov      2024-06-17  2589  				map0 {
510cd9e6884531 Alexey Charkov      2024-06-17  2590  					trip = <&littlecore_alert>;
510cd9e6884531 Alexey Charkov      2024-06-17  2591  					cooling-device =
510cd9e6884531 Alexey Charkov      2024-06-17  2592  						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
510cd9e6884531 Alexey Charkov      2024-06-17  2593  						<&cpu_l1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
510cd9e6884531 Alexey Charkov      2024-06-17  2594  						<&cpu_l2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
510cd9e6884531 Alexey Charkov      2024-06-17  2595  						<&cpu_l3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
510cd9e6884531 Alexey Charkov      2024-06-17  2596  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2597  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2598  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2599  
510cd9e6884531 Alexey Charkov      2024-06-17  2600  		/* sensor near the PD_CENTER power domain */
510cd9e6884531 Alexey Charkov      2024-06-17  2601  		center_thermal: center-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2602  			polling-delay-passive = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2603  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2604  			thermal-sensors = <&tsadc 4>;
510cd9e6884531 Alexey Charkov      2024-06-17  2605  
510cd9e6884531 Alexey Charkov      2024-06-17  2606  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2607  				center_crit: center-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2608  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2609  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2610  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2611  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2612  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2613  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2614  
510cd9e6884531 Alexey Charkov      2024-06-17  2615  		gpu_thermal: gpu-thermal {
b78f87940a7932 Alexey Charkov      2024-06-17  2616  			polling-delay-passive = <100>;
510cd9e6884531 Alexey Charkov      2024-06-17  2617  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2618  			thermal-sensors = <&tsadc 5>;
510cd9e6884531 Alexey Charkov      2024-06-17  2619  
510cd9e6884531 Alexey Charkov      2024-06-17  2620  			trips {
b78f87940a7932 Alexey Charkov      2024-06-17  2621  				gpu_alert: gpu-alert {
b78f87940a7932 Alexey Charkov      2024-06-17  2622  					temperature = <85000>;
b78f87940a7932 Alexey Charkov      2024-06-17  2623  					hysteresis = <2000>;
b78f87940a7932 Alexey Charkov      2024-06-17  2624  					type = "passive";
b78f87940a7932 Alexey Charkov      2024-06-17  2625  				};
b78f87940a7932 Alexey Charkov      2024-06-17  2626  
510cd9e6884531 Alexey Charkov      2024-06-17  2627  				gpu_crit: gpu-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2628  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2629  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2630  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2631  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2632  			};
b78f87940a7932 Alexey Charkov      2024-06-17  2633  
b78f87940a7932 Alexey Charkov      2024-06-17  2634  			cooling-maps {
b78f87940a7932 Alexey Charkov      2024-06-17  2635  				map0 {
b78f87940a7932 Alexey Charkov      2024-06-17  2636  					trip = <&gpu_alert>;
b78f87940a7932 Alexey Charkov      2024-06-17  2637  					cooling-device =
b78f87940a7932 Alexey Charkov      2024-06-17  2638  						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
b78f87940a7932 Alexey Charkov      2024-06-17  2639  				};
b78f87940a7932 Alexey Charkov      2024-06-17  2640  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2641  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2642  
510cd9e6884531 Alexey Charkov      2024-06-17  2643  		npu_thermal: npu-thermal {
510cd9e6884531 Alexey Charkov      2024-06-17  2644  			polling-delay-passive = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2645  			polling-delay = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2646  			thermal-sensors = <&tsadc 6>;
510cd9e6884531 Alexey Charkov      2024-06-17  2647  
510cd9e6884531 Alexey Charkov      2024-06-17  2648  			trips {
510cd9e6884531 Alexey Charkov      2024-06-17  2649  				npu_crit: npu-crit {
510cd9e6884531 Alexey Charkov      2024-06-17  2650  					temperature = <115000>;
510cd9e6884531 Alexey Charkov      2024-06-17  2651  					hysteresis = <0>;
510cd9e6884531 Alexey Charkov      2024-06-17  2652  					type = "critical";
510cd9e6884531 Alexey Charkov      2024-06-17  2653  				};
510cd9e6884531 Alexey Charkov      2024-06-17  2654  			};
510cd9e6884531 Alexey Charkov      2024-06-17  2655  		};
510cd9e6884531 Alexey Charkov      2024-06-17  2656  	};
510cd9e6884531 Alexey Charkov      2024-06-17  2657  
def88eb4d8365a Dragan Simic        2024-06-09  2658  	tsadc: tsadc@fec00000 {
def88eb4d8365a Dragan Simic        2024-06-09  2659  		compatible = "rockchip,rk3588-tsadc";
def88eb4d8365a Dragan Simic        2024-06-09  2660  		reg = <0x0 0xfec00000 0x0 0x400>;
def88eb4d8365a Dragan Simic        2024-06-09  2661  		interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2662  		clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
def88eb4d8365a Dragan Simic        2024-06-09  2663  		clock-names = "tsadc", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2664  		assigned-clocks = <&cru CLK_TSADC>;
def88eb4d8365a Dragan Simic        2024-06-09  2665  		assigned-clock-rates = <2000000>;
def88eb4d8365a Dragan Simic        2024-06-09  2666  		resets = <&cru SRST_P_TSADC>, <&cru SRST_TSADC>;
def88eb4d8365a Dragan Simic        2024-06-09  2667  		reset-names = "tsadc-apb", "tsadc";
def88eb4d8365a Dragan Simic        2024-06-09  2668  		rockchip,hw-tshut-temp = <120000>;
def88eb4d8365a Dragan Simic        2024-06-09  2669  		rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
def88eb4d8365a Dragan Simic        2024-06-09  2670  		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
def88eb4d8365a Dragan Simic        2024-06-09  2671  		pinctrl-0 = <&tsadc_gpio_func>;
def88eb4d8365a Dragan Simic        2024-06-09  2672  		pinctrl-1 = <&tsadc_shut>;
def88eb4d8365a Dragan Simic        2024-06-09  2673  		pinctrl-names = "gpio", "otpout";
def88eb4d8365a Dragan Simic        2024-06-09  2674  		#thermal-sensor-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2675  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2676  	};
def88eb4d8365a Dragan Simic        2024-06-09  2677  
def88eb4d8365a Dragan Simic        2024-06-09  2678  	saradc: adc@fec10000 {
def88eb4d8365a Dragan Simic        2024-06-09  2679  		compatible = "rockchip,rk3588-saradc";
def88eb4d8365a Dragan Simic        2024-06-09  2680  		reg = <0x0 0xfec10000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09  2681  		interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2682  		#io-channel-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2683  		clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
def88eb4d8365a Dragan Simic        2024-06-09  2684  		clock-names = "saradc", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2685  		resets = <&cru SRST_P_SARADC>;
def88eb4d8365a Dragan Simic        2024-06-09  2686  		reset-names = "saradc-apb";
def88eb4d8365a Dragan Simic        2024-06-09  2687  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2688  	};
def88eb4d8365a Dragan Simic        2024-06-09  2689  
def88eb4d8365a Dragan Simic        2024-06-09  2690  	i2c6: i2c@fec80000 {
def88eb4d8365a Dragan Simic        2024-06-09  2691  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2692  		reg = <0x0 0xfec80000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2693  		clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
def88eb4d8365a Dragan Simic        2024-06-09  2694  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2695  		interrupts = <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2696  		pinctrl-0 = <&i2c6m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2697  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2698  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2699  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2700  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2701  	};
def88eb4d8365a Dragan Simic        2024-06-09  2702  
def88eb4d8365a Dragan Simic        2024-06-09  2703  	i2c7: i2c@fec90000 {
def88eb4d8365a Dragan Simic        2024-06-09  2704  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2705  		reg = <0x0 0xfec90000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2706  		clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
def88eb4d8365a Dragan Simic        2024-06-09  2707  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2708  		interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2709  		pinctrl-0 = <&i2c7m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2710  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2711  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2712  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2713  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2714  	};
def88eb4d8365a Dragan Simic        2024-06-09  2715  
def88eb4d8365a Dragan Simic        2024-06-09  2716  	i2c8: i2c@feca0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2717  		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
def88eb4d8365a Dragan Simic        2024-06-09  2718  		reg = <0x0 0xfeca0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2719  		clocks = <&cru CLK_I2C8>, <&cru PCLK_I2C8>;
def88eb4d8365a Dragan Simic        2024-06-09  2720  		clock-names = "i2c", "pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2721  		interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2722  		pinctrl-0 = <&i2c8m0_xfer>;
def88eb4d8365a Dragan Simic        2024-06-09  2723  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2724  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2725  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2726  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2727  	};
def88eb4d8365a Dragan Simic        2024-06-09  2728  
def88eb4d8365a Dragan Simic        2024-06-09  2729  	spi4: spi@fecb0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2730  		compatible = "rockchip,rk3588-spi", "rockchip,rk3066-spi";
def88eb4d8365a Dragan Simic        2024-06-09  2731  		reg = <0x0 0xfecb0000 0x0 0x1000>;
def88eb4d8365a Dragan Simic        2024-06-09  2732  		interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2733  		clocks = <&cru CLK_SPI4>, <&cru PCLK_SPI4>;
def88eb4d8365a Dragan Simic        2024-06-09  2734  		clock-names = "spiclk", "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2735  		dmas = <&dmac2 13>, <&dmac2 14>;
def88eb4d8365a Dragan Simic        2024-06-09  2736  		dma-names = "tx", "rx";
def88eb4d8365a Dragan Simic        2024-06-09  2737  		num-cs = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2738  		pinctrl-0 = <&spi4m0_cs0 &spi4m0_cs1 &spi4m0_pins>;
def88eb4d8365a Dragan Simic        2024-06-09  2739  		pinctrl-names = "default";
def88eb4d8365a Dragan Simic        2024-06-09  2740  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2741  		#size-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2742  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2743  	};
def88eb4d8365a Dragan Simic        2024-06-09  2744  
def88eb4d8365a Dragan Simic        2024-06-09  2745  	otp: efuse@fecc0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2746  		compatible = "rockchip,rk3588-otp";
def88eb4d8365a Dragan Simic        2024-06-09  2747  		reg = <0x0 0xfecc0000 0x0 0x400>;
def88eb4d8365a Dragan Simic        2024-06-09  2748  		clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
def88eb4d8365a Dragan Simic        2024-06-09  2749  			 <&cru CLK_OTP_PHY_G>, <&cru CLK_OTPC_ARB>;
def88eb4d8365a Dragan Simic        2024-06-09  2750  		clock-names = "otp", "apb_pclk", "phy", "arb";
def88eb4d8365a Dragan Simic        2024-06-09  2751  		resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>,
def88eb4d8365a Dragan Simic        2024-06-09  2752  			 <&cru SRST_OTPC_ARB>;
def88eb4d8365a Dragan Simic        2024-06-09  2753  		reset-names = "otp", "apb", "arb";
def88eb4d8365a Dragan Simic        2024-06-09  2754  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2755  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2756  
def88eb4d8365a Dragan Simic        2024-06-09  2757  		cpu_code: cpu-code@2 {
def88eb4d8365a Dragan Simic        2024-06-09  2758  			reg = <0x02 0x2>;
def88eb4d8365a Dragan Simic        2024-06-09  2759  		};
def88eb4d8365a Dragan Simic        2024-06-09  2760  
def88eb4d8365a Dragan Simic        2024-06-09  2761  		otp_id: id@7 {
def88eb4d8365a Dragan Simic        2024-06-09  2762  			reg = <0x07 0x10>;
def88eb4d8365a Dragan Simic        2024-06-09  2763  		};
def88eb4d8365a Dragan Simic        2024-06-09  2764  
def88eb4d8365a Dragan Simic        2024-06-09  2765  		cpub0_leakage: cpu-leakage@17 {
def88eb4d8365a Dragan Simic        2024-06-09  2766  			reg = <0x17 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2767  		};
def88eb4d8365a Dragan Simic        2024-06-09  2768  
def88eb4d8365a Dragan Simic        2024-06-09  2769  		cpub1_leakage: cpu-leakage@18 {
def88eb4d8365a Dragan Simic        2024-06-09  2770  			reg = <0x18 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2771  		};
def88eb4d8365a Dragan Simic        2024-06-09  2772  
def88eb4d8365a Dragan Simic        2024-06-09  2773  		cpul_leakage: cpu-leakage@19 {
def88eb4d8365a Dragan Simic        2024-06-09  2774  			reg = <0x19 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2775  		};
def88eb4d8365a Dragan Simic        2024-06-09  2776  
def88eb4d8365a Dragan Simic        2024-06-09  2777  		log_leakage: log-leakage@1a {
def88eb4d8365a Dragan Simic        2024-06-09  2778  			reg = <0x1a 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2779  		};
def88eb4d8365a Dragan Simic        2024-06-09  2780  
def88eb4d8365a Dragan Simic        2024-06-09  2781  		gpu_leakage: gpu-leakage@1b {
def88eb4d8365a Dragan Simic        2024-06-09  2782  			reg = <0x1b 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2783  		};
def88eb4d8365a Dragan Simic        2024-06-09  2784  
def88eb4d8365a Dragan Simic        2024-06-09  2785  		otp_cpu_version: cpu-version@1c {
def88eb4d8365a Dragan Simic        2024-06-09  2786  			reg = <0x1c 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2787  			bits = <3 3>;
def88eb4d8365a Dragan Simic        2024-06-09  2788  		};
def88eb4d8365a Dragan Simic        2024-06-09  2789  
def88eb4d8365a Dragan Simic        2024-06-09  2790  		npu_leakage: npu-leakage@28 {
def88eb4d8365a Dragan Simic        2024-06-09  2791  			reg = <0x28 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2792  		};
def88eb4d8365a Dragan Simic        2024-06-09  2793  
def88eb4d8365a Dragan Simic        2024-06-09  2794  		codec_leakage: codec-leakage@29 {
def88eb4d8365a Dragan Simic        2024-06-09  2795  			reg = <0x29 0x1>;
def88eb4d8365a Dragan Simic        2024-06-09  2796  		};
def88eb4d8365a Dragan Simic        2024-06-09  2797  	};
def88eb4d8365a Dragan Simic        2024-06-09  2798  
def88eb4d8365a Dragan Simic        2024-06-09  2799  	dmac2: dma-controller@fed10000 {
def88eb4d8365a Dragan Simic        2024-06-09  2800  		compatible = "arm,pl330", "arm,primecell";
def88eb4d8365a Dragan Simic        2024-06-09  2801  		reg = <0x0 0xfed10000 0x0 0x4000>;
def88eb4d8365a Dragan Simic        2024-06-09  2802  		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH 0>,
def88eb4d8365a Dragan Simic        2024-06-09  2803  			     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2804  		arm,pl330-periph-burst;
def88eb4d8365a Dragan Simic        2024-06-09  2805  		clocks = <&cru ACLK_DMAC2>;
def88eb4d8365a Dragan Simic        2024-06-09  2806  		clock-names = "apb_pclk";
def88eb4d8365a Dragan Simic        2024-06-09  2807  		#dma-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2808  	};
def88eb4d8365a Dragan Simic        2024-06-09  2809  
def88eb4d8365a Dragan Simic        2024-06-09  2810  	hdptxphy_hdmi0: phy@fed60000 {
def88eb4d8365a Dragan Simic        2024-06-09  2811  		compatible = "rockchip,rk3588-hdptx-phy";
def88eb4d8365a Dragan Simic        2024-06-09  2812  		reg = <0x0 0xfed60000 0x0 0x2000>;
def88eb4d8365a Dragan Simic        2024-06-09  2813  		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX0>;
def88eb4d8365a Dragan Simic        2024-06-09  2814  		clock-names = "ref", "apb";
def88eb4d8365a Dragan Simic        2024-06-09  2815  		#phy-cells = <0>;
def88eb4d8365a Dragan Simic        2024-06-09  2816  		resets = <&cru SRST_HDPTX0>, <&cru SRST_P_HDPTX0>,
def88eb4d8365a Dragan Simic        2024-06-09  2817  			 <&cru SRST_HDPTX0_INIT>, <&cru SRST_HDPTX0_CMN>,
def88eb4d8365a Dragan Simic        2024-06-09  2818  			 <&cru SRST_HDPTX0_LANE>, <&cru SRST_HDPTX0_ROPLL>,
def88eb4d8365a Dragan Simic        2024-06-09  2819  			 <&cru SRST_HDPTX0_LCPLL>;
def88eb4d8365a Dragan Simic        2024-06-09  2820  		reset-names = "phy", "apb", "init", "cmn", "lane", "ropll",
def88eb4d8365a Dragan Simic        2024-06-09  2821  			      "lcpll";
def88eb4d8365a Dragan Simic        2024-06-09  2822  		rockchip,grf = <&hdptxphy0_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2823  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2824  	};
def88eb4d8365a Dragan Simic        2024-06-09  2825  
def88eb4d8365a Dragan Simic        2024-06-09  2826  	usbdp_phy0: phy@fed80000 {
def88eb4d8365a Dragan Simic        2024-06-09  2827  		compatible = "rockchip,rk3588-usbdp-phy";
def88eb4d8365a Dragan Simic        2024-06-09  2828  		reg = <0x0 0xfed80000 0x0 0x10000>;
def88eb4d8365a Dragan Simic        2024-06-09  2829  		#phy-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2830  		clocks = <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>,
def88eb4d8365a Dragan Simic        2024-06-09  2831  			 <&cru CLK_USBDP_PHY0_IMMORTAL>,
def88eb4d8365a Dragan Simic        2024-06-09  2832  			 <&cru PCLK_USBDPPHY0>,
def88eb4d8365a Dragan Simic        2024-06-09  2833  			 <&u2phy0>;
def88eb4d8365a Dragan Simic        2024-06-09  2834  		clock-names = "refclk", "immortal", "pclk", "utmi";
def88eb4d8365a Dragan Simic        2024-06-09  2835  		resets = <&cru SRST_USBDP_COMBO_PHY0_INIT>,
def88eb4d8365a Dragan Simic        2024-06-09  2836  			 <&cru SRST_USBDP_COMBO_PHY0_CMN>,
def88eb4d8365a Dragan Simic        2024-06-09  2837  			 <&cru SRST_USBDP_COMBO_PHY0_LANE>,
def88eb4d8365a Dragan Simic        2024-06-09  2838  			 <&cru SRST_USBDP_COMBO_PHY0_PCS>,
def88eb4d8365a Dragan Simic        2024-06-09  2839  			 <&cru SRST_P_USBDPPHY0>;
def88eb4d8365a Dragan Simic        2024-06-09  2840  		reset-names = "init", "cmn", "lane", "pcs_apb", "pma_apb";
def88eb4d8365a Dragan Simic        2024-06-09  2841  		rockchip,u2phy-grf = <&usb2phy0_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2842  		rockchip,usb-grf = <&usb_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2843  		rockchip,usbdpphy-grf = <&usbdpphy0_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2844  		rockchip,vo-grf = <&vo0_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2845  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2846  	};
def88eb4d8365a Dragan Simic        2024-06-09  2847  
def88eb4d8365a Dragan Simic        2024-06-09  2848  	combphy0_ps: phy@fee00000 {
def88eb4d8365a Dragan Simic        2024-06-09  2849  		compatible = "rockchip,rk3588-naneng-combphy";
def88eb4d8365a Dragan Simic        2024-06-09  2850  		reg = <0x0 0xfee00000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2851  		clocks = <&cru CLK_REF_PIPE_PHY0>, <&cru PCLK_PCIE_COMBO_PIPE_PHY0>,
def88eb4d8365a Dragan Simic        2024-06-09  2852  			 <&cru PCLK_PHP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  2853  		clock-names = "ref", "apb", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  2854  		assigned-clocks = <&cru CLK_REF_PIPE_PHY0>;
def88eb4d8365a Dragan Simic        2024-06-09  2855  		assigned-clock-rates = <100000000>;
def88eb4d8365a Dragan Simic        2024-06-09  2856  		#phy-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2857  		resets = <&cru SRST_REF_PIPE_PHY0>, <&cru SRST_P_PCIE2_PHY0>;
def88eb4d8365a Dragan Simic        2024-06-09  2858  		reset-names = "phy", "apb";
def88eb4d8365a Dragan Simic        2024-06-09  2859  		rockchip,pipe-grf = <&php_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2860  		rockchip,pipe-phy-grf = <&pipe_phy0_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2861  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2862  	};
def88eb4d8365a Dragan Simic        2024-06-09  2863  
def88eb4d8365a Dragan Simic        2024-06-09  2864  	combphy2_psu: phy@fee20000 {
def88eb4d8365a Dragan Simic        2024-06-09  2865  		compatible = "rockchip,rk3588-naneng-combphy";
def88eb4d8365a Dragan Simic        2024-06-09  2866  		reg = <0x0 0xfee20000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2867  		clocks = <&cru CLK_REF_PIPE_PHY2>, <&cru PCLK_PCIE_COMBO_PIPE_PHY2>,
def88eb4d8365a Dragan Simic        2024-06-09  2868  			 <&cru PCLK_PHP_ROOT>;
def88eb4d8365a Dragan Simic        2024-06-09  2869  		clock-names = "ref", "apb", "pipe";
def88eb4d8365a Dragan Simic        2024-06-09  2870  		assigned-clocks = <&cru CLK_REF_PIPE_PHY2>;
def88eb4d8365a Dragan Simic        2024-06-09  2871  		assigned-clock-rates = <100000000>;
def88eb4d8365a Dragan Simic        2024-06-09  2872  		#phy-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2873  		resets = <&cru SRST_REF_PIPE_PHY2>, <&cru SRST_P_PCIE2_PHY2>;
def88eb4d8365a Dragan Simic        2024-06-09  2874  		reset-names = "phy", "apb";
def88eb4d8365a Dragan Simic        2024-06-09  2875  		rockchip,pipe-grf = <&php_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2876  		rockchip,pipe-phy-grf = <&pipe_phy2_grf>;
def88eb4d8365a Dragan Simic        2024-06-09  2877  		status = "disabled";
def88eb4d8365a Dragan Simic        2024-06-09  2878  	};
def88eb4d8365a Dragan Simic        2024-06-09  2879  
def88eb4d8365a Dragan Simic        2024-06-09  2880  	system_sram2: sram@ff001000 {
def88eb4d8365a Dragan Simic        2024-06-09  2881  		compatible = "mmio-sram";
def88eb4d8365a Dragan Simic        2024-06-09  2882  		reg = <0x0 0xff001000 0x0 0xef000>;
def88eb4d8365a Dragan Simic        2024-06-09  2883  		ranges = <0x0 0x0 0xff001000 0xef000>;
def88eb4d8365a Dragan Simic        2024-06-09  2884  		#address-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2885  		#size-cells = <1>;
def88eb4d8365a Dragan Simic        2024-06-09  2886  	};
def88eb4d8365a Dragan Simic        2024-06-09  2887  
def88eb4d8365a Dragan Simic        2024-06-09  2888  	pinctrl: pinctrl {
def88eb4d8365a Dragan Simic        2024-06-09  2889  		compatible = "rockchip,rk3588-pinctrl";
def88eb4d8365a Dragan Simic        2024-06-09  2890  		ranges;
def88eb4d8365a Dragan Simic        2024-06-09  2891  		rockchip,grf = <&ioc>;
def88eb4d8365a Dragan Simic        2024-06-09  2892  		#address-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2893  		#size-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2894  
def88eb4d8365a Dragan Simic        2024-06-09  2895  		gpio0: gpio@fd8a0000 {
def88eb4d8365a Dragan Simic        2024-06-09  2896  			compatible = "rockchip,gpio-bank";
def88eb4d8365a Dragan Simic        2024-06-09  2897  			reg = <0x0 0xfd8a0000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2898  			interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2899  			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
def88eb4d8365a Dragan Simic        2024-06-09  2900  			gpio-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2901  			gpio-ranges = <&pinctrl 0 0 32>;
def88eb4d8365a Dragan Simic        2024-06-09  2902  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2903  			#gpio-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2904  			#interrupt-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2905  		};
def88eb4d8365a Dragan Simic        2024-06-09  2906  
def88eb4d8365a Dragan Simic        2024-06-09  2907  		gpio1: gpio@fec20000 {
def88eb4d8365a Dragan Simic        2024-06-09  2908  			compatible = "rockchip,gpio-bank";
def88eb4d8365a Dragan Simic        2024-06-09  2909  			reg = <0x0 0xfec20000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2910  			interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2911  			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
def88eb4d8365a Dragan Simic        2024-06-09  2912  			gpio-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2913  			gpio-ranges = <&pinctrl 0 32 32>;
def88eb4d8365a Dragan Simic        2024-06-09  2914  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2915  			#gpio-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2916  			#interrupt-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2917  		};
def88eb4d8365a Dragan Simic        2024-06-09  2918  
def88eb4d8365a Dragan Simic        2024-06-09  2919  		gpio2: gpio@fec30000 {
def88eb4d8365a Dragan Simic        2024-06-09  2920  			compatible = "rockchip,gpio-bank";
def88eb4d8365a Dragan Simic        2024-06-09  2921  			reg = <0x0 0xfec30000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2922  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2923  			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
def88eb4d8365a Dragan Simic        2024-06-09  2924  			gpio-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2925  			gpio-ranges = <&pinctrl 0 64 32>;
def88eb4d8365a Dragan Simic        2024-06-09  2926  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2927  			#gpio-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2928  			#interrupt-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2929  		};
def88eb4d8365a Dragan Simic        2024-06-09  2930  
def88eb4d8365a Dragan Simic        2024-06-09  2931  		gpio3: gpio@fec40000 {
def88eb4d8365a Dragan Simic        2024-06-09  2932  			compatible = "rockchip,gpio-bank";
def88eb4d8365a Dragan Simic        2024-06-09  2933  			reg = <0x0 0xfec40000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2934  			interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2935  			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
def88eb4d8365a Dragan Simic        2024-06-09  2936  			gpio-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2937  			gpio-ranges = <&pinctrl 0 96 32>;
def88eb4d8365a Dragan Simic        2024-06-09  2938  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2939  			#gpio-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2940  			#interrupt-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2941  		};
def88eb4d8365a Dragan Simic        2024-06-09  2942  
def88eb4d8365a Dragan Simic        2024-06-09  2943  		gpio4: gpio@fec50000 {
def88eb4d8365a Dragan Simic        2024-06-09  2944  			compatible = "rockchip,gpio-bank";
def88eb4d8365a Dragan Simic        2024-06-09  2945  			reg = <0x0 0xfec50000 0x0 0x100>;
def88eb4d8365a Dragan Simic        2024-06-09  2946  			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH 0>;
def88eb4d8365a Dragan Simic        2024-06-09  2947  			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
def88eb4d8365a Dragan Simic        2024-06-09  2948  			gpio-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2949  			gpio-ranges = <&pinctrl 0 128 32>;
def88eb4d8365a Dragan Simic        2024-06-09  2950  			interrupt-controller;
def88eb4d8365a Dragan Simic        2024-06-09  2951  			#gpio-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2952  			#interrupt-cells = <2>;
def88eb4d8365a Dragan Simic        2024-06-09  2953  		};
def88eb4d8365a Dragan Simic        2024-06-09  2954  	};
def88eb4d8365a Dragan Simic        2024-06-09  2955  };
def88eb4d8365a Dragan Simic        2024-06-09  2956  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
