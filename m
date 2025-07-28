Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2424A11
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753705040; cv=none; b=eCtsB2eQ3iFBZ/n68yRppUtZ3gCyR0JZXcGeZX+u+TC+i1E1aYYBnIoeVZDIruRagQ8CUnLqWKLr6SvTYGCf7O7JEP1+BKuXgRKdAuDwagof7+Xg5mjw1DHtrLUFPYNxG1hvLh4xhJpBBL22cnff6KzUwnoBSuAFN7vHhQCvLpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753705040; c=relaxed/simple;
	bh=gkAA8rV+dTTRAKTVYWVWtCURKz8J2Q8NxWEkGH73uJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkUF/XPquM9TTzfC4p1TYnKt4sZWA/5jqv5JTvVBa+iW7xBur9SR8Wum1zi2N6A5KGUaUyIaD3+giYFqjrgO5+Tb2Eq3pPYEWVfGECh65Oq6qBzqbMyeUqes93Z56fj8RustRE6p8mDGzbXz9JAHFgeCGEZoB0x5YYVvbqdgkYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZgPqn1t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZgPqn1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753705039; x=1785241039;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gkAA8rV+dTTRAKTVYWVWtCURKz8J2Q8NxWEkGH73uJY=;
  b=AZgPqn1tf6iykbBMvZBEgsiWExfmjh8YkNXZTc3ne268q1lpU08LYkbj
   tEwHYGniemKBnSzE7DeeOo0hsol+VoYpVaZxm2AySaHxe/zgt3QthHwTJ
   5XIcsiomFMxpzAXqK8xqQOaQ5yGLNRVB1tqbWNPeHNMpqFU3CaC5zDnEh
   WzKy6NMDWmVjv/zd/WUBOl2D88PXf3jUWTOhOr/PAt/Oa68KI7yyvTaWC
   fzdOJ2QOO2NPjPLCC9BHEZ1lnR9No6aseSzsi+HxL6RZmdPz8s0+PBuN5
   vbsPxGBIj0m/hkFAJP4yBMWuLTDQI/mApEN8vxupflm/dACVxSZFZv/SO
   Q==;
X-CSE-ConnectionGUID: NGdIqxJCRR6/064tbU+53w==
X-CSE-MsgGUID: wbMFFvI+SW2rfdFVpDU2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55158223"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55158223"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 05:17:18 -0700
X-CSE-ConnectionGUID: ekpXY8GnSgyVhXhCWWZPHg==
X-CSE-MsgGUID: aniN5zrnRVeD7BVqXKPCsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161688985"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 28 Jul 2025 05:17:17 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugMn4-0000Wl-34;
	Mon, 28 Jul 2025 12:17:14 +0000
Date: Mon, 28 Jul 2025 14:16:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axc001.dtsi:18.11-80.4: Warning
 (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no
 unit name
Message-ID: <202507281402.wV344xHI-lkp@intel.com>
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
head:   038d61fd642278bab63ee8ef722c50d10ab01e8f
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: arc-axs101_defconfig (https://download.01.org/0day-ci/archive/20250728/202507281402.wV344xHI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281402.wV344xHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507281402.wV344xHI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton.dtsi:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc001.dtsi:18.11-80.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc001.dtsi:37.30-41.5: Warning (unit_address_vs_reg): /cpu_card/arc700-intc@cpu: node has a unit name, but no reg or ranges property
>> arch/arc/boot/dts/axs10x_mb.dtsi:13.12-329.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/axc001.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc001.dtsi:31.24-35.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc001.dtsi:37.30-41.5: Warning (simple_bus_reg): /cpu_card/arc700-intc@cpu: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc001.dtsi:77.16-79.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
>> arch/arc/boot/dts/axs10x_mb.dtsi:73.24-88.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs101.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +18 arch/arc/boot/dts/axc001.dtsi

2e8cd93877b2f9 Vineet Gupta     2016-01-19  12  
556cc1c5f528dc Alexey Brodkin   2014-01-27  13  / {
556cc1c5f528dc Alexey Brodkin   2014-01-27  14  	compatible = "snps,arc";
f862b31514bad6 Eugeniy Paltsev  2017-06-26  15  	#address-cells = <2>;
f862b31514bad6 Eugeniy Paltsev  2017-06-26  16  	#size-cells = <2>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  17  
556cc1c5f528dc Alexey Brodkin   2014-01-27 @18  	cpu_card {
556cc1c5f528dc Alexey Brodkin   2014-01-27  19  		compatible = "simple-bus";
556cc1c5f528dc Alexey Brodkin   2014-01-27  20  		#address-cells = <1>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  21  		#size-cells = <1>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  22  
f862b31514bad6 Eugeniy Paltsev  2017-06-26  23  		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  24  
b3d6aba8bd92c2 Vineet Gupta     2016-01-01 @25  		core_clk: core_clk {
b3d6aba8bd92c2 Vineet Gupta     2016-01-01  26  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta     2016-01-01  27  			compatible = "fixed-clock";
b3d6aba8bd92c2 Vineet Gupta     2016-01-01  28  			clock-frequency = <750000000>;
b3d6aba8bd92c2 Vineet Gupta     2016-01-01  29  		};
b3d6aba8bd92c2 Vineet Gupta     2016-01-01  30  
93c53f2397fb58 Eugeniy Paltsev  2019-11-19 @31  		input_clk: input-clk {
93c53f2397fb58 Eugeniy Paltsev  2019-11-19  32  			#clock-cells = <0>;
93c53f2397fb58 Eugeniy Paltsev  2019-11-19  33  			compatible = "fixed-clock";
93c53f2397fb58 Eugeniy Paltsev  2019-11-19  34  			clock-frequency = <33333333>;
93c53f2397fb58 Eugeniy Paltsev  2019-11-19  35  		};
93c53f2397fb58 Eugeniy Paltsev  2019-11-19  36  
9ba7648cc9b363 Vineet Gupta     2016-01-28 @37  		core_intc: arc700-intc@cpu {
556cc1c5f528dc Alexey Brodkin   2014-01-27  38  			compatible = "snps,arc700-intc";
556cc1c5f528dc Alexey Brodkin   2014-01-27  39  			interrupt-controller;
556cc1c5f528dc Alexey Brodkin   2014-01-27  40  			#interrupt-cells = <1>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  41  		};
556cc1c5f528dc Alexey Brodkin   2014-01-27  42  
556cc1c5f528dc Alexey Brodkin   2014-01-27  43  		/*
556cc1c5f528dc Alexey Brodkin   2014-01-27  44  		 * this GPIO block ORs all interrupts on CPU card (creg,..)
556cc1c5f528dc Alexey Brodkin   2014-01-27  45  		 * to uplink only 1 IRQ to ARC core intc
556cc1c5f528dc Alexey Brodkin   2014-01-27  46  		 */
ef4c54c340de47 Alexey Brodkin   2019-01-24  47  		dw-apb-gpio@2000 {
556cc1c5f528dc Alexey Brodkin   2014-01-27  48  			compatible = "snps,dw-apb-gpio";
556cc1c5f528dc Alexey Brodkin   2014-01-27  49  			reg = < 0x2000 0x80 >;
556cc1c5f528dc Alexey Brodkin   2014-01-27  50  			#address-cells = <1>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  51  			#size-cells = <0>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  52  
556cc1c5f528dc Alexey Brodkin   2014-01-27  53  			ictl_intc: gpio-controller@0 {
556cc1c5f528dc Alexey Brodkin   2014-01-27  54  				compatible = "snps,dw-apb-gpio-port";
556cc1c5f528dc Alexey Brodkin   2014-01-27  55  				gpio-controller;
556cc1c5f528dc Alexey Brodkin   2014-01-27  56  				#gpio-cells = <2>;
4d93ffe661ff59 Uwe Kleine-König 2024-10-22  57  				ngpios = <30>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  58  				reg = <0>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  59  				interrupt-controller;
556cc1c5f528dc Alexey Brodkin   2014-01-27  60  				#interrupt-cells = <2>;
9ba7648cc9b363 Vineet Gupta     2016-01-28  61  				interrupt-parent = <&core_intc>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  62  				interrupts = <15>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  63  			};
556cc1c5f528dc Alexey Brodkin   2014-01-27  64  		};
556cc1c5f528dc Alexey Brodkin   2014-01-27  65  
ef4c54c340de47 Alexey Brodkin   2019-01-24  66  		debug_uart: dw-apb-uart@5000 {
556cc1c5f528dc Alexey Brodkin   2014-01-27  67  			compatible = "snps,dw-apb-uart";
556cc1c5f528dc Alexey Brodkin   2014-01-27  68  			reg = <0x5000 0x100>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  69  			clock-frequency = <33333000>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  70  			interrupt-parent = <&ictl_intc>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  71  			interrupts = <19 4>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  72  			baud = <115200>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  73  			reg-shift = <2>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  74  			reg-io-width = <4>;
556cc1c5f528dc Alexey Brodkin   2014-01-27  75  		};
556cc1c5f528dc Alexey Brodkin   2014-01-27  76  
6227e9f0e9ee98 Alexey Brodkin   2016-10-31 @77  		arcpct0: pct {

:::::: The code at line 18 was first introduced by commit
:::::: 556cc1c5f528dcc87733920de17d61b6ebe8999d ARC: [axs101] Add support for AXS101 SDP (software development platform)

:::::: TO: Alexey Brodkin <abrodkin@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
