Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38BAD23
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724906819; cv=none; b=hGbp4RjdlfnlZll2M84O1CIOl7h+OENRroQfnF7+jfa1wX/dbH7EPaXlxX+/f8xKTpebAn4a/3SdPhPoPa8TUUdP/y29b1TynHLmCga/4fqqkzUk7XsrjFAkbVS1lJacEORelcXS4ttVa5lmTeCBC9zEHPeCIVVPtclCBcf3Ams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724906819; c=relaxed/simple;
	bh=WMu1pbyARyIvJqb6zojLywhBOMS3alDyrcpHonV5mYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOO0eXs6NP7Qe7zGhy+x+AbJL0VURGWtR9f3/Z7E17vPIfFME17Cker1lZ2K0QqX7rFTlDxmGqaHZQ2mtXjxDxmStBsWrUPR7XFjm7a4sdTjO3Bo14hRN5RE8wP1ElR+pxoSYFPIWRgK5C2YK0J+hGPeQczNrliwl5tkHTf/awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVuF4rtu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVuF4rtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724906808; x=1756442808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMu1pbyARyIvJqb6zojLywhBOMS3alDyrcpHonV5mYg=;
  b=YVuF4rtu2yVugXPZ7Ws3wbqdhn/EAPJqmhxbS7ugiOsbhzxWEdP6cumc
   DJL56uJ/las9eOqrojBVZEdcDV+KG/lmccs7FKDNDufi5FoKxrvRqzBiy
   JmmBtVsBcSAQqaVDGgj0hfvfqoHo+WfhSfJedQ4Tx+iKLYO66X9EXPZ+0
   UkGzuu+tAYEjWWY9NVy5JgdBgqF6cAl/VzAfdToMTZpyQk8ukpuwdesiU
   Mv0YotHKwN8CiZPeQMnAtaMhMTDmRCfdSB8BSmrPwU5bj8G4y5lQ1NM7A
   eTbVjwxLU2B6hepfmnNfHXJw4bE2jjOtVHiTFpXdbWgLnku13A8sHXode
   w==;
X-CSE-ConnectionGUID: Nx9Gq4MiSzKJ4M3wG16xsA==
X-CSE-MsgGUID: ZL/EMYG4QUGvmmydi1cWUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23605866"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23605866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 21:46:47 -0700
X-CSE-ConnectionGUID: vIcdhspRQFSYvTBQwWEr6A==
X-CSE-MsgGUID: 7SwAG6kdQAeJrpJEV3ifAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="94189141"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2024 21:46:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjX3S-000LgG-0L;
	Thu, 29 Aug 2024 04:46:42 +0000
Date: Thu, 29 Aug 2024 12:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:eic7700 3/24]
 arch/riscv/boot/dts/eswin/eic7700.dtsi:459.26-704.5: Warning
 (unit_address_vs_reg): /noc/d0_cfg_noc: node has a reg or ranges property,
 but no unit name
Message-ID: <202408291237.Y3k2uXzz-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: cde091e1f52d5410587d2623987afc6f71c383f3 [3/24] riscv: dts: Clean up EIC7700 device trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240829/202408291237.Y3k2uXzz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291237.Y3k2uXzz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408291237.Y3k2uXzz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:459.26-704.5: Warning (unit_address_vs_reg): /noc/d0_cfg_noc: node has a reg or ranges property, but no unit name
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3384.29-3396.6: Warning (unit_address_vs_reg): /soc/scu_sys_con@0x51810000/noc@51810324: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3470.47-3480.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3481.48-3491.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@40: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3492.46-3502.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@80: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3503.46-3512.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@c0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3513.50-3523.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@140: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3524.49-3534.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@200: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3535.49-3545.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@240: node has a unit name, but no reg or ranges property
--
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4337.21-4358.5: Warning (unit_address_vs_reg): /soc/lpcpu@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4990.29-4992.8: Warning (unit_address_vs_reg): /soc/hdmi@502a0000/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:287.28-290.6: Warning (unit_address_vs_reg): /soc/hdmi@502a0000/ports/port@2/endpoint@1: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:5006.31-5043.5: Warning (unit_address_vs_reg): /soc/usb0@50480000: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:5045.31-5082.5: Warning (unit_address_vs_reg): /soc/usb1@50490000: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:102.23-108.5: Warning (unit_address_vs_reg): /soc/reset_test@1e00e000: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:95.32-98.5: Warning (unit_address_vs_reg): /reserved-memory/g2d_4GB_boundary_reserved_4k: node has a reg or ranges property, but no unit name
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:459.26-704.5: Warning (simple_bus_reg): /noc/d0_cfg_noc: simple-bus unit address format error, expected "52060000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:984.35-2487.5: Warning (simple_bus_reg): /noc/d0_sys_noc@52002C00: simple-bus unit address format error, expected "52002c00"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:3078.34-3081.5: Warning (simple_bus_reg): /soc/authentication-controller: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:3270.28-3275.5: Warning (simple_bus_reg): /soc/subsystem_pbus_clock: missing or empty reg/ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3324.31-3332.5: Warning (simple_bus_reg): /soc/serial@0x50900000: simple-bus unit address format error, expected "50900000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3334.31-3342.5: Warning (simple_bus_reg): /soc/serial@0x50910000: simple-bus unit address format error, expected "50910000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3344.31-3353.5: Warning (simple_bus_reg): /soc/serial@0x50920000: simple-bus unit address format error, expected "50920000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3355.31-3364.5: Warning (simple_bus_reg): /soc/serial@0x50930000: simple-bus unit address format error, expected "50930000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3366.31-3375.5: Warning (simple_bus_reg): /soc/serial@0x50940000: simple-bus unit address format error, expected "50940000"
--
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3464.37-3546.5: Warning (avoid_unnecessary_addr_size): /soc/power-controller@51808000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4760.26-4775.5: Warning (avoid_unnecessary_addr_size): /soc/i2s0@50200000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4777.26-4792.5: Warning (avoid_unnecessary_addr_size): /soc/i2s1@50210000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4927.12-4935.7: Warning (avoid_unnecessary_addr_size): /soc/mipi_dsi@50270000/ports/port@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4937.12-4945.7: Warning (avoid_unnecessary_addr_size): /soc/mipi_dsi@50270000/ports/port@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3653.30-3668.5: Warning (unique_unit_address_if_enabled): /soc/eswin-npu@51c00000: duplicate unit-address (also used in node /soc/llc@51c00000)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:3160.27-3165.5: Warning (unique_unit_address_if_enabled): /soc/debug-controller@0: duplicate unit-address (also used in node /soc/ipc@0)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:3160.27-3165.5: Warning (unique_unit_address_if_enabled): /soc/debug-controller@0: duplicate unit-address (also used in node /soc/ddr-controller@0)
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4324.22-4335.5: Warning (unique_unit_address_if_enabled): /soc/ipc@0: duplicate unit-address (also used in node /soc/ddr-controller@0)
   arch/riscv/boot/dts/eswin/eic7700.dtsi:3902.25-3944.5: Warning (interrupt_provider): /soc/pcie@0x54000000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4889.12-4897.7: Warning (graph_child_address): /soc/dsi-output/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4927.12-4935.7: Warning (graph_child_address): /soc/mipi_dsi@50270000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:4937.12-4945.7: Warning (graph_child_address): /soc/mipi_dsi@50270000/ports/port@1: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:5190.9-5199.6: Warning (graph_child_address): /soc/csidma@0x52048000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:5208.9-5217.6: Warning (graph_child_address): /soc/csidma@0x52058000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +459 arch/riscv/boot/dts/eswin/eic7700.dtsi

cde091e1f52d54 Emil Renner Berthing 2024-08-26    32  
8ea3019924f781 linmin               2024-07-29    33  / {
8ea3019924f781 linmin               2024-07-29    34  	compatible = "eswin,eic7700";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    35  	#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    36  	#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    37  
cde091e1f52d54 Emil Renner Berthing 2024-08-26    38  	cpus {
cde091e1f52d54 Emil Renner Berthing 2024-08-26    39  		#address-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    40  		#size-cells = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    41  
cde091e1f52d54 Emil Renner Berthing 2024-08-26    42  		cpu@0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26    43  			compatible = "eswin,eic770x", "riscv";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    44  			reg = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    45  			clock-frequency = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    46  			d-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    47  			d-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    48  			d-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    49  			d-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    50  			d-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    51  			device_type = "cpu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    52  			hardware-exec-breakpoint-count = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    53  			hwpf-distanceBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    54  			hwpf-hitCacheThrdBits = <5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    55  			hwpf-hitMSHRThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    56  			hwpf-l2pfPoolSize = <10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    57  			hwpf-nIssQEnt = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    58  			hwpf-nPrefetchQueueEntries = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    59  			hwpf-nStreams = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    60  			hwpf-qFullnessThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    61  			hwpf-windowBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    62  			i-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    63  			i-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    64  			i-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    65  			i-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    66  			i-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    67  			mmu-type = "riscv,sv48";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    68  			next-level-cache = <&L15>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    69  			riscv,isa = "rv64imafdc_h_zicsr_zifencei_zba_zbb_sscofpmf";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    70  			riscv,pmpgranularity = <4096>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    71  			riscv,pmpregions = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    72  			sifive,buserror = <&cpu0_buserror>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    73  			tlb-split;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    74  			clocks = <&d0_clock EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    75  			operating-points-v2 = <&d0_cpu_opp_table>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    76  
cde091e1f52d54 Emil Renner Berthing 2024-08-26    77  			cpu0_intc: interrupt-controller {
cde091e1f52d54 Emil Renner Berthing 2024-08-26    78  				compatible = "riscv,cpu-intc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    79  				#interrupt-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    80  				interrupt-controller;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    81  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26    82  
cde091e1f52d54 Emil Renner Berthing 2024-08-26    83  			pmu {
cde091e1f52d54 Emil Renner Berthing 2024-08-26    84  				compatible = "riscv,pmu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26    85  				riscv,event-to-mhpmevent =
cde091e1f52d54 Emil Renner Berthing 2024-08-26    86  					<0x00004 0x0 0x0202>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    87  					<0x00005 0x0 0x4000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    88  					<0x00006 0x0 0x2001>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    89  					<0x10009 0x0 0x0102>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    90  					<0x10019 0x0 0x1002>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    91  					<0x10021 0x0 0x0802>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    92  				riscv,event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26    93  					<0x00001 0x00001 0x01>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    94  					<0x00002 0x00002 0x02>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    95  					<0x00004 0x00006 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    96  					<0x10009 0x10009 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    97  					<0x10019 0x10019 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26    98  					<0x10021 0x10021 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26    99  				riscv,raw-event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   100  					<0x0 0x0 0xffffffff 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   101  					<0x0 0x1 0xffffffff 0xfffe07ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   102  					<0x0 0x2 0xffffffff 0xfffe00ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   103  					<0x0 0x3 0xfffffffc 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   104  					<0x0 0x4 0xffffffc0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   105  					<0x0 0x5 0xffffffff 0xfffffdff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   106  					<0x0 0x6 0xfffffe00 0x110204ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   107  					<0x0 0x7 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   108  					<0x0 0x8 0xfffffe04 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   109  					<0x0 0x9 0xffffffff 0xffffc0ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   110  					<0x0 0xa 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   111  					<0x0 0xb 0xffffffff 0xfffffcff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   112  					<0x0 0xc 0xfffffff0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   113  					<0x0 0xd 0xffffffff 0x800000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   114  					<0x0 0xe 0xffffffff 0xf80000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   115  					<0x0 0xf 0xfffffffc 0x000000ff 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   116  				interrupts-extended = <&cpu0_intc 13>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   117  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   118  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   119  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   120  		cpu@1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   121  			compatible = "eswin,eic770x", "riscv";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   122  			reg = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   123  			clock-frequency = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   124  			d-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   125  			d-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   126  			d-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   127  			d-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   128  			d-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   129  			device_type = "cpu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   130  			hardware-exec-breakpoint-count = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   131  			hwpf-distanceBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   132  			hwpf-hitCacheThrdBits = <5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   133  			hwpf-hitMSHRThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   134  			hwpf-l2pfPoolSize = <10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   135  			hwpf-nIssQEnt = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   136  			hwpf-nPrefetchQueueEntries = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   137  			hwpf-nStreams = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   138  			hwpf-qFullnessThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   139  			hwpf-windowBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   140  			i-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   141  			i-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   142  			i-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   143  			i-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   144  			i-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   145  			mmu-type = "riscv,sv48";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   146  			next-level-cache = <&L20>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   147  			riscv,isa = "rv64imafdc_h_zicsr_zifencei_zba_zbb_sscofpmf";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   148  			riscv,pmpgranularity = <4096>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   149  			riscv,pmpregions = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   150  			sifive,buserror = <&cpu1_buserror>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   151  			tlb-split;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   152  			clocks = <&d0_clock EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   153  			operating-points-v2 = <&d0_cpu_opp_table>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   154  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   155  			cpu1_intc: interrupt-controller {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   156  				compatible = "riscv,cpu-intc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   157  				#interrupt-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   158  				interrupt-controller;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   159  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   160  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   161  			pmu {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   162  				compatible = "riscv,pmu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   163  				riscv,event-to-mhpmevent =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   164  					<0x00004 0x0 0x0202>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   165  					<0x00005 0x0 0x4000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   166  					<0x00006 0x0 0x2001>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   167  					<0x10009 0x0 0x0102>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   168  					<0x10019 0x0 0x1002>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   169  					<0x10021 0x0 0x0802>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   170  				riscv,event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   171  					<0x00001 0x00001 0x01>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   172  					<0x00002 0x00002 0x02>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   173  					<0x00004 0x00006 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   174  					<0x10009 0x10009 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   175  					<0x10019 0x10019 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   176  					<0x10021 0x10021 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   177  				riscv,raw-event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   178  					<0x0 0x0 0xffffffff 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   179  					<0x0 0x1 0xffffffff 0xfffe07ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   180  					<0x0 0x2 0xffffffff 0xfffe00ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   181  					<0x0 0x3 0xfffffffc 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   182  					<0x0 0x4 0xffffffc0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   183  					<0x0 0x5 0xffffffff 0xfffffdff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   184  					<0x0 0x6 0xfffffe00 0x110204ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   185  					<0x0 0x7 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   186  					<0x0 0x8 0xfffffe04 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   187  					<0x0 0x9 0xffffffff 0xffffc0ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   188  					<0x0 0xa 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   189  					<0x0 0xb 0xffffffff 0xfffffcff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   190  					<0x0 0xc 0xfffffff0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   191  					<0x0 0xd 0xffffffff 0x800000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   192  					<0x0 0xe 0xffffffff 0xf80000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   193  					<0x0 0xf 0xfffffffc 0x000000ff 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   194  				interrupts-extended = <&cpu1_intc 13>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   195  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   196  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   197  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   198  		cpu@2 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   199  			compatible = "eswin,eic770x", "riscv";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   200  			reg = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   201  			clock-frequency = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   202  			d-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   203  			d-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   204  			d-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   205  			d-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   206  			d-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   207  			device_type = "cpu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   208  			hardware-exec-breakpoint-count = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   209  			hwpf-distanceBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   210  			hwpf-hitCacheThrdBits = <5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   211  			hwpf-hitMSHRThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   212  			hwpf-l2pfPoolSize = <10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   213  			hwpf-nIssQEnt = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   214  			hwpf-nPrefetchQueueEntries = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   215  			hwpf-nStreams = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   216  			hwpf-qFullnessThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   217  			hwpf-windowBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   218  			i-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   219  			i-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   220  			i-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   221  			i-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   222  			i-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   223  			mmu-type = "riscv,sv48";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   224  			next-level-cache = <&L25>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   225  			riscv,isa = "rv64imafdc_h_zicsr_zifencei_zba_zbb_sscofpmf";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   226  			riscv,pmpgranularity = <4096>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   227  			riscv,pmpregions = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   228  			sifive,buserror = <&cpu2_buserror>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   229  			tlb-split;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   230  			clocks = <&d0_clock EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   231  			operating-points-v2 = <&d0_cpu_opp_table>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   232  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   233  			cpu2_intc: interrupt-controller {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   234  				compatible = "riscv,cpu-intc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   235  				#interrupt-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   236  				interrupt-controller;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   237  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   238  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   239  			pmu {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   240  				compatible = "riscv,pmu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   241  				riscv,event-to-mhpmevent =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   242  					<0x00004 0x0 0x0202>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   243  					<0x00005 0x0 0x4000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   244  					<0x00006 0x0 0x2001>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   245  					<0x10009 0x0 0x0102>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   246  					<0x10019 0x0 0x1002>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   247  					<0x10021 0x0 0x0802>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   248  				riscv,event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   249  					<0x00001 0x00001 0x01>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   250  					<0x00002 0x00002 0x02>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   251  					<0x00004 0x00006 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   252  					<0x10009 0x10009 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   253  					<0x10019 0x10019 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   254  					<0x10021 0x10021 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   255  				riscv,raw-event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   256  					<0x0 0x0 0xffffffff 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   257  					<0x0 0x1 0xffffffff 0xfffe07ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   258  					<0x0 0x2 0xffffffff 0xfffe00ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   259  					<0x0 0x3 0xfffffffc 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   260  					<0x0 0x4 0xffffffc0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   261  					<0x0 0x5 0xffffffff 0xfffffdff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   262  					<0x0 0x6 0xfffffe00 0x110204ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   263  					<0x0 0x7 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   264  					<0x0 0x8 0xfffffe04 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   265  					<0x0 0x9 0xffffffff 0xffffc0ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   266  					<0x0 0xa 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   267  					<0x0 0xb 0xffffffff 0xfffffcff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   268  					<0x0 0xc 0xfffffff0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   269  					<0x0 0xd 0xffffffff 0x800000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   270  					<0x0 0xe 0xffffffff 0xf80000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   271  					<0x0 0xf 0xfffffffc 0x000000ff 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   272  				interrupts-extended = <&cpu2_intc 13>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   273  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   274  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   275  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   276  		L32: cpu@3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   277  			compatible = "eswin,eic770x", "riscv";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   278  			reg = <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   279  			clock-frequency = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   280  			d-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   281  			d-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   282  			d-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   283  			d-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   284  			d-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   285  			device_type = "cpu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   286  			hardware-exec-breakpoint-count = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   287  			hwpf-distanceBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   288  			hwpf-hitCacheThrdBits = <5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   289  			hwpf-hitMSHRThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   290  			hwpf-l2pfPoolSize = <10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   291  			hwpf-nIssQEnt = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   292  			hwpf-nPrefetchQueueEntries = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   293  			hwpf-nStreams = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   294  			hwpf-qFullnessThrdBits = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   295  			hwpf-windowBits = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   296  			i-cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   297  			i-cache-sets = <128>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   298  			i-cache-size = <32768>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   299  			i-tlb-sets = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   300  			i-tlb-size = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   301  			mmu-type = "riscv,sv48";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   302  			next-level-cache = <&L30>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   303  			riscv,isa = "rv64imafdc_h_zicsr_zifencei_zba_zbb_sscofpmf";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   304  			riscv,pmpgranularity = <4096>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   305  			riscv,pmpregions = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   306  			sifive,buserror = <&cpu3_buserror>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   307  			tlb-split;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   308  			clocks = <&d0_clock EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   309  			operating-points-v2 = <&d0_cpu_opp_table>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   310  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   311  			cpu3_intc: interrupt-controller {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   312  				compatible = "riscv,cpu-intc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   313  				#interrupt-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   314  				interrupt-controller;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   315  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   316  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   317  			pmu {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   318  				compatible = "riscv,pmu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   319  				riscv,event-to-mhpmevent =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   320  					<0x00004 0x0 0x0202>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   321  					<0x00005 0x0 0x4000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   322  					<0x00006 0x0 0x2001>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   323  					<0x10009 0x0 0x0102>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   324  					<0x10019 0x0 0x1002>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   325  					<0x10021 0x0 0x0802>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   326  				riscv,event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   327  					<0x00001 0x00001 0x01>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   328  					<0x00002 0x00002 0x02>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   329  					<0x00004 0x00006 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   330  					<0x10009 0x10009 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   331  					<0x10019 0x10019 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   332  					<0x10021 0x10021 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   333  				riscv,raw-event-to-mhpmcounters =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   334  					<0x0 0x0 0xffffffff 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   335  					<0x0 0x1 0xffffffff 0xfffe07ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   336  					<0x0 0x2 0xffffffff 0xfffe00ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   337  					<0x0 0x3 0xfffffffc 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   338  					<0x0 0x4 0xffffffc0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   339  					<0x0 0x5 0xffffffff 0xfffffdff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   340  					<0x0 0x6 0xfffffe00 0x110204ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   341  					<0x0 0x7 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   342  					<0x0 0x8 0xfffffe04 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   343  					<0x0 0x9 0xffffffff 0xffffc0ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   344  					<0x0 0xa 0xffffffff 0xf00000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   345  					<0x0 0xb 0xffffffff 0xfffffcff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   346  					<0x0 0xc 0xfffffff0 0x000000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   347  					<0x0 0xd 0xffffffff 0x800000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   348  					<0x0 0xe 0xffffffff 0xf80000ff 0x78>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   349  					<0x0 0xf 0xfffffffc 0x000000ff 0x78>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   350  				interrupts-extended = <&cpu3_intc 13>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   351  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   352  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   353  	};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   354  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   355  	memory: memory@80000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   356  		compatible = "sifive,axi4-mem-port", "sifive,axi4-port", "sifive,mem-port";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   357  		reg = <0x0 0x80000000 0x7f 0x80000000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   358  		device_type = "memory";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   359  		sifive,port-width-bytes = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   360  	};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   361  
8ea3019924f781 linmin               2024-07-29   362  	d0_cpu_opp_table: opp-table0 {
8ea3019924f781 linmin               2024-07-29   363  		compatible = "operating-points-v2";
8ea3019924f781 linmin               2024-07-29   364  		opp-shared;
8ea3019924f781 linmin               2024-07-29   365  
8ea3019924f781 linmin               2024-07-29   366  		opp-24000000 {
8ea3019924f781 linmin               2024-07-29   367  			opp-hz = /bits/ 64 <CLK_FREQ_24M>;
8ea3019924f781 linmin               2024-07-29   368  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   369  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   370  		};
8ea3019924f781 linmin               2024-07-29   371  		opp-100000000 {
8ea3019924f781 linmin               2024-07-29   372  			opp-hz = /bits/ 64 <CLK_FREQ_100M>;
8ea3019924f781 linmin               2024-07-29   373  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   374  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   375  		};
8ea3019924f781 linmin               2024-07-29   376  		opp-200000000 {
8ea3019924f781 linmin               2024-07-29   377  			opp-hz = /bits/ 64 <CLK_FREQ_200M>;
8ea3019924f781 linmin               2024-07-29   378  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   379  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   380  		};
8ea3019924f781 linmin               2024-07-29   381  		opp-400000000 {
8ea3019924f781 linmin               2024-07-29   382  			opp-hz = /bits/ 64 <CLK_FREQ_400M>;
8ea3019924f781 linmin               2024-07-29   383  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   384  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   385  		};
8ea3019924f781 linmin               2024-07-29   386  		opp-500000000 {
8ea3019924f781 linmin               2024-07-29   387  			opp-hz = /bits/ 64 <CLK_FREQ_500M>;
8ea3019924f781 linmin               2024-07-29   388  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   389  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   390  		};
8ea3019924f781 linmin               2024-07-29   391  		opp-600000000 {
8ea3019924f781 linmin               2024-07-29   392  			opp-hz = /bits/ 64 <CLK_FREQ_600M>;
8ea3019924f781 linmin               2024-07-29   393  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   394  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   395  		};
8ea3019924f781 linmin               2024-07-29   396  		opp-700000000 {
8ea3019924f781 linmin               2024-07-29   397  			opp-hz = /bits/ 64 <CLK_FREQ_700M>;
8ea3019924f781 linmin               2024-07-29   398  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   399  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   400  		};
8ea3019924f781 linmin               2024-07-29   401  		opp-800000000 {
8ea3019924f781 linmin               2024-07-29   402  			opp-hz = /bits/ 64 <CLK_FREQ_800M>;
8ea3019924f781 linmin               2024-07-29   403  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   404  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   405  		};
8ea3019924f781 linmin               2024-07-29   406  		opp-900000000 {
8ea3019924f781 linmin               2024-07-29   407  			opp-hz = /bits/ 64 <CLK_FREQ_900M>;
8ea3019924f781 linmin               2024-07-29   408  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   409  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   410  		};
8ea3019924f781 linmin               2024-07-29   411  		opp-1000000000 {
8ea3019924f781 linmin               2024-07-29   412  			opp-hz = /bits/ 64 <CLK_FREQ_1000M>;
8ea3019924f781 linmin               2024-07-29   413  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   414  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   415  		};
8ea3019924f781 linmin               2024-07-29   416  		opp-1200000000 {
8ea3019924f781 linmin               2024-07-29   417  			opp-hz = /bits/ 64 <CLK_FREQ_1200M>;
8ea3019924f781 linmin               2024-07-29   418  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   419  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   420  		};
8ea3019924f781 linmin               2024-07-29   421  		opp-1300000000 {
8ea3019924f781 linmin               2024-07-29   422  			opp-hz = /bits/ 64 <CLK_FREQ_1300M>;
8ea3019924f781 linmin               2024-07-29   423  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   424  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   425  		};
8ea3019924f781 linmin               2024-07-29   426  		opp-1400000000 {
8ea3019924f781 linmin               2024-07-29   427  			opp-hz = /bits/ 64 <CLK_FREQ_1400M>;
8ea3019924f781 linmin               2024-07-29   428  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   429  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   430  		};
8ea3019924f781 linmin               2024-07-29   431  		opp-1500000000 {
8ea3019924f781 linmin               2024-07-29   432  			opp-hz = /bits/ 64 <CLK_FREQ_1500M>;
8ea3019924f781 linmin               2024-07-29   433  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   434  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   435  		};
8ea3019924f781 linmin               2024-07-29   436  		opp-1600000000 {
8ea3019924f781 linmin               2024-07-29   437  			opp-hz = /bits/ 64 <CLK_FREQ_1600M>;
8ea3019924f781 linmin               2024-07-29   438  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   439  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   440  		};
8ea3019924f781 linmin               2024-07-29   441  		opp-1700000000 {
8ea3019924f781 linmin               2024-07-29   442  			opp-hz = /bits/ 64 <CLK_FREQ_1700M>;
8ea3019924f781 linmin               2024-07-29   443  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   444  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   445  		};
8ea3019924f781 linmin               2024-07-29   446  		opp-1800000000 {
8ea3019924f781 linmin               2024-07-29   447  			opp-hz = /bits/ 64 <CLK_FREQ_1800M>;
8ea3019924f781 linmin               2024-07-29   448  			opp-microvolt = <800000>;
8ea3019924f781 linmin               2024-07-29   449  			clock-latency-ns = <70000>;
8ea3019924f781 linmin               2024-07-29   450  		};
8ea3019924f781 linmin               2024-07-29   451  	};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   452  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   453  	noc {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   454  		compatible = "eswin,noc", "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   455  		#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   456  		#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   457  		ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   458  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  @459  		d0_cfg_noc: d0_cfg_noc {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   460  			compatible = "eswin,eic7700-noc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   461  			reg = <0x0 0x52060000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   462  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   463  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   464  			ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   465  			interrupts = <446>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   466  			interrupt-names = "error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   467  			interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   468  			errlogger,idx = <0 1 3 5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   469  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   470  			sideband_manager@52061000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   471  				compatible = "eswin,win2xxx-noc-sideband-manager";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   472  				reg = <0 0x52061000 0 0x10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   473  				SenseIn0 =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   474  					<SBM_CLMM		OFFSET0>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   475  					<SBM_CNOC_AON		OFFSET1>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   476  					<SBM_CNOC_DDRT0_CTRL	OFFSET2>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   477  					<SBM_CNOC_DDRT0_PHY	OFFSET3>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   478  					<SBM_CNOC_DDRT1_CTRL	OFFSET4>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   479  					<SBM_CNOC_DDRT1_PHY	OFFSET5>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   480  					<SBM_CNOC_DSPT		OFFSET6>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   481  					<SBM_CNOC_GPU		OFFSET7>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   482  					<SBM_CNOC_HSP		OFFSET8>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   483  					<SBM_CNOC_LSP_APB2	OFFSET9>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   484  					<SBM_CNOC_LSP_APB3	OFFSET10>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   485  					<SBM_CNOC_LSP_APB4	OFFSET11>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   486  					<SBM_CNOC_LSP_APB6	OFFSET12>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   487  					<SBM_CNOC_MCPUT_D2D 	OFFSET13>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   488  					<SBM_CNOC_NPU		OFFSET14>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   489  					<SBM_CNOC_PCIET_P 	OFFSET15>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   490  					<SBM_CNOC_PCIET_X 	OFFSET16>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   491  					<SBM_CNOC_TCU		OFFSET17>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   492  					<SBM_CNOC_VC		OFFSET18>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   493  					<SBM_CNOC_VI		OFFSET19>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   494  					<SBM_CNOC_VO		OFFSET20>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   495  				bf-name =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   496  					"SBM_CLMM",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   497  					"SBM_CNOC_AON",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   498  					"SBM_CNOC_DDRT0_CTRL",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   499  					"SBM_CNOC_DDRT0_PHY ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   500  					"SBM_CNOC_DDRT1_CTRL",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   501  					"SBM_CNOC_DDRT1_PHY",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   502  					"SBM_CNOC_DSPT",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   503  					"SBM_CNOC_GPU",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   504  					"SBM_CNOC_HSP",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   505  					"SBM_CNOC_LSP_APB2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   506  					"SBM_CNOC_LSP_APB3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   507  					"SBM_CNOC_LSP_APB4",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   508  					"SBM_CNOC_LSP_APB6",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   509  					"SBM_CNOC_MCPUT_D2D",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   510  					"SBM_CNOC_NPU",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   511  					"SBM_CNOC_PCIET_P",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   512  					"SBM_CNOC_PCIET_X",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   513  					"SBM_CNOC_TCU",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   514  					"SBM_CNOC_VC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   515  					"SBM_CNOC_VI",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   516  					"SBM_CNOC_VO";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   517  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   518  			ErrorLogger0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   519  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   520  				offset,length = <0x14>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   521  				description = "Register 0 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   522  				lock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   523  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   524  					offset,length = <0>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   525  					lut = "Not Locked", "Locked";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   526  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   527  				OpCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   528  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   529  					offset,length = <1>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   530  					lut = "RD: data read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   531  					      "RDW: data read with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   532  					      "RDL: allocates monitor in the Target with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   533  					      "RDX: exclusive read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   534  					      "WR: data write with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   535  					      "WRW: data write with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   536  					      "WRC: conditional write if matching monitor in Target is found",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   537  					      "RSV: reserved",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   538  					      "PRE: preamble packet of linked sequence (locked sequence)",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   539  					      "URG: urgency packet used for QoS (status must be REQ)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   540  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   541  				ErrCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   542  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   543  					offset,length = <8>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   544  					lut = "SLV (error source: Target): error detected by the Slave without any information or no Error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   545  					      "DEC (error source: Initiator NIU): decode error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   546  					      "UNS (error source: Target NIU): unsupported access type",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   547  					      "DISC (error source: Power Disconnect): disconnected Target or NoC domain",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   548  					      "SEC (error source: Initiator NIU or Firewall): security error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   549  					      "HIDE (error source: Firewall): hidden security error. Will be reported as OK to the initiator",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   550  					      "TMO (error source: Target NIU): time-out",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   551  					      "RSV: reserved";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   552  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   553  				Len1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   554  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   555  					offset,length = <16>, <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   556  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   557  				Format {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   558  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   559  					offset,length = <31>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   560  					lut = "NTTP v3.0 (Invalid)", "NTTP v3.5 (Ok)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   561  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   562  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   563  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   564  			ErrorLogger1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   565  				compatible = "eswin,eic7700,register", "eswin,eic7700,noc,filter,routeid";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   566  				offset,length = <0x18>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   567  				description = "Register 1 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   568  				InitFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   569  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   570  					offset,length = <15>, <1>;  /*bit 15 will aloways be 0, then we will always get "snoc_cnoc/I/0"*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26   571  					lut = "snoc_cnoc/I/0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   572  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   573  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   574  				TargetFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   575  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   576  					offset,length = <10>, <5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   577  					lut =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   578  						"clmm/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   579  						"cnoc_aon/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   580  						"cnoc_ddrt0_ctrl/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   581  						"cnoc_ddrt0_phy/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   582  						"cnoc_ddrt1_ctrl/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   583  						"cnoc_ddrt1_phy/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   584  						"cnoc_dspt/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   585  						"cnoc_gpu/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   586  						"cnoc_hsp/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   587  						"cnoc_lsp_apb2/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   588  						"cnoc_lsp_apb3/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   589  						"cnoc_lsp_apb4/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   590  						"cnoc_lsp_apb6/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   591  						"cnoc_mcput_d2d/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   592  						"cnoc_npu/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   593  						"cnoc_pciet_p/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   594  						"cnoc_pciet_x/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   595  						"cnoc_service/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   596  						"cnoc_tcu/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   597  						"cnoc_vc/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   598  						"cnoc_vi/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   599  						"cnoc_vo/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   600  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   601  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   602  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   603  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   604  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   605  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   606  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   607  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   608  						"RESERVED",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   609  						"RESERVED";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   610  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   611  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   612  				TargetSubRange {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   613  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   614  					offset,length = <8>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   615  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   616  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   617  				SeqId {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   618  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   619  					offset,length = <0>, <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   620  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   621  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   622  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   623  			ErrorLogger3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   624  				/* This register does not really include a bitfield or its bitfield is 32 bits and it provides an offset address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   625  				/* To calculate the absolute address, you must use the initflow:targetflow:subrange from ErrorLogger1 register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   626  				/* And use it as an index in the aperture table. Then you must add the value of this register to the value given */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   627  				/* by the table to get the absolute address. */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   628  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   629  				offset,length = <0x20>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   630  				description = "Register 3 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   631  				aperture-link = <1>; /* link to ErrorLogger1 whose information are required to calculate real absolute address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   632  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   633  				AbsoluteAddress {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   634  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   635  					offset,length = <8>, <8>;	/* bitfield initflow:targeflow:subrange from aperture-link register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   636  					aperture-size= <46>;		/* Number of line in the aperture table below */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   637  					aperture-idx,aperture-base =	/* Aperture_idx is concatenation of initflow:targetflow:subrange bitfield from ErrorLogger1 */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   638  						/bits/ 64  <0x0 0x0    0x0  0x51600000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   639  						/bits/ 64  <0x0 0x0    0x1  0x71600000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   640  						/bits/ 64  <0x0 0x1    0x0  0x51800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   641  						/bits/ 64  <0x0 0x1    0x1  0x71800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   642  						/bits/ 64  <0x0 0x1    0x2  0x0       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   643  						/bits/ 64  <0x0 0x1    0x3  0x0       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   644  						/bits/ 64  <0x0 0x2    0x0  0x52300000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   645  						/bits/ 64  <0x0 0x2    0x1  0x72300000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   646  						/bits/ 64  <0x0 0x3    0x0  0x53000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   647  						/bits/ 64  <0x0 0x3    0x1  0x73000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   648  						/bits/ 64  <0x0 0x4    0x0  0x52380000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   649  						/bits/ 64  <0x0 0x4    0x1  0x72380000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   650  						/bits/ 64  <0x0 0x5    0x0  0x53800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   651  						/bits/ 64  <0x0 0x5    0x1  0x73800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   652  						/bits/ 64  <0x0 0x6    0x0  0x52200000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   653  						/bits/ 64  <0x0 0x6    0x1  0x72200000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   654  						/bits/ 64  <0x0 0x7    0x0  0x51400000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   655  						/bits/ 64  <0x0 0x7    0x1  0x71400000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   656  						/bits/ 64  <0x0 0x8    0x0  0x50400000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   657  						/bits/ 64  <0x0 0x8    0x1  0x70400000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   658  						/bits/ 64  <0x0 0x9    0x0  0x50800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   659  						/bits/ 64  <0x0 0x9    0x1  0x70800000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   660  						/bits/ 64  <0x0 0xa    0x0  0x50900000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   661  						/bits/ 64  <0x0 0xa    0x1  0x70900000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   662  						/bits/ 64  <0x0 0xb    0x0  0x50a00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   663  						/bits/ 64  <0x0 0xb    0x1  0x70a00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   664  						/bits/ 64  <0x0 0xc    0x0  0x50b00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   665  						/bits/ 64  <0x0 0xc    0x1  0x70b00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   666  						/bits/ 64  <0x0 0xd    0x0  0x52100000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   667  						/bits/ 64  <0x0 0xd    0x1  0x72100000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   668  						/bits/ 64  <0x0 0xe    0x0  0x51c00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   669  						/bits/ 64  <0x0 0xe    0x1  0x71c00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   670  						/bits/ 64  <0x0 0xf    0x0  0x50000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   671  						/bits/ 64  <0x0 0xf    0x1  0x70000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   672  						/bits/ 64  <0x0 0x10   0x0  0x54000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   673  						/bits/ 64  <0x0 0x10   0x1  0x74000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   674  						/bits/ 64  <0x0 0x11   0x0  0x52060000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   675  						/bits/ 64  <0x0 0x11   0x1  0x72060000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   676  						/bits/ 64  <0x0 0x12   0x0  0x50c00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   677  						/bits/ 64  <0x0 0x12   0x1  0x70c00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   678  						/bits/ 64  <0x0 0x13   0x0  0x50100000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   679  						/bits/ 64  <0x0 0x13   0x1  0x70100000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   680  						/bits/ 64  <0x0 0x14   0x0  0x51000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   681  						/bits/ 64  <0x0 0x14   0x1  0x71000000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   682  						/bits/ 64  <0x0 0x15   0x0  0x50200000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   683  						/bits/ 64  <0x0 0x15   0x1  0x70200000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   684  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   685  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   686  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   687  			ErrorLogger5 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   688  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   689  				offset,length = <0x28>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   690  				description = "Register 5 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   691  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   692  				User_flag {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   693  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   694  					offset,length = <0x0>, <7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   695  					lut = "Cache_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   696  					      "Cache_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   697  					      "Cache_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   698  					      "Cache_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   699  					      "Prot_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   700  					      "Prot_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   701  					      "Prot_2";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   702  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   703  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   704  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   705  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   706  		d0_llc_noc: d0_llc_noc@52081400 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   707  			compatible = "eswin,eic7700-noc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   708  			reg = <0 0x52081400 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   709  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   710  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   711  			ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   712  			interrupts = <441>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   713  			interrupt-names = "error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   714  			interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   715  			errlogger,idx = <0 1 3 4 5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   716  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   717  			sideband_manager@52082000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   718  				compatible = "eswin,win2xxx-noc-sideband-manager";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   719  				reg = <0 0x52082000 0 0x10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   720  				SenseIn0 =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   721  					<SBM_LNOC_NPU_LLC0 	OFFSET0>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   722  					<SBM_LNOC_NPU_LLC1 	OFFSET1>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   723  					<SBM_LNOC_DDRT0_P0 	OFFSET2>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   724  					<SBM_LNOC_DDRT1_P0 	OFFSET3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   725  				bf-name =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   726  					"SBM_LNOC_NPU_LLC0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   727  					"SBM_LNOC_NPU_LLC1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   728  					"SBM_LNOC_DDRT0_P0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   729  					"SBM_LNOC_DDRT1_P0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   730  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   731  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   732  			llcnoc_packet_ddr0_p0_req_probe@52080000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   733  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   734  				reg = <0 0x52080000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   735  				clocks = <&d0_clock EIC7700_CLK_DDRT0_P0_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   736  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   737  				interrupts = <445>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   738  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   739  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   740  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   741  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   742  				portsel = "ddr0_p0_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   743  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   744  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   745  			llcnoc_packet_ddr1_p0_req_probe@52080800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   746  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   747  				reg = <0 0x52080800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   748  				clocks = <&d0_clock EIC7700_CLK_DDRT1_P0_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   749  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   750  				interrupts = <443>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   751  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   752  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   753  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   754  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   755  				portsel = "ddr1_p0_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   756  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   757  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   758  			llcnoc_trans_probe@52081000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   759  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   760  				reg = <0 0x52081000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   761  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   762  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   763  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   764  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   765  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   766  				interrupts = <441>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   767  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   768  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   769  				filter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   770  				counter,nr = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   771  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   772  				portsel = "npu_llc0", "npu_llc1";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   773  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   774  				llcnoc_trans_npu_llc0_filter@52081480 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   775  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   776  					reg = <0 0x52081480 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   777  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   778  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   779  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   780  				llcnoc_trans_npu_llc1_filter@52081500 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   781  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   782  					reg = <0 0x52081500 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   783  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   784  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   785  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   786  				llcnoc_trans_profiler@52081580 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   787  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   788  					reg = <0 0x52081580 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   789  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   790  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   791  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   792  			ErrorLogger0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   793  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   794  				offset,length = <0x14>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   795  				description = "Register 0 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   796  				lock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   797  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   798  					offset,length = <0>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   799  					lut = "Not Locked", "Locked";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   800  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   801  				OpCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   802  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   803  					offset,length = <1>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   804  					lut = "RD: data read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   805  					      "RDW: data read with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   806  					      "RDL: allocates monitor in the Target with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   807  					      "RDX: exclusive read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   808  					      "WR: data write with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   809  					      "WRW: data write with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   810  					      "WRC: conditional write if matching monitor in Target is found",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   811  					      "RSV: reserved",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   812  					      "PRE: preamble packet of linked sequence (locked sequence)",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   813  					      "URG: urgency packet used for QoS (status must be REQ)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   814  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   815  				ErrCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   816  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   817  					offset,length = <8>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   818  					lut = "SLV (error source: Target): error detected by the Slave without any information or no Error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   819  					      "DEC (error source: Initiator NIU): decode error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   820  					      "UNS (error source: Target NIU): unsupported access type",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   821  					      "DISC (error source: Power Disconnect): disconnected Target or NoC domain",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   822  					      "SEC (error source: Initiator NIU or Firewall): security error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   823  					      "HIDE (error source: Firewall): hidden security error. Will be reported as OK to the initiator",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   824  					      "TMO (error source: Target NIU): time-out",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   825  					      "RSV: reserved";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   826  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   827  				Len1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   828  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   829  					offset,length = <16>, <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   830  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   831  				Format {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   832  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   833  					offset,length = <31>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   834  					lut = "NTTP v3.0 (Invalid)", "NTTP v3.5 (Ok)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   835  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   836  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   837  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   838  			ErrorLogger1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   839  				compatible = "eswin,eic7700,register", "eswin,eic7700,noc,filter,routeid";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   840  				offset,length = <0x18>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   841  				description = "Register 1 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   842  				InitFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   843  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   844  					offset,length = <14>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   845  					lut =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   846  						"npu_lnoc_llc0/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   847  							"npu_lnoc_llc1/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   848  								"snoc_lnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   849  									"RESERVED";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   850  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   851  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   852  				TargetFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   853  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   854  					offset,length = <12>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   855  					lut =
cde091e1f52d54 Emil Renner Berthing 2024-08-26   856  						"lnoc_ddrt0_p0/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   857  							"lnoc_ddrt1_p0/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   858  								"lnoc_service/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   859  									"RESERVED";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   860  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   861  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   862  				TargetSubRange {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   863  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   864  					offset,length = <8>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   865  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   866  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   867  				SeqId {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   868  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   869  					offset,length = <0>, <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   870  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   871  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   872  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   873  			ErrorLogger3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   874  				/* This register does not really include a bitfield or its bitfield is 32 bits and it provides an offset address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   875  				/* To calculate the absolute address, you must use the initflow:targetflow:subrange from ErrorLogger1 register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   876  				/* And use it as an index in the aperture table. Then you must add the value of this register to the value given */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   877  				/* by the table to get the absolute address. */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   878  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   879  				offset,length = <0x20>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   880  				description = "Register 3 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   881  				aperture-link = <1>; /* link to ErrorLogger whose information are required to calculate real absolute address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   882  				msb-link = <4>; /*indicate which ErrorLogger contains the msb addrs, -1 means no*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26   883  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   884  				AbsoluteAddress {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   885  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   886  					offset,length = <8>, <8>;	/* bitfield initflow:targeflow:subrange from aperture-link register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   887  					aperture-size= <53>;		/* Number of line in the aperture table below */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   888  					aperture-idx,aperture-base =	/* Aperture_idx is concatenation of initflow:targetflow:subrange bitfield from ErrorLogger1 */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   889  						/bits/ 64  <0x0	0x0	0x0	0x80000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   890  						/bits/ 64  <0x0	0x0	0x1	0x100000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   891  						/bits/ 64  <0x0	0x0	0x2	0x200000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   892  						/bits/ 64  <0x0	0x0	0x3	0x400000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   893  						/bits/ 64  <0x0	0x0	0x4	0x800000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   894  						/bits/ 64  <0x0	0x0	0x5	0x2000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   895  						/bits/ 64  <0x0	0x0	0x6	0xc000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   896  						/bits/ 64  <0x0	0x0	0x7	0xe000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   897  						/bits/ 64  <0x0	0x0	0x8	0x4000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   898  						/bits/ 64  <0x0	0x0	0x9	0x4000000100    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   899  						/bits/ 64  <0x0	0x0	0xa	0x10000000000   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   900  						/bits/ 64  <0x0	0x0	0xb	0x10000000100   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   901  						/bits/ 64  <0x0	0x0	0xc	0x0             >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   902  						/bits/ 64  <0x0	0x1	0x0	0x80000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   903  						/bits/ 64  <0x0	0x1	0x1	0x100000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   904  						/bits/ 64  <0x0	0x1	0x2	0x200000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   905  						/bits/ 64  <0x0	0x1	0x3	0x400000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   906  						/bits/ 64  <0x0	0x1	0x4	0x800000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   907  						/bits/ 64  <0x0	0x1	0x5	0x2000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   908  						/bits/ 64  <0x0	0x1	0x6	0xc000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   909  						/bits/ 64  <0x0	0x1	0x7	0xe000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   910  						/bits/ 64  <0x0	0x1	0x8	0x4000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   911  						/bits/ 64  <0x0	0x1	0x9	0x4000000180    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   912  						/bits/ 64  <0x0	0x1	0xa	0x10000000080   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   913  						/bits/ 64  <0x0	0x1	0xb	0x10000000180   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   914  						/bits/ 64  <0x1	0x0	0x0	0x80000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   915  						/bits/ 64  <0x1	0x0	0x1	0x100000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   916  						/bits/ 64  <0x1	0x0	0x2	0x200000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   917  						/bits/ 64  <0x1	0x0	0x3	0x400000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   918  						/bits/ 64  <0x1	0x0	0x4	0x800000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   919  						/bits/ 64  <0x1	0x0	0x5	0x2000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   920  						/bits/ 64  <0x1	0x0	0x6	0xc000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   921  						/bits/ 64  <0x1	0x0	0x7	0xe000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   922  						/bits/ 64  <0x1	0x0	0x8	0x4000000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   923  						/bits/ 64  <0x1	0x0	0x9	0x4000000100    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   924  						/bits/ 64  <0x1	0x0	0xa	0x10000000000   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   925  						/bits/ 64  <0x1	0x0	0xb	0x10000000100   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   926  						/bits/ 64  <0x1	0x0	0xc	0x0             >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   927  						/bits/ 64  <0x1	0x1	0x0	0x80000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   928  						/bits/ 64  <0x1	0x1	0x1	0x100000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   929  						/bits/ 64  <0x1	0x1	0x2	0x200000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   930  						/bits/ 64  <0x1	0x1	0x3	0x400000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   931  						/bits/ 64  <0x1	0x1	0x4	0x800000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   932  						/bits/ 64  <0x1	0x1	0x5	0x2000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   933  						/bits/ 64  <0x1	0x1	0x6	0xc000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   934  						/bits/ 64  <0x1	0x1	0x7	0xe000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   935  						/bits/ 64  <0x1	0x1	0x8	0x4000000080    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   936  						/bits/ 64  <0x1	0x1	0x9	0x4000000180    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   937  						/bits/ 64  <0x1	0x1	0xa	0x10000000080   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   938  						/bits/ 64  <0x1	0x1	0xb	0x10000000180   >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   939  						/bits/ 64  <0x2	0x2	0x0	0x52080000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   940  						/bits/ 64  <0x2	0x2	0x1	0x72080000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26   941  						/bits/ 64  <0x2	0x2	0x2	0x0             >;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   942  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   943  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   944  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   945  			ErrorLogger4 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   946  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   947  				offset,length = <0x24>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   948  				description = "Register 4 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   949  				addr_msb {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   950  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   951  					description = "Stores NTTP packet header field Addr (MSBs) of the logged error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   952  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   953  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   954  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   955  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   956  			ErrorLogger5 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   957  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   958  				offset,length = <0x28>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   959  				description = "Register 5 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   960  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   961  				User_flag {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   962  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   963  					offset,length = <0x0>, <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   964  					lut = "Cache_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   965  					      "Cache_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   966  					      "Cache_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   967  					      "Cache_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   968  					      "Prot_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   969  					      "Prot_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   970  					      "Prot_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   971  					      "Qos_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   972  					      "Qos_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   973  					      "Qos_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   974  					      "Qos_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   975  					      "User_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   976  					      "User_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   977  					      "User_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   978  					      "User_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26   979  					      "User_4";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   980  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   981  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   982  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26   983  
cde091e1f52d54 Emil Renner Berthing 2024-08-26   984  		d0_sys_noc: d0_sys_noc@52002C00 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26   985  			compatible = "eswin,eic7700-noc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   986  			reg = <0 0x52002C00 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   987  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   988  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   989  			ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   990  			interrupts = <431>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   991  			interrupt-names = "error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   992  			interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   993  			errlogger,idx = <0 1 3 4 5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   994  			eswin,qos-configs = "DSPT", "NPU", "SPISLV_TBU3";
cde091e1f52d54 Emil Renner Berthing 2024-08-26   995  			eswin,DSPT-qos-base = <0x52002C80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26   996  			eswin,DSPT-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26   997  				0x8 0x4        /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26   998  				0xC 0x2        /* mode 0:fixed 1:limiter 2:bypass 3:regulator*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26   999  				/* a number of (1/256)th of Bytes/cycle.
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1000  				Ex:zebu zdfi design feature, dsp AXI Clk=1040MHz, BW=12.1875MB/s, register value = (9.375/1040)*256 = 0x03
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1001  				*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1002  				0x10 0x03    /* bandwidth. 12.1875MB/s */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1003  				/*
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1004  				Saturation(B) = ((Requried Bandwidth)*(Windows Time of Bandwidth Calculation))/16
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1005  				Ex:16 byte saturation for BW=12.1875MB/s means 1.313us window time.
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1006  				The desired value is number of saturation bytes divided by 16(ex,1 for 16byte B)
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1007  				*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1008  				0x14 0x1     /* saturation, 1.313us*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1009  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1010  			eswin,NPU-qos-base = <0x52002D00>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1011  			eswin,NPU-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1012  				0x8 0x4      /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1013  				0xC 0x2      /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1014  				0x10 0x18    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1015  				0x14 0x10    /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1016  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1017  			eswin,SPISLV_TBU3-qos-base = <0x52002D80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1018  			eswin,SPISLV_TBU3-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1019  				0x8 0x4      /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1020  				0xC 0x2      /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1021  				0x10 0x18    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1022  				0x14 0x10    /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1023  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1024  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1025  			sideband_manager@52004000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1026  				compatible = "eswin,win2xxx-noc-sideband-manager";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1027  				reg = <0 0x52004000 0 0x10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1028  				SenseIn0 =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1029  					<SBM_AON_SNOC_SP0 	OFFSET0>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1030  					<SBM_DSPT_SNOC 		OFFSET1>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1031  					<SBM_JTAG_SNOC 		OFFSET2>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1032  					<SBM_MCPUT_SNOC_D2D 	OFFSET3>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1033  					<SBM_MCPUT_SNOC_MP 	OFFSET4>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1034  					<SBM_MCPUT_SNOC_SP0 	OFFSET5>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1035  					<SBM_MCPUT_SNOC_SP1 	OFFSET6>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1036  					<SBM_NPU_SNOC_SP0 	OFFSET7>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1037  					<SBM_NPU_SNOC_SP1 	OFFSET8>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1038  					<SBM_PCIET_SNOC_P 	OFFSET9>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1039  					<SBM_SPISLV_PCIET_SNOC	OFFSET10>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1040  					<SBM_TBU4_SNOC 		OFFSET11>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1041  					<SBM_TCU_SNOC 		OFFSET12>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1042  					<SBM_SNOC_AON 		OFFSET13>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1043  					<SBM_SNOC_DDR0_P1 	OFFSET14>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1044  					<SBM_SNOC_DDR0_P2 	OFFSET15>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1045  					<SBM_SNOC_DDR1_P1 	OFFSET16>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1046  					<SBM_SNOC_DDR1_P2 	OFFSET17>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1047  					<SBM_SNOC_DSPT 		OFFSET18>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1048  					<SBM_SNOC_MCPUT_D2D 	OFFSET19>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1049  					<SBM_SNOC_NPU 		OFFSET20>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1050  					<SBM_SNOC_PCIET 	OFFSET21>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1051  				bf-name =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1052  					"SBM_AON_SNOC_SP0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1053  					"SBM_DSPT_SNOC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1054  					"SBM_JTAG_SNOC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1055  					"SBM_MCPUT_SNOC_D2D ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1056  					"SBM_MCPUT_SNOC_MP",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1057  					"SBM_MCPUT_SNOC_SP0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1058  					"SBM_MCPUT_SNOC_SP1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1059  					"SBM_NPU_SNOC_SP0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1060  					"SBM_NPU_SNOC_SP1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1061  					"SBM_PCIET_SNOC_P",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1062  					"SBM_SPISLV_PCIET_SNOC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1063  					"SBM_TBU4_SNOC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1064  					"SBM_TCU_SNOC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1065  					"SBM_SNOC_AON",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1066  					"SBM_SNOC_DDR0_P1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1067  					"SBM_SNOC_DDR0_P2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1068  					"SBM_SNOC_DDR1_P1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1069  					"SBM_SNOC_DDR1_P2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1070  					"SBM_SNOC_DSPT",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1071  					"SBM_SNOC_MCPUT_D2D",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1072  					"SBM_SNOC_NPU",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1073  					"SBM_SNOC_PCIET";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1074  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1075  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1076  			sysnoc_packet_ddr0_p1_req_probe@52000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1077  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1078  				reg = <0 0x52000000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1079  				clocks = <&d0_clock EIC7700_CLK_DDRT0_P1_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1080  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1081  				interrupts = <439>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1082  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1083  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1084  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1085  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1086  				portsel = "ddr0_p1_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1087  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1088  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1089  			sysnoc_packet_ddr0_p2_req_probe@52000800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1090  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1091  				reg = <0 0x52000800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1092  				clocks = <&d0_clock EIC7700_CLK_DDRT0_P2_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1093  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1094  				interrupts = <437>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1095  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1096  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1097  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1098  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1099  				portsel = "ddr0_p2_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1100  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1101  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1102  			sysnoc_packet_ddr1_p1_req_probe@52001000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1103  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1104  				reg = <0 0x52001000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1105  				clocks = <&d0_clock EIC7700_CLK_DDRT1_P1_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1106  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1107  				interrupts = <435>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1108  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1109  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1110  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1111  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1112  				portsel = "ddr1_p1_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1113  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1114  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1115  			sysnoc_packet_ddr1_p2_req_probe@52001800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1116  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1117  				reg = <0 0x52001800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1118  				clocks = <&d0_clock EIC7700_CLK_DDRT1_P2_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1119  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1120  				interrupts = <433>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1121  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1122  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1123  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1124  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1125  				portsel = "ddr1_p2_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1126  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1127  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1128  			sysnoc_trans_probe_0@52002000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1129  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1130  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1131  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1132  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1133  				reg = <0 0x52002000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1134  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1135  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1136  				interrupts = <430>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1137  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1138  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1139  				filter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1140  				counter,nr = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1141  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1142  				portsel = "dspt_snoc", "npu_sp1";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1143  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1144  				sysnoc_trans_dspt_filter@52002E00 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1145  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1146  					reg = <0 0x52002E00 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1147  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1148  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1149  				sysnoc_trans_npu_sp1_filter@52002F80 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1150  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1151  					reg = <0 0x52002F80 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1152  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1153  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1154  				sysnoc_trans_profiler@52003180 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1155  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1156  					reg = <0 0x52003180 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1157  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1158  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1159  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1160  			sysnoc_trans_probe_1@52002400 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1161  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1162  				reg = <0 0x52002400 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1163  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1164  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1165  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1166  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1167  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1168  				interrupts = <429>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1169  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1170  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1171  				filter,nr = <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1172  				counter,nr = <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1173  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1174  				portsel = "mcput_mp", "mcput_sp1", "tcu";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1175  				sysnoc_trans_mcput_mp_filter@52002E80 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1176  					status = "okay";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1177  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1178  					reg = <0 0x52002E80 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1179  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1180  				sysnoc_trans_mcput_sp1_filter@52002F00 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1181  					status = "okay";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1182  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1183  					reg = <0 0x52002F00 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1184  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1185  				sysnoc_trans_tcu_filter@52003100 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1186  					status = "okay";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1187  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1188  					reg = <0 0x52003100 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1189  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1190  				sysnoc_trans_profiler@52003200 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1191  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1192  					reg = <0 0x52003200 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1193  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1194  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1195  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1196  			sysnoc_trans_probe_2@52002800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1197  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1198  				reg = <0 0x52002800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1199  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1200  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1201  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1202  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1203  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1204  				interrupts = <428>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1205  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1206  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1207  				filter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1208  				counter,nr = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1209  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1210  				portsel = "spislv_tbu3", "tbu4_snoc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1211  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1212  				sysnoc_trans_spislv_tbu3_filter@52003000 {	/*pcie subsys*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1213  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1214  					reg = <0 0x52003000 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1215  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1216  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1217  				sysnoc_trans_tbu4_filter@52003080 {	/*aon subsys*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1218  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1219  					reg = <0 0x52003080 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1220  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1221  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1222  				sysnoc_trans_profiler@52003280 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1223  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1224  					reg = <0 0x52003280 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1225  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1226  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1227  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1228  			ErrorLogger0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1229  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1230  				offset,length = <0x14>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1231  				description = "Register 0 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1232  				lock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1233  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1234  					offset,length = <0>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1235  					lut = "Not Locked", "Locked";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1236  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1237  				OpCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1238  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1239  					offset,length = <1>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1240  					lut = "RD: data read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1241  					      "RDW: data read with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1242  					      "RDL: allocates monitor in the Target with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1243  					      "RDX: exclusive read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1244  					      "WR: data write with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1245  					      "WRW: data write with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1246  					      "WRC: conditional write if matching monitor in Target is found",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1247  					      "RSV: reserved",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1248  					      "PRE: preamble packet of linked sequence (locked sequence)",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1249  					      "URG: urgency packet used for QoS (status must be REQ)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1250  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1251  				ErrCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1252  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1253  					offset,length = <8>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1254  					lut = "SLV (error source: Target): error detected by the Slave without any information or no Error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1255  					      "DEC (error source: Initiator NIU): decode error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1256  					      "UNS (error source: Target NIU): unsupported access type",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1257  					      "DISC (error source: Power Disconnect): disconnected Target or NoC domain",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1258  					      "SEC (error source: Initiator NIU or Firewall): security error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1259  					      "HIDE (error source: Firewall): hidden security error. Will be reported as OK to the initiator",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1260  					      "TMO (error source: Target NIU): time-out",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1261  					      "RSV: reserved";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1262  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1263  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1264  				Len1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1265  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1266  					offset,length = <16>, <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1267  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1268  				Format {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1269  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1270  					offset,length = <31>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1271  					lut = "NTTP v3.0 (Invalid)", "NTTP v3.5 (Ok)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1272  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1273  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1274  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1275  			ErrorLogger1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1276  				compatible = "eswin,eic7700,register", "eswin,eic7700,noc,filter,routeid";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1277  				offset,length = <0x18>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1278  				description = "Register 1 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1279  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1280  				InitFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1281  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1282  					offset,length = <19>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1283  					lut = "aon_snoc_sp0/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1284  					      "dspt_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1285  					      "jtag_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1286  					      "mcput_snoc_d2d/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1287  					      "mcput_snoc_mp/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1288  					      "mcput_snoc_sp0/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1289  					      "mcput_snoc_sp1/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1290  					      "mnoc_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1291  					      "npu_snoc_sp0/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1292  					      "npu_snoc_sp1/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1293  					      "pciet_snoc_p/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1294  					      "rnoc_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1295  					      "spislv_tbu3_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1296  					      "tbu4_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1297  					      "tcu_snoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1298  					      "RESERVED0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1299  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1300  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1301  				TargetFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1302  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1303  					offset,length = <15>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1304  					lut = "snoc_aon/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1305  					      "snoc_cnoc/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1306  					      "snoc_ddrt0_p1/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1307  					      "snoc_ddrt0_p2/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1308  					      "snoc_ddrt1_p1/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1309  					      "snoc_ddrt1_p2/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1310  					      "snoc_dspt/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1311  					      "snoc_lnoc/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1312  					      "snoc_mcput_d2d/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1313  					      "snoc_mnoc/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1314  					      "snoc_npu/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1315  					      "snoc_pciet/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1316  					      "snoc_rnoc/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1317  					      "snoc_service/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1318  					      "RESERVED1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1319  					      "RESERVED2";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1320  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1321  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1322  				TargetSubRange {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1323  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1324  					offset,length = <9>, <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1325  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1326  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1327  				SeqId {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1328  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1329  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1330  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1331  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1332  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1333  			ErrorLogger3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1334  				/* This register does not really include a bitfield or its bitfield is 32 bits and it provides an offset address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1335  				/* To calculate the absolute address, you must use the initflow:targetflow:subrange from ErrorLogger1 register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1336  				/* And use it as an index in the aperture table. Then you must add the value of this register to the value given */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1337  				/* by the table to get the absolute address. */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1338  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1339  				offset,length = <0x20>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1340  				description = "Register 3 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1341  				aperture-link = <1>; /* link to ErrorLogger whose information are required to calculate real absolute address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1342  				msb-link = <4>; /*indicate which ErrorLogger contains the msb addrs, -1 means no*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1343  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1344  				AbsoluteAddress {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1345  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1346  					offset,length = <9>, <14>;	/* bitfield initflow:targeflow:subrange from aperture-link register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1347  					aperture-size= < 1181 >;	/* Number of line in the aperture table below */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1348  					aperture-idx,aperture-base =	/* Aperture_idx is concatenation of initflow:targetflow:subrange bitfield from ErrorLogger1 */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1349  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1350  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1351  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1352  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1353  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1354  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1355  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1356  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1357  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1358  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1359  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1360  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1361  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1362  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1363  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1364  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1365  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_cnoc_T_O      0x10            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1366  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1367  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1368  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1369  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1370  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1371  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1372  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1373  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1374  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x2             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1375  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x3             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1376  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x4             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1377  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x5             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1378  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x6             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1379  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x7             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1380  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x8             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1381  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x9             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1382  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1383  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1384  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xc             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1385  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xd             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1386  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1387  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1388  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1389  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1390  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1391  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1392  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1393  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1394  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1395  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1396  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1397  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1398  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1399  						/bits/ 64  <aon_snoc_sp0_I_O     snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1400  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1401  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1402  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1403  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1404  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x4             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1405  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x5             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1406  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x6             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1407  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x7             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1408  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x8             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1409  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0x9             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1410  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0xa             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1411  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0xb             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1412  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0xc             0x14004000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1413  						/bits/ 64  <dspt_snoc_I_O        snoc_aon_T_O       0xd             0x1400c000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1414  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1415  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1416  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1417  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1418  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1419  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1420  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1421  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1422  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1423  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1424  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1425  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1426  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1427  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1428  						/bits/ 64  <dspt_snoc_I_O        snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1429  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1430  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1431  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1432  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1433  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1434  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1435  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1436  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1437  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1438  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1439  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1440  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1441  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1442  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1443  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1444  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1445  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1446  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1447  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1448  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1449  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1450  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1451  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1452  						/bits/ 64  <dspt_snoc_I_O        snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1453  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1454  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1455  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1456  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1457  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1458  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1459  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1460  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1461  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1462  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1463  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1464  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1465  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1466  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1467  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1468  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1469  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1470  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1471  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1472  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1473  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1474  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1475  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1476  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1477  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1478  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1479  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1480  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1481  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1482  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1483  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1484  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1485  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1486  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1487  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1488  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1489  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1490  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1491  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1492  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1493  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1494  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1495  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1496  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1497  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1498  						/bits/ 64  <dspt_snoc_I_O        snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1499  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1500  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1501  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1502  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1503  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1504  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1505  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1506  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1507  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1508  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1509  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1510  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1511  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1512  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1513  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1514  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1515  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1516  						/bits/ 64  <dspt_snoc_I_O        snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1517  						/bits/ 64  <dspt_snoc_I_O        snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1518  						/bits/ 64  <dspt_snoc_I_O        snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1519  						/bits/ 64  <dspt_snoc_I_O        snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1520  						/bits/ 64  <dspt_snoc_I_O        snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1521  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1522  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1523  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1524  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1525  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1526  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1527  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1528  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1529  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1530  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1531  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1532  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1533  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1534  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1535  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1536  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1537  						/bits/ 64  <jtag_snoc_I_O        snoc_cnoc_T_O      0x10            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1538  						/bits/ 64  <jtag_snoc_I_O        snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1539  						/bits/ 64  <jtag_snoc_I_O        snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1540  						/bits/ 64  <jtag_snoc_I_O        snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1541  						/bits/ 64  <jtag_snoc_I_O        snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1542  						/bits/ 64  <jtag_snoc_I_O        snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1543  						/bits/ 64  <jtag_snoc_I_O        snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1544  						/bits/ 64  <jtag_snoc_I_O        snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1545  						/bits/ 64  <jtag_snoc_I_O        snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1546  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1547  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1548  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1549  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1550  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x4             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1551  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x5             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1552  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x6             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1553  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x7             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1554  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x8             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1555  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0x9             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1556  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0xa             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1557  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0xb             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1558  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0xc             0x14004000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1559  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_aon_T_O       0xd             0x1400c000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1560  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1561  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1562  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1563  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1564  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1565  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1566  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1567  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1568  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1569  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1570  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1571  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1572  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1573  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1574  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1575  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1576  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1577  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1578  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1579  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1580  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1581  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1582  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1583  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1584  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1585  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1586  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1587  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1588  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1589  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1590  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1591  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1592  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1593  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1594  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1595  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1596  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1597  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1598  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1599  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1600  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1601  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1602  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1603  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1604  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1605  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1606  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1607  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1608  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1609  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1610  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1611  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1612  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1613  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1614  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1615  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1616  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1617  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1618  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1619  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1620  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1621  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1622  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1623  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1624  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1625  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1626  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1627  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1628  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1629  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1630  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1631  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1632  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1633  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1634  						/bits/ 64  <mcput_snoc_d2d_I_O   snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1635  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1636  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1637  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1638  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1639  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1640  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1641  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x6             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1642  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt0_p1_T_O  0x7             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1643  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1644  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1645  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1646  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1647  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1648  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1649  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x6             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1650  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_ddrt1_p1_T_O  0x7             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1651  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1652  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1653  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1654  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1655  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1656  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1657  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x6             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1658  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x7             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1659  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x8             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1660  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0x9             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1661  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0xa             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1662  						/bits/ 64  <mcput_snoc_mp_I_O    snoc_npu_T_O       0xb             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1663  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1664  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1665  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1666  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1667  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1668  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1669  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x6             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1670  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_aon_T_O       0x7             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1671  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1672  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1673  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1674  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1675  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1676  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1677  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1678  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1679  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1680  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1681  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1682  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1683  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1684  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1685  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1686  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1687  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1688  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1689  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1690  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1691  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1692  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1693  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1694  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x2             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1695  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x3             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1696  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x4             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1697  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x5             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1698  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x6             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1699  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x7             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1700  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x8             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1701  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0x9             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1702  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1703  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1704  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0xc             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1705  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mcput_d2d_T_O 0xd             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1706  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1707  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1708  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1709  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1710  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1711  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1712  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1713  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1714  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1715  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1716  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1717  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1718  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1719  						/bits/ 64  <mcput_snoc_sp0_I_O   snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1720  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1721  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1722  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1723  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1724  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x4             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1725  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x5             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1726  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x6             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1727  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x7             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1728  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x8             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1729  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0x9             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1730  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xa             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1731  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xb             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1732  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xc             0x14004000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1733  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xd             0x1400c000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1734  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1735  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_aon_T_O       0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1736  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1737  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1738  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1739  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1740  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1741  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1742  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1743  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1744  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1745  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1746  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1747  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1748  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1749  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1750  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1751  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1752  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1753  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1754  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1755  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1756  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1757  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1758  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1759  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1760  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1761  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1762  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1763  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1764  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1765  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1766  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1767  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1768  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1769  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1770  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1771  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1772  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1773  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1774  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1775  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1776  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1777  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1778  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1779  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1780  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1781  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1782  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1783  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1784  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1785  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1786  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1787  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1788  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1789  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1790  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1791  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1792  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1793  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1794  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1795  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1796  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1797  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1798  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1799  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1800  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1801  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1802  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1803  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1804  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1805  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1806  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1807  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1808  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1809  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1810  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1811  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1812  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1813  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1814  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1815  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1816  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1817  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1818  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1819  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1820  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1821  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1822  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1823  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1824  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1825  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1826  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1827  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1828  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1829  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1830  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1831  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1832  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1833  						/bits/ 64  <mcput_snoc_sp1_I_O   snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1834  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1835  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1836  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1837  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1838  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1839  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1840  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1841  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1842  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1843  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1844  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1845  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1846  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1847  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1848  						/bits/ 64  <mnoc_snoc_I_O        snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1849  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1850  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1851  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1852  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1853  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1854  						/bits/ 64  <mnoc_snoc_I_O        snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1855  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1856  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1857  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1858  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1859  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1860  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1861  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1862  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1863  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1864  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1865  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1866  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1867  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1868  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1869  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1870  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1871  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1872  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1873  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1874  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1875  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1876  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1877  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1878  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1879  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1880  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1881  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1882  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1883  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1884  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1885  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1886  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1887  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1888  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1889  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1890  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1891  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1892  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1893  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1894  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1895  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1896  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1897  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1898  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1899  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1900  						/bits/ 64  <mnoc_snoc_I_O        snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1901  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1902  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1903  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1904  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1905  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1906  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1907  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1908  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1909  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1910  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1911  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1912  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1913  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1914  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1915  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1916  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1917  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1918  						/bits/ 64  <mnoc_snoc_I_O        snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1919  						/bits/ 64  <mnoc_snoc_I_O        snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1920  						/bits/ 64  <mnoc_snoc_I_O        snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1921  						/bits/ 64  <mnoc_snoc_I_O        snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1922  						/bits/ 64  <mnoc_snoc_I_O        snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1923  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1924  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1925  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1926  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1927  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1928  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1929  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x6             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1930  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_aon_T_O       0x7             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1931  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1932  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1933  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1934  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1935  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1936  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1937  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1938  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1939  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1940  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1941  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1942  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1943  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1944  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1945  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1946  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1947  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_cnoc_T_O      0x10            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1948  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1949  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1950  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1951  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1952  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1953  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1954  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1955  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1956  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x2             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1957  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x3             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1958  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x4             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1959  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x5             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1960  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x6             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1961  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x7             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1962  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x8             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1963  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0x9             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1964  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1965  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1966  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xc             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1967  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mcput_d2d_T_O 0xd             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1968  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1969  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1970  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1971  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1972  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1973  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1974  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1975  						/bits/ 64  <npu_snoc_sp0_I_O     snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1976  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1977  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1978  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1979  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1980  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x4             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1981  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x5             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1982  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x6             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1983  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x7             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1984  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x8             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1985  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0x9             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1986  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xa             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1987  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xb             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1988  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xc             0x14004000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1989  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xd             0x1400c000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1990  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1991  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_aon_T_O       0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1992  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1993  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1994  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1995  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1996  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1997  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1998  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  1999  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2000  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2001  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2002  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2003  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2004  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2005  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2006  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2007  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2008  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2009  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2010  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2011  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2012  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2013  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2014  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2015  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2016  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2017  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2018  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2019  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2020  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2021  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2022  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2023  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2024  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2025  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2026  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2027  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2028  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2029  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2030  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2031  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2032  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2033  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2034  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2035  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2036  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2037  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2038  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2039  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2040  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2041  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2042  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2043  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2044  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2045  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2046  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2047  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2048  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2049  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2050  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2051  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2052  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2053  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2054  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2055  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2056  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2057  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2058  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2059  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2060  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2061  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2062  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2063  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2064  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2065  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2066  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2067  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2068  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2069  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2070  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2071  						/bits/ 64  <npu_snoc_sp1_I_O     snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2072  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2073  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2074  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2075  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2076  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2077  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2078  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2079  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2080  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2081  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2082  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2083  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2084  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2085  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2086  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2087  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0xf             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2088  						/bits/ 64  <pciet_snoc_p_I_O     snoc_cnoc_T_O      0x10            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2089  						/bits/ 64  <pciet_snoc_p_I_O     snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2090  						/bits/ 64  <pciet_snoc_p_I_O     snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2091  						/bits/ 64  <pciet_snoc_p_I_O     snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2092  						/bits/ 64  <pciet_snoc_p_I_O     snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2093  						/bits/ 64  <pciet_snoc_p_I_O     snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2094  						/bits/ 64  <pciet_snoc_p_I_O     snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2095  						/bits/ 64  <pciet_snoc_p_I_O     snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2096  						/bits/ 64  <pciet_snoc_p_I_O     snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2097  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2098  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2099  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2100  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2101  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2102  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2103  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2104  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2105  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2106  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2107  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2108  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2109  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2110  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2111  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2112  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2113  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2114  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2115  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x12            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2116  						/bits/ 64  <rnoc_snoc_I_O        snoc_npu_T_O       0x13            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2117  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x0             0x520c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2118  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x1             0x720c0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2119  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x2             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2120  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x3             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2121  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x4             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2122  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x5             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2123  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x6             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2124  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x7             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2125  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x8             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2126  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0x9             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2127  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0xa             0x5c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2128  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0xb             0x7c000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2129  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0xc             0x14004000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2130  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_aon_T_O       0xd             0x1400c000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2131  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x0             0x52060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2132  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x1             0x72060000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2133  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x2             0x52100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2134  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x3             0x52200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2135  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x4             0x52300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2136  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x5             0x72100000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2137  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x6             0x72200000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2138  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x7             0x72300000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2139  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x8             0x53000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2140  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0x9             0x73000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2141  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0xa             0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2142  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0xb             0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2143  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0xc             0x54000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2144  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0xd             0x74000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2145  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_cnoc_T_O      0xe             0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2146  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2147  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2148  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2149  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2150  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2151  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2152  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2153  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2154  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2155  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2156  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2157  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2158  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2159  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2160  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2161  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2162  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2163  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2164  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2165  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2166  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2167  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2168  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2169  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2170  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2171  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2172  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2173  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2174  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2175  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2176  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_lnoc_T_O      0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2177  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_lnoc_T_O      0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2178  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2179  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2180  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2181  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2182  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2183  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2184  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2185  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2186  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2187  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2188  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2189  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2190  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2191  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2192  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2193  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2194  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2195  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2196  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2197  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2198  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2199  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2200  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2201  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2202  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2203  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2204  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2205  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2206  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2207  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2208  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2209  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2210  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2211  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2212  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2213  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2214  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2215  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2216  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2217  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2218  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2219  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2220  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2221  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2222  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2223  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2224  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mnoc_T_O      0x0             0x52020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2225  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_mnoc_T_O      0x1             0x72020000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2226  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2227  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2228  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2229  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2230  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2231  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2232  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2233  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2234  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2235  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2236  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2237  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2238  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2239  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2240  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2241  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2242  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2243  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2244  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_rnoc_T_O      0x0             0x52040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2245  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_rnoc_T_O      0x1             0x72040000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2246  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_service_T_O   0x0             0x52000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2247  						/bits/ 64  <spislv_tbu3_snoc_I_O snoc_service_T_O   0x1             0x72000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2248  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2249  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2250  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2251  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2252  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2253  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2254  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2255  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2256  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2257  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2258  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2259  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2260  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2261  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2262  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2263  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2264  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2265  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2266  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2267  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2268  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2269  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2270  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2271  						/bits/ 64  <tbu4_snoc_I_O        snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2272  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2273  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2274  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2275  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2276  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2277  						/bits/ 64  <tbu4_snoc_I_O        snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2278  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2279  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2280  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2281  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2282  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2283  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2284  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2285  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2286  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2287  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2288  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2289  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2290  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2291  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2292  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2293  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2294  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2295  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2296  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2297  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2298  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2299  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2300  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2301  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2302  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2303  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2304  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2305  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2306  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2307  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2308  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2309  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2310  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2311  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2312  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2313  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2314  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2315  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2316  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2317  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2318  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2319  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2320  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2321  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2322  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2323  						/bits/ 64  <tbu4_snoc_I_O        snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2324  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2325  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2326  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2327  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2328  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2329  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2330  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2331  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2332  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2333  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2334  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2335  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2336  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2337  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2338  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2339  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2340  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2341  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2342  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x12            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2343  						/bits/ 64  <tbu4_snoc_I_O        snoc_npu_T_O       0x13            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2344  						/bits/ 64  <tbu4_snoc_I_O        snoc_pciet_T_O     0x0             0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2345  						/bits/ 64  <tbu4_snoc_I_O        snoc_pciet_T_O     0x1             0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2346  						/bits/ 64  <tbu4_snoc_I_O        snoc_pciet_T_O     0x2             0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2347  						/bits/ 64  <tbu4_snoc_I_O        snoc_pciet_T_O     0x3             0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2348  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x0             0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2349  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x1             0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2350  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x2             0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2351  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x3             0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2352  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x4             0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2353  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x5             0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2354  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x6             0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2355  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x7             0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2356  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x8             0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2357  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0x9             0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2358  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0xa             0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2359  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt0_p2_T_O  0xb             0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2360  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x0             0x80000080        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2361  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x1             0x100000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2362  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x2             0x200000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2363  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x3             0x400000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2364  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x4             0x800000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2365  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x5             0x2000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2366  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x6             0xc000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2367  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x7             0xe000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2368  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x8             0x4000000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2369  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0x9             0x4000000180      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2370  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0xa             0x10000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2371  						/bits/ 64  <tcu_snoc_I_O         snoc_ddrt1_p2_T_O  0xb             0x10000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2372  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x0             0x520e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2373  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x1             0x720e0000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2374  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x2             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2375  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x3             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2376  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x4             0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2377  						/bits/ 64  <tcu_snoc_I_O         snoc_dspt_T_O      0x5             0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2378  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x0             0x58400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2379  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1             0x78400000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2380  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x2             0x14000400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2381  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x3             0x14008400000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2382  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x4             0x58800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2383  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x5             0x78800000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2384  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x6             0x14000800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2385  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x7             0x14008800000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2386  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x8             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2387  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x9             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2388  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xa             0x5b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2389  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xb             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2390  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xc             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2391  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xd             0x7b000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2392  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xe             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2393  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0xf             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2394  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x10            0x14003000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2395  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x11            0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2396  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x12            0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2397  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x13            0x1400b000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2398  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x14            0x50000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2399  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x15            0x70000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2400  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x16            0x40000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2401  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x17            0x60000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2402  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x18            0x80000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2403  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x19            0x100000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2404  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1a            0x200000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2405  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1b            0x400000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2406  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1c            0x800000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2407  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1d            0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2408  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1e            0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2409  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x1f            0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2410  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x20            0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2411  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x21            0x2000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2412  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x22            0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2413  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x23            0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2414  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x24            0xc000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2415  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x25            0xe000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2416  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x26            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2417  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x27            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2418  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x28            0x4000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2419  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x29            0x4000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2420  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x2a            0x8000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2421  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x2b            0xa000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2422  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x2c            0x10000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2423  						/bits/ 64  <tcu_snoc_I_O         snoc_mcput_d2d_T_O 0x2d            0x10000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2424  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x0             0x52080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2425  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x1             0x72080000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2426  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x2             0x59000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2427  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x3             0x5a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2428  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x4             0x79000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2429  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x5             0x7a000000        >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2430  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x6             0x14001000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2431  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x7             0x14002000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2432  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x8             0x14009000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2433  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x9             0x1400a000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2434  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xa             0x1800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2435  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xb             0x3800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2436  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xc             0xd800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2437  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xd             0xf800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2438  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xe             0x7000000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2439  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0xf             0x7000000100      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2440  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x10            0x13000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2441  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x11            0x13000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2442  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x12            0x0               >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2443  						/bits/ 64  <tcu_snoc_I_O         snoc_npu_T_O       0x13            0x0               >;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2444  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2445  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2446  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2447  			ErrorLogger4 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2448  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2449  				offset,length = <0x24>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2450  				description = "Register 4 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2451  				addr_msb {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2452  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2453  					description = "Stores NTTP packet header field Addr (MSBs) of the logged error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2454  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2455  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2456  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2457  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2458  			ErrorLogger5 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2459  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2460  				offset,length = <0x28>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2461  				description = "Register 5 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2462  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2463  				User_flag {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2464  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2465  					offset,length = <0x0>, <18>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2466  					lut =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2467  						"Cache_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2468  						"Cache_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2469  						"Cache_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2470  						"Cache_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2471  						"Prot_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2472  						"Prot_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2473  						"Prot_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2474  						"User_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2475  						"User_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2476  						"User_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2477  						"User_3 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2478  						"User_4 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2479  						"User_5 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2480  						"User_6 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2481  						"qos0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2482  						"qos1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2483  						"qos2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2484  						"qos3";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2485  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2486  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2487  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2488  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2489  		d0_media_noc: d0_media_noc@52021400 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2490  			compatible = "eswin,eic7700-noc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2491  			reg = <0 0x52021400 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2492  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2493  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2494  			ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2495  			interrupts = <454>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2496  			interrupt-names = "error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2497  			interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2498  			errlogger,idx = <0 1 3 4 5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2499  			eswin,qos-configs = "GPU", "TBU2", "VC";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2500  			eswin,GPU-qos-base = <0x52021480>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2501  			eswin,GPU-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2502  				0x8 0x4        /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2503  				0xC 0x2        /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2504  				0x10 0x1E0    /* bandwidth*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2505  				0x14 0x1     /* saturation*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2506  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2507  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2508  			eswin,TBU2-qos-base = <0x52021500>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2509  			eswin,TBU2-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2510  				0x8 0x4      /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2511  				0xC 0x2      /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2512  				0x10 0x18    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2513  				0x14 0x10    /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2514  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2515  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2516  			eswin,VC-qos-base = <0x52021580>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2517  			eswin,VC-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2518  				0x8 0x4      /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2519  				0xC 0x2      /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2520  				0x10 0x18    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2521  				0x14 0x10    /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2522  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2523  			sideband_manager@52022000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2524  				compatible = "eswin,win2xxx-noc-sideband-manager";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2525  				reg = <0 0x52022000 0 0x10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2526  				SenseIn0 =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2527  					<SBM_MNOC_GPU 	OFFSET0>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2528  					<SBM_MNOC_TBU2 	OFFSET1>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2529  					<SBM_MNOC_VC 	OFFSET2>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2530  					<SBM_MNOC_DDRT0_P3 	OFFSET3>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2531  					<SBM_MNOC_DDRT1_P3 	OFFSET4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2532  				bf-name =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2533  					"SBM_MNOC_GPU",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2534  					"SBM_MNOC_TBU2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2535  					"SBM_MNOC_VC",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2536  					"SBM_MNOC_DDRT0_P3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2537  					"SBM_MNOC_DDRT1_P3";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2538  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2539  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2540  			mnoc_packet_ddr0_p3_req_probe@52020000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2541  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2542  				reg = <0 0x52020000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2543  				clocks = <&d0_clock EIC7700_CLK_DDRT0_P3_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2544  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2545  				interrupts = <458>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2546  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2547  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2548  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2549  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2550  				portsel = "ddr0_p3_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2551  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2552  			mnoc_packet_ddr1_p3_req_probe@52020800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2553  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2554  				reg = <0 0x52020800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2555  				clocks = <&d0_clock EIC7700_CLK_DDRT1_P3_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2556  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2557  				interrupts = <456>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2558  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2559  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2560  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2561  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2562  				portsel = "ddr1_p3_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2563  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2564  			mnoc_trans_probe@52021000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2565  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2566  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2567  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2568  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2569  				reg = <0 0x52021000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2570  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2571  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2572  				interrupts = <453>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2573  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2574  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2575  				filter,nr = <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2576  				counter,nr = <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2577  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2578  				portsel = "gpu", "tbu2", "vc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2579  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2580  				mnoc_trans_gpu_filter@52021600 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2581  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2582  					reg = <0 0x52021600 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2583  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2584  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2585  				mnoc_trans_tbu2_filter@52021680 {	/*hsp subsys*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2586  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2587  					reg = <0 0x52021680 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2588  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2589  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2590  				mnoc_trans_vc_filter@52021700 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2591  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2592  					reg = <0 0x52021700 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2593  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2594  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2595  				mnoc_trans_profiler@52021780 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2596  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2597  					reg = <0 0x52021780 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2598  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2599  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2600  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2601  			ErrorLogger0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2602  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2603  				offset,length = <0x14>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2604  				description = "Register 0 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2605  				lock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2606  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2607  					offset,length = <0>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2608  					lut = "Not Locked", "Locked";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2609  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2610  				OpCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2611  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2612  					offset,length = <1>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2613  					lut = "RD: data read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2614  					      "RDW: data read with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2615  					      "RDL: allocates monitor in the Target with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2616  					      "RDX: exclusive read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2617  					      "WR: data write with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2618  					      "WRW: data write with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2619  					      "WRC: conditional write if matching monitor in Target is found",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2620  					      "RSV: reserved",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2621  					      "PRE: preamble packet of linked sequence (locked sequence)",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2622  					      "URG: urgency packet used for QoS (status must be REQ)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2623  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2624  				ErrCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2625  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2626  					offset,length = <8>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2627  					lut = "SLV (error source: Target): error detected by the Slave without any information or no Error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2628  					      "DEC (error source: Initiator NIU): decode error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2629  					      "UNS (error source: Target NIU): unsupported access type",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2630  					      "DISC (error source: Power Disconnect): disconnected Target or NoC domain",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2631  					      "SEC (error source: Initiator NIU or Firewall): security error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2632  					      "HIDE (error source: Firewall): hidden security error. Will be reported as OK to the initiator",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2633  					      "TMO (error source: Target NIU): time-out",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2634  					      "RSV: reserved";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2635  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2636  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2637  				Len1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2638  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2639  					offset,length = <16>, <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2640  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2641  				Format {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2642  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2643  					offset,length = <31>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2644  					lut = "NTTP v3.0 (Invalid)", "NTTP v3.5 (Ok)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2645  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2646  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2647  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2648  			ErrorLogger1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2649  				compatible = "eswin,eic7700,register", "eswin,eic7700,noc,filter,routeid";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2650  				offset,length = <0x18>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2651  				description = "Register 1 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2652  				InitFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2653  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2654  					offset,length = <14>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2655  					lut = "gpu_mnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2656  					      "snoc_mnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2657  					      "tbu2_mnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2658  					      "vc_mnoc/I/0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2659  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2660  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2661  				TargetFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2662  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2663  					offset,length = <12>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2664  					lut = "mnoc_ddrt0_p3/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2665  					      "mnoc_ddrt1_p3/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2666  					      "mnoc_service/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2667  					      "mnoc_snoc/T/0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2668  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2669  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2670  				TargetSubRange {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2671  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2672  					offset,length = <9>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2673  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2674  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2675  				SeqId {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2676  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2677  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2678  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2679  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2680  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2681  			ErrorLogger3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2682  				/* This register does not really include a bitfield or its bitfield is 32 bits and it provides an offset address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2683  				/* To calculate the absolute address, you must use the initflow:targetflow:subrange from ErrorLogger1 register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2684  				/* And use it as an index in the aperture table. Then you must add the value of this register to the value given */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2685  				/* by the table to get the absolute address. */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2686  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2687  				offset,length = <0x20>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2688  				description = "Register 3 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2689  				aperture-link = <1>; /* link to ErrorLogger whose information are required to calculate real absolute address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2690  				msb-link = <4>; /*indicate which ErrorLogger contains the msb addrs, -1 means no*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2691  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2692  				AbsoluteAddress {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2693  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2694  					offset,length = <9>, <7>;	/* bitfield initflow:targeflow:subrange from aperture-link register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2695  					aperture-size= < 55 >;		/* Number of line in the aperture table below */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2696  					aperture-idx,aperture-base =	/* Aperture_idx is concatenation of initflow:targetflow:subrange bitfield from ErrorLogger1 */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2697  						/bits/ 64  <0x0  0x0 0x0           0x80000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2698  						/bits/ 64  <0x0  0x0 0x1           0x100000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2699  						/bits/ 64  <0x0  0x0 0x2           0x200000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2700  						/bits/ 64  <0x0  0x0 0x3           0x400000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2701  						/bits/ 64  <0x0  0x0 0x4           0x800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2702  						/bits/ 64  <0x0  0x0 0x5           0x2000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2703  						/bits/ 64  <0x0  0x0 0x6           0x4000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2704  						/bits/ 64  <0x0  0x0 0x7           0x4000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2705  						/bits/ 64  <0x0  0x1 0x0           0x80000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2706  						/bits/ 64  <0x0  0x1 0x1           0x100000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2707  						/bits/ 64  <0x0  0x1 0x2           0x200000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2708  						/bits/ 64  <0x0  0x1 0x3           0x400000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2709  						/bits/ 64  <0x0  0x1 0x4           0x800000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2710  						/bits/ 64  <0x0  0x1 0x5           0x2000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2711  						/bits/ 64  <0x0  0x1 0x6           0x4000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2712  						/bits/ 64  <0x0  0x1 0x7           0x4000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2713  						/bits/ 64  <0x0  0x3 0x0           0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2714  						/bits/ 64  <0x1 0x2  0x0           0x52020000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2715  						/bits/ 64  <0x1 0x2  0x1           0x72020000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2716  						/bits/ 64  <0x1 0x2  0x2           0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2717  						/bits/ 64  <0x1 0x2  0x3           0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2718  						/bits/ 64  <0x2 0x0 0x0           0x80000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2719  						/bits/ 64  <0x2 0x0 0x1           0x100000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2720  						/bits/ 64  <0x2 0x0 0x2           0x200000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2721  						/bits/ 64  <0x2 0x0 0x3           0x400000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2722  						/bits/ 64  <0x2 0x0 0x4           0x800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2723  						/bits/ 64  <0x2 0x0 0x5           0x2000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2724  						/bits/ 64  <0x2 0x0 0x6           0x4000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2725  						/bits/ 64  <0x2 0x0 0x7           0x4000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2726  						/bits/ 64  <0x2 0x1 0x0           0x80000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2727  						/bits/ 64  <0x2 0x1 0x1           0x100000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2728  						/bits/ 64  <0x2 0x1 0x2           0x200000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2729  						/bits/ 64  <0x2 0x1 0x3           0x400000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2730  						/bits/ 64  <0x2 0x1 0x4           0x800000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2731  						/bits/ 64  <0x2 0x1 0x5           0x2000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2732  						/bits/ 64  <0x2 0x1 0x6           0x4000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2733  						/bits/ 64  <0x2 0x1 0x7           0x4000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2734  						/bits/ 64  <0x2 0x3   0x0           0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2735  						/bits/ 64  <0x3   0x0 0x0           0x80000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2736  						/bits/ 64  <0x3   0x0 0x1           0x100000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2737  						/bits/ 64  <0x3   0x0 0x2           0x200000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2738  						/bits/ 64  <0x3   0x0 0x3           0x400000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2739  						/bits/ 64  <0x3   0x0 0x4           0x800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2740  						/bits/ 64  <0x3   0x0 0x5           0x2000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2741  						/bits/ 64  <0x3   0x0 0x6           0x4000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2742  						/bits/ 64  <0x3   0x0 0x7           0x4000000100     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2743  						/bits/ 64  <0x3   0x1 0x0           0x80000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2744  						/bits/ 64  <0x3   0x1 0x1           0x100000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2745  						/bits/ 64  <0x3   0x1 0x2           0x200000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2746  						/bits/ 64  <0x3   0x1 0x3           0x400000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2747  						/bits/ 64  <0x3   0x1 0x4           0x800000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2748  						/bits/ 64  <0x3   0x1 0x5           0x2000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2749  						/bits/ 64  <0x3   0x1 0x6           0x4000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2750  						/bits/ 64  <0x3   0x1 0x7           0x4000000180     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2751  						/bits/ 64  <0x3   0x3 0x0           0x0              >;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2752  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2753  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2754  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2755  			ErrorLogger4 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2756  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2757  				offset,length = <0x24>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2758  				description = "Register 4 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2759  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2760  				addr_msb {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2761  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2762  					description = "Stores NTTP packet header field Addr (MSBs) of the logged error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2763  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2764  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2765  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2766  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2767  			ErrorLogger5 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2768  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2769  				offset,length = <0x28>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2770  				description = "Register 5 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2771  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2772  				User_flag {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2773  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2774  					offset,length = <0x0>, <18>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2775  					lut = "Cache_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2776  					      "Cache_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2777  					      "Cache_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2778  					      "Cache_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2779  					      "Prot_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2780  					      "Prot_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2781  					      "Prot_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2782  					      "User_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2783  					      "User_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2784  					      "User_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2785  					      "User_3 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2786  					      "User_4 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2787  					      "User_5 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2788  					      "User_6 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2789  					      "qos0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2790  					      "qos1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2791  					      "qos2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2792  					      "qos3";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2793  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2794  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2795  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2796  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2797  		d0_realtime_noc: d0_realtime_noc@52041400 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2798  			compatible = "eswin,eic7700-noc";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2799  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2800  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2801  			ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2802  			reg = <0 0x52041400 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2803  			interrupts = <448>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2804  			interrupt-names = "error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2805  			interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2806  			errlogger,idx = <0 1 3 4 5>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2807  			eswin,qos-configs = "TBU0", "VO";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2808  			eswin,TBU0-qos-base = <0x52041480>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2809  			eswin,TBU0-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2810  				0x8 0x4        /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2811  				0xC 0x2        /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2812  				0x10 0x1E0    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2813  				0x14 0x1     /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2814  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2815  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2816  			eswin,VO-qos-base = <0x52041500>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2817  			eswin,VO-qos-settings = <
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2818  				0x8 0x4      /* prio */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2819  				0xC 0x2      /* mode */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2820  				0x10 0x18    /* bandwidth */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2821  				0x14 0x10    /* saturation */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2822  				0x18 0x1>;   /* QoSEn */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2823  			sideband_manager@52042000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2824  				compatible = "eswin,win2xxx-noc-sideband-manager";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2825  				reg = <0 0x52042000 0 0x10>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2826  				SenseIn0 =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2827  					<SBM_RNOC_TBU0 	OFFSET0>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2828  					<SBM_RNOC_VO 	OFFSET1>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2829  					<SBM_RNOC_DDRT0_P4 	OFFSET2>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2830  					<SBM_RNOC_DDRT1_P4 	OFFSET3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2831  				bf-name =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2832  					"SBM_RNOC_TBU0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2833  					"SBM_RNOC_VO",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2834  					"SBM_RNOC_DDRT0_P4",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2835  					"SBM_RNOC_DDRT1_P4";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2836  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2837  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2838  			rnoc_packet_ddr0_p4_req_probe@52040000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2839  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2840  				reg = <0 0x52040000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2841  				clocks = <&d0_clock EIC7700_CLK_DDRT0_P4_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2842  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2843  				interrupts = <452>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2844  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2845  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2846  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2847  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2848  				portsel = "ddr0_p4_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2849  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2850  			rnoc_packet_ddr1_p4_req_probe@52040800 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2851  				compatible = "eswin,win2xxx-noc-packet-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2852  				reg = <0 0x52040800 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2853  				clocks = <&d0_clock EIC7700_CLK_DDRT1_P4_ACLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2854  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2855  				interrupts = <450>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2856  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2857  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2858  				filter,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2859  				counter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2860  				portsel = "ddr1_p4_req";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2861  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2862  			rnoc_trans_probe@52041000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2863  				#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2864  				#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2865  				ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2866  				compatible = "eswin,win2xxx-noc-trans-probe";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2867  				reg = <0 0x52041000 0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2868  				clocks = <&d0_clock EIC7700_CLK_NOC_NSP_CLK>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2869  				clock-names = "clk";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2870  				interrupts = <447>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2871  				interrupt-names = "stat";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2872  				interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2873  				filter,nr = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2874  				counter,nr = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2875  				profiler,nr = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2876  				portsel = "tbu0", "vo";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2877  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2878  				rnoc_trans_tbu0_filter@52041580 {	/*vi subsys*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2879  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2880  					reg = <0 0x52041580 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2881  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2882  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2883  				rnoc_trans_vo_filter@52041600 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2884  					compatible = "eswin,win2xxx-noc-trans-filter";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2885  					reg = <0 0x52041600 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2886  					status = "disabled";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2887  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2888  				rnoc_trans_profiler@52041680 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2889  					compatible = "eswin,win2xxx-noc-trans-profiler";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2890  					reg = <0 0x52041680 0 0x80>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2891  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2892  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2893  			ErrorLogger0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2894  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2895  				offset,length = <0x14>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2896  				description = "Register 0 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2897  				lock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2898  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2899  					offset,length = <0>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2900  					lut = "Not Locked", "Locked";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2901  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2902  				OpCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2903  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2904  					offset,length = <1>, <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2905  					lut = "RD: data read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2906  					      "RDW: data read with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2907  					      "RDL: allocates monitor in the Target with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2908  					      "RDX: exclusive read with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2909  					      "WR: data write with incrementing address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2910  					      "WRW: data write with wrapping address",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2911  					      "WRC: conditional write if matching monitor in Target is found",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2912  					      "RSV: reserved",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2913  					      "PRE: preamble packet of linked sequence (locked sequence)",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2914  					      "URG: urgency packet used for QoS (status must be REQ)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2915  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2916  				ErrCode {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2917  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2918  					offset,length = <8>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2919  					lut = "SLV (error source: Target): error detected by the Slave without any information or no Error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2920  					      "DEC (error source: Initiator NIU): decode error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2921  					      "UNS (error source: Target NIU): unsupported access type",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2922  					      "DISC (error source: Power Disconnect): disconnected Target or NoC domain",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2923  					      "SEC (error source: Initiator NIU or Firewall): security error",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2924  					      "HIDE (error source: Firewall): hidden security error. Will be reported as OK to the initiator",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2925  					      "TMO (error source: Target NIU): time-out",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2926  					      "RSV: reserved";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2927  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2928  				Len1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2929  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2930  					offset,length = <16>, <12>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2931  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2932  				Format {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2933  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2934  					offset,length = <31>, <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2935  					lut = "NTTP v3.0 (Invalid)", "NTTP v3.5 (Ok)";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2936  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2937  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2938  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2939  			ErrorLogger1 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2940  				compatible = "eswin,eic7700,register", "eswin,eic7700,noc,filter,routeid";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2941  				offset,length = <0x18>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2942  				description = "Register 1 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2943  				InitFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2944  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2945  					offset,length = <14>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2946  					lut = "snoc_rnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2947  					      "tbu0_rnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2948  					      "vo_rnoc/I/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2949  					      "RESERVED0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2950  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2951  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2952  				TargetFlow {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2953  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2954  					offset,length = <12>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2955  					lut = "rnoc_ddrt0_p4/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2956  					      "rnoc_ddrt1_p4/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2957  					      "rnoc_service/T/0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2958  					      "rnoc_snoc/T/0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2959  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2960  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2961  				TargetSubRange {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2962  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2963  					offset,length = <9>, <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2964  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2965  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2966  				SeqId {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2967  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2968  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2969  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2970  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2971  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2972  			ErrorLogger3 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2973  				/* This register does not really include a bitfield or its bitfield is 32 bits and it provides an offset address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2974  				/* To calculate the absolute address, you must use the initflow:targetflow:subrange from ErrorLogger1 register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2975  				/* And use it as an index in the aperture table. Then you must add the value of this register to the value given */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2976  				/* by the table to get the absolute address. */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2977  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2978  				offset,length = <0x20>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2979  				description = "Register 3 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2980  				aperture-link = <1>; /* link to ErrorLogger whose information are required to calculate real absolute address */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2981  				msb-link = <4>; /*indicate which ErrorLogger contains the msb addrs, -1 means no*/
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2982  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2983  				AbsoluteAddress {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2984  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2985  					offset,length = <9>, <7>;	/* bitfield initflow:targeflow:subrange from aperture-link register */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2986  					aperture-size= < 40 >;		/* Number of line in the aperture table below */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2987  					aperture-idx,aperture-base =	/* Aperture_idx is concatenation of initflow:targetflow:subrange bitfield from ErrorLogger1 */
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2988  						/bits/ 64  <0x0 0x2 0x0          0x52040000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2989  						/bits/ 64  <0x0 0x2 0x1          0x72040000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2990  						/bits/ 64  <0x0 0x2 0x2          0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2991  						/bits/ 64  <0x0 0x2 0x3          0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2992  						/bits/ 64  <0x1 0x0 0x0          0x80000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2993  						/bits/ 64  <0x1 0x0 0x1          0x100000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2994  						/bits/ 64  <0x1 0x0 0x2          0x200000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2995  						/bits/ 64  <0x1 0x0 0x3          0x400000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2996  						/bits/ 64  <0x1 0x0 0x4          0x800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2997  						/bits/ 64  <0x1 0x0 0x5          0x2000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2998  						/bits/ 64  <0x1 0x1 0x0          0x80000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  2999  						/bits/ 64  <0x1 0x1 0x1          0x100000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3000  						/bits/ 64  <0x1 0x1 0x2          0x200000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3001  						/bits/ 64  <0x1 0x1 0x3          0x400000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3002  						/bits/ 64  <0x1 0x1 0x4          0x800000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3003  						/bits/ 64  <0x1 0x1 0x5          0x2000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3004  						/bits/ 64  <0x1 0x3 0x0          0x59000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3005  						/bits/ 64  <0x1 0x3 0x1          0x79000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3006  						/bits/ 64  <0x1 0x3 0x2          0x14001000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3007  						/bits/ 64  <0x1 0x3 0x3          0x14009000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3008  						/bits/ 64  <0x1 0x3 0x4          0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3009  						/bits/ 64  <0x1 0x3 0x5          0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3010  						/bits/ 64  <0x2 0x0 0x0          0x80000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3011  						/bits/ 64  <0x2 0x0 0x1          0x100000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3012  						/bits/ 64  <0x2 0x0 0x2          0x200000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3013  						/bits/ 64  <0x2 0x0 0x3          0x400000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3014  						/bits/ 64  <0x2 0x0 0x4          0x800000000      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3015  						/bits/ 64  <0x2 0x0 0x5          0x2000000000     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3016  						/bits/ 64  <0x2 0x1 0x0          0x80000080       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3017  						/bits/ 64  <0x2 0x1 0x1          0x100000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3018  						/bits/ 64  <0x2 0x1 0x2          0x200000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3019  						/bits/ 64  <0x2 0x1 0x3          0x400000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3020  						/bits/ 64  <0x2 0x1 0x4          0x800000080      >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3021  						/bits/ 64  <0x2 0x1 0x5          0x2000000080     >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3022  						/bits/ 64  <0x2 0x3 0x0          0x59000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3023  						/bits/ 64  <0x2 0x3 0x1          0x79000000       >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3024  						/bits/ 64  <0x2 0x3 0x2          0x14001000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3025  						/bits/ 64  <0x2 0x3 0x3          0x14009000000    >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3026  						/bits/ 64  <0x2 0x3 0x4          0x0              >,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3027  						/bits/ 64  <0x2 0x3 0x5          0x0              >;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3028  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3029  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3030  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3031  			ErrorLogger4 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3032  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3033  				offset,length = <0x24>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3034  				description = "Register 4 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3035  				addr_msb {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3036  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3037  					description = "Stores NTTP packet header field Addr (MSBs) of the logged error";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3038  					offset,length = <0>, <9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3039  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3040  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3041  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3042  			ErrorLogger5 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3043  				compatible = "eswin,eic7700,register";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3044  				offset,length = <0x28>, <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3045  				description = "Register 5 to log errors";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3046  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3047  				User_flag {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3048  					compatible = "eswin,eic7700,bitfield";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3049  					offset,length = <0x0>, <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3050  					lut = "Cache_0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3051  					      "Cache_1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3052  					      "Cache_2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3053  					      "Cache_3",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3054  					      "Prot_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3055  					      "Prot_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3056  					      "Prot_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3057  					      "User_0 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3058  					      "User_1 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3059  					      "User_2 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3060  					      "User_3 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3061  					      "User_4 ",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3062  					      "qos0",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3063  					      "qos1",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3064  					      "qos2",
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3065  					      "qos3";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3066  				};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3067  			};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3068  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3069  	};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3070  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3071  	SOC: soc {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3072  		compatible = "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3073  		#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3074  		#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3075  		interrupt-parent = <&plic0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3076  		ranges;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3077  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3078  		L40: authentication-controller {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3079  			compatible = "sifive,authentication0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3080  			sifive,auth-types = "fuse";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3081  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3082  		L51: axi4-sys-port@40000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3083  			#address-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3084  			#size-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3085  			compatible = "sifive,axi4-sys-port", "sifive,axi4-port", "sifive,sys-port", "simple-external-bus", "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3086  			ranges = <0x40000000 0x0 0x40000000 0x40000000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3087  			sifive,port-width-bytes = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3088  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3089  		L52: axi4-sys-port@8000000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3090  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3091  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3092  			compatible = "sifive,axi4-sys-port", "sifive,axi4-port", "sifive,sys-port", "simple-external-bus", "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3093  			ranges = <0x80 0x0 0x80 0x0 0x180 0x0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3094  			sifive,port-width-bytes = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3095  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3096  		L46: basic-bus-blocker@200000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3097  			compatible = "sifive,basic-bus-blocker1";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3098  			reg = <0x0 0x200000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3099  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3100  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3101  		L43: basic-bus-blocker@202000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3102  			compatible = "sifive,basic-bus-blocker1";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3103  			reg = <0x0 0x202000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3104  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3105  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3106  		L48: basic-bus-blocker@204000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3107  			compatible = "sifive,basic-bus-blocker1";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3108  			reg = <0x0 0x204000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3109  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3110  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3111  		L54: burst-bundler@10010000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3112  			compatible = "sifive,burst-bundler0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3113  			reg = <0x0 0x10010000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3114  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3115  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3116  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3117  		cpu0_buserror: bus-error-unit@1700000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3118  			compatible = "sifive,buserror";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3119  			reg = <0x0 0x1700000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3120  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3121  			interrupts = <517>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3122  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3123  		cpu1_buserror: bus-error-unit@1701000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3124  			compatible = "sifive,buserror";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3125  			reg = <0x0 0x1701000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3126  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3127  			interrupts = <518>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3128  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3129  		cpu2_buserror: bus-error-unit@1702000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3130  			compatible = "sifive,buserror";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3131  			reg = <0x0 0x1702000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3132  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3133  			interrupts = <519>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3134  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3135  		cpu3_buserror: bus-error-unit@1703000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3136  			compatible = "sifive,buserror";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3137  			reg = <0x0 0x1703000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3138  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3139  			interrupts = <520>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3140  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3141  		L7: cache-controller@2010000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3142  			compatible = "sifive,eic7700";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3143  			reg = <0x0 0x2010000 0x0 0x4000 0x0 0x8000000 0x0 0x400000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3144  			reg-names = "control", "sideband";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3145  			cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3146  			cache-level = <3>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3147  			cache-sets = <4096>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3148  			cache-size = <4194304>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3149  			cache-unified;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3150  			interrupts = <1>, <3>, <4>, <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3151  			next-level-cache = <&L9 &L10 &L11 &memory>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3152  			sifive,a-mshr-count = <60>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3153  			sifive,bank-count = <4>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3154  			sifive,ecc-granularity = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3155  			sifive,max-master-id = <13>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3156  			sifive,perfmon-counters = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3157  			numa-node-id = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3158  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3159  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3160  		L34: debug-controller@0 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3161  			compatible = "sifive,debug-100", "riscv,debug-100";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3162  			reg = <0x0 0x0 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3163  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3164  			debug-attach = "jtag";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3165  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3166  		L8: error-device@1000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3167  			compatible = "sifive,error0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3168  			reg = <0x0 0x00001000 0x0 0x0003000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3169  			      <0x0 0x00005000 0x0 0x0013000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3170  			      <0x0 0x00019000 0x0 0x00e7000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3171  			      <0x0 0x00114000 0x0 0x00ec000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3172  			      <0x0 0x00201000 0x0 0x0001000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3173  			      <0x0 0x00203000 0x0 0x0001000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3174  			      <0x0 0x00205000 0x0 0x14fb000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3175  			      <0x0 0x01704000 0x0 0x08fc000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3176  			      <0x0 0x02014000 0x0 0x5fec000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3177  			      <0x0 0x08400000 0x0 0x3c00000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3178  			      <0x0 0x10000000 0x0 0x0003000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3179  			      <0x0 0x10004000 0x0 0x000c000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3180  			      <0x0 0x10011000 0x0 0x001f000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3181  			      <0x0 0x10034000 0x0 0x9fcc000>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3182  			      <0x0 0x1a400000 0x0 0x5c00000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3183  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3184  		L9: error-device@10003000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3185  			compatible = "sifive,error0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3186  			reg = <0x0 0x10003000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3187  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3188  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3189  		plic0: interrupt-controller@c000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3190  			#interrupt-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3191  			compatible = "sifive,plic-1.0.0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3192  			interrupt-controller;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3193  			interrupts-extended =
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3194  				<&cpu0_intc 0xffffffff>, <&cpu0_intc 9>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3195  				<&cpu1_intc 0xffffffff>, <&cpu1_intc 9>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3196  				<&cpu2_intc 0xffffffff>, <&cpu2_intc 9>,
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3197  				<&cpu3_intc 0xffffffff>, <&cpu3_intc 9>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3198  			reg = <0x0 0xc000000 0x0 0x4000000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3199  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3200  			riscv,max-priority = <7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3201  			riscv,ndev = <520>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3202  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3203  
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3204  		L53: order-obliterator@10030000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3205  			compatible = "sifive,order-obliterator0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3206  			reg = <0x0 0x10030000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3207  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3208  			interrupts = <516>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3209  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3210  		L15: pl2@104000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3211  			cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3212  			cache-level = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3213  			cache-sets = <512>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3214  			cache-size = <262144>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3215  			cache-unified;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3216  			compatible = "sifive,pL2Cache0", "cache";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3217  			next-level-cache = <&L7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3218  			reg = <0x0 0x104000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3219  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3220  			sifive,ecc-granularity = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3221  			sifive,perfmon-counters = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3222  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3223  		L20: pl2@108000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3224  			cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3225  			cache-level = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3226  			cache-sets = <512>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3227  			cache-size = <262144>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3228  			cache-unified;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3229  			compatible = "sifive,pL2Cache0", "cache";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3230  			next-level-cache = <&L7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3231  			reg = <0x0 0x108000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3232  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3233  			sifive,ecc-granularity = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3234  			sifive,perfmon-counters = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3235  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3236  		L25: pl2@10c000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3237  			cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3238  			cache-level = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3239  			cache-sets = <512>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3240  			cache-size = <262144>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3241  			cache-unified;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3242  			compatible = "sifive,pL2Cache0", "cache";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3243  			next-level-cache = <&L7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3244  			reg = <0x0 0x10c000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3245  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3246  			sifive,ecc-granularity = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3247  			sifive,perfmon-counters = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3248  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3249  		L30: pl2@110000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3250  			cache-block-size = <64>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3251  			cache-level = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3252  			cache-sets = <512>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3253  			cache-size = <262144>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3254  			cache-unified;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3255  			compatible = "sifive,pL2Cache0", "cache";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3256  			next-level-cache = <&L7>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3257  			reg = <0x0 0x110000 0x0 0x4000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3258  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3259  			sifive,ecc-granularity = <16>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3260  			sifive,perfmon-counters = <6>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3261  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3262  		L10: rom@1a000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3263  			compatible = "ucbbar,cacheable-zero0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3264  			reg = <0x0 0x1a000000 0x0 0x400000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3265  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3266  		L11: rom@3a000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3267  			compatible = "ucbbar,cacheable-zero0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3268  			reg = <0x0 0x3a000000 0x0 0x400000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3269  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3270  		L6: subsystem_pbus_clock {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3271  			#clock-cells = <0>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3272  			clock-frequency = <10000000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3273  			clock-output-names = "subsystem_pbus_clock";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3274  			compatible = "fixed-clock";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3275  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3276  		L61: teststatus@4000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3277  			compatible = "sifive,test0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3278  			reg = <0x0 0x4000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3279  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3280  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3281  		L45: tl-address-adjuster@20000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3282  			#address-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3283  			#size-cells = <1>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3284  			compatible = "sifive,tl-inter-sys-port", "sifive,tl-port", "simple-external-bus", "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3285  			ranges = <0x20000000 0x0 0x20000000 0x1a000000 0x3a400000 0x0 0x3a400000 0x5c00000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3286  			sifive,port-width-bytes = <8>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3287  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3288  		L42: tl-inter-mem-master-port@80000000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3289  			#address-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3290  			#size-cells = <2>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3291  			compatible = "sifive,tl-inter-mem-master-port", "sifive,tl-port", "sifive,inter-mem-master-port", "simple-external-bus", "simple-bus";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3292  			ranges = <0x0 0x80000000 0x0 0x80000000 0x7f 0x80000000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3293  			sifive,port-width-bytes = <32>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3294  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3295  		L55: trace-encoder-0@100000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3296  			compatible = "sifive,trace0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3297  			reg = <0x0 0x100000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3298  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3299  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3300  		L56: trace-encoder-1@101000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3301  			compatible = "sifive,trace0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3302  			reg = <0x0 0x101000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3303  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3304  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3305  		L57: trace-encoder-2@102000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3306  			compatible = "sifive,trace0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3307  			reg = <0x0 0x102000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3308  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3309  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3310  		L58: trace-encoder-3@103000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3311  			compatible = "sifive,trace0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3312  			reg = <0x0 0x103000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3313  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3314  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3315  		L59: trace-funnel-0@18000 {
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3316  			compatible = "sifive,trace0";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3317  			reg = <0x0 0x18000 0x0 0x1000>;
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3318  			reg-names = "control";
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3319  		};
cde091e1f52d54 Emil Renner Berthing 2024-08-26  3320  	};
8ea3019924f781 linmin               2024-07-29  3321  };
8ea3019924f781 linmin               2024-07-29  3322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
