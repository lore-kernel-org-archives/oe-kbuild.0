Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB422172D
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754742796; cv=none; b=UuxRKqF/NXV8GCgJ3DDs92qurOIuqjAcdIR+ftQ0S0/TFN1Y3NOq4/N+8XXYGAd9q5DCV0OiUqVKF9+PcWa3gH+eWop9PyG+yQNho7m3jN+3PvdLggDiroTs6I2seOE0QRCBgSWQAkBdDjEMs4Z3l2H8xLlsLwjSJkfabPN2K6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754742796; c=relaxed/simple;
	bh=lVghsRw7ZQp8khrLKWbF3IKfFc2vl2UjNOUJN6tYrBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npPlBLNPkbpjP80xob+7yJlj8FviiTn2f3LKmnQ+Hs/bGgxzFbm74yC0D2/8OK2McwVxOoFne+ERZIwO69Qi2u4gVZeo8kKpDnRcSxTqDSxYwTkCS9FxbklnMPmn/Zvt1/M8qYQ/x4dkR2E/C0ooqqKimWUNK/h3hQsyVY/yD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAhXSXsg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAhXSXsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754742795; x=1786278795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVghsRw7ZQp8khrLKWbF3IKfFc2vl2UjNOUJN6tYrBw=;
  b=YAhXSXsgi0HKPHYA16rjbDkeEHDADrNhb7Ed3vEVJz4np61BfuexYeHo
   O1HMMb7MK7Ok7/GVYcqmPhh0bLRh7d8BMtXRCyLwNx2yjaOcs+gSLitIp
   5PeX5FRgpiXUe/+szArZW4ajGZUG5miCfx4jYxIT7GH6f6x1TKR4dJ2/I
   6a26pa27xXH2pyGHm1NDk5ruYBjJN+PYHZgdaNeTvFmYeMcQ0z2ZTtb1G
   odV1Eb821qN3vZs3cybrbKjNigFE0NHeddAR3mZ9jPzbLTkea2CisO5Fl
   n0Rp0dPjUIiZUUH3det+AMFCokl6XvFETXxRFsnW5a9rzvCxyimLDds4o
   Q==;
X-CSE-ConnectionGUID: Riqm6uvNQPKGoSAZ3WmTOg==
X-CSE-MsgGUID: 0poTIAEhRaauvdGeRuGqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59680203"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59680203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 05:33:14 -0700
X-CSE-ConnectionGUID: 2xF90yVBSz2I5/G4+pCRvw==
X-CSE-MsgGUID: 8Os2FeM6QuunczK7drtxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196354247"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2025 05:33:13 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukil5-0002oJ-2H;
	Sat, 09 Aug 2025 12:33:11 +0000
Date: Sat, 9 Aug 2025 14:32:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/nsimosci_hs_idu.dts:33.22-37.5: Warning
 (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
Message-ID: <202508091456.jwCbHigL-lkp@intel.com>
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
head:   c30a13538d9f8b2a60b2f6b26abe046dea10aa12
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arc-nsimosci_hs_smp_defconfig (https://download.01.org/0day-ci/archive/20250809/202508091456.jwCbHigL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091456.jwCbHigL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091456.jwCbHigL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:33.22-37.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:39.40-43.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:45.38-50.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:64.18-68.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:77.21-83.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +33 arch/arc/boot/dts/nsimosci_hs_idu.dts

a12ebe16a5cea6 Vineet Gupta   2015-03-09   8  
a12ebe16a5cea6 Vineet Gupta   2015-03-09   9  / {
618a9cd06dd471 Alexey Brodkin 2016-08-16  10  	model = "snps,nsimosci_hs-smp";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  11  	compatible = "snps,nsimosci_hs";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  12  	#address-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  13  	#size-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  14  	interrupt-parent = <&core_intc>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  15  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  16  	chosen {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  17  		/* this is for console on serial */
8ff3afc159f26e Alexey Brodkin 2018-01-18  18  		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug video=640x480-24 print-fatal-signals=1";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  19  	};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  20  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  21  	aliases {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  22  		serial0 = &uart0;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  23  	};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  24  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  25  	fpga {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  26  		compatible = "simple-bus";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  27  		#address-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  28  		#size-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  29  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  30  		/* child and parent address space 1:1 mapped */
a12ebe16a5cea6 Vineet Gupta   2015-03-09  31  		ranges;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  32  
b3d6aba8bd92c2 Vineet Gupta   2016-01-01 @33  		core_clk: core_clk {
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  34  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  35  			compatible = "fixed-clock";
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  36  			clock-frequency = <5000000>;
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  37  		};
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  38  
a12ebe16a5cea6 Vineet Gupta   2015-03-09 @39  		core_intc: core-interrupt-controller {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  40  			compatible = "snps,archs-intc";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  41  			interrupt-controller;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  42  			#interrupt-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  43  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  44  
a12ebe16a5cea6 Vineet Gupta   2015-03-09 @45  		idu_intc: idu-interrupt-controller {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  46  			compatible = "snps,archs-idu-intc";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  47  			interrupt-controller;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  48  			interrupt-parent = <&core_intc>;
ec69b269d87c12 Yuriy Kolerov  2017-02-02  49  			#interrupt-cells = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  50  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  51  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  52  		uart0: serial@f0000000 {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  53  			compatible = "ns8250";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  54  			reg = <0xf0000000 0x2000>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  55  			interrupt-parent = <&idu_intc>;
ec69b269d87c12 Yuriy Kolerov  2017-02-02  56  			interrupts = <0>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  57  			clock-frequency = <3686400>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  58  			baud = <115200>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  59  			reg-shift = <2>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  60  			reg-io-width = <4>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  61  			no-loopback-test = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  62  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  63  
830c6578481e3b Alexey Brodkin 2016-06-06 @64  		pguclk: pguclk {
830c6578481e3b Alexey Brodkin 2016-06-06  65  			#clock-cells = <0>;
830c6578481e3b Alexey Brodkin 2016-06-06  66  			compatible = "fixed-clock";
830c6578481e3b Alexey Brodkin 2016-06-06  67  			clock-frequency = <25175000>;
830c6578481e3b Alexey Brodkin 2016-06-06  68  		};
830c6578481e3b Alexey Brodkin 2016-06-06  69  
830c6578481e3b Alexey Brodkin 2016-06-06  70  		pgu@f9000000 {
830c6578481e3b Alexey Brodkin 2016-06-06  71  			compatible = "snps,arcpgu";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  72  			reg = <0xf9000000 0x400>;
830c6578481e3b Alexey Brodkin 2016-06-06  73  			clocks = <&pguclk>;
830c6578481e3b Alexey Brodkin 2016-06-06  74  			clock-names = "pxlclk";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  75  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  76  
a12ebe16a5cea6 Vineet Gupta   2015-03-09 @77  		ps2: ps2@f9001000 {
a12ebe16a5cea6 Vineet Gupta   2015-03-09  78  			compatible = "snps,arc_ps2";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  79  			reg = <0xf9000400 0x14>;
ec69b269d87c12 Yuriy Kolerov  2017-02-02  80  			interrupts = <3>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  81  			interrupt-parent = <&idu_intc>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  82  			interrupt-names = "arc_ps2_irq";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  83  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  84  
a12ebe16a5cea6 Vineet Gupta   2015-03-09  85  		eth0: ethernet@f0003000 {
df420fd68811c9 Lada Trimasova 2016-03-14  86  			compatible = "ezchip,nps-mgt-enet";
a12ebe16a5cea6 Vineet Gupta   2015-03-09  87  			reg = <0xf0003000 0x44>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  88  			interrupt-parent = <&idu_intc>;
ec69b269d87c12 Yuriy Kolerov  2017-02-02  89  			interrupts = <1>;
a12ebe16a5cea6 Vineet Gupta   2015-03-09  90  		};
a12ebe16a5cea6 Vineet Gupta   2015-03-09  91  
a12ebe16a5cea6 Vineet Gupta   2015-03-09 @92  		arcpct0: pct {

:::::: The code at line 33 was first introduced by commit
:::::: b3d6aba8bd92c20b7748ccd82b6fab8ea5081066 ARC: [dts] Add clk feeding into timers to DTs

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
