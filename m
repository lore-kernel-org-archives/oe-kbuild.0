Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB258F49
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055961; cv=none; b=kSv/asPUTYT8OZyUwunYm5k+kUdYSNPQ3Wfl3OY31unkljJ+eBybujU93OB8Xbnagbux7k86J/e/HV6sErpHUQzG1nF5ImAIr/L7/uwwTqHWU6EhGSkt8LMCVNz8qzbdWL4ReZqPTy4Z4pb2E5tbJv5LsZsELpsXHA7B7BVhG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055961; c=relaxed/simple;
	bh=kVWcYgHwjf7z4HGb4sgp84hCLXYADJXy7tC/3UCmRvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsPagggrkmYtIbyxXXEwzxG8nPTMBnLKEPWg8dYnX6SfopqU+PGKBT4G14re+dgb2bVzOi44RWSWBE+lVjHhEKEZSnLB7zNQtYU+erFazAesD/NdIXLcf7NDiZJHb6CQlYKsoA+rg6OnbzAs/F/fSTIe0A48taMflBJ/HxYwyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCm8WmVB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCm8WmVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754055960; x=1785591960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVWcYgHwjf7z4HGb4sgp84hCLXYADJXy7tC/3UCmRvA=;
  b=hCm8WmVBBm1J3WrBtYOZNS7z7U8dJnprd8eeC58MP+MVPdYeUZYd4E1q
   58/xSw+KvPN9ckyv4NHnwpjlcA/A1dB/EPUwoC/nCUQGcFkJh6p7l1g+7
   zsOKchx7vdobfA219UxrTv57RdJWPpb0x0uLI3Jz1rI0PxydEW0J3JTPN
   JjdUb3qctvSgg71XfQXtGO9dDJ253l2iOyf9vGiXPEGEvF9i5dWb96LX5
   oUx2TS9rd7DDtDJb3VoT4xBbGBTKKUujIQpXbtzF/9ORfvP8nmXfvCGkL
   2pCnzL/Lrvr9dYembeLDHz0kJ+2sBx9DytIYiedcArWnpHzROtj65PHMp
   w==;
X-CSE-ConnectionGUID: W94EnwxPS1C5tQ+qpsPqhQ==
X-CSE-MsgGUID: pdOjrArYRAasz4FOJRQCaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56269376"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56269376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 06:45:59 -0700
X-CSE-ConnectionGUID: k062+K87Q6WZtFLznPUnVQ==
X-CSE-MsgGUID: 6qez6SJ4RcmPyyPrypo0tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="200726458"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 01 Aug 2025 06:45:57 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhq55-0001Er-0n;
	Fri, 01 Aug 2025 13:45:55 +0000
Date: Fri, 1 Aug 2025 15:45:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/abilis_tb10x.dtsi:40.9-242.4: Warning
 (unit_address_vs_reg): /soc100: node has a reg or ranges property, but no
 unit name
Message-ID: <202508011559.ZnEeL8Sh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89748acdf226fd1a8775ff6fa2703f8412b286c8
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: arc-tb10x_defconfig (https://download.01.org/0day-ci/archive/20250801/202508011559.ZnEeL8Sh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011559.ZnEeL8Sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508011559.ZnEeL8Sh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arc/boot/dts/abilis_tb10x.dtsi:40.9-242.4: Warning (unit_address_vs_reg): /soc100: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/abilis_tb10x.dtsi:201.40-216.5: Warning (unit_address_vs_reg): /soc100/tb10x-stream-proc: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/abilis_tb100_dvk.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/abilis_tb10x.dtsi:48.20-52.5: Warning (simple_bus_reg): /soc100/oscillator: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb10x.dtsi:53.23-58.5: Warning (simple_bus_reg): /soc100/clkdiv_cpu: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb10x.dtsi:59.23-64.5: Warning (simple_bus_reg): /soc100/clkdiv_ahb: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb10x.dtsi:72.30-76.5: Warning (simple_bus_reg): /soc100/interrupt-controller: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb10x.dtsi:201.40-216.5: Warning (simple_bus_reg): /soc100/tb10x-stream-proc: simple-bus unit address format error, expected "fff00000"
>> arch/arc/boot/dts/abilis_tb100_dvk.dts:52.8-114.5: Warning (simple_bus_reg): /soc100/leds: missing or empty reg/ranges property

vim +40 arch/arc/boot/dts/abilis_tb10x.dtsi

2eb9504bcc1f16 Christian Ruppert 2013-04-11  @40  	soc100 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11   41  		#address-cells	= <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   42  		#size-cells	= <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   43  		device_type	= "soc";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   44  		ranges		= <0xfe000000 0xfe000000 0x02000000
ef4c54c340de47 Alexey Brodkin    2019-01-24   45  				0x000f0000 0x000f0000 0x00010000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   46  		compatible	= "abilis,tb10x", "simple-bus";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   47  
2eb9504bcc1f16 Christian Ruppert 2013-04-11  @48  		pll0: oscillator {
2eb9504bcc1f16 Christian Ruppert 2013-04-11   49  			compatible = "fixed-clock";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   50  			#clock-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   51  			clock-output-names = "pll0";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   52  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11  @53  		cpu_clk: clkdiv_cpu {
0dfad77d0a03ea Christian Ruppert 2013-04-12   54  			compatible = "fixed-factor-clock";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   55  			#clock-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   56  			clocks = <&pll0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   57  			clock-output-names = "cpu_clk";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   58  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11  @59  		ahb_clk: clkdiv_ahb {
0dfad77d0a03ea Christian Ruppert 2013-04-12   60  			compatible = "fixed-factor-clock";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   61  			#clock-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   62  			clocks = <&pll0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   63  			clock-output-names = "ahb_clk";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   64  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11   65  
ef4c54c340de47 Alexey Brodkin    2019-01-24   66  		iomux: iomux@ff10601c {
2eb9504bcc1f16 Christian Ruppert 2013-04-11   67  			compatible = "abilis,tb10x-iomux";
9c8e612d9d622d Christian Ruppert 2013-10-31   68  			#gpio-range-cells = <3>;
ef4c54c340de47 Alexey Brodkin    2019-01-24   69  			reg = <0xff10601c 0x4>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   70  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11   71  
2eb9504bcc1f16 Christian Ruppert 2013-04-11  @72  		intc: interrupt-controller {
2eb9504bcc1f16 Christian Ruppert 2013-04-11   73  			compatible = "snps,arc700-intc";
2eb9504bcc1f16 Christian Ruppert 2013-04-11   74  			interrupt-controller;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   75  			#interrupt-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   76  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11   77  		tb10x_ictl: pic@fe002000 {
723e2b801d8030 Christian Ruppert 2013-06-26   78  			compatible = "abilis,tb10x-ictl";
ef4c54c340de47 Alexey Brodkin    2019-01-24   79  			reg = <0xfe002000 0x20>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   80  			interrupt-controller;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   81  			#interrupt-cells = <2>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   82  			interrupt-parent = <&intc>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   83  			interrupts = <5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
2eb9504bcc1f16 Christian Ruppert 2013-04-11   84  					20 21 22 23 24 25 26 27 28 29 30 31>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   85  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11   86  
ef4c54c340de47 Alexey Brodkin    2019-01-24   87  		uart@ff100000 {
7d19273cd0408f Christian Ruppert 2013-05-10   88  			compatible = "snps,dw-apb-uart";
ef4c54c340de47 Alexey Brodkin    2019-01-24   89  			reg = <0xff100000 0x100>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   90  			clock-frequency = <166666666>;
723e2b801d8030 Christian Ruppert 2013-06-26   91  			interrupts = <25 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   92  			reg-shift = <2>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   93  			reg-io-width = <4>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   94  			interrupt-parent = <&tb10x_ictl>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   95  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24   96  		ethernet@fe100000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11   97  			compatible = "snps,dwmac-3.70a","snps,dwmac";
ef4c54c340de47 Alexey Brodkin    2019-01-24   98  			reg = <0xfe100000 0x1058>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11   99  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  100  			interrupts = <6 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  101  			interrupt-names = "macirq";
2eb9504bcc1f16 Christian Ruppert 2013-04-11  102  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  103  			clock-names = "stmmaceth";
2eb9504bcc1f16 Christian Ruppert 2013-04-11  104  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  105  		dma@fe000000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  106  			compatible = "snps,dma-spear1340";
ef4c54c340de47 Alexey Brodkin    2019-01-24  107  			reg = <0xfe000000 0x400>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  108  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  109  			interrupts = <14 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  110  			dma-channels = <6>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  111  			dma-requests = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  112  			dma-masters = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  113  			#dma-cells = <3>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  114  			chan_allocation_order = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  115  			chan_priority = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  116  			block_size = <0x7ff>;
2e65060e803e04 Andy Shevchenko   2016-04-27  117  			data-width = <4>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  118  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  119  			clock-names = "hclk";
bd2c6636cc59c4 Eugeniy Paltsev   2016-11-25  120  			multi-block = <1 1 1 1 1 1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  121  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11  122  
ef4c54c340de47 Alexey Brodkin    2019-01-24  123  		i2c0: i2c@ff120000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  124  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  125  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  126  			compatible = "snps,designware-i2c";
ef4c54c340de47 Alexey Brodkin    2019-01-24  127  			reg = <0xff120000 0x1000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  128  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  129  			interrupts = <12 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  130  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  131  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  132  		i2c1: i2c@ff121000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  133  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  134  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  135  			compatible = "snps,designware-i2c";
ef4c54c340de47 Alexey Brodkin    2019-01-24  136  			reg = <0xff121000 0x1000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  137  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  138  			interrupts = <12 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  139  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  140  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  141  		i2c2: i2c@ff122000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  142  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  143  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  144  			compatible = "snps,designware-i2c";
ef4c54c340de47 Alexey Brodkin    2019-01-24  145  			reg = <0xff122000 0x1000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  146  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  147  			interrupts = <12 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  148  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  149  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  150  		i2c3: i2c@ff123000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  151  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  152  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  153  			compatible = "snps,designware-i2c";
ef4c54c340de47 Alexey Brodkin    2019-01-24  154  			reg = <0xff123000 0x1000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  155  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  156  			interrupts = <12 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  157  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  158  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  159  		i2c4: i2c@ff124000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  160  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  161  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  162  			compatible = "snps,designware-i2c";
ef4c54c340de47 Alexey Brodkin    2019-01-24  163  			reg = <0xff124000 0x1000>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  164  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  165  			interrupts = <12 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  166  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  167  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11  168  
ef4c54c340de47 Alexey Brodkin    2019-01-24  169  		spi0: spi@fe010000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  170  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  171  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  172  			cell-index = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  173  			compatible = "abilis,tb100-spi";
2eb9504bcc1f16 Christian Ruppert 2013-04-11  174  			num-cs = <1>;
ef4c54c340de47 Alexey Brodkin    2019-01-24  175  			reg = <0xfe010000 0x20>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  176  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  177  			interrupts = <26 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  178  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  179  		};
ef4c54c340de47 Alexey Brodkin    2019-01-24  180  		spi1: spi@fe011000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  181  			#address-cells = <1>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  182  			#size-cells = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  183  			cell-index = <1>;
7d19273cd0408f Christian Ruppert 2013-05-10  184  			compatible = "abilis,tb100-spi";
2eb9504bcc1f16 Christian Ruppert 2013-04-11  185  			num-cs = <2>;
ef4c54c340de47 Alexey Brodkin    2019-01-24  186  			reg = <0xfe011000 0x20>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  187  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  188  			interrupts = <10 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  189  			clocks = <&ahb_clk>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  190  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11  191  
2eb9504bcc1f16 Christian Ruppert 2013-04-11  192  		tb10x_tsm: tb10x-tsm@ff316000 {
2eb9504bcc1f16 Christian Ruppert 2013-04-11  193  			compatible = "abilis,tb100-tsm";
2eb9504bcc1f16 Christian Ruppert 2013-04-11  194  			reg = <0xff316000 0x400>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  195  			interrupt-parent = <&tb10x_ictl>;
723e2b801d8030 Christian Ruppert 2013-06-26  196  			interrupts = <17 8>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  197  			output-clkdiv = <4>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  198  			global-packet-delay = <0x21>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  199  			port-packet-delay = <0>;
2eb9504bcc1f16 Christian Ruppert 2013-04-11  200  		};
2eb9504bcc1f16 Christian Ruppert 2013-04-11 @201  		tb10x_stream_proc: tb10x-stream-proc {

:::::: The code at line 40 was first introduced by commit
:::::: 2eb9504bcc1f164ac137cd12c5deeb1e21cc6b1b ARC: [TB10x] Device tree of TB100 and TB101 Development Kits

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
