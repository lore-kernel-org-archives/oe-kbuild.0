Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C05208A9
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Feb 2025 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430321; cv=none; b=FBpAvSDKW6TzXHCXvgxrKH2etq3vgf+TV/Y+cDgimHSQjUHjGM6MLC/EpbNtOSQ9S7+xaP2Fj02+c9ZLnqPGODRR3/XL1AQVwMbFRAIlzlImSKfMaVXoVeFb7WQHH+r5xq1Vos1opJKuPFocz9nWgqrOUz4Q8gnPDcAh1lxNMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430321; c=relaxed/simple;
	bh=oY1sRs3DIGhbmqcwh/8ME+9w8GlHwo48KyiCSb217X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0DTMxBENbiK9C8YtA9+OZauV4PrgaTMUggnv5Cuv+/xLNtC0T72TqgFshO30lBBhThB0ItIvAyqEJG2+nd9GgKEQXqsPnNvQ0uCVgq5tlTQBpuQu5BJiP2ACiZ7iLu5a058NCdA9EBX5jL2qbr5VV2rosY+bR3ybNeLTCcip54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7M6xiBb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7M6xiBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738430319; x=1769966319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oY1sRs3DIGhbmqcwh/8ME+9w8GlHwo48KyiCSb217X8=;
  b=K7M6xiBb2uEGG3ihGWC8pUW9MrFQLPiKhWz14g1J61Xm5kO1bW8Jm/Y8
   UbQEfxtijxacYXQDN6wPizL7UKL1PizankxBSCHfNH6B3lBdjdJBp0Qcd
   qgU1BG34AI6RcuDpr+9sZlQgPVUBzsW2OgJYAlr6oaAN7ovtN8tICYcn5
   FvyqWMY9GiUvLMhu7kuCxQOOiZYUSjWWIIqQr7/EhoDvbKf3VlO/DDAEI
   qkSxd2sRnREh++dZOKxt3qLVUoSEN5BQrTapowPdhyNfvLXhxPipNwVC3
   k9H+Yr8LEduInZszH21dRbLa2rQZ7XtrG0OFHI5dRzvvhYyoglXfDk9f9
   g==;
X-CSE-ConnectionGUID: 9vv7O9PhTzqOm16NQuu2Sw==
X-CSE-MsgGUID: WgIk++TTQsWViyXbjVzEZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39079282"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39079282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 09:18:38 -0800
X-CSE-ConnectionGUID: ne6Ku124QM+cIi5J6xY7DA==
X-CSE-MsgGUID: fw/iIalRR8STZyB3m2aD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="140774724"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Feb 2025 09:18:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teH8d-000oOx-0p;
	Sat, 01 Feb 2025 17:18:35 +0000
Date: Sun, 2 Feb 2025 01:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC
 evaluation board
Message-ID: <202502020107.pfsv4sal-lkp@intel.com>
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
In-Reply-To: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7605336e9d136c14c94482ce7385de783f2f748e]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/arm64-dts-Introduce-more-nodes-to-EN7581-SoC-evaluation-board/20250201-224326
base:   7605336e9d136c14c94482ce7385de783f2f748e
patch link:    https://lore.kernel.org/r/20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6%40kernel.org
patch subject: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC evaluation board
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020107.pfsv4sal-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020107.pfsv4sal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502020107.pfsv4sal-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/airoha/en7581.dtsi:186.24-192.5: Warning (unit_address_vs_reg): /soc/i2cclock@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/airoha/en7581.dtsi:155.37-160.5: Warning (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address format error, expected "1fb00000"
>> arch/arm64/boot/dts/airoha/en7581.dtsi:186.24-192.5: Warning (simple_bus_reg): /soc/i2cclock@0: missing or empty reg/ranges property

vim +186 arch/arm64/boot/dts/airoha/en7581.dtsi

ab52c59103002b Daniel Danzberger 2024-03-09    6  
ab52c59103002b Daniel Danzberger 2024-03-09    7  / {
ab52c59103002b Daniel Danzberger 2024-03-09    8  	interrupt-parent = <&gic>;
ab52c59103002b Daniel Danzberger 2024-03-09    9  	#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   10  	#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   11  
ab52c59103002b Daniel Danzberger 2024-03-09   12  	reserved-memory {
ab52c59103002b Daniel Danzberger 2024-03-09   13  		#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   14  		#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   15  		ranges;
ab52c59103002b Daniel Danzberger 2024-03-09   16  
ab52c59103002b Daniel Danzberger 2024-03-09   17  		npu-binary@84000000 {
ab52c59103002b Daniel Danzberger 2024-03-09   18  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   19  			reg = <0x0 0x84000000 0x0 0xa00000>;
ab52c59103002b Daniel Danzberger 2024-03-09   20  		};
ab52c59103002b Daniel Danzberger 2024-03-09   21  
ab52c59103002b Daniel Danzberger 2024-03-09   22  		npu-flag@84b0000 {
ab52c59103002b Daniel Danzberger 2024-03-09   23  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   24  			reg = <0x0 0x84b00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   25  		};
ab52c59103002b Daniel Danzberger 2024-03-09   26  
ab52c59103002b Daniel Danzberger 2024-03-09   27  		npu-pkt@85000000 {
ab52c59103002b Daniel Danzberger 2024-03-09   28  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   29  			reg = <0x0 0x85000000 0x0 0x1a00000>;
ab52c59103002b Daniel Danzberger 2024-03-09   30  		};
ab52c59103002b Daniel Danzberger 2024-03-09   31  
ab52c59103002b Daniel Danzberger 2024-03-09   32  		npu-phyaddr@86b00000 {
ab52c59103002b Daniel Danzberger 2024-03-09   33  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   34  			reg = <0x0 0x86b00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   35  		};
ab52c59103002b Daniel Danzberger 2024-03-09   36  
ab52c59103002b Daniel Danzberger 2024-03-09   37  		npu-rxdesc@86d00000 {
ab52c59103002b Daniel Danzberger 2024-03-09   38  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   39  			reg = <0x0 0x86d00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   40  		};
ab52c59103002b Daniel Danzberger 2024-03-09   41  	};
ab52c59103002b Daniel Danzberger 2024-03-09   42  
ab52c59103002b Daniel Danzberger 2024-03-09   43  	psci {
ab52c59103002b Daniel Danzberger 2024-03-09   44  		compatible = "arm,psci-1.0";
ab52c59103002b Daniel Danzberger 2024-03-09   45  		method = "smc";
ab52c59103002b Daniel Danzberger 2024-03-09   46  	};
ab52c59103002b Daniel Danzberger 2024-03-09   47  
ab52c59103002b Daniel Danzberger 2024-03-09   48  	cpus {
ab52c59103002b Daniel Danzberger 2024-03-09   49  		#address-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09   50  		#size-cells = <0>;
ab52c59103002b Daniel Danzberger 2024-03-09   51  
ab52c59103002b Daniel Danzberger 2024-03-09   52  		cpu-map {
ab52c59103002b Daniel Danzberger 2024-03-09   53  			cluster0 {
ab52c59103002b Daniel Danzberger 2024-03-09   54  				core0 {
ab52c59103002b Daniel Danzberger 2024-03-09   55  					cpu = <&cpu0>;
ab52c59103002b Daniel Danzberger 2024-03-09   56  				};
ab52c59103002b Daniel Danzberger 2024-03-09   57  
ab52c59103002b Daniel Danzberger 2024-03-09   58  				core1 {
ab52c59103002b Daniel Danzberger 2024-03-09   59  					cpu = <&cpu1>;
ab52c59103002b Daniel Danzberger 2024-03-09   60  				};
ab52c59103002b Daniel Danzberger 2024-03-09   61  
ab52c59103002b Daniel Danzberger 2024-03-09   62  				core2 {
ab52c59103002b Daniel Danzberger 2024-03-09   63  					cpu = <&cpu2>;
ab52c59103002b Daniel Danzberger 2024-03-09   64  				};
ab52c59103002b Daniel Danzberger 2024-03-09   65  
ab52c59103002b Daniel Danzberger 2024-03-09   66  				core3 {
ab52c59103002b Daniel Danzberger 2024-03-09   67  					cpu = <&cpu3>;
ab52c59103002b Daniel Danzberger 2024-03-09   68  				};
ab52c59103002b Daniel Danzberger 2024-03-09   69  			};
ab52c59103002b Daniel Danzberger 2024-03-09   70  		};
ab52c59103002b Daniel Danzberger 2024-03-09   71  
ab52c59103002b Daniel Danzberger 2024-03-09   72  		cpu0: cpu@0 {
ab52c59103002b Daniel Danzberger 2024-03-09   73  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   74  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   75  			reg = <0x0>;
ab52c59103002b Daniel Danzberger 2024-03-09   76  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   77  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   78  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   79  		};
ab52c59103002b Daniel Danzberger 2024-03-09   80  
ab52c59103002b Daniel Danzberger 2024-03-09   81  		cpu1: cpu@1 {
ab52c59103002b Daniel Danzberger 2024-03-09   82  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   83  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   84  			reg = <0x1>;
ab52c59103002b Daniel Danzberger 2024-03-09   85  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   86  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   87  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   88  		};
ab52c59103002b Daniel Danzberger 2024-03-09   89  
ab52c59103002b Daniel Danzberger 2024-03-09   90  		cpu2: cpu@2 {
ab52c59103002b Daniel Danzberger 2024-03-09   91  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   92  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   93  			reg = <0x2>;
ab52c59103002b Daniel Danzberger 2024-03-09   94  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   95  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   96  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   97  		};
ab52c59103002b Daniel Danzberger 2024-03-09   98  
ab52c59103002b Daniel Danzberger 2024-03-09   99  		cpu3: cpu@3 {
ab52c59103002b Daniel Danzberger 2024-03-09  100  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09  101  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09  102  			reg = <0x3>;
ab52c59103002b Daniel Danzberger 2024-03-09  103  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09  104  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09  105  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09  106  		};
ab52c59103002b Daniel Danzberger 2024-03-09  107  
ab52c59103002b Daniel Danzberger 2024-03-09  108  		l2: l2-cache {
ab52c59103002b Daniel Danzberger 2024-03-09  109  			compatible = "cache";
ab52c59103002b Daniel Danzberger 2024-03-09  110  			cache-size = <0x80000>;
ab52c59103002b Daniel Danzberger 2024-03-09  111  			cache-line-size = <64>;
ab52c59103002b Daniel Danzberger 2024-03-09  112  			cache-level = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  113  			cache-unified;
ab52c59103002b Daniel Danzberger 2024-03-09  114  		};
ab52c59103002b Daniel Danzberger 2024-03-09  115  	};
ab52c59103002b Daniel Danzberger 2024-03-09  116  
ab52c59103002b Daniel Danzberger 2024-03-09  117  	timer {
ab52c59103002b Daniel Danzberger 2024-03-09  118  		compatible = "arm,armv8-timer";
ab52c59103002b Daniel Danzberger 2024-03-09  119  		interrupt-parent = <&gic>;
ab52c59103002b Daniel Danzberger 2024-03-09  120  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  121  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  122  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  123  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
ab52c59103002b Daniel Danzberger 2024-03-09  124  	};
ab52c59103002b Daniel Danzberger 2024-03-09  125  
ab52c59103002b Daniel Danzberger 2024-03-09  126  	soc {
ab52c59103002b Daniel Danzberger 2024-03-09  127  		compatible = "simple-bus";
ab52c59103002b Daniel Danzberger 2024-03-09  128  		#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  129  		#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  130  		ranges;
ab52c59103002b Daniel Danzberger 2024-03-09  131  
ab52c59103002b Daniel Danzberger 2024-03-09  132  		gic: interrupt-controller@9000000 {
ab52c59103002b Daniel Danzberger 2024-03-09  133  			compatible = "arm,gic-v3";
ab52c59103002b Daniel Danzberger 2024-03-09  134  			interrupt-controller;
ab52c59103002b Daniel Danzberger 2024-03-09  135  			#interrupt-cells = <3>;
ab52c59103002b Daniel Danzberger 2024-03-09  136  			#address-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09  137  			#size-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09  138  			reg = <0x0 0x09000000 0x0 0x20000>,
ab52c59103002b Daniel Danzberger 2024-03-09  139  			      <0x0 0x09080000 0x0 0x80000>,
ab52c59103002b Daniel Danzberger 2024-03-09  140  			      <0x0 0x09400000 0x0 0x2000>,
ab52c59103002b Daniel Danzberger 2024-03-09  141  			      <0x0 0x09500000 0x0 0x2000>,
ab52c59103002b Daniel Danzberger 2024-03-09  142  			      <0x0 0x09600000 0x0 0x20000>;
ab52c59103002b Daniel Danzberger 2024-03-09  143  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
ab52c59103002b Daniel Danzberger 2024-03-09  144  		};
ab52c59103002b Daniel Danzberger 2024-03-09  145  
ab52c59103002b Daniel Danzberger 2024-03-09  146  		uart1: serial@1fbf0000 {
ab52c59103002b Daniel Danzberger 2024-03-09  147  			compatible = "ns16550";
ab52c59103002b Daniel Danzberger 2024-03-09  148  			reg = <0x0 0x1fbf0000 0x0 0x30>;
ab52c59103002b Daniel Danzberger 2024-03-09  149  			reg-io-width = <4>;
ab52c59103002b Daniel Danzberger 2024-03-09  150  			reg-shift = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  151  			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
ab52c59103002b Daniel Danzberger 2024-03-09  152  			clock-frequency = <1843200>;
ab52c59103002b Daniel Danzberger 2024-03-09  153  		};
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  154  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  155  		scuclk: clock-controller@1fa20000 {
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  156  			compatible = "airoha,en7581-scu";
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  157  			reg = <0x0 0x1fb00000 0x0 0x970>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  158  			#clock-cells = <1>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  159  			#reset-cells = <1>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  160  		};
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  161  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  162  		rng@1faa1000 {
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  163  			compatible = "airoha,en7581-trng";
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  164  			reg = <0x0 0x1faa1000 0x0 0xc04>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  165  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  166  		};
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  167  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  168  		system-controller@1fbf0200 {
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  169  			compatible = "syscon", "simple-mfd";
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  170  			reg = <0x0 0x1fbf0200 0x0 0xc0>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  171  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  172  			en7581_pinctrl: pinctrl {
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  173  				compatible = "airoha,en7581-pinctrl";
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  174  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  175  				interrupt-parent = <&gic>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  176  				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  177  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  178  				gpio-controller;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  179  				#gpio-cells = <2>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  180  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  181  				interrupt-controller;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  182  				#interrupt-cells = <2>;
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  183  			};
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  184  		};
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01  185  
89ddabb2e68a00 Lorenzo Bianconi  2025-02-01 @186  		i2cclock: i2cclock@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
