Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C969272E48
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793755; cv=none; b=damsFM6ytTUgUux1mUGLfbmIMHBP65TDWkFVKNGMZ8IrbKVv+E7HZx7XvtXdqXx+uRprh9PLklL6XYZJ7vzLRa6IcgWBO2SI4iHeb32eeVBXDCf7wCBNfNR7hlbaxr5QPpmUTqdNp+gytgLxfWss1AWoLssSSxN3C3femNoqqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793755; c=relaxed/simple;
	bh=OyT7AfuVVXloasB6CChlLz1FJVHpGy+4Un9TI8MqDo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pie3H6JcR4vPJRmj5InMPiFQMT7N8+8IqnZGmUHZd4zpaiADNtq/JgmdDI1CcCAUFveX0EoCIUOQhOnBXBAC28RdmXMPo+6Rntp+vqV8nFSY5UUcM9Qs9BPI6mFMleSo/dL0P2jf/IlqENO8kdsg6T0dsnhQsIt3tm3tx4DGoQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqyRAq9H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqyRAq9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746793752; x=1778329752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyT7AfuVVXloasB6CChlLz1FJVHpGy+4Un9TI8MqDo4=;
  b=IqyRAq9HwThHZC7TzV24xSUi5OMpm9hms+b1UYiCnJKt+Y3l0BfNjVFa
   U8SN2bQsyZCaoklJN3OpBH/q8wGaD0JKcnQHQNUTjcECJnO75yS29QzNt
   DRXKf1MVp+1PEXnswJFU/sz/0yS/e6k46ahPb/wScB6HNETSMeOwdFina
   xg6IR4XyZrZAQgSNo0C0U05O6CBV2IdAxToM9RTTU4h/zVwA2EsElaDyJ
   KEAXk3uJaSHQgE+0DZqnY6PjSMLZCZYSrUzyY4gp15fRMVftZ+scv0Fbj
   MhBLVNM/PHX48mGqyJIFnlRInGs1lPz6FD4Q4/tbOetA7GpNGQ/eBFwyr
   w==;
X-CSE-ConnectionGUID: FJZBCo2tT0KKzsWSMfcTew==
X-CSE-MsgGUID: HjORU6LzTka+dYsNhm4ReQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59963902"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59963902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:29:11 -0700
X-CSE-ConnectionGUID: 68FNSYwsR4eJCfxTiHzSLA==
X-CSE-MsgGUID: j3/9Uy0qRr2pcc6r+6TdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137101800"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 05:29:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDMqi-000C4D-2E;
	Fri, 09 May 2025 12:29:08 +0000
Date: Fri, 9 May 2025 20:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: mt8189: Add mt8189 dts evaluation
 board and Mafefile
Message-ID: <202505092006.tpx07Djm-lkp@intel.com>
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
In-Reply-To: <20250508063546.289115-4-sirius.wang@mediatek.com>
References: <20250508063546.289115-4-sirius.wang@mediatek.com>
TO: Sirius Wang <sirius.wang@mediatek.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Sean Wang <sean.wang@mediatek.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: wenst@chromium.org
CC: xavier.chang@mediatek.com
CC: Sirius Wang <sirius.wang@mediatek.com>

Hi Sirius,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sirius-Wang/dt-bindings-arm-Add-compatible-for-MediaTek-MT8189/20250508-145238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250508063546.289115-4-sirius.wang%40mediatek.com
patch subject: [PATCH v2 3/3] arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092006.tpx07Djm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092006.tpx07Djm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505092006.tpx07Djm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:385.37-405.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +385 arch/arm64/boot/dts/mediatek/mt8189.dtsi

a49efba0ecae5d Sirius Wang 2025-05-08    8  
a49efba0ecae5d Sirius Wang 2025-05-08    9  / {
a49efba0ecae5d Sirius Wang 2025-05-08   10  	compatible = "mediatek,mt8189";
a49efba0ecae5d Sirius Wang 2025-05-08   11  	interrupt-parent = <&gic>;
a49efba0ecae5d Sirius Wang 2025-05-08   12  	#address-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08   13  	#size-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08   14  
a49efba0ecae5d Sirius Wang 2025-05-08   15  	aliases {
a49efba0ecae5d Sirius Wang 2025-05-08   16  		serial0 = &uart0;
a49efba0ecae5d Sirius Wang 2025-05-08   17  	};
a49efba0ecae5d Sirius Wang 2025-05-08   18  
a49efba0ecae5d Sirius Wang 2025-05-08   19  	clk32k: oscillator-clk32k {
a49efba0ecae5d Sirius Wang 2025-05-08   20  		compatible = "fixed-clock";
a49efba0ecae5d Sirius Wang 2025-05-08   21  		#clock-cells = <0>;
a49efba0ecae5d Sirius Wang 2025-05-08   22  		clock-frequency = <32000>;
a49efba0ecae5d Sirius Wang 2025-05-08   23  		clock-output-names = "clk32k";
a49efba0ecae5d Sirius Wang 2025-05-08   24  	};
a49efba0ecae5d Sirius Wang 2025-05-08   25  
a49efba0ecae5d Sirius Wang 2025-05-08   26  	clk13m: oscillator-clk13m {
a49efba0ecae5d Sirius Wang 2025-05-08   27  		compatible = "fixed-factor-clock";
a49efba0ecae5d Sirius Wang 2025-05-08   28  		#clock-cells = <0>;
a49efba0ecae5d Sirius Wang 2025-05-08   29  		clocks = <&clk26m>;
a49efba0ecae5d Sirius Wang 2025-05-08   30  		clock-mult = <1>;
a49efba0ecae5d Sirius Wang 2025-05-08   31  		clock-div = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08   32  		clock-output-names = "clk13m";
a49efba0ecae5d Sirius Wang 2025-05-08   33  	};
a49efba0ecae5d Sirius Wang 2025-05-08   34  
a49efba0ecae5d Sirius Wang 2025-05-08   35  	clk26m: oscillator-clk26m {
a49efba0ecae5d Sirius Wang 2025-05-08   36  		compatible = "fixed-clock";
a49efba0ecae5d Sirius Wang 2025-05-08   37  		#clock-cells = <0>;
a49efba0ecae5d Sirius Wang 2025-05-08   38  		clock-frequency = <26000000>;
a49efba0ecae5d Sirius Wang 2025-05-08   39  		clock-output-names = "clk26m";
a49efba0ecae5d Sirius Wang 2025-05-08   40  	};
a49efba0ecae5d Sirius Wang 2025-05-08   41  
a49efba0ecae5d Sirius Wang 2025-05-08   42  	clk104m: oscillator-clk104m {
a49efba0ecae5d Sirius Wang 2025-05-08   43  		compatible = "fixed-factor-clock";
a49efba0ecae5d Sirius Wang 2025-05-08   44  		#clock-cells = <0>;
a49efba0ecae5d Sirius Wang 2025-05-08   45  		clocks = <&clk26m>;
a49efba0ecae5d Sirius Wang 2025-05-08   46  		clock-mult = <4>;
a49efba0ecae5d Sirius Wang 2025-05-08   47  		clock-div = <1>;
a49efba0ecae5d Sirius Wang 2025-05-08   48  		clock-output-names = "clk104m";
a49efba0ecae5d Sirius Wang 2025-05-08   49  	};
a49efba0ecae5d Sirius Wang 2025-05-08   50  
a49efba0ecae5d Sirius Wang 2025-05-08   51  	cpus {
a49efba0ecae5d Sirius Wang 2025-05-08   52  		#address-cells = <1>;
a49efba0ecae5d Sirius Wang 2025-05-08   53  		#size-cells = <0>;
a49efba0ecae5d Sirius Wang 2025-05-08   54  
a49efba0ecae5d Sirius Wang 2025-05-08   55  		cpu0: cpu@0 {
a49efba0ecae5d Sirius Wang 2025-05-08   56  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08   57  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08   58  			reg = <0x000>;
a49efba0ecae5d Sirius Wang 2025-05-08   59  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08   60  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08   61  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08   62  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08   63  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08   64  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08   65  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08   66  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08   67  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08   68  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08   69  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08   70  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08   71  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08   72  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08   73  		};
a49efba0ecae5d Sirius Wang 2025-05-08   74  
a49efba0ecae5d Sirius Wang 2025-05-08   75  		cpu1: cpu@100 {
a49efba0ecae5d Sirius Wang 2025-05-08   76  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08   77  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08   78  			reg = <0x100>;
a49efba0ecae5d Sirius Wang 2025-05-08   79  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08   80  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08   81  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08   82  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08   83  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08   84  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08   85  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08   86  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08   87  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08   88  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08   89  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08   90  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08   91  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08   92  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08   93  		};
a49efba0ecae5d Sirius Wang 2025-05-08   94  
a49efba0ecae5d Sirius Wang 2025-05-08   95  		cpu2: cpu@200 {
a49efba0ecae5d Sirius Wang 2025-05-08   96  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08   97  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08   98  			reg = <0x200>;
a49efba0ecae5d Sirius Wang 2025-05-08   99  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  100  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  101  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08  102  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08  103  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  104  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  105  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  106  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  107  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  108  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  109  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  110  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  111  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08  112  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  113  		};
a49efba0ecae5d Sirius Wang 2025-05-08  114  
a49efba0ecae5d Sirius Wang 2025-05-08  115  		cpu3: cpu@300 {
a49efba0ecae5d Sirius Wang 2025-05-08  116  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08  117  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08  118  			reg = <0x300>;
a49efba0ecae5d Sirius Wang 2025-05-08  119  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  120  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  121  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08  122  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08  123  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  124  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  125  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  126  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  127  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  128  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  129  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  130  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  131  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08  132  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  133  		};
a49efba0ecae5d Sirius Wang 2025-05-08  134  
a49efba0ecae5d Sirius Wang 2025-05-08  135  		cpu4: cpu@400 {
a49efba0ecae5d Sirius Wang 2025-05-08  136  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08  137  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08  138  			reg = <0x400>;
a49efba0ecae5d Sirius Wang 2025-05-08  139  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  140  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  141  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08  142  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08  143  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  144  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  145  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  146  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  147  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  148  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  149  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  150  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  151  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08  152  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  153  		};
a49efba0ecae5d Sirius Wang 2025-05-08  154  
a49efba0ecae5d Sirius Wang 2025-05-08  155  		cpu5: cpu@500 {
a49efba0ecae5d Sirius Wang 2025-05-08  156  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08  157  			compatible = "arm,cortex-a55";
a49efba0ecae5d Sirius Wang 2025-05-08  158  			reg = <0x500>;
a49efba0ecae5d Sirius Wang 2025-05-08  159  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  160  			clock-frequency = <2000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  161  			capacity-dmips-mhz = <742>;
a49efba0ecae5d Sirius Wang 2025-05-08  162  			cpu-idle-states = <&cpu_off_l>, <&cpu_cluster_off_l>, <&cpu_mcusys_off_l>,
a49efba0ecae5d Sirius Wang 2025-05-08  163  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  164  			i-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  165  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  166  			i-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  167  			d-cache-size = <32768>;
a49efba0ecae5d Sirius Wang 2025-05-08  168  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  169  			d-cache-sets = <128>;
a49efba0ecae5d Sirius Wang 2025-05-08  170  			next-level-cache = <&l2_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  171  			performance-domains = <&performance 0>;
a49efba0ecae5d Sirius Wang 2025-05-08  172  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  173  		};
a49efba0ecae5d Sirius Wang 2025-05-08  174  
a49efba0ecae5d Sirius Wang 2025-05-08  175  		cpu6: cpu@600 {
a49efba0ecae5d Sirius Wang 2025-05-08  176  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08  177  			compatible = "arm,cortex-a78";
a49efba0ecae5d Sirius Wang 2025-05-08  178  			reg = <0x600>;
a49efba0ecae5d Sirius Wang 2025-05-08  179  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  180  			clock-frequency = <3000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  181  			capacity-dmips-mhz = <958>;
a49efba0ecae5d Sirius Wang 2025-05-08  182  			cpu-idle-states = <&cpu_off_m>, <&cpu_cluster_off_m>, <&cpu_mcusys_off_m>,
a49efba0ecae5d Sirius Wang 2025-05-08  183  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  184  			i-cache-size = <65536>;
a49efba0ecae5d Sirius Wang 2025-05-08  185  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  186  			i-cache-sets = <256>;
a49efba0ecae5d Sirius Wang 2025-05-08  187  			d-cache-size = <65536>;
a49efba0ecae5d Sirius Wang 2025-05-08  188  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  189  			d-cache-sets = <256>;
a49efba0ecae5d Sirius Wang 2025-05-08  190  			next-level-cache = <&l2_1>;
a49efba0ecae5d Sirius Wang 2025-05-08  191  			performance-domains = <&performance 1>;
a49efba0ecae5d Sirius Wang 2025-05-08  192  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  193  		};
a49efba0ecae5d Sirius Wang 2025-05-08  194  
a49efba0ecae5d Sirius Wang 2025-05-08  195  		cpu7: cpu@700 {
a49efba0ecae5d Sirius Wang 2025-05-08  196  			device_type = "cpu";
a49efba0ecae5d Sirius Wang 2025-05-08  197  			compatible = "arm,cortex-a78";
a49efba0ecae5d Sirius Wang 2025-05-08  198  			reg = <0x700>;
a49efba0ecae5d Sirius Wang 2025-05-08  199  			enable-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  200  			clock-frequency = <3000000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  201  			capacity-dmips-mhz = <958>;
a49efba0ecae5d Sirius Wang 2025-05-08  202  			cpu-idle-states = <&cpu_off_m>, <&cpu_cluster_off_m>, <&cpu_mcusys_off_m>,
a49efba0ecae5d Sirius Wang 2025-05-08  203  					  <&cpu_system_vcore>, <&cpu_s2idle>;
a49efba0ecae5d Sirius Wang 2025-05-08  204  			i-cache-size = <65536>;
a49efba0ecae5d Sirius Wang 2025-05-08  205  			i-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  206  			i-cache-sets = <256>;
a49efba0ecae5d Sirius Wang 2025-05-08  207  			d-cache-size = <65536>;
a49efba0ecae5d Sirius Wang 2025-05-08  208  			d-cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  209  			d-cache-sets = <256>;
a49efba0ecae5d Sirius Wang 2025-05-08  210  			next-level-cache = <&l2_1>;
a49efba0ecae5d Sirius Wang 2025-05-08  211  			performance-domains = <&performance 1>;
a49efba0ecae5d Sirius Wang 2025-05-08  212  			#cooling-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  213  		};
a49efba0ecae5d Sirius Wang 2025-05-08  214  
a49efba0ecae5d Sirius Wang 2025-05-08  215  		cpu-map {
a49efba0ecae5d Sirius Wang 2025-05-08  216  			cluster0 {
a49efba0ecae5d Sirius Wang 2025-05-08  217  				core0 {
a49efba0ecae5d Sirius Wang 2025-05-08  218  					cpu = <&cpu0>;
a49efba0ecae5d Sirius Wang 2025-05-08  219  				};
a49efba0ecae5d Sirius Wang 2025-05-08  220  				core1 {
a49efba0ecae5d Sirius Wang 2025-05-08  221  					cpu = <&cpu1>;
a49efba0ecae5d Sirius Wang 2025-05-08  222  				};
a49efba0ecae5d Sirius Wang 2025-05-08  223  				core2 {
a49efba0ecae5d Sirius Wang 2025-05-08  224  					cpu = <&cpu2>;
a49efba0ecae5d Sirius Wang 2025-05-08  225  				};
a49efba0ecae5d Sirius Wang 2025-05-08  226  				core3 {
a49efba0ecae5d Sirius Wang 2025-05-08  227  					cpu = <&cpu3>;
a49efba0ecae5d Sirius Wang 2025-05-08  228  				};
a49efba0ecae5d Sirius Wang 2025-05-08  229  				core4 {
a49efba0ecae5d Sirius Wang 2025-05-08  230  					cpu = <&cpu4>;
a49efba0ecae5d Sirius Wang 2025-05-08  231  				};
a49efba0ecae5d Sirius Wang 2025-05-08  232  				core5 {
a49efba0ecae5d Sirius Wang 2025-05-08  233  					cpu = <&cpu5>;
a49efba0ecae5d Sirius Wang 2025-05-08  234  				};
a49efba0ecae5d Sirius Wang 2025-05-08  235  			};
a49efba0ecae5d Sirius Wang 2025-05-08  236  
a49efba0ecae5d Sirius Wang 2025-05-08  237  			cluster1 {
a49efba0ecae5d Sirius Wang 2025-05-08  238  				core0 {
a49efba0ecae5d Sirius Wang 2025-05-08  239  					cpu = <&cpu6>;
a49efba0ecae5d Sirius Wang 2025-05-08  240  				};
a49efba0ecae5d Sirius Wang 2025-05-08  241  				core1 {
a49efba0ecae5d Sirius Wang 2025-05-08  242  					cpu = <&cpu7>;
a49efba0ecae5d Sirius Wang 2025-05-08  243  				};
a49efba0ecae5d Sirius Wang 2025-05-08  244  			};
a49efba0ecae5d Sirius Wang 2025-05-08  245  		};
a49efba0ecae5d Sirius Wang 2025-05-08  246  
a49efba0ecae5d Sirius Wang 2025-05-08  247  		idle-states {
a49efba0ecae5d Sirius Wang 2025-05-08  248  			entry-method = "psci";
a49efba0ecae5d Sirius Wang 2025-05-08  249  
a49efba0ecae5d Sirius Wang 2025-05-08  250  			cpu_off_l: cpu-off-l {
a49efba0ecae5d Sirius Wang 2025-05-08  251  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  252  				arm,psci-suspend-param = <0x00010000>;
a49efba0ecae5d Sirius Wang 2025-05-08  253  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  254  				entry-latency-us = <97>;
a49efba0ecae5d Sirius Wang 2025-05-08  255  				exit-latency-us = <252>;
a49efba0ecae5d Sirius Wang 2025-05-08  256  				min-residency-us = <6710>;
a49efba0ecae5d Sirius Wang 2025-05-08  257  			};
a49efba0ecae5d Sirius Wang 2025-05-08  258  
a49efba0ecae5d Sirius Wang 2025-05-08  259  			cpu_off_m: cpu-off-m {
a49efba0ecae5d Sirius Wang 2025-05-08  260  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  261  				arm,psci-suspend-param = <0x00010000>;
a49efba0ecae5d Sirius Wang 2025-05-08  262  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  263  				entry-latency-us = <53>;
a49efba0ecae5d Sirius Wang 2025-05-08  264  				exit-latency-us = <143>;
a49efba0ecae5d Sirius Wang 2025-05-08  265  				min-residency-us = <2120>;
a49efba0ecae5d Sirius Wang 2025-05-08  266  			};
a49efba0ecae5d Sirius Wang 2025-05-08  267  
a49efba0ecae5d Sirius Wang 2025-05-08  268  			cpu_cluster_off_l: cpu-cluster-off-l {
a49efba0ecae5d Sirius Wang 2025-05-08  269  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  270  				arm,psci-suspend-param = <0x01010001>;
a49efba0ecae5d Sirius Wang 2025-05-08  271  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  272  				entry-latency-us = <109>;
a49efba0ecae5d Sirius Wang 2025-05-08  273  				exit-latency-us = <325>;
a49efba0ecae5d Sirius Wang 2025-05-08  274  				min-residency-us = <6710>;
a49efba0ecae5d Sirius Wang 2025-05-08  275  			};
a49efba0ecae5d Sirius Wang 2025-05-08  276  
a49efba0ecae5d Sirius Wang 2025-05-08  277  			cpu_cluster_off_m: cpu-cluster-off-m {
a49efba0ecae5d Sirius Wang 2025-05-08  278  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  279  				arm,psci-suspend-param = <0x01010001>;
a49efba0ecae5d Sirius Wang 2025-05-08  280  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  281  				entry-latency-us = <59>;
a49efba0ecae5d Sirius Wang 2025-05-08  282  				exit-latency-us = <188>;
a49efba0ecae5d Sirius Wang 2025-05-08  283  				min-residency-us = <2120>;
a49efba0ecae5d Sirius Wang 2025-05-08  284  			};
a49efba0ecae5d Sirius Wang 2025-05-08  285  
a49efba0ecae5d Sirius Wang 2025-05-08  286  			cpu_mcusys_off_l: cpu-mcusys-off-l {
a49efba0ecae5d Sirius Wang 2025-05-08  287  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  288  				arm,psci-suspend-param = <0x02010007>;
a49efba0ecae5d Sirius Wang 2025-05-08  289  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  290  				entry-latency-us = <1357>;
a49efba0ecae5d Sirius Wang 2025-05-08  291  				exit-latency-us = <835>;
a49efba0ecae5d Sirius Wang 2025-05-08  292  				min-residency-us = <6710>;
a49efba0ecae5d Sirius Wang 2025-05-08  293  			};
a49efba0ecae5d Sirius Wang 2025-05-08  294  
a49efba0ecae5d Sirius Wang 2025-05-08  295  			cpu_mcusys_off_m: cpu-mcusys-off-m {
a49efba0ecae5d Sirius Wang 2025-05-08  296  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  297  				arm,psci-suspend-param = <0x02010007>;
a49efba0ecae5d Sirius Wang 2025-05-08  298  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  299  				entry-latency-us = <1202>;
a49efba0ecae5d Sirius Wang 2025-05-08  300  				exit-latency-us = <679>;
a49efba0ecae5d Sirius Wang 2025-05-08  301  				min-residency-us = <2120>;
a49efba0ecae5d Sirius Wang 2025-05-08  302  			};
a49efba0ecae5d Sirius Wang 2025-05-08  303  
a49efba0ecae5d Sirius Wang 2025-05-08  304  			cpu_system_vcore: cpu-system-vcore {
a49efba0ecae5d Sirius Wang 2025-05-08  305  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  306  				arm,psci-suspend-param = <0x020100ff>;
a49efba0ecae5d Sirius Wang 2025-05-08  307  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  308  				entry-latency-us = <940>;
a49efba0ecae5d Sirius Wang 2025-05-08  309  				exit-latency-us = <3500>;
a49efba0ecae5d Sirius Wang 2025-05-08  310  				min-residency-us = <35200>;
a49efba0ecae5d Sirius Wang 2025-05-08  311  			};
a49efba0ecae5d Sirius Wang 2025-05-08  312  
a49efba0ecae5d Sirius Wang 2025-05-08  313  			cpu_s2idle: cpu-s2idle {
a49efba0ecae5d Sirius Wang 2025-05-08  314  				compatible = "arm,idle-state";
a49efba0ecae5d Sirius Wang 2025-05-08  315  				arm,psci-suspend-param = <0x020180ff>;
a49efba0ecae5d Sirius Wang 2025-05-08  316  				local-timer-stop;
a49efba0ecae5d Sirius Wang 2025-05-08  317  				entry-latency-us = <10000>;
a49efba0ecae5d Sirius Wang 2025-05-08  318  				exit-latency-us = <10000>;
a49efba0ecae5d Sirius Wang 2025-05-08  319  				min-residency-us = <4294967295>;
a49efba0ecae5d Sirius Wang 2025-05-08  320  			};
a49efba0ecae5d Sirius Wang 2025-05-08  321  		};
a49efba0ecae5d Sirius Wang 2025-05-08  322  
a49efba0ecae5d Sirius Wang 2025-05-08  323  		l2_0: l2-cache0 {
a49efba0ecae5d Sirius Wang 2025-05-08  324  			compatible = "cache";
a49efba0ecae5d Sirius Wang 2025-05-08  325  			cache-level = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  326  			cache-size = <131072>;
a49efba0ecae5d Sirius Wang 2025-05-08  327  			cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  328  			cache-sets = <512>;
a49efba0ecae5d Sirius Wang 2025-05-08  329  			next-level-cache = <&l3_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  330  			cache-unified;
a49efba0ecae5d Sirius Wang 2025-05-08  331  		};
a49efba0ecae5d Sirius Wang 2025-05-08  332  
a49efba0ecae5d Sirius Wang 2025-05-08  333  		l2_1: l2-cache1 {
a49efba0ecae5d Sirius Wang 2025-05-08  334  			compatible = "cache";
a49efba0ecae5d Sirius Wang 2025-05-08  335  			cache-level = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  336  			cache-size = <262144>;
a49efba0ecae5d Sirius Wang 2025-05-08  337  			cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  338  			cache-sets = <512>;
a49efba0ecae5d Sirius Wang 2025-05-08  339  			next-level-cache = <&l3_0>;
a49efba0ecae5d Sirius Wang 2025-05-08  340  			cache-unified;
a49efba0ecae5d Sirius Wang 2025-05-08  341  		};
a49efba0ecae5d Sirius Wang 2025-05-08  342  
a49efba0ecae5d Sirius Wang 2025-05-08  343  		l3_0: l3-cache {
a49efba0ecae5d Sirius Wang 2025-05-08  344  			compatible = "cache";
a49efba0ecae5d Sirius Wang 2025-05-08  345  			cache-level = <3>;
a49efba0ecae5d Sirius Wang 2025-05-08  346  			cache-size = <1048576>;
a49efba0ecae5d Sirius Wang 2025-05-08  347  			cache-line-size = <64>;
a49efba0ecae5d Sirius Wang 2025-05-08  348  			cache-sets = <2048>;
a49efba0ecae5d Sirius Wang 2025-05-08  349  			cache-unified;
a49efba0ecae5d Sirius Wang 2025-05-08  350  		};
a49efba0ecae5d Sirius Wang 2025-05-08  351  	};
a49efba0ecae5d Sirius Wang 2025-05-08  352  
a49efba0ecae5d Sirius Wang 2025-05-08  353  	psci {
a49efba0ecae5d Sirius Wang 2025-05-08  354  		compatible = "arm,psci-1.0";
a49efba0ecae5d Sirius Wang 2025-05-08  355  		method = "smc";
a49efba0ecae5d Sirius Wang 2025-05-08  356  	};
a49efba0ecae5d Sirius Wang 2025-05-08  357  
a49efba0ecae5d Sirius Wang 2025-05-08  358  	memory: memory@40000000 {
a49efba0ecae5d Sirius Wang 2025-05-08  359  		device_type = "memory";
a49efba0ecae5d Sirius Wang 2025-05-08  360  		reg = <0 0x40000000 0 0xC0000000>;
a49efba0ecae5d Sirius Wang 2025-05-08  361  	};
a49efba0ecae5d Sirius Wang 2025-05-08  362  
a49efba0ecae5d Sirius Wang 2025-05-08  363  	timer: timer {
a49efba0ecae5d Sirius Wang 2025-05-08  364  		compatible = "arm,armv8-timer";
a49efba0ecae5d Sirius Wang 2025-05-08  365  		interrupt-parent = <&gic>;
a49efba0ecae5d Sirius Wang 2025-05-08  366  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
a49efba0ecae5d Sirius Wang 2025-05-08  367  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
a49efba0ecae5d Sirius Wang 2025-05-08  368  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
a49efba0ecae5d Sirius Wang 2025-05-08  369  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
a49efba0ecae5d Sirius Wang 2025-05-08  370  	};
a49efba0ecae5d Sirius Wang 2025-05-08  371  
a49efba0ecae5d Sirius Wang 2025-05-08  372  	soc {
a49efba0ecae5d Sirius Wang 2025-05-08  373  		compatible = "simple-bus";
a49efba0ecae5d Sirius Wang 2025-05-08  374  		#address-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  375  		#size-cells = <2>;
a49efba0ecae5d Sirius Wang 2025-05-08  376  		ranges;
a49efba0ecae5d Sirius Wang 2025-05-08  377  		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
a49efba0ecae5d Sirius Wang 2025-05-08  378  
a49efba0ecae5d Sirius Wang 2025-05-08  379  		performance: performance-controller@11bc10 {
a49efba0ecae5d Sirius Wang 2025-05-08  380  			compatible = "mediatek,cpufreq-hw";
a49efba0ecae5d Sirius Wang 2025-05-08  381  			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
a49efba0ecae5d Sirius Wang 2025-05-08  382  			#performance-domain-cells = <1>;
a49efba0ecae5d Sirius Wang 2025-05-08  383  		};
a49efba0ecae5d Sirius Wang 2025-05-08  384  
a49efba0ecae5d Sirius Wang 2025-05-08 @385  		gic: interrupt-controller@c000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
