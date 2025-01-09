Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F536186E27
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445834; cv=none; b=kFGf2dDfisRLYGxXogKyE8dJSujA6CuYCjmtm7SYN4ZaAvJud0XXHa6t7UKlSr9xH5e6aZJz+wYZqXpS68uDX583GBqNMSjg43z7LIZQqZzPqtuc/Uo9JHUJptfzY1SU0URRPaGf+RmnKBqOmuUP/lhB87/99s5p6DdHgisv7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445834; c=relaxed/simple;
	bh=fJeNcx4QhDsq0OQTqCIR550xKryWUh07fOIrQCSES8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fd3Nx9wNTa7l3Uxh0wC4YNMHTxWiq4QQ23XH7ioA8uIwuHicbahGUXXCj9SlldSLc/c3U6/EB+8uaVji8Ajj5aZ6fJzUCNryPATpogUF4KTwxFXdroZYJuvNJfiXo6uMAxk6RbOfe758fIIRrNSMMQub3+uTDJYbBHhEgJPVdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLYCG5fg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLYCG5fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736445830; x=1767981830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJeNcx4QhDsq0OQTqCIR550xKryWUh07fOIrQCSES8k=;
  b=nLYCG5fgn+Q/RWj44mjfkxvM1lFYV+zlkPsgsr78elOWKpdFrzYZV+7c
   XnGf7cg2De0oOhFO6An+NpLW0L4xJVNvqXRaXzltxhZV86kLRPy63Ux+k
   Hjkoy/NgPqA5ezSMWz0W+O6mMLsDAItBexMvRIQdXiUf98wjFXgQsfi+M
   LVOWi8kSQvZlhW07j3g7lImYqRU+Ozn3oubCTf0SIvhkGTvMWZC3zOTaA
   WgxM02va1zwbewvViXmV8+bLGjdRGBEjp3Edp5MTMAOnnMpaY9nhWqOj8
   wcdqrWQBwsGR+txS5L2O8Zi7jagMv3HEmbsslcv5ExZhz7w0O6uFqa2fl
   A==;
X-CSE-ConnectionGUID: 5eFbLVM1SpeJ/kihFXIdZg==
X-CSE-MsgGUID: YgVJmWwFTKqLaKJrJLKNuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36605181"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36605181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:03:49 -0800
X-CSE-ConnectionGUID: +no7Xb86ReSxFl/kte2+lA==
X-CSE-MsgGUID: +sBAfwvqSp2hwBSOiAZMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126765820"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 10:03:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVwsi-000Hy3-2N;
	Thu, 09 Jan 2025 18:03:44 +0000
Date: Fri, 10 Jan 2025 02:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 6/7] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
Message-ID: <202501100154.2GVtEknd-lkp@intel.com>
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
In-Reply-To: <20231023-display-support-v5-6-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-6-3905f1e4b835@baylibre.com>
TO: Alexandre Mergnat <amergnat@baylibre.com>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Jitao Shi <jitao.shi@mediatek.com>
TO: CK Hu <ck.hu@mediatek.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Alexandre Mergnat <amergnat@baylibre.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d89551994a430b50c4fffcb1e617a057fa76e20]

url:    https://github.com/intel-lab-lkp/linux/commits/amergnat-baylibre-com/dt-bindings-display-mediatek-dpi-add-power-domains-property/20250109-002152
base:   9d89551994a430b50c4fffcb1e617a057fa76e20
patch link:    https://lore.kernel.org/r/20231023-display-support-v5-6-3905f1e4b835%40baylibre.com
patch subject: [PATCH v5 6/7] arm64: dts: mediatek: add display blocks support for the MT8365 SoC
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100154.2GVtEknd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100154.2GVtEknd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501100154.2GVtEknd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:822.12-830.7: Warning (graph_child_address): /soc/ovl@1400b000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:832.12-840.7: Warning (graph_child_address): /soc/ovl@1400b000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:856.12-864.7: Warning (graph_child_address): /soc/rdma@1400d000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:866.12-874.7: Warning (graph_child_address): /soc/rdma@1400d000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:888.12-896.7: Warning (graph_child_address): /soc/color@1400f000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:898.12-906.7: Warning (graph_child_address): /soc/color@1400f000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:920.12-928.7: Warning (graph_child_address): /soc/ccorr@14010000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:930.12-938.7: Warning (graph_child_address): /soc/ccorr@14010000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:952.12-960.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:962.12-970.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:984.12-992.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:994.12-1002.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:1016.12-1024.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1026.12-1033.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +822 arch/arm64/boot/dts/mediatek/mt8365.dtsi

6ff9453765565b Fabien Parent       2023-03-09    16  
6ff9453765565b Fabien Parent       2023-03-09    17  / {
6ff9453765565b Fabien Parent       2023-03-09    18  	compatible = "mediatek,mt8365";
6ff9453765565b Fabien Parent       2023-03-09    19  	interrupt-parent = <&sysirq>;
6ff9453765565b Fabien Parent       2023-03-09    20  	#address-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09    21  	#size-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09    22  
eebaaff677f64a Alexandre Mergnat   2025-01-08    23  	aliases {
eebaaff677f64a Alexandre Mergnat   2025-01-08    24  		aal0 = &aal0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    25  		ccorr0 = &ccorr0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    26  		color0 = &color0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    27  		dither0 = &dither0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    28  		dpi0 = &dpi0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    29  		dsi0 = &dsi0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    30  		gamma0 = &gamma0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    31  		ovl0 = &ovl0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    32  		rdma0 = &rdma0;
eebaaff677f64a Alexandre Mergnat   2025-01-08    33  		rdma1 = &rdma1;
eebaaff677f64a Alexandre Mergnat   2025-01-08    34  	};
eebaaff677f64a Alexandre Mergnat   2025-01-08    35  
6ff9453765565b Fabien Parent       2023-03-09    36  	cpus {
6ff9453765565b Fabien Parent       2023-03-09    37  		#address-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09    38  		#size-cells = <0>;
6ff9453765565b Fabien Parent       2023-03-09    39  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    40  	cluster0_opp: opp-table-0 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    41  		compatible = "operating-points-v2";
27205cec69b0f6 Alexandre Mergnat   2023-05-25    42  		opp-shared;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    43  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    44  		opp-850000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    45  			opp-hz = /bits/ 64 <850000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    46  			opp-microvolt = <650000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    47  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    48  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    49  		opp-918000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    50  			opp-hz = /bits/ 64 <918000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    51  			opp-microvolt = <668750>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    52  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    53  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    54  		opp-987000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    55  			opp-hz = /bits/ 64 <987000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    56  			opp-microvolt = <687500>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    57  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    58  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    59  		opp-1056000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    60  			opp-hz = /bits/ 64 <1056000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    61  			opp-microvolt = <706250>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    62  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    63  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    64  		opp-1125000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    65  			opp-hz = /bits/ 64 <1125000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    66  			opp-microvolt = <725000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    67  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    68  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    69  		opp-1216000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    70  			opp-hz = /bits/ 64 <1216000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    71  			opp-microvolt = <750000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    72  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    73  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    74  		opp-1308000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    75  			opp-hz = /bits/ 64 <1308000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    76  			opp-microvolt = <775000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    77  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    78  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    79  		opp-1400000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    80  			opp-hz = /bits/ 64 <1400000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    81  			opp-microvolt = <800000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    82  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    83  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    84  		opp-1466000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    85  			opp-hz = /bits/ 64 <1466000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    86  			opp-microvolt = <825000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    87  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    88  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    89  		opp-1533000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    90  			opp-hz = /bits/ 64 <1533000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    91  			opp-microvolt = <850000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    92  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    93  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    94  		opp-1633000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25    95  			opp-hz = /bits/ 64 <1633000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    96  			opp-microvolt = <887500>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25    97  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25    98  
27205cec69b0f6 Alexandre Mergnat   2023-05-25    99  		opp-1700000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25   100  			opp-hz = /bits/ 64 <1700000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   101  			opp-microvolt = <912500>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   102  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   103  
27205cec69b0f6 Alexandre Mergnat   2023-05-25   104  		opp-1767000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25   105  			opp-hz = /bits/ 64 <1767000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   106  			opp-microvolt = <937500>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   107  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   108  
27205cec69b0f6 Alexandre Mergnat   2023-05-25   109  		opp-1834000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25   110  			opp-hz = /bits/ 64 <1834000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   111  			opp-microvolt = <962500>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   112  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   113  
27205cec69b0f6 Alexandre Mergnat   2023-05-25   114  		opp-1917000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25   115  			opp-hz = /bits/ 64 <1917000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   116  			opp-microvolt = <993750>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   117  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   118  
27205cec69b0f6 Alexandre Mergnat   2023-05-25   119  		opp-2001000000 {
27205cec69b0f6 Alexandre Mergnat   2023-05-25   120  			opp-hz = /bits/ 64 <2001000000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   121  			opp-microvolt = <1025000>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   122  		};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   123  	};
27205cec69b0f6 Alexandre Mergnat   2023-05-25   124  
6ff9453765565b Fabien Parent       2023-03-09   125  		cpu-map {
6ff9453765565b Fabien Parent       2023-03-09   126  			cluster0 {
6ff9453765565b Fabien Parent       2023-03-09   127  				core0 {
6ff9453765565b Fabien Parent       2023-03-09   128  					cpu = <&cpu0>;
6ff9453765565b Fabien Parent       2023-03-09   129  				};
6ff9453765565b Fabien Parent       2023-03-09   130  				core1 {
6ff9453765565b Fabien Parent       2023-03-09   131  					cpu = <&cpu1>;
6ff9453765565b Fabien Parent       2023-03-09   132  				};
6ff9453765565b Fabien Parent       2023-03-09   133  				core2 {
6ff9453765565b Fabien Parent       2023-03-09   134  					cpu = <&cpu2>;
6ff9453765565b Fabien Parent       2023-03-09   135  				};
6ff9453765565b Fabien Parent       2023-03-09   136  				core3 {
6ff9453765565b Fabien Parent       2023-03-09   137  					cpu = <&cpu3>;
6ff9453765565b Fabien Parent       2023-03-09   138  				};
6ff9453765565b Fabien Parent       2023-03-09   139  			};
6ff9453765565b Fabien Parent       2023-03-09   140  		};
6ff9453765565b Fabien Parent       2023-03-09   141  
6ff9453765565b Fabien Parent       2023-03-09   142  		cpu0: cpu@0 {
6ff9453765565b Fabien Parent       2023-03-09   143  			device_type = "cpu";
6ff9453765565b Fabien Parent       2023-03-09   144  			compatible = "arm,cortex-a53";
6ff9453765565b Fabien Parent       2023-03-09   145  			reg = <0x0>;
6ff9453765565b Fabien Parent       2023-03-09   146  			#cooling-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   147  			enable-method = "psci";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   148  			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
6ff9453765565b Fabien Parent       2023-03-09   149  			i-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   150  			i-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   151  			i-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   152  			d-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   153  			d-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   154  			d-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   155  			next-level-cache = <&l2>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   156  			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
27205cec69b0f6 Alexandre Mergnat   2023-05-25   157  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   158  			clock-names = "cpu", "intermediate";
27205cec69b0f6 Alexandre Mergnat   2023-05-25   159  			operating-points-v2 = <&cluster0_opp>;
6ff9453765565b Fabien Parent       2023-03-09   160  		};
6ff9453765565b Fabien Parent       2023-03-09   161  
6ff9453765565b Fabien Parent       2023-03-09   162  		cpu1: cpu@1 {
6ff9453765565b Fabien Parent       2023-03-09   163  			device_type = "cpu";
6ff9453765565b Fabien Parent       2023-03-09   164  			compatible = "arm,cortex-a53";
6ff9453765565b Fabien Parent       2023-03-09   165  			reg = <0x1>;
6ff9453765565b Fabien Parent       2023-03-09   166  			#cooling-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   167  			enable-method = "psci";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   168  			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
6ff9453765565b Fabien Parent       2023-03-09   169  			i-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   170  			i-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   171  			i-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   172  			d-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   173  			d-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   174  			d-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   175  			next-level-cache = <&l2>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   176  			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
27205cec69b0f6 Alexandre Mergnat   2023-05-25   177  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   178  			clock-names = "cpu", "intermediate", "armpll";
27205cec69b0f6 Alexandre Mergnat   2023-05-25   179  			operating-points-v2 = <&cluster0_opp>;
6ff9453765565b Fabien Parent       2023-03-09   180  		};
6ff9453765565b Fabien Parent       2023-03-09   181  
6ff9453765565b Fabien Parent       2023-03-09   182  		cpu2: cpu@2 {
6ff9453765565b Fabien Parent       2023-03-09   183  			device_type = "cpu";
6ff9453765565b Fabien Parent       2023-03-09   184  			compatible = "arm,cortex-a53";
6ff9453765565b Fabien Parent       2023-03-09   185  			reg = <0x2>;
6ff9453765565b Fabien Parent       2023-03-09   186  			#cooling-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   187  			enable-method = "psci";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   188  			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
6ff9453765565b Fabien Parent       2023-03-09   189  			i-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   190  			i-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   191  			i-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   192  			d-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   193  			d-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   194  			d-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   195  			next-level-cache = <&l2>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   196  			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
27205cec69b0f6 Alexandre Mergnat   2023-05-25   197  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   198  			clock-names = "cpu", "intermediate", "armpll";
27205cec69b0f6 Alexandre Mergnat   2023-05-25   199  			operating-points-v2 = <&cluster0_opp>;
6ff9453765565b Fabien Parent       2023-03-09   200  		};
6ff9453765565b Fabien Parent       2023-03-09   201  
6ff9453765565b Fabien Parent       2023-03-09   202  		cpu3: cpu@3 {
6ff9453765565b Fabien Parent       2023-03-09   203  			device_type = "cpu";
6ff9453765565b Fabien Parent       2023-03-09   204  			compatible = "arm,cortex-a53";
6ff9453765565b Fabien Parent       2023-03-09   205  			reg = <0x3>;
6ff9453765565b Fabien Parent       2023-03-09   206  			#cooling-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   207  			enable-method = "psci";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   208  			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
6ff9453765565b Fabien Parent       2023-03-09   209  			i-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   210  			i-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   211  			i-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   212  			d-cache-size = <0x8000>;
6ff9453765565b Fabien Parent       2023-03-09   213  			d-cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   214  			d-cache-sets = <256>;
6ff9453765565b Fabien Parent       2023-03-09   215  			next-level-cache = <&l2>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   216  			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
27205cec69b0f6 Alexandre Mergnat   2023-05-25   217  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
27205cec69b0f6 Alexandre Mergnat   2023-05-25   218  			clock-names = "cpu", "intermediate", "armpll";
27205cec69b0f6 Alexandre Mergnat   2023-05-25   219  			operating-points-v2 = <&cluster0_opp>;
6ff9453765565b Fabien Parent       2023-03-09   220  		};
6ff9453765565b Fabien Parent       2023-03-09   221  
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   222  		idle-states {
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   223  			entry-method = "psci";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   224  
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   225  			CPU_MCDI: cpu-mcdi {
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   226  				compatible = "arm,idle-state";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   227  				local-timer-stop;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   228  				arm,psci-suspend-param = <0x00010001>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   229  				entry-latency-us = <300>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   230  				exit-latency-us = <200>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   231  				min-residency-us = <1000>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   232  			};
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   233  
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   234  			CLUSTER_MCDI: cluster-mcdi {
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   235  				compatible = "arm,idle-state";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   236  				local-timer-stop;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   237  				arm,psci-suspend-param = <0x01010001>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   238  				entry-latency-us = <350>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   239  				exit-latency-us = <250>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   240  				min-residency-us = <1200>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   241  			};
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   242  
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   243  			CLUSTER_DPIDLE: cluster-dpidle {
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   244  				compatible = "arm,idle-state";
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   245  				local-timer-stop;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   246  				arm,psci-suspend-param = <0x01010004>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   247  				entry-latency-us = <300>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   248  				exit-latency-us = <800>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   249  				min-residency-us = <3300>;
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   250  			};
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   251  		};
e8c6b47f498849 Amjad Ouled-Ameur   2023-05-25   252  
6ff9453765565b Fabien Parent       2023-03-09   253  		l2: l2-cache {
6ff9453765565b Fabien Parent       2023-03-09   254  			compatible = "cache";
6ff9453765565b Fabien Parent       2023-03-09   255  			cache-level = <2>;
6ff9453765565b Fabien Parent       2023-03-09   256  			cache-size = <0x80000>;
6ff9453765565b Fabien Parent       2023-03-09   257  			cache-line-size = <64>;
6ff9453765565b Fabien Parent       2023-03-09   258  			cache-sets = <512>;
6ff9453765565b Fabien Parent       2023-03-09   259  			cache-unified;
6ff9453765565b Fabien Parent       2023-03-09   260  		};
6ff9453765565b Fabien Parent       2023-03-09   261  	};
6ff9453765565b Fabien Parent       2023-03-09   262  
6ff9453765565b Fabien Parent       2023-03-09   263  	clk26m: oscillator {
6ff9453765565b Fabien Parent       2023-03-09   264  		compatible = "fixed-clock";
6ff9453765565b Fabien Parent       2023-03-09   265  		#clock-cells = <0>;
6ff9453765565b Fabien Parent       2023-03-09   266  		clock-frequency = <26000000>;
6ff9453765565b Fabien Parent       2023-03-09   267  		clock-output-names = "clk26m";
6ff9453765565b Fabien Parent       2023-03-09   268  	};
6ff9453765565b Fabien Parent       2023-03-09   269  
6ff9453765565b Fabien Parent       2023-03-09   270  	psci {
6ff9453765565b Fabien Parent       2023-03-09   271  		compatible = "arm,psci-1.0";
6ff9453765565b Fabien Parent       2023-03-09   272  		method = "smc";
6ff9453765565b Fabien Parent       2023-03-09   273  	};
6ff9453765565b Fabien Parent       2023-03-09   274  
6ff9453765565b Fabien Parent       2023-03-09   275  	soc {
6ff9453765565b Fabien Parent       2023-03-09   276  		#address-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   277  		#size-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   278  		compatible = "simple-bus";
6ff9453765565b Fabien Parent       2023-03-09   279  		ranges;
6ff9453765565b Fabien Parent       2023-03-09   280  
6ff9453765565b Fabien Parent       2023-03-09   281  		gic: interrupt-controller@c000000 {
6ff9453765565b Fabien Parent       2023-03-09   282  			compatible = "arm,gic-v3";
6ff9453765565b Fabien Parent       2023-03-09   283  			#interrupt-cells = <3>;
6ff9453765565b Fabien Parent       2023-03-09   284  			interrupt-parent = <&gic>;
6ff9453765565b Fabien Parent       2023-03-09   285  			interrupt-controller;
6ff9453765565b Fabien Parent       2023-03-09   286  			reg = <0 0x0c000000 0 0x10000>, /* GICD */
6ff9453765565b Fabien Parent       2023-03-09   287  			      <0 0x0c080000 0 0x80000>, /* GICR */
6ff9453765565b Fabien Parent       2023-03-09   288  			      <0 0x0c400000 0 0x2000>,  /* GICC */
6ff9453765565b Fabien Parent       2023-03-09   289  			      <0 0x0c410000 0 0x1000>,  /* GICH */
6ff9453765565b Fabien Parent       2023-03-09   290  			      <0 0x0c420000 0 0x2000>;  /* GICV */
6ff9453765565b Fabien Parent       2023-03-09   291  
6ff9453765565b Fabien Parent       2023-03-09   292  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
6ff9453765565b Fabien Parent       2023-03-09   293  		};
6ff9453765565b Fabien Parent       2023-03-09   294  
6ff9453765565b Fabien Parent       2023-03-09   295  		topckgen: syscon@10000000 {
6ff9453765565b Fabien Parent       2023-03-09   296  			compatible = "mediatek,mt8365-topckgen", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   297  			reg = <0 0x10000000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   298  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   299  		};
6ff9453765565b Fabien Parent       2023-03-09   300  
6ff9453765565b Fabien Parent       2023-03-09   301  		infracfg: syscon@10001000 {
6ff9453765565b Fabien Parent       2023-03-09   302  			compatible = "mediatek,mt8365-infracfg", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   303  			reg = <0 0x10001000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   304  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   305  		};
6ff9453765565b Fabien Parent       2023-03-09   306  
6ff9453765565b Fabien Parent       2023-03-09   307  		pericfg: syscon@10003000 {
6ff9453765565b Fabien Parent       2023-03-09   308  			compatible = "mediatek,mt8365-pericfg", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   309  			reg = <0 0x10003000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   310  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   311  		};
6ff9453765565b Fabien Parent       2023-03-09   312  
6ff9453765565b Fabien Parent       2023-03-09   313  		syscfg_pctl: syscfg-pctl@10005000 {
6ff9453765565b Fabien Parent       2023-03-09   314  			compatible = "mediatek,mt8365-syscfg", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   315  			reg = <0 0x10005000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   316  		};
6ff9453765565b Fabien Parent       2023-03-09   317  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   318  		scpsys: syscon@10006000 {
cc827572ad153d Krzysztof Kozlowski 2024-06-12   319  			compatible = "mediatek,mt8365-scpsys", "syscon", "simple-mfd";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   320  			reg = <0 0x10006000 0 0x1000>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   321  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   322  			/* System Power Manager */
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   323  			spm: power-controller {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   324  				compatible = "mediatek,mt8365-power-controller";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   325  				#address-cells = <1>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   326  				#size-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   327  				#power-domain-cells = <1>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   328  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   329  				/* power domains of the SoC */
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   330  				power-domain@MT8365_POWER_DOMAIN_MM {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   331  					reg = <MT8365_POWER_DOMAIN_MM>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   332  					clocks = <&topckgen CLK_TOP_MM_SEL>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   333  						 <&mmsys CLK_MM_MM_SMI_COMMON>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   334  						 <&mmsys CLK_MM_MM_SMI_COMM0>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   335  						 <&mmsys CLK_MM_MM_SMI_COMM1>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   336  						 <&mmsys CLK_MM_MM_SMI_LARB0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   337  					clock-names = "mm", "mm-0", "mm-1",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   338  						      "mm-2", "mm-3";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   339  					#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   340  					mediatek,infracfg = <&infracfg>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   341  					mediatek,infracfg-nao = <&infracfg_nao>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   342  					#address-cells = <1>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   343  					#size-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   344  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   345  					power-domain@MT8365_POWER_DOMAIN_CAM {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   346  						reg = <MT8365_POWER_DOMAIN_CAM>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   347  						clocks = <&camsys CLK_CAM_LARB2>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   348  							 <&camsys CLK_CAM_SENIF>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   349  							 <&camsys CLK_CAMSV0>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   350  							 <&camsys CLK_CAMSV1>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   351  							 <&camsys CLK_CAM_FDVT>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   352  							 <&camsys CLK_CAM_WPE>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   353  						clock-names = "cam-0", "cam-1",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   354  							      "cam-2", "cam-3",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   355  							      "cam-4", "cam-5";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   356  						#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   357  						mediatek,infracfg = <&infracfg>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   358  						mediatek,smi = <&smi_common>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   359  					};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   360  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   361  					power-domain@MT8365_POWER_DOMAIN_VDEC {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   362  						reg = <MT8365_POWER_DOMAIN_VDEC>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   363  						#power-domain-cells = <0>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   364  						mediatek,smi = <&smi_common>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   365  					};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   366  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   367  					power-domain@MT8365_POWER_DOMAIN_VENC {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   368  						reg = <MT8365_POWER_DOMAIN_VENC>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   369  						#power-domain-cells = <0>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   370  						mediatek,smi = <&smi_common>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   371  					};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   372  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   373  					power-domain@MT8365_POWER_DOMAIN_APU {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   374  						reg = <MT8365_POWER_DOMAIN_APU>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   375  						clocks = <&infracfg CLK_IFR_APU_AXI>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   376  							 <&apu CLK_APU_IPU_CK>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   377  							 <&apu CLK_APU_AXI>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   378  							 <&apu CLK_APU_JTAG>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   379  							 <&apu CLK_APU_IF_CK>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   380  							 <&apu CLK_APU_EDMA>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   381  							 <&apu CLK_APU_AHB>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   382  						clock-names = "apu", "apu-0",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   383  							      "apu-1", "apu-2",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   384  							      "apu-3", "apu-4",
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   385  							      "apu-5";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   386  						#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   387  						mediatek,infracfg = <&infracfg>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   388  						mediatek,smi = <&smi_common>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   389  					};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   390  				};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   391  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   392  				power-domain@MT8365_POWER_DOMAIN_CONN {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   393  					reg = <MT8365_POWER_DOMAIN_CONN>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   394  					clocks = <&topckgen CLK_TOP_CONN_32K>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   395  						 <&topckgen CLK_TOP_CONN_26M>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   396  					clock-names = "conn", "conn1";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   397  					#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   398  					mediatek,infracfg = <&infracfg>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   399  				};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   400  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   401  				power-domain@MT8365_POWER_DOMAIN_MFG {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   402  					reg = <MT8365_POWER_DOMAIN_MFG>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   403  					clocks = <&topckgen CLK_TOP_MFG_SEL>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   404  					clock-names = "mfg";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   405  					#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   406  					mediatek,infracfg = <&infracfg>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   407  				};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   408  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   409  				power-domain@MT8365_POWER_DOMAIN_AUDIO {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   410  					reg = <MT8365_POWER_DOMAIN_AUDIO>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   411  					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   412  						 <&infracfg CLK_IFR_AUDIO>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   413  						 <&infracfg CLK_IFR_AUD_26M_BK>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   414  					clock-names = "audio", "audio1", "audio2";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   415  					#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   416  					mediatek,infracfg = <&infracfg>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   417  				};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   418  
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   419  				power-domain@MT8365_POWER_DOMAIN_DSP {
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   420  					reg = <MT8365_POWER_DOMAIN_DSP>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   421  					clocks = <&topckgen CLK_TOP_DSP_SEL>,
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   422  						 <&topckgen CLK_TOP_DSP_26M>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   423  					clock-names = "dsp", "dsp1";
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   424  					#power-domain-cells = <0>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   425  					mediatek,infracfg = <&infracfg>;
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   426  				};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   427  			};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   428  		};
c70ca9a2d09ae1 Alexandre Mergnat   2023-09-25   429  
751ec3da08b431 Alexandre Mergnat   2023-05-25   430  		watchdog: watchdog@10007000 {
751ec3da08b431 Alexandre Mergnat   2023-05-25   431  			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
751ec3da08b431 Alexandre Mergnat   2023-05-25   432  			reg = <0 0x10007000 0 0x100>;
751ec3da08b431 Alexandre Mergnat   2023-05-25   433  			#reset-cells = <1>;
751ec3da08b431 Alexandre Mergnat   2023-05-25   434  		};
751ec3da08b431 Alexandre Mergnat   2023-05-25   435  
6ff9453765565b Fabien Parent       2023-03-09   436  		pio: pinctrl@1000b000 {
6ff9453765565b Fabien Parent       2023-03-09   437  			compatible = "mediatek,mt8365-pinctrl";
6ff9453765565b Fabien Parent       2023-03-09   438  			reg = <0 0x1000b000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   439  			mediatek,pctl-regmap = <&syscfg_pctl>;
6ff9453765565b Fabien Parent       2023-03-09   440  			gpio-controller;
6ff9453765565b Fabien Parent       2023-03-09   441  			#gpio-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   442  			interrupt-controller;
6ff9453765565b Fabien Parent       2023-03-09   443  			#interrupt-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   444  			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
6ff9453765565b Fabien Parent       2023-03-09   445  		};
6ff9453765565b Fabien Parent       2023-03-09   446  
6ff9453765565b Fabien Parent       2023-03-09   447  		apmixedsys: syscon@1000c000 {
6ff9453765565b Fabien Parent       2023-03-09   448  			compatible = "mediatek,mt8365-apmixedsys", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   449  			reg = <0 0x1000c000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   450  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   451  		};
6ff9453765565b Fabien Parent       2023-03-09   452  
a00d1c915df3db Alexandre Mergnat   2023-03-29   453  		pwrap: pwrap@1000d000 {
a00d1c915df3db Alexandre Mergnat   2023-03-29   454  			compatible = "mediatek,mt8365-pwrap";
a00d1c915df3db Alexandre Mergnat   2023-03-29   455  			reg = <0 0x1000d000 0 0x1000>;
a00d1c915df3db Alexandre Mergnat   2023-03-29   456  			reg-names = "pwrap";
a00d1c915df3db Alexandre Mergnat   2023-03-29   457  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
a00d1c915df3db Alexandre Mergnat   2023-03-29   458  			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
a00d1c915df3db Alexandre Mergnat   2023-03-29   459  				 <&infracfg CLK_IFR_PMIC_AP>,
a00d1c915df3db Alexandre Mergnat   2023-03-29   460  				 <&infracfg CLK_IFR_PWRAP_SYS>,
a00d1c915df3db Alexandre Mergnat   2023-03-29   461  				 <&infracfg CLK_IFR_PWRAP_TMR>;
a00d1c915df3db Alexandre Mergnat   2023-03-29   462  			clock-names = "spi", "wrap", "sys", "tmr";
a00d1c915df3db Alexandre Mergnat   2023-03-29   463  		};
a00d1c915df3db Alexandre Mergnat   2023-03-29   464  
6ff9453765565b Fabien Parent       2023-03-09   465  		keypad: keypad@10010000 {
6ff9453765565b Fabien Parent       2023-03-09   466  			compatible = "mediatek,mt6779-keypad";
6ff9453765565b Fabien Parent       2023-03-09   467  			reg = <0 0x10010000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   468  			wakeup-source;
6ff9453765565b Fabien Parent       2023-03-09   469  			interrupts = <GIC_SPI 124 IRQ_TYPE_EDGE_FALLING>;
6ff9453765565b Fabien Parent       2023-03-09   470  			clocks = <&clk26m>;
6ff9453765565b Fabien Parent       2023-03-09   471  			clock-names = "kpd";
6ff9453765565b Fabien Parent       2023-03-09   472  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   473  		};
6ff9453765565b Fabien Parent       2023-03-09   474  
6ff9453765565b Fabien Parent       2023-03-09   475  		mcucfg: syscon@10200000 {
6ff9453765565b Fabien Parent       2023-03-09   476  			compatible = "mediatek,mt8365-mcucfg", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   477  			reg = <0 0x10200000 0 0x2000>;
6ff9453765565b Fabien Parent       2023-03-09   478  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   479  		};
6ff9453765565b Fabien Parent       2023-03-09   480  
6ff9453765565b Fabien Parent       2023-03-09   481  		sysirq: interrupt-controller@10200a80 {
6ff9453765565b Fabien Parent       2023-03-09   482  			compatible = "mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq";
6ff9453765565b Fabien Parent       2023-03-09   483  			interrupt-controller;
6ff9453765565b Fabien Parent       2023-03-09   484  			#interrupt-cells = <3>;
6ff9453765565b Fabien Parent       2023-03-09   485  			interrupt-parent = <&gic>;
6ff9453765565b Fabien Parent       2023-03-09   486  			reg = <0 0x10200a80 0 0x20>;
6ff9453765565b Fabien Parent       2023-03-09   487  		};
6ff9453765565b Fabien Parent       2023-03-09   488  
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   489  		iommu: iommu@10205000 {
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   490  			compatible = "mediatek,mt8365-m4u";
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   491  			reg = <0 0x10205000 0 0x1000>;
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   492  			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   493  			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   494  			#iommu-cells = <1>;
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   495  		};
9b5d64654ea8f5 Alexandre Mergnat   2023-09-25   496  
6ff9453765565b Fabien Parent       2023-03-09   497  		infracfg_nao: infracfg@1020e000 {
6ff9453765565b Fabien Parent       2023-03-09   498  			compatible = "mediatek,mt8365-infracfg", "syscon";
6ff9453765565b Fabien Parent       2023-03-09   499  			reg = <0 0x1020e000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   500  			#clock-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   501  		};
6ff9453765565b Fabien Parent       2023-03-09   502  
6ff9453765565b Fabien Parent       2023-03-09   503  		rng: rng@1020f000 {
6ff9453765565b Fabien Parent       2023-03-09   504  			compatible = "mediatek,mt8365-rng", "mediatek,mt7623-rng";
6ff9453765565b Fabien Parent       2023-03-09   505  			reg = <0 0x1020f000 0 0x100>;
6ff9453765565b Fabien Parent       2023-03-09   506  			clocks = <&infracfg CLK_IFR_TRNG>;
6ff9453765565b Fabien Parent       2023-03-09   507  			clock-names = "rng";
6ff9453765565b Fabien Parent       2023-03-09   508  		};
6ff9453765565b Fabien Parent       2023-03-09   509  
6ff9453765565b Fabien Parent       2023-03-09   510  		apdma: dma-controller@11000280 {
6ff9453765565b Fabien Parent       2023-03-09   511  			compatible = "mediatek,mt8365-uart-dma", "mediatek,mt6577-uart-dma";
6ff9453765565b Fabien Parent       2023-03-09   512  			reg = <0 0x11000280 0 0x80>,
6ff9453765565b Fabien Parent       2023-03-09   513  			      <0 0x11000300 0 0x80>,
6ff9453765565b Fabien Parent       2023-03-09   514  			      <0 0x11000380 0 0x80>,
6ff9453765565b Fabien Parent       2023-03-09   515  			      <0 0x11000400 0 0x80>,
6ff9453765565b Fabien Parent       2023-03-09   516  			      <0 0x11000580 0 0x80>,
6ff9453765565b Fabien Parent       2023-03-09   517  			      <0 0x11000600 0 0x80>;
6ff9453765565b Fabien Parent       2023-03-09   518  			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_LOW>,
6ff9453765565b Fabien Parent       2023-03-09   519  				     <GIC_SPI 46 IRQ_TYPE_LEVEL_LOW>,
6ff9453765565b Fabien Parent       2023-03-09   520  				     <GIC_SPI 47 IRQ_TYPE_LEVEL_LOW>,
6ff9453765565b Fabien Parent       2023-03-09   521  				     <GIC_SPI 48 IRQ_TYPE_LEVEL_LOW>,
6ff9453765565b Fabien Parent       2023-03-09   522  				     <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>,
6ff9453765565b Fabien Parent       2023-03-09   523  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   524  			dma-requests = <6>;
6ff9453765565b Fabien Parent       2023-03-09   525  			clocks = <&infracfg CLK_IFR_AP_DMA>;
6ff9453765565b Fabien Parent       2023-03-09   526  			clock-names = "apdma";
6ff9453765565b Fabien Parent       2023-03-09   527  			#dma-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   528  		};
6ff9453765565b Fabien Parent       2023-03-09   529  
6ff9453765565b Fabien Parent       2023-03-09   530  		uart0: serial@11002000 {
6ff9453765565b Fabien Parent       2023-03-09   531  			compatible = "mediatek,mt8365-uart", "mediatek,mt6577-uart";
6ff9453765565b Fabien Parent       2023-03-09   532  			reg = <0 0x11002000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   533  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   534  			clocks = <&clk26m>, <&infracfg CLK_IFR_UART0>;
6ff9453765565b Fabien Parent       2023-03-09   535  			clock-names = "baud", "bus";
6ff9453765565b Fabien Parent       2023-03-09   536  			dmas = <&apdma 0>, <&apdma 1>;
6ff9453765565b Fabien Parent       2023-03-09   537  			dma-names = "tx", "rx";
6ff9453765565b Fabien Parent       2023-03-09   538  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   539  		};
6ff9453765565b Fabien Parent       2023-03-09   540  
6ff9453765565b Fabien Parent       2023-03-09   541  		uart1: serial@11003000 {
6ff9453765565b Fabien Parent       2023-03-09   542  			compatible = "mediatek,mt8365-uart", "mediatek,mt6577-uart";
6ff9453765565b Fabien Parent       2023-03-09   543  			reg = <0 0x11003000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   544  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   545  			clocks = <&clk26m>, <&infracfg CLK_IFR_UART1>;
6ff9453765565b Fabien Parent       2023-03-09   546  			clock-names = "baud", "bus";
6ff9453765565b Fabien Parent       2023-03-09   547  			dmas = <&apdma 2>, <&apdma 3>;
6ff9453765565b Fabien Parent       2023-03-09   548  			dma-names = "tx", "rx";
6ff9453765565b Fabien Parent       2023-03-09   549  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   550  		};
6ff9453765565b Fabien Parent       2023-03-09   551  
6ff9453765565b Fabien Parent       2023-03-09   552  		uart2: serial@11004000 {
6ff9453765565b Fabien Parent       2023-03-09   553  			compatible = "mediatek,mt8365-uart", "mediatek,mt6577-uart";
6ff9453765565b Fabien Parent       2023-03-09   554  			reg = <0 0x11004000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   555  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   556  			clocks = <&clk26m>, <&infracfg CLK_IFR_UART2>;
6ff9453765565b Fabien Parent       2023-03-09   557  			clock-names = "baud", "bus";
6ff9453765565b Fabien Parent       2023-03-09   558  			dmas = <&apdma 4>, <&apdma 5>;
6ff9453765565b Fabien Parent       2023-03-09   559  			dma-names = "tx", "rx";
6ff9453765565b Fabien Parent       2023-03-09   560  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   561  		};
6ff9453765565b Fabien Parent       2023-03-09   562  
6ff9453765565b Fabien Parent       2023-03-09   563  		pwm: pwm@11006000 {
6ff9453765565b Fabien Parent       2023-03-09   564  			compatible = "mediatek,mt8365-pwm";
6ff9453765565b Fabien Parent       2023-03-09   565  			reg = <0 0x11006000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   566  			#pwm-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   567  			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   568  			clocks = <&infracfg CLK_IFR_PWM_HCLK>,
6ff9453765565b Fabien Parent       2023-03-09   569  				 <&infracfg CLK_IFR_PWM>,
6ff9453765565b Fabien Parent       2023-03-09   570  				 <&infracfg CLK_IFR_PWM1>,
6ff9453765565b Fabien Parent       2023-03-09   571  				 <&infracfg CLK_IFR_PWM2>,
6ff9453765565b Fabien Parent       2023-03-09   572  				 <&infracfg CLK_IFR_PWM3>;
6ff9453765565b Fabien Parent       2023-03-09   573  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
6ff9453765565b Fabien Parent       2023-03-09   574  		};
6ff9453765565b Fabien Parent       2023-03-09   575  
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   576  		i2c0: i2c@11007000 {
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   577  			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   578  			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   579  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   580  			clock-div = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   581  			clocks = <&infracfg CLK_IFR_I2C0_AXI>, <&infracfg CLK_IFR_AP_DMA>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   582  			clock-names = "main", "dma";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   583  			#address-cells = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   584  			#size-cells = <0>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   585  			status = "disabled";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   586  		};
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   587  
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   588  		i2c1: i2c@11008000 {
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   589  			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   590  			reg = <0 0x11008000 0 0xa0>, <0 0x11000100 0 0x80>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   591  			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   592  			clock-div = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   593  			clocks = <&infracfg CLK_IFR_I2C1_AXI>, <&infracfg CLK_IFR_AP_DMA>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   594  			clock-names = "main", "dma";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   595  			#address-cells = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   596  			#size-cells = <0>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   597  			status = "disabled";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   598  		};
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   599  
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   600  		i2c2: i2c@11009000 {
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   601  			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   602  			reg = <0 0x11009000 0 0xa0>, <0 0x11000180 0 0x80>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   603  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   604  			clock-div = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   605  			clocks = <&infracfg CLK_IFR_I2C2_AXI>, <&infracfg CLK_IFR_AP_DMA>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   606  			clock-names = "main", "dma";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   607  			#address-cells = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   608  			#size-cells = <0>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   609  			status = "disabled";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   610  		};
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   611  
6ff9453765565b Fabien Parent       2023-03-09   612  		spi: spi@1100a000 {
6ff9453765565b Fabien Parent       2023-03-09   613  			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
6ff9453765565b Fabien Parent       2023-03-09   614  			reg = <0 0x1100a000 0 0x100>;
6ff9453765565b Fabien Parent       2023-03-09   615  			#address-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   616  			#size-cells = <0>;
6ff9453765565b Fabien Parent       2023-03-09   617  			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   618  			clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
6ff9453765565b Fabien Parent       2023-03-09   619  				 <&topckgen CLK_TOP_SPI_SEL>,
6ff9453765565b Fabien Parent       2023-03-09   620  				 <&infracfg CLK_IFR_SPI0>;
6ff9453765565b Fabien Parent       2023-03-09   621  			clock-names = "parent-clk", "sel-clk", "spi-clk";
6ff9453765565b Fabien Parent       2023-03-09   622  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   623  		};
6ff9453765565b Fabien Parent       2023-03-09   624  
eebaaff677f64a Alexandre Mergnat   2025-01-08   625  		disp_pwm: pwm@1100e000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   626  			compatible = "mediatek,mt8365-disp-pwm", "mediatek,mt8183-disp-pwm";
eebaaff677f64a Alexandre Mergnat   2025-01-08   627  			reg = <0 0x1100e000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   628  			clock-names = "main", "mm";
eebaaff677f64a Alexandre Mergnat   2025-01-08   629  			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>, <&infracfg CLK_IFR_DISP_PWM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   630  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   631  			#pwm-cells = <2>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   632  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   633  
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   634  		i2c3: i2c@1100f000 {
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   635  			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   636  			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   637  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   638  			clock-div = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   639  			clocks = <&infracfg CLK_IFR_I2C3_AXI>, <&infracfg CLK_IFR_AP_DMA>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   640  			clock-names = "main", "dma";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   641  			#address-cells = <1>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   642  			#size-cells = <0>;
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   643  			status = "disabled";
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   644  		};
dbf17e13f04ac0 Alexandre Mergnat   2023-03-28   645  
6ff9453765565b Fabien Parent       2023-03-09   646  		ssusb: usb@11201000 {
6ff9453765565b Fabien Parent       2023-03-09   647  			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
6ff9453765565b Fabien Parent       2023-03-09   648  			reg = <0 0x11201000 0 0x2e00>, <0 0x11203e00 0 0x0100>;
6ff9453765565b Fabien Parent       2023-03-09   649  			reg-names = "mac", "ippc";
6ff9453765565b Fabien Parent       2023-03-09   650  			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   651  			phys = <&u2port0 PHY_TYPE_USB2>,
6ff9453765565b Fabien Parent       2023-03-09   652  			       <&u2port1 PHY_TYPE_USB2>;
6ff9453765565b Fabien Parent       2023-03-09   653  			clocks = <&topckgen CLK_TOP_SSUSB_TOP_CK_EN>,
6ff9453765565b Fabien Parent       2023-03-09   654  				 <&infracfg CLK_IFR_SSUSB_REF>,
6ff9453765565b Fabien Parent       2023-03-09   655  				 <&infracfg CLK_IFR_SSUSB_SYS>,
6ff9453765565b Fabien Parent       2023-03-09   656  				 <&infracfg CLK_IFR_ICUSB>;
6ff9453765565b Fabien Parent       2023-03-09   657  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
6ff9453765565b Fabien Parent       2023-03-09   658  			#address-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   659  			#size-cells = <2>;
6ff9453765565b Fabien Parent       2023-03-09   660  			ranges;
6ff9453765565b Fabien Parent       2023-03-09   661  			status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   662  
6ff9453765565b Fabien Parent       2023-03-09   663  			usb_host: usb@11200000 {
6ff9453765565b Fabien Parent       2023-03-09   664  				compatible = "mediatek,mt8365-xhci", "mediatek,mtk-xhci";
6ff9453765565b Fabien Parent       2023-03-09   665  				reg = <0 0x11200000 0 0x1000>;
6ff9453765565b Fabien Parent       2023-03-09   666  				reg-names = "mac";
6ff9453765565b Fabien Parent       2023-03-09   667  				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_LOW>;
6ff9453765565b Fabien Parent       2023-03-09   668  				clocks = <&topckgen CLK_TOP_SSUSB_TOP_CK_EN>,
6ff9453765565b Fabien Parent       2023-03-09   669  					 <&infracfg CLK_IFR_SSUSB_REF>,
6ff9453765565b Fabien Parent       2023-03-09   670  					 <&infracfg CLK_IFR_SSUSB_SYS>,
6ff9453765565b Fabien Parent       2023-03-09   671  					 <&infracfg CLK_IFR_ICUSB>,
6ff9453765565b Fabien Parent       2023-03-09   672  					 <&infracfg CLK_IFR_SSUSB_XHCI>;
6ff9453765565b Fabien Parent       2023-03-09   673  				clock-names = "sys_ck", "ref_ck", "mcu_ck",
6ff9453765565b Fabien Parent       2023-03-09   674  					      "dma_ck", "xhci_ck";
6ff9453765565b Fabien Parent       2023-03-09   675  				status = "disabled";
6ff9453765565b Fabien Parent       2023-03-09   676  			};
6ff9453765565b Fabien Parent       2023-03-09   677  		};
6ff9453765565b Fabien Parent       2023-03-09   678  
8b5db516c9416d Alexandre Mergnat   2023-03-29   679  		mmc0: mmc@11230000 {
8b5db516c9416d Alexandre Mergnat   2023-03-29   680  			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
8b5db516c9416d Alexandre Mergnat   2023-03-29   681  			reg = <0 0x11230000 0 0x1000>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   682  			      <0 0x11cd0000 0 0x1000>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   683  			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   684  			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   685  				 <&infracfg CLK_IFR_MSDC0_HCLK>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   686  				 <&infracfg CLK_IFR_MSDC0_SRC>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   687  			clock-names = "source", "hclk", "source_cg";
8b5db516c9416d Alexandre Mergnat   2023-03-29   688  			status = "disabled";
8b5db516c9416d Alexandre Mergnat   2023-03-29   689  		};
8b5db516c9416d Alexandre Mergnat   2023-03-29   690  
8b5db516c9416d Alexandre Mergnat   2023-03-29   691  		mmc1: mmc@11240000 {
8b5db516c9416d Alexandre Mergnat   2023-03-29   692  			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
8b5db516c9416d Alexandre Mergnat   2023-03-29   693  			reg = <0 0x11240000 0 0x1000>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   694  			      <0 0x11c90000 0 0x1000>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   695  			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   696  			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   697  				 <&infracfg CLK_IFR_MSDC1_HCLK>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   698  				 <&infracfg CLK_IFR_MSDC1_SRC>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   699  			clock-names = "source", "hclk", "source_cg";
8b5db516c9416d Alexandre Mergnat   2023-03-29   700  			status = "disabled";
8b5db516c9416d Alexandre Mergnat   2023-03-29   701  		};
8b5db516c9416d Alexandre Mergnat   2023-03-29   702  
8b5db516c9416d Alexandre Mergnat   2023-03-29   703  		mmc2: mmc@11250000 {
8b5db516c9416d Alexandre Mergnat   2023-03-29   704  			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
8b5db516c9416d Alexandre Mergnat   2023-03-29   705  			reg = <0 0x11250000 0 0x1000>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   706  			      <0 0x11c60000 0 0x1000>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   707  			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_LOW>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   708  			clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   709  				 <&infracfg CLK_IFR_MSDC2_HCLK>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   710  				 <&infracfg CLK_IFR_MSDC2_SRC>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   711  				 <&infracfg CLK_IFR_MSDC2_BK>,
8b5db516c9416d Alexandre Mergnat   2023-03-29   712  				 <&infracfg CLK_IFR_AP_MSDC0>;
8b5db516c9416d Alexandre Mergnat   2023-03-29   713  			clock-names = "source", "hclk", "source_cg",
8b5db516c9416d Alexandre Mergnat   2023-03-29   714  				      "bus_clk", "sys_cg";
8b5db516c9416d Alexandre Mergnat   2023-03-29   715  			status = "disabled";
8b5db516c9416d Alexandre Mergnat   2023-03-29   716  		};
8b5db516c9416d Alexandre Mergnat   2023-03-29   717  
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   718  		ethernet: ethernet@112a0000 {
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   719  			compatible = "mediatek,mt8365-eth";
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   720  			reg = <0 0x112a0000 0 0x1000>;
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   721  			mediatek,pericfg = <&infracfg>;
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   722  			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   723  			clocks = <&topckgen CLK_TOP_ETH_SEL>,
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   724  				 <&infracfg CLK_IFR_NIC_AXI>,
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   725  				 <&infracfg CLK_IFR_NIC_SLV_AXI>;
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   726  			clock-names = "core", "reg", "trans";
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   727  			status = "disabled";
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   728  		};
91e217d4b6ea39 Alexandre Mergnat   2023-03-29   729  
eebaaff677f64a Alexandre Mergnat   2025-01-08   730  		mipi_tx0: dsi-phy@11c00000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   731  			compatible = "mediatek,mt8365-mipi-tx", "mediatek,mt8183-mipi-tx";
eebaaff677f64a Alexandre Mergnat   2025-01-08   732  			reg = <0 0x11c00000 0 0x800>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   733  			clock-output-names = "mipi_tx0_pll";
eebaaff677f64a Alexandre Mergnat   2025-01-08   734  			clocks = <&clk26m>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   735  			#clock-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   736  			#phy-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   737  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   738  
6ff9453765565b Fabien Parent       2023-03-09   739  		u3phy: t-phy@11cc0000 {
6ff9453765565b Fabien Parent       2023-03-09   740  			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
6ff9453765565b Fabien Parent       2023-03-09   741  			#address-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   742  			#size-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   743  			ranges = <0 0 0x11cc0000 0x9000>;
6ff9453765565b Fabien Parent       2023-03-09   744  
6ff9453765565b Fabien Parent       2023-03-09   745  			u2port0: usb-phy@0 {
6ff9453765565b Fabien Parent       2023-03-09   746  				reg = <0x0 0x400>;
6ff9453765565b Fabien Parent       2023-03-09   747  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_CK_EN>,
6ff9453765565b Fabien Parent       2023-03-09   748  					 <&topckgen CLK_TOP_USB20_48M_EN>;
6ff9453765565b Fabien Parent       2023-03-09   749  				clock-names = "ref", "da_ref";
6ff9453765565b Fabien Parent       2023-03-09   750  				#phy-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   751  			};
6ff9453765565b Fabien Parent       2023-03-09   752  
6ff9453765565b Fabien Parent       2023-03-09   753  			u2port1: usb-phy@1000 {
6ff9453765565b Fabien Parent       2023-03-09   754  				reg = <0x1000 0x400>;
6ff9453765565b Fabien Parent       2023-03-09   755  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_CK_EN>,
6ff9453765565b Fabien Parent       2023-03-09   756  					 <&topckgen CLK_TOP_USB20_48M_EN>;
6ff9453765565b Fabien Parent       2023-03-09   757  				clock-names = "ref", "da_ref";
6ff9453765565b Fabien Parent       2023-03-09   758  				#phy-cells = <1>;
6ff9453765565b Fabien Parent       2023-03-09   759  			};
6ff9453765565b Fabien Parent       2023-03-09   760  		};
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   761  
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   762  		mmsys: syscon@14000000 {
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   763  			compatible = "mediatek,mt8365-mmsys", "syscon";
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   764  			reg = <0 0x14000000 0 0x1000>;
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   765  			#clock-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   766  			port {
eebaaff677f64a Alexandre Mergnat   2025-01-08   767  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   768  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   769  
eebaaff677f64a Alexandre Mergnat   2025-01-08   770  				mmsys_main: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   771  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   772  					remote-endpoint = <&ovl0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   773  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   774  				mmsys_ext: endpoint@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   775  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   776  					remote-endpoint = <&rdma1_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   777  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   778  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   779  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   780  
eebaaff677f64a Alexandre Mergnat   2025-01-08   781  		mutex: mutex@14001000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   782  			compatible =  "mediatek,mt8365-disp-mutex";
eebaaff677f64a Alexandre Mergnat   2025-01-08   783  			reg = <0 0x14001000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   784  			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   785  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
0dc923ea2b96ef Alexandre Mergnat   2023-09-25   786  		};
1fc9f965fbb251 Alexandre Mergnat   2023-09-25   787  
2bb2410e70e378 Alexandre Mergnat   2023-09-25   788  		smi_common: smi@14002000 {
2bb2410e70e378 Alexandre Mergnat   2023-09-25   789  			compatible = "mediatek,mt8365-smi-common";
2bb2410e70e378 Alexandre Mergnat   2023-09-25   790  			reg = <0 0x14002000 0 0x1000>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   791  			clocks = <&mmsys CLK_MM_MM_SMI_COMMON>,
2bb2410e70e378 Alexandre Mergnat   2023-09-25   792  				 <&mmsys CLK_MM_MM_SMI_COMMON>,
2bb2410e70e378 Alexandre Mergnat   2023-09-25   793  				 <&mmsys CLK_MM_MM_SMI_COMM0>,
2bb2410e70e378 Alexandre Mergnat   2023-09-25   794  				 <&mmsys CLK_MM_MM_SMI_COMM1>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   795  			clock-names = "apb", "smi", "gals0", "gals1";
2bb2410e70e378 Alexandre Mergnat   2023-09-25   796  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
2bb2410e70e378 Alexandre Mergnat   2023-09-25   797  		};
2bb2410e70e378 Alexandre Mergnat   2023-09-25   798  
d6b2df359be64a Alexandre Mergnat   2023-09-25   799  		larb0: larb@14003000 {
d6b2df359be64a Alexandre Mergnat   2023-09-25   800  			compatible = "mediatek,mt8365-smi-larb",
d6b2df359be64a Alexandre Mergnat   2023-09-25   801  				     "mediatek,mt8186-smi-larb";
d6b2df359be64a Alexandre Mergnat   2023-09-25   802  			reg = <0 0x14003000 0 0x1000>;
d6b2df359be64a Alexandre Mergnat   2023-09-25   803  			mediatek,smi = <&smi_common>;
d6b2df359be64a Alexandre Mergnat   2023-09-25   804  			clocks = <&mmsys CLK_MM_MM_SMI_LARB0>,
d6b2df359be64a Alexandre Mergnat   2023-09-25   805  				 <&mmsys CLK_MM_MM_SMI_LARB0>;
d6b2df359be64a Alexandre Mergnat   2023-09-25   806  			clock-names = "apb", "smi";
d6b2df359be64a Alexandre Mergnat   2023-09-25   807  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
d6b2df359be64a Alexandre Mergnat   2023-09-25   808  			mediatek,larb-id = <0>;
d6b2df359be64a Alexandre Mergnat   2023-09-25   809  		};
d6b2df359be64a Alexandre Mergnat   2023-09-25   810  
eebaaff677f64a Alexandre Mergnat   2025-01-08   811  		ovl0: ovl@1400b000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   812  			compatible = "mediatek,mt8365-disp-ovl", "mediatek,mt8192-disp-ovl";
eebaaff677f64a Alexandre Mergnat   2025-01-08   813  			reg = <0 0x1400b000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   814  			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   815  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   816  			iommus = <&iommu M4U_PORT_DISP_OVL0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   817  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   818  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   819  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   820  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   821  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @822  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   823  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   824  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   825  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   826  					ovl0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   827  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   828  						remote-endpoint = <&mmsys_main>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   829  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   830  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   831  
eebaaff677f64a Alexandre Mergnat   2025-01-08   832  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   833  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   834  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   835  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   836  					ovl0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   837  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   838  						remote-endpoint = <&rdma0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   839  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   840  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   841  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   842  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   843  
eebaaff677f64a Alexandre Mergnat   2025-01-08   844  		rdma0: rdma@1400d000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   845  			compatible = "mediatek,mt8365-disp-rdma", "mediatek,mt8183-disp-rdma";
eebaaff677f64a Alexandre Mergnat   2025-01-08   846  			reg = <0 0x1400d000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   847  			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   848  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   849  			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   850  			mediatek,rdma-fifo-size = <5120>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   851  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   852  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   853  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   854  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   855  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @856  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   857  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   858  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   859  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   860  					rdma0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   861  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   862  						remote-endpoint = <&ovl0_out>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   863  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   864  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   865  
eebaaff677f64a Alexandre Mergnat   2025-01-08   866  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   867  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   868  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   869  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   870  					rdma0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   871  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   872  						remote-endpoint = <&color0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   873  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   874  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   875  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   876  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   877  
eebaaff677f64a Alexandre Mergnat   2025-01-08   878  		color0: color@1400f000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   879  			compatible = "mediatek,mt8365-disp-color", "mediatek,mt8173-disp-color";
eebaaff677f64a Alexandre Mergnat   2025-01-08   880  			reg = <0 0x1400f000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   881  			clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   882  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   883  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   884  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   885  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   886  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   887  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @888  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   889  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   890  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   891  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   892  					color0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   893  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   894  						remote-endpoint = <&rdma0_out>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   895  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   896  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   897  
eebaaff677f64a Alexandre Mergnat   2025-01-08   898  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   899  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   900  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   901  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   902  					color0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   903  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   904  						remote-endpoint = <&ccorr0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   905  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   906  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   907  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   908  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   909  
eebaaff677f64a Alexandre Mergnat   2025-01-08   910  		ccorr0: ccorr@14010000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   911  			compatible = "mediatek,mt8365-disp-ccorr", "mediatek,mt8183-disp-ccorr";
eebaaff677f64a Alexandre Mergnat   2025-01-08   912  			reg = <0 0x14010000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   913  			clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   914  			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   915  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   916  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   917  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   918  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   919  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @920  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   921  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   922  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   923  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   924  					ccorr0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   925  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   926  						remote-endpoint = <&color0_out>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   927  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   928  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   929  
eebaaff677f64a Alexandre Mergnat   2025-01-08   930  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   931  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   932  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   933  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   934  					ccorr0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   935  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   936  						remote-endpoint = <&aal0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   937  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   938  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   939  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   940  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   941  
eebaaff677f64a Alexandre Mergnat   2025-01-08   942  		aal0: aal@14011000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   943  			compatible = "mediatek,mt8365-disp-aal", "mediatek,mt8183-disp-aal";
eebaaff677f64a Alexandre Mergnat   2025-01-08   944  			reg = <0 0x14011000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   945  			clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   946  			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   947  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   948  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   949  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   950  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   951  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @952  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   953  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   954  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   955  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   956  					aal0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   957  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   958  						remote-endpoint = <&ccorr0_out>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   959  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   960  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   961  
eebaaff677f64a Alexandre Mergnat   2025-01-08   962  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   963  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   964  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   965  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   966  					aal0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   967  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   968  						remote-endpoint = <&gamma0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   969  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   970  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   971  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08   972  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08   973  
eebaaff677f64a Alexandre Mergnat   2025-01-08   974  		gamma0: gamma@14012000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   975  			compatible = "mediatek,mt8365-disp-gamma", "mediatek,mt8183-disp-gamma";
eebaaff677f64a Alexandre Mergnat   2025-01-08   976  			reg = <0 0x14012000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   977  			clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   978  			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   979  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   980  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08   981  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   982  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   983  
eebaaff677f64a Alexandre Mergnat   2025-01-08  @984  				port@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   985  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   986  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   987  					reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   988  					gamma0_in: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   989  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   990  						remote-endpoint = <&aal0_out>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   991  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08   992  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08   993  
eebaaff677f64a Alexandre Mergnat   2025-01-08   994  				port@1 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   995  					#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   996  					#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   997  					reg = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08   998  					gamma0_out: endpoint@0 {
eebaaff677f64a Alexandre Mergnat   2025-01-08   999  						reg = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1000  						remote-endpoint = <&dither0_in>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1001  					};
eebaaff677f64a Alexandre Mergnat   2025-01-08  1002  				};
eebaaff677f64a Alexandre Mergnat   2025-01-08  1003  			};
eebaaff677f64a Alexandre Mergnat   2025-01-08  1004  		};
eebaaff677f64a Alexandre Mergnat   2025-01-08  1005  
eebaaff677f64a Alexandre Mergnat   2025-01-08  1006  		dither0: dither@14013000 {
eebaaff677f64a Alexandre Mergnat   2025-01-08  1007  			compatible = "mediatek,mt8365-disp-dither", "mediatek,mt8183-disp-dither";
eebaaff677f64a Alexandre Mergnat   2025-01-08  1008  			reg = <0 0x14013000 0 0x1000>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1009  			clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1010  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1011  			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1012  			ports {
eebaaff677f64a Alexandre Mergnat   2025-01-08  1013  				#address-cells = <1>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1014  				#size-cells = <0>;
eebaaff677f64a Alexandre Mergnat   2025-01-08  1015  
eebaaff677f64a Alexandre Mergnat   2025-01-08 @1016  				port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
