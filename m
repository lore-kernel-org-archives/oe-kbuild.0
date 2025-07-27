Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3EC24466D
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753651770; cv=none; b=UmG7hPDS3lDdlR0WXVf7K38NuqzZil+4rM+wxDkHFFrZ5Cs2luR1XXr7VTeQyujh5punl/Z8hNd6LY3lMqmPrs9KsmzD0ilEmTCQ0GtJ6hk2ymXGH2uVQmCI4Np8CsbGTGSLFqHSRvhAwz+RYr+au11Dje37opPIPOITiuo1IC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753651770; c=relaxed/simple;
	bh=ia5dS15pzHsLfWbAt5h1W9D3EgOJbSojJbhaZd+wYxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/cZ81XyQtaZPWiBBtNjLe/bTvi8brBfmtJpfub3gmIXZHqFZAlDLhwwnsiktdy+7mXLiNqg08utmqsIm5+3R4sqc2L6ZnGr/G8mK9PdOiRyR5NmJcdV3eV9CA4A09jDDIH77pBuTQpbRXNRpzCeys2VZY5MynXBsHj42G3DVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDyVQxua; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDyVQxua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753651769; x=1785187769;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ia5dS15pzHsLfWbAt5h1W9D3EgOJbSojJbhaZd+wYxc=;
  b=oDyVQxuaTXP27wjEUvzms5IaKIlR127gT4YWBcok9UDOUdKfNcAoKsOv
   XNLjyZH0J6yXEfXukY+Tj7XOt9jJWswKyZjTJmm1hu1JcRXEQxkF4syaw
   4x0RJe6/hcOZl6G1LTo28cqBcuo8cRXUCezhCB1yG1YZl1xMk+ZJRCxiA
   988giXmM1NTihOfOft2vSWO3hFVb4LcKwqiwOI2kf6tBCIvLIIOasMKTG
   1P4l7kTK63IFWYTqrKJf712upQUVYihIgUvqCqkH6kaE495yNuX+IrDXT
   NtSbI1R3K8vC5I7pV1cXtepetBBxUAZPPrUqoINinNeOarrOQ/4Ia6Q38
   A==;
X-CSE-ConnectionGUID: hGTjZwWPTY6Rlaj4PYc/tA==
X-CSE-MsgGUID: DilwVqjgSzSr1/CoV+4Psw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55759063"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55759063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 14:29:28 -0700
X-CSE-ConnectionGUID: ED4PfmUCTO6hOqVXz/mydg==
X-CSE-MsgGUID: tNHCV2B/RzuS6hcIJ+ZvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161507867"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2025 14:29:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug8vs-0000S3-0m;
	Sun, 27 Jul 2025 21:29:24 +0000
Date: Sun, 27 Jul 2025 23:28:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axc003_idu.dtsi:17.11-98.4: Warning
 (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no
 unit name
Message-ID: <202507272309.UfvaBmkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b711733e89a3f84c8e1e56e2328f9a0fa5facc7c
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: arc-axs103_smp_defconfig (https://download.01.org/0day-ci/archive/20250727/202507272309.UfvaBmkG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272309.UfvaBmkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507272309.UfvaBmkG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc003_idu.dtsi:17.11-98.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:108.12-124.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc003_idu.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:51.38-56.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
>> arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
>> arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
>> arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +17 arch/arc/boot/dts/axc003_idu.dtsi

2e8cd93877b2f9 Vineet Gupta     2016-01-19   11  
5fa2daaa8d8223 Vineet Gupta     2015-03-09   12  / {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   13  	compatible = "snps,arc";
f862b31514bad6 Eugeniy Paltsev  2017-06-26   14  	#address-cells = <2>;
f862b31514bad6 Eugeniy Paltsev  2017-06-26   15  	#size-cells = <2>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   16  
5fa2daaa8d8223 Vineet Gupta     2015-03-09  @17  	cpu_card {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   18  		compatible = "simple-bus";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   19  		#address-cells = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   20  		#size-cells = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   21  
f862b31514bad6 Eugeniy Paltsev  2017-06-26   22  		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   23  
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14  @24  		input_clk: input-clk {
b3d6aba8bd92c2 Vineet Gupta     2016-01-01   25  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta     2016-01-01   26  			compatible = "fixed-clock";
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   27  			clock-frequency = <33333333>;
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   28  		};
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   29  
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   30  		core_clk: core-clk@80 {
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   31  			compatible = "snps,axs10x-arc-pll-clock";
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   32  			reg = <0x80 0x10>, <0x100 0x10>;
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   33  			#clock-cells = <0>;
f6a09bace0bb95 Eugeniy Paltsev  2017-08-14   34  			clocks = <&input_clk>;
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   35  
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   36  			/*
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   37  			 * Set initial core pll output frequency to 100MHz.
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   38  			 * It will be applied at the core pll driver probing
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   39  			 * on early boot.
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   40  			 */
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   41  			assigned-clocks = <&core_clk>;
fbd1cec57064aa Eugeniy Paltsev  2017-12-09   42  			assigned-clock-rates = <100000000>;
b3d6aba8bd92c2 Vineet Gupta     2016-01-01   43  		};
b3d6aba8bd92c2 Vineet Gupta     2016-01-01   44  
9ba7648cc9b363 Vineet Gupta     2016-01-28  @45  		core_intc: archs-intc@cpu {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   46  			compatible = "snps,archs-intc";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   47  			interrupt-controller;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   48  			#interrupt-cells = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   49  		};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   50  
5fa2daaa8d8223 Vineet Gupta     2015-03-09  @51  		idu_intc: idu-interrupt-controller {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   52  			compatible = "snps,archs-idu-intc";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   53  			interrupt-controller;
9ba7648cc9b363 Vineet Gupta     2016-01-28   54  			interrupt-parent = <&core_intc>;
ec69b269d87c12 Yuriy Kolerov    2017-02-02   55  			#interrupt-cells = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   56  		};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   57  
5fa2daaa8d8223 Vineet Gupta     2015-03-09   58  		/*
5fa2daaa8d8223 Vineet Gupta     2015-03-09   59  		 * this GPIO block ORs all interrupts on CPU card (creg,..)
5fa2daaa8d8223 Vineet Gupta     2015-03-09   60  		 * to uplink only 1 IRQ to ARC core intc
5fa2daaa8d8223 Vineet Gupta     2015-03-09   61  		 */
ef4c54c340de47 Alexey Brodkin   2019-01-24   62  		dw-apb-gpio@2000 {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   63  			compatible = "snps,dw-apb-gpio";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   64  			reg = < 0x2000 0x80 >;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   65  			#address-cells = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   66  			#size-cells = <0>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   67  
5fa2daaa8d8223 Vineet Gupta     2015-03-09   68  			ictl_intc: gpio-controller@0 {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   69  				compatible = "snps,dw-apb-gpio-port";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   70  				gpio-controller;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   71  				#gpio-cells = <2>;
4d93ffe661ff59 Uwe Kleine-König 2024-10-22   72  				ngpios = <30>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   73  				reg = <0>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   74  				interrupt-controller;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   75  				#interrupt-cells = <2>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   76  				interrupt-parent = <&idu_intc>;
ec69b269d87c12 Yuriy Kolerov    2017-02-02   77  				interrupts = <1>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   78  			};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   79  		};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   80  
ef4c54c340de47 Alexey Brodkin   2019-01-24   81  		debug_uart: dw-apb-uart@5000 {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   82  			compatible = "snps,dw-apb-uart";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   83  			reg = <0x5000 0x100>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   84  			clock-frequency = <33333000>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   85  			interrupt-parent = <&ictl_intc>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   86  			interrupts = <2 4>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   87  			baud = <115200>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   88  			reg-shift = <2>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   89  			reg-io-width = <4>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   90  		};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   91  
5fa2daaa8d8223 Vineet Gupta     2015-03-09  @92  		arcpct0: pct {
5fa2daaa8d8223 Vineet Gupta     2015-03-09   93  			compatible = "snps,archs-pct";
5fa2daaa8d8223 Vineet Gupta     2015-03-09   94  			#interrupt-cells = <1>;
9ba7648cc9b363 Vineet Gupta     2016-01-28   95  			interrupt-parent = <&core_intc>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   96  			interrupts = <20>;
5fa2daaa8d8223 Vineet Gupta     2015-03-09   97  		};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   98  	};
5fa2daaa8d8223 Vineet Gupta     2015-03-09   99  
678c8110d23c0a Eugeniy Paltsev  2018-07-30  100  	/*
678c8110d23c0a Eugeniy Paltsev  2018-07-30  101  	 * Mark DMA peripherals connected via IOC port as dma-coherent. We do
678c8110d23c0a Eugeniy Paltsev  2018-07-30  102  	 * it via overlay because peripherals defined in axs10x_mb.dtsi are
678c8110d23c0a Eugeniy Paltsev  2018-07-30  103  	 * used for both AXS101 and AXS103 boards and only AXS103 has IOC (so
678c8110d23c0a Eugeniy Paltsev  2018-07-30  104  	 * only AXS103 board has HW-coherent DMA peripherals)
678c8110d23c0a Eugeniy Paltsev  2018-07-30  105  	 * We don't need to mark pgu@17000 as dma-coherent because it uses
678c8110d23c0a Eugeniy Paltsev  2018-07-30  106  	 * external DMA buffer located outside of IOC aperture.
678c8110d23c0a Eugeniy Paltsev  2018-07-30  107  	 */
678c8110d23c0a Eugeniy Paltsev  2018-07-30 @108  	axs10x_mb {
ef4c54c340de47 Alexey Brodkin   2019-01-24 @109  		ethernet@18000 {

:::::: The code at line 17 was first introduced by commit
:::::: 5fa2daaa8d8223d06fcdba171a7a668dc8e8b179 ARCv2: [axs103] Support ARC SDP FPGA platform for HS38x cores

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
